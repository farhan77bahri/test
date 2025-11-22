if fileExists("sourceC.lua") then
	fileDelete("sourceC.lua")
end

local Markers = {}
local radarblip = {}
local makerpos = {
	{1100.7957763672, -1207.3135986328, 17.8046875},
}

function createMarkers()
	for index, value in ipairs(makerpos) do
		Markers[index] = createMarker(makerpos[index][1], makerpos[index][2], makerpos[index][3]-1, "cylinder", 2.0, 124, 197, 118)
		radarblip[index] = createBlip(makerpos[index][1], makerpos[index][2], makerpos[index][3]-1, 23, 2, 255, 0, 0, 255, 0, 99999)
		setElementData(radarblip[index] ,"blip >> name", "Ferro Velho")
		setElementData(Markers[index], "yunk:marker", true)
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), createMarkers)

local Panel = false
--local font = dxCreateFont("files/myriadproregular.ttf", 9)
local font2 = dxCreateFont("files/myriadproregular.ttf", 11)
local font3 = dxCreateFont("files/myriadproregular.ttf", 11)

local font = dxCreateFont("font.ttf",16)
local informacio = dxCreateFont("font.ttf",12)
local sx, sy = guiGetScreenSize()
local myScreenSource = dxCreateScreenSource(sx/2, sy/2)


function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

function onYunkMarkerHit(hitPlayer, dim)
	if localPlayer == hitPlayer and getElementData(source, "yunk:marker") == true then
		if isPedInVehicle(localPlayer) then
			local veh = getPedOccupiedVehicle(localPlayer)
			local seat = getPedOccupiedVehicleSeat(localPlayer)
			if (veh) and seat == 0 then
				if getElementModel(veh(localPlayer)) == 507 and getElementModel(veh(localPlayer)) == 561 and getElementModel(veh(localPlayer)) == 579 and getElementModel(veh(localPlayer)) == 411 and getElementModel(veh(localPlayer)) == 521 then return end
				if getElementData(veh, "veh:owner") == getElementData(localPlayer, "char:id") and getElementData(veh, "veh:id") > 0 or getElementData(localPlayer, "acc:admin") >= 7 then
					realName = exports.san_realname:getVehicleRealName(getElementModel(veh))
					--realName = getElementModel(veh)
					cost = exports.san_realname:getVehicleShopCost2(getElementModel(veh)) / 2.0
					outputChatBox(realName .. " | " .. convertNumber(cost) .. " $ be")
					
					Panel = true
					addEventHandler("onClientRender", root, PanelRender)
					setElementFrozen(veh, true)

				else
					exports.san_infobox:addNotification("O veículo não é de sua propriedade!","info")
				end
			end
		end
	end
end
addEventHandler("onClientMarkerHit", getRootElement(), onYunkMarkerHit)

function onYunkMarkerLeave(hitPlayer, dim)
	if localPlayer == hitPlayer and getElementData(source, "yunk:marker") == true then
		if Panel == true then
			veh = getPedOccupiedVehicle(localPlayer)
			if (veh) then

				Panel = false
				removeEventHandler("onClientRender", root, PanelRender)
				setElementFrozen(veh, false)
			
				
			end
		end
	end
end
addEventHandler("onClientMarkerLeave", getRootElement(), onYunkMarkerLeave)

local buttons = {{"accept"}, {"Cancel"}}

function PanelRender()
	if Panel then
	
		local monitorSize = {guiGetScreenSize()}
		local panelSize = {330, 200}
		local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2
		local buttonSize = {250, 30}
		-- san MTA ALAPJAI -- 

--		dxDrawImage(sx/2-55,sy/2-200,100,100,"logo.png")

dxDrawRectangle(sx/2-250,sy/2-90,500,30,tocolor(0,0,0,250)) -- dx rectangle felső
dxDrawRectangle(sx/2-250,sy/2,500,100,tocolor(0,0,0,200)) -- Sőtét rectangle alsó
dxDrawRectangle(sx/2-250,sy/2-60,500,60,tocolor(0,0,0,170)) -- Világos rectangle, középső
dxDrawText("IRG-MTA #7cc576Roleplay#FFFFFF",sx/2-240,sy/2+35,sx/2-240,sy/2-185,tocolor(255,255,255,255),1,font,"left","center",false,false,false,true)
dxDrawText("Meghdar Vajhi Ke Baraye In Mashin Be Shoma Dade Mishavad: $: #7cc576".. convertNumber(math.floor(cost)) .."",sx/2-240,sy/2+85,sx/2-240,sy/2-185,tocolor(255,255,255,255),1,informacio,"left","center",false,false,false,true)
--dxDrawText("Tipo de veículo:#7cc576" .. realName .. "",sx/2-240,sy/2+130,sx/2-240,sy/2-185,tocolor(255,255,255,255),1,informacio,"left","center",false,false,false,true)
dxDrawText("\nAz Foroosh Mashin Khod Be Oraghi Motmaen Hastid!?",sx/2-240,sy/2+130,sx/2-240,sy/2-185,tocolor(255,255,255,255),1,informacio,"left","center",false,false,false,true)

	
	--	dxDrawText(text, panelX+panelSize[1]/2, panelY+25, panelX+panelSize[1]/2, panelY+25, tocolor(255, 255, 255, 255), 1, font, "center", "top", false, false, true, true)
	--	dxDrawText(text2, panelX+panelSize[1]/2, panelY+70, panelX+panelSize[1]/2, panelY+70, tocolor(255, 255, 255, 255), 1, font3, "center", "top", false, false, true, true)
		
		for i, v in ipairs(buttons) do
			if isInBox(panelX+35, panelY+120+((i-1)*40), buttonSize[1], buttonSize[2]) and v[1] == "accept" then
				dxDrawRectangle(panelX+35, panelY+120+((i-1)*40), buttonSize[1], buttonSize[2], tocolor(124, 197, 118, 230))
				dxDrawText(v[1], panelX+35+buttonSize[1]/2, panelY+120+((i-1)*40)+15, panelX+35+buttonSize[1]/2,panelY+120+((i-1)*40)+15, tocolor(0, 0, 0, 255), 1, font2, "center", "center", false, false, true, true)
			
			elseif isInBox(panelX+35, panelY+120+((i-1)*40), buttonSize[1], buttonSize[2]) and v[1] == "Cancel" then
				dxDrawRectangle(panelX+35, panelY+120+((i-1)*40), buttonSize[1], buttonSize[2], tocolor(124, 197, 118, 230))
				dxDrawText(v[1], panelX+35+buttonSize[1]/2, panelY+120+((i-1)*40)+15, panelX+35+buttonSize[1]/2,panelY+120+((i-1)*40)+15, tocolor(0, 0, 0, 255), 1, font2, "center", "center", false, false, true, true)
			
			else
				dxDrawRectangle(panelX+35, panelY+120+((i-1)*40), buttonSize[1], buttonSize[2], tocolor(124, 197, 118, 230))
				dxDrawText(v[1], panelX+35+buttonSize[1]/2, panelY+120+((i-1)*40)+15, panelX+35+buttonSize[1]/2,panelY+120+((i-1)*40)+15, tocolor(255, 255, 255, 255), 1, font2, "center", "center", false, false, true, true)

			end
		end
	end
end

function yunkClick( button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement )
    if button == "left" and state == "down" and Panel then
	
		local monitorSize = {guiGetScreenSize()}
		local panelSize = {330, 200}
		local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2
		local text = "Obrigado pelos destroços.\nVocê quer esmagá-lo mesmo??\n\n"
		local text2 = "Preço esmagar #7cc576" .. convertNumber(math.floor(cost)) .. "."
		local buttonSize = {250, 30}
		veh = getPedOccupiedVehicle(localPlayer)
		seat = getPedOccupiedVehicleSeat(localPlayer)
		if seat ~= 0 then return end
		
		for i, v in ipairs(buttons) do
			if dobozbaVan(panelX+35, panelY+120+((i-1)*40), 250, 30, absoluteX, absoluteY) then
				if v[1] == "accept" then
					--outputChatBox("Elfogadás")
					
					setElementFrozen(veh, false)
					Panel = false
					removeEventHandler("onClientRender", root, PanelRender)
	                exports.san_infobox:addNotification("Shoma Mashin Khod Ra Ba Moafaghiyat Forokhtid! ","success")
					--outputChatBox("#87D37C[informação]:#ffffff soma #7cc576" .. convertNumber(cost) .. "#ffffff", 255, 255, 255, true)
					triggerServerEvent("junk:deleteVehicle", localPlayer, localPlayer, veh, math.floor(cost))
					--removePedFromVehicle(localPlayer)
				elseif v[1] == "Cancel" then
					--outputChatBox("Elutasítás")
					
					setElementFrozen(veh, false)
					Panel = false
					removeEventHandler("onClientRender", root, PanelRender)
					outputChatBox(" ", 255, 255, 255, true)
	exports.san_infobox:addNotification("Shoma Ba Moafaghiyat Cancel Kardid","success")
				end
			end
		end
	end
end
addEventHandler ("onClientClick", getRootElement(), yunkClick )

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function isInBox(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(cursorX >= xS and cursorX <= xS+wS and cursorY >= yS and cursorY <= yS+hS) then
			return true
		else
			return false
		end
	end	
end