local monitorSize = {guiGetScreenSize()}
local panelSize = {200, 240}
local panelData = {
	['x'] = monitorSize[1]-panelSize[1] - 10,
	['y'] = monitorSize[2]/2-panelSize[2]/2,
	['w'] = panelSize[1],
	['h'] = panelSize[2],
}
local commands = {{'Colher', 124, 197, 118,200}, {'Regar', 0, 174, 255,200}, {'Cancelar plantio', 255, 167, 0,200}, {'Fechar painel', 215, 85, 85,200}}

local flyPlayer = localPlayer
local tileData = {}
local font = dxCreateFont('files/calibri.ttf', 11)
local font2 = dxCreateFont('files/calibri.ttf', 10)
local font3 = dxCreateFont('files/calibri.ttf', 13)

addEventHandler ("onClientClick", root, function (button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if button == 'right' and state=="down" and clickedElement and getElementType(clickedElement) == "object" and getElementData(clickedElement,"Plant.Object") then
		local pX,pY,pZ = getElementPosition(flyPlayer)
		if getDistanceBetweenPoints3D(pX,pY,pZ,worldX,worldY,worldZ)<=4 then
			if isTimer(timer) then return end
			timer = setTimer(function() end, 1000, 1) --- spam védelem
			if getElementData(clickedElement, 'Plant.owner') == getElementData(flyPlayer, 'acc:id') or getElementData(flyPlayer, "acc:admin") >= 10 then 
				if showProgress then return end
					if (not PanelState) then
					plantID = getElementData(clickedElement,"Plant.id")
					plantSQLID = getElementData(clickedElement,"Plant.SQLid")
					triggerServerEvent('fmPlant.loadTableData', flyPlayer, flyPlayer)
				end
			else
				outputChatBox('#c0c0c0[plantação]: #ffffffEstá plantação Não é sua!', 255, 255, 255, true)
			end
		end
	elseif button == 'left' and state=="down" and PanelState then
		if isTimer(timer) then return end
		timer = setTimer(function() end, 1000, 1) --- spam védelem
		for index, value in ipairs (commands) do 
			if isMouseInPosition(panelData['x']+10, panelData['y']+25+35+index*35, panelData['w']-20, 30) then 
				if index == 1 then
						if tonumber(tileData[plantID]["harvested"]) < 10  then 
							if tonumber(tileData[plantID]["growth"]) == 100 then 
								if exports['san_items']:hasItem(flyPlayer, 38) then 
								triggerServerEvent("playerAnimationToServer", flyPlayer, flyPlayer, "BOMBER", "BOM_Plant", 1000)
								triggerServerEvent("fmPlant.harvestedTile", flyPlayer, flyPlayer, plantSQLID, plantID)
								PanelState = false
								tileData = {}
							else
								outputChatBox('#c0c0c0[plantação]: #ffffffDessa forma, você não será capaz de recuperar que você não vale a pena ou você não tem uma faca!', 255, 255, 255, true)
							end
						else
							outputChatBox('#c0c0c0[plantação]: #ffffffEsta planta não produz frutos!', 255, 255, 255, true)
						end
					end
				elseif index == 2 then 
					if exports['san_items']:hasItem(flyPlayer, 147) then 
						triggerServerEvent("fmPlant.irrigation", flyPlayer, flyPlayer, plantSQLID, plantID)
						PanelState = false
						tileData = {}
					else
						outputChatBox('#c0c0c0[plantação]: #ffffffVocê não tem uma regador!', 255, 255, 255, true)
					end
				elseif index == 3 then
					triggerServerEvent("fmPlant.destoyTile", flyPlayer, flyPlayer, plantSQLID, plantID)
					triggerServerEvent("playerAnimationToServer", flyPlayer, flyPlayer, "BOMBER", "BOM_Plant", 1000)
					PanelState = false
					tileData = {}
				elseif index == 4 then 
					PanelState = false
					tileData = {}
				end
			end
		end
	end
end)

function drawPanel()
	if not PanelState then return end
	dxDrawRectangle(panelData['x'], panelData['y'], panelData['w'], panelData['h'], tocolor(0, 0, 0, 100))
	--dxDrawRectangleBox(panelData['x'], panelData['y'], panelData['w'], panelData['h'], tocolor(0, 0, 0, 255))
	dxDrawRectangle(panelData['x'], panelData['y'], panelData['w'], 25, tocolor(0, 0, 0, 255))
	dxDrawRectangle(panelData['x'], panelData['y']+85, panelData['w'], 5, tocolor(0, 0, 0, 200))
	strint, int = getTypeData(tonumber(tileData[plantID]["type"]))
	dxDrawText(strint, panelData['x'] + panelData['w']/2, panelData['y'] + 25/2, panelData['x'] + panelData['w']/2, panelData['y'] + 25/2, tocolor(124, 197, 118, 255), 1, font, "center", "center", false, false, false, true)
	
	
	dxDrawText("condição: "..condition(tonumber(tileData[plantID]["harvested"])) , panelData['x'] + panelData['w']/2, panelData['y'] + 30, panelData['x'] + panelData['w']/2, panelData['y'] + 30/2, tocolor(255, 255, 255, 255), 1, font2, "center", "top", false, false, false, true)
	
	dxDrawRectangle(panelData['x']+10, panelData['y']+55, panelData['w']-20, 25, tocolor(0, 0, 0, 180))
	dxDrawRectangle(panelData['x']+16, panelData['y']+60, (tileData[plantID]["growth"]/100) * (panelData['w']-32), 15, tocolor(124, 197, 118, 200)) --(time/55)*pictureSize[1]
	
	dxDrawText("Água: ", panelData['x']-145 + panelData['w']/2, panelData['y']-30, panelData['x'] + panelData['w']/2, panelData['y'] + 30/2, tocolor(255, 255, 255, 255), 1, font3, "center", "top", false, false, false, true)
	
	dxDrawRectangle(panelData['x']+45, panelData['y']-30, panelData['w']-45, 25, tocolor(0, 0, 0, 180))
	dxDrawRectangle(panelData['x']+50, panelData['y']-25, (tileData[plantID]["water"]/100) * (panelData['w']-54), 15, tocolor(82, 179, 217, 180)) --(time/55)*pictureSize[1]
	for index, value in ipairs (commands) do 
		if isMouseInPosition(panelData['x']+10, panelData['y']+25+35+index*35, panelData['w']-20, 30) then 
			dxDrawRectangle(panelData['x']+10, panelData['y']+25+35+index*35, panelData['w']-20, 30, tocolor(0, 0, 0, 180))
			dxDrawRectangle(panelData['x']+15, panelData['y']+30+35+index*35, panelData['w']-30, 20, tocolor(value[2], value[3], value[4], 180))
			dxDrawText(value[1], panelData['x']+10+(panelData['w']-20)/2, panelData['y']+25+index*40 + 30/2, panelData['x']+10+(panelData['w']-20)/2, panelData['y']+65+35+index*30 + 25/2, tocolor(255, 255, 255, 255), 1, font2, "center", "center", false, false, false, true)
		else
			dxDrawRectangle(panelData['x']+10, panelData['y']+25+35+index*35, panelData['w']-20, 30, tocolor(0, 0, 0, 180))
			dxDrawText(value[1], panelData['x']+10+(panelData['w']-20)/2, panelData['y']+25+index*40 + 25/2, panelData['x']+10+(panelData['w']-20)/2, panelData['y']+65+35+index*30 + 30/2, tocolor(255, 255, 255, 255), 1, font2, "center", "center", false, false, false, true)
		end
	end
end
addEventHandler('onClientRender', root, drawPanel)

addEvent('fmPlant.loadTableDataClient', true)
addEventHandler('fmPlant.loadTableDataClient', root, function(table)
	PanelState = true
	tileData = table
end)

function progressBar()

end

function getTypeData(i)
	if not i then return "false" end
	if i == 1 then
		return "Plantação de maconha",1
	elseif i == 2 then
		return "Arbusto de cocaína",2
	end
end

function condition(a)
	if a <= 5 then
		return "#00AEFFSaudável";
	elseif a < 10 then
		return "#ffa700Velha";
	else
		return "#D24D57Morta";
	end
end

function dxDrawRectangleBox(left, top, width, height, color)
	--dxDrawRectangle(left, top, width, height, tocolor(151, 61, 83,50))
	dxDrawRectangle(left-1, top, 1, height, color)
	dxDrawRectangle(left+width, top, 1, height, color)
	dxDrawRectangle(left, top-1, width, 1, color)
	dxDrawRectangle(left, top+height, width, 1, color)
end

function isMouseInPosition ( x, y, width, height ) 
    if ( not isCursorShowing ( ) ) then 
        return false 
    end 
  
    local sx, sy = guiGetScreenSize ( ) 
    local cx, cy = getCursorPosition ( ) 
    local cx, cy = ( cx * sx ), ( cy * sy ) 
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then 
        return true 
    else 
        return false 
    end 
end 