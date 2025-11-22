local monitorSize = {guiGetScreenSize()} -- // Lekérdezi a monitor méreteit
local panelData = {550, 510} -- // Panel szélessége és magassága
local panelX, panelY = monitorSize[1]/2-panelData[1]/2, monitorSize[2]/2-panelData[2]/2 -- // X, Y Pozició
local font = dxCreateFont("files/Calibri.ttf", 10) -- // Font
local showShop = false -- // A panel felvan-e rajzolva
local currentShop = 0 -- // Jelenlegi shop
local scroll = 0 -- // Görgetés
local count = 1 -- // Darabszám
local maxDraw = 8 -- // Maximum kirajzolás
local createdGuis = {} -- // A guik táblázata
local shopElement = nil --// Shop Element

------------------------------

-- // Klikkelés

------------------------------

addEventHandler('onClientClick', root, function (button, state, _, _, _, _, _, element)
	if button == 'right' and state == 'down' and element and not showShop then 
			if getElementData(element, 'shop >> npc') or false then 
				local x, y, z = getElementPosition(localPlayer)
				local elementX, elementY, elementZ = getElementPosition(element)
				if getDistanceBetweenPoints3D(x, y, z, elementX, elementY, elementZ) <= 5 then 
					if tonumber(getElementData(element,'shop >> type') or 1) == 11 and not getElementData(localPlayer, "char:dutyfaction") == 7 then outputChatBox('#D24D57[IRG] #ffffffVocê não faz parte do Ministerio!', 255, 255, 255, true) return end
					if tonumber(getElementData(element,'shop >> type') or 1) == 12 and not getElementData(localPlayer, "char:dutyfaction") == 7 then outputChatBox('#D24D57[IRG] #ffffffVocê não faz parte do Ministerio!', 255, 255, 255, true) return end
					getShopDatas(element)
				else
					outputChatBox('#D24D57[IRG] #ffffffShoma Nemitonid Az Forooshande Chizi Bekharid!', 255, 255, 255, true)
				end
			end
	elseif button == 'left' and state == 'down' and showShop then 
		
		if tonumber(getElementData(element,'shop >> type') or 1) == 11 and not getElementData(localPlayer, "char:dutyfaction") == 7 then outputChatBox('#D24D57[IRG] #ffffffVocê não faz parte do Ministerio!', 255, 255, 255, true) return end
		if tonumber(getElementData(element,'shop >> type') or 1) == 12 and not getElementData(localPlayer, "char:dutyfaction") == 7 then outputChatBox('#D24D57[IRG] #ffffffVocê não faz parte do Ministerio!', 255, 255, 255, true) return end
		
		local elem = 0
		for index, value in ipairs(shopItemList[currentShop].itemList) do
			if (index > scroll and elem < maxDraw) then
				elem = elem + 1
				if isMouseInPosition (panelX+panelData[1]-155, panelY-25+elem*57+56/2-20/2, 77, 20) then
					if guiEditSetCaretIndex(createdGuis[elem], string.len(guiGetText(createdGuis[elem]))) then
						guiBringToFront(createdGuis[elem])
					end
				elseif isMouseInPosition (panelX+panelData[1]-45, panelY-25+elem*57+56/2-32/2, 32, 32) then 	
					if isElement(createdGuis[elem]) then
						count = guiGetText(createdGuis[elem])
						if tonumber(count) then 
							if count == '' or count == ' ' then 
								count = 1
							end		
						else
							count = 1
							guiSetText(createdGuis[elem], '')
						end
					else
						count = 1
					end
					
					if (math.floor(count) > 0) then
						if tonumber(getElementData(element,'shop >> type') or 1) == 11 and not getElementData(localPlayer, "char:dutyfaction") == 7 then return end
						if tonumber(getElementData(element,'shop >> type') or 1) == 12 and not getElementData(localPlayer, "char:dutyfaction") == 7 then return end
						if getElementData(localPlayer, 'char:money') >= (value[5]* math.floor(count)) then
							setTimer(function(value, count)
								triggerServerEvent('sanMTA->#buyItem', localPlayer, localPlayer, value[2], value[3], math.floor(count), value[5]* math.floor(count))
								setElementData(localPlayer, 'char:money', getElementData(localPlayer, 'char:money') - value[5]* math.floor(count))
							end, 100, 1, value, count)
						end
					end
				end
			end
		end
	end
end)

------------------------------

-- // destoy and draw funkciók

------------------------------

function getShopDatas(element)
	showShop = not showShop 
	if showShop then
		currentShop = tonumber(getElementData(element, 'shop >> type'))
		createGui('create')
		shopElement = element
		addEventHandler('onClientRender', root, createShopPanel, true, 'low-5')
		bindKey('backspace', 'down', desroyPanel)
	else
		createGui('destroy')
		removeEventHandler('onClientRender', root, createShopPanel)
		unbindKey('backspace', 'down', desroyPanel)
	end
end

function desroyPanel ()
	removeEventHandler('onClientRender', root, createShopPanel) 
	showShop = false 
	createGui('destroy')
	count = 1
	scroll = 0
	currentShop = 0
	unbindKey('backspace', 'down', desroyPanel)
end

------------------------------

-- // Edit létrehozása és törlése

------------------------------

function createGui(type)
	if tostring(type) == "destroy" then
		for index, value in ipairs(shopItemList[currentShop].itemList) do
			if isElement(createdGuis[index]) then
				destroyElement(createdGuis[index])
			end
		end
	else
		for index, value in ipairs(shopItemList[currentShop].itemList) do
			createdGuis[index] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiSetText(createdGuis[index], value[4])
			guiEditSetMaxLength(createdGuis[index], 4)	
		end
	end
end

------------------------------

-- // felrajzolás

------------------------------

function createShopPanel()
	local x, y, z = getElementPosition(localPlayer)
	local elementX, elementY, elementZ = getElementPosition(shopElement)
	if (getDistanceBetweenPoints3D(x, y, z, elementX, elementY, elementZ) > 5 ) then desroyPanel() return end
	dxDrawRectangle(panelX, panelY, panelData[1], panelData[2], tocolor(0, 0, 0, 150)) -- // background
	dxDrawRectangle(panelX, panelY, panelData[1], 25, tocolor(0, 0, 0, 200))
	dxDrawText("Baraye Bastan Menu #D24D57'backspace' #ffffff Ra Bezanid", panelX+panelData[1]/2, (panelY+panelData[1]-65)+25/2, panelX+panelData[1]/2, (panelY+panelData[1]-65)+25/2, tocolor(255, 255, 255, 255), 1, font, 'center', 'center', false, false, false, true)
	dxDrawText('#7cc576IRG #FFFFFFRoleplay - #7cc576'..shopItemList[currentShop].name, panelX+panelData[1]/2, panelY+25/2, panelX+panelData[1]/2, panelY+25/2, tocolor(255, 255, 255, 255), 1, font, 'center', 'center', false, false, false, true)
	local elem = 0
	for index, value in ipairs(shopItemList[currentShop].itemList) do
		if (index > scroll and elem < maxDraw) then
			elem = elem + 1
			dxDrawRectangle(panelX+5, panelY-25+elem*57, panelData[1]-10, 56, tocolor(0, 0, 0, 150))	
			dxDrawRectangle(panelX+10, panelY-17+elem*57, 40, 40, tocolor(255, 255, 255, 60))
			dxDrawImage(panelX+10+2, panelY-17+elem*57+2, 36, 36, getItemImage(value[2]))
			if isElement(createdGuis[elem]) then
				count = guiGetText(createdGuis[elem])
				if tonumber(count) then 
					if count == '' or count == ' ' then 
						count = 1
					end		
				else
					count = 1
					guiSetText(createdGuis[elem], '')
				end
			else
				count = 1
			end
			dxDrawText('Name: #7cc576'.. value[1] .. '\n#ffffffMablagh: #7cc576R$: '.. formatMoney(value[5]*math.floor(count))..'\n#ffffffTozihat: #F7CA18'.. exports['san_items']:getItemDescription(value[2]) ..'', panelX+10+2+43, panelY-25+elem*57+2, 36, 36, tocolor(255, 255, 255, 255), 1, font, 'left', 'top', false, false, false, true)
			dxDrawText('Tedad: #7cc576'.. math.floor(count), panelX+panelData[1]-155, panelY-25+elem*57+56/2, 36, panelY-25+elem*57+56/2, tocolor(255, 255, 255, 255), 1, font, 'left', 'center', false, false, false, true)
			if isMouseInPosition (panelX+panelData[1]-45, panelY-25+elem*57+56/2-32/2, 32, 32) then 
				dxDrawImage(panelX+panelData[1]-45, panelY-25+elem*57+56/2-32/2, 32, 32, 'files/shopIcon.png', 0, 0, 0, tocolor(124, 197, 118, 255))
			else
				dxDrawImage(panelX+panelData[1]-45, panelY-25+elem*57+56/2-32/2, 32, 32, 'files/shopIcon.png', 0, 0, 0, tocolor(255, 255, 255, 255))
			end
		end
	end
	if #shopItemList[currentShop].itemList > maxDraw then 
		dxDrawRectangle(panelX+panelData[1]+5, panelY+25, 10, panelData[2]-25, tocolor(0, 0, 0, 150)) -- // scrole backfround
		dxDrawRectangle(panelX+panelData[1]+5+1, panelY+25+1+((panelData[2]-25)/(#shopItemList[currentShop].itemList-maxDraw+1))*scroll, 8, (panelData[2]-25)/(#shopItemList[currentShop].itemList-maxDraw+1)-2, tocolor(124,197,118, 255)) -- // Scros line
	end
end

------------------------------

-- // Görgetés

------------------------------

bindKey("mouse_wheel_down", "down", 
	function() 
		if showShop then
			if scroll < #shopItemList[currentShop].itemList - maxDraw then
				scroll = scroll + 1	
			end
		end
	end
)

bindKey("mouse_wheel_up", "down", 
	function() 
		if showShop then
			if scroll > 0 then
				scroll = scroll - 1		
			end
		end
	end
)

------------------------------

-- // Egyéb

------------------------------

function formatMoney(amount)
	local formatted = tonumber(amount)
	if formatted then
		while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1 %2')
		if (k==0) then
			break
		end
	end
		return formatted
	else
		return amount
	end
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

function getItemImage(item)
	return fileExists(":san_items/files/items/"..item..".png") and ":san_items/files/items/"..item..".png" or ":san_items/files/items/0.png"
end

addEventHandler("onClientPedDamage",  getRootElement(), function ()
	if (getElementData(source, "ped >> death")) then
		cancelEvent()
	end
end)

addEventHandler("onClientPlayerStealthKill", getRootElement(), function(targetPlayer) 
	if (getElementType(targetPlayer) == 'ped' and getElementData(targetPlayer, "ped >> death")) then  
		cancelEvent()
	end
end)