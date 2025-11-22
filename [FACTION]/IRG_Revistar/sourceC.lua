local monitorScreen = {guiGetScreenSize()}
local panelSize = {200, 230}
local panelX 
local panelY  
local Player
local Marker
local Font = dxCreateFont("files/myriadproregular.ttf", 9)
local Font2 = dxCreateFont("files/myriadproregular.ttf", 12)
local active_Menu = {{"DastBand"}, {"Gashtan"}, {"Cancel"},}

local show = false

addEventHandler("onClientClick", root, function(button, state, absX, absY, elementX, elementY, elementZ, element)
	if button == "right" and state == "down" and element and element ~= localPlayer and getElementType(element)=="player" then 
		local x, y, z = getElementPosition(getLocalPlayer())
		local playerx, playery, playerz = getElementPosition(element)
		if (getDistanceBetweenPoints3D(x, y, z, playerx, playery, playerz) <= 5) then
	  if getElementData(getLocalPlayer(), "char:dutyfaction") == 1 or getElementData(getLocalPlayer(), "char:dutyfaction") == 2 or getElementData(getLocalPlayer(), "char:dutyfaction") == 3 or getElementData(getLocalPlayer(), "char:dutyfaction") == 4 or getElementData(getLocalPlayer(), "char:dutyfaction") == 5 or getElementData(getLocalPlayer(), "char:dutyfaction") == 6 or getElementData(getLocalPlayer(), "char:dutyfaction") == 7 or getElementData(getLocalPlayer(), "char:dutyfaction") == 8 or getElementData(getLocalPlayer(), "char:dutyfaction") == 9 or getElementData(getLocalPlayer(), "char:dutyfaction") == 10 or getElementData(getLocalPlayer(), "char:dutyfaction") == 11 or getElementData(getLocalPlayer(), "char:dutyfaction") == 12 or getElementData(getLocalPlayer(), "char:dutyfaction") == 13 or getElementData(getLocalPlayer(), "char:dutyfaction") == 14 or getElementData(getLocalPlayer(), "char:dutyfaction") == 15 then
			panelX = absX
			panelY = absY
			Player = element	
			show = true
			removeEventHandler("onClientRender", root, createPlayerPanel)
			addEventHandler("onClientRender", root, createPlayerPanel)
		end
end
	elseif button == "left" and state == "down" and show then 
		for index, value in ipairs (active_Menu) do 
			if dobozbaVan(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, absX, absY) then 
				if value[1] == "DastBand" then 
					--if exports['san_items']:hasItem(localPlayer, 42, 1) then 
					if exports['san_items']:hasItem(localPlayer, 32) then 
						triggerServerEvent("onServerCuff", localPlayer, localPlayer, Player)
					else
						outputChatBox("#4286f4[Erro]: #ffffffVocê não tem algemas!", 255, 255, 255, true)
					end				
				elseif value[1] == "Gashtan" then 
					if Player:getData("handsup") then 
						triggerServerEvent("revistarANIM", localPlayer, localPlayer)
						exports['san_items']:openInventory(Player)
						exports['san_items']:abririnv(getPlayerName(Player))
						


						exports.san_chat:sendLocalMeMessage(localPlayer, "Está revistando o jogador.(".. Player:getData("char:name") .. ")" )
					else
						outputChatBox("#4286f4[Erro]: #ffffffVocê só pode revistar se o jogador estiver com a mão pra cima!!", 255, 255, 255, true)
					end				
				elseif value[1] == "Cancel" then 
					removeEventHandler("onClientRender", root, createPlayerPanel) 
					show = false
					if isElement(Marker) then destroyElement(Marker) end
				end
			end
		end
	end
end)

function createMarkerFunction(PlayerX,PlayerY,PlayerZ)
	if isElement(Marker) then 
		destroyElement(Marker)
	end

	Marker = createMarker ( PlayerX,PlayerY,PlayerZ+1.7, "arrow", 0.4, 25, 181, 254, 170 )
end

function createPlayerPanel()
	if not show then return end
	local PlayerX,PlayerY,PlayerZ = getElementPosition(Player)
	createMarkerFunction(PlayerX,PlayerY,PlayerZ)
	local jX, jY, jZ = getElementPosition(getLocalPlayer())
	local bX, bY, bZ = getElementPosition(Player)
	if (getDistanceBetweenPoints3D(jX, jY, jZ, bX, bY, bZ) > 5 ) then removeEventHandler("onClientRender", root, createPlayerPanel) show = false if isElement(Marker) then destroyElement(Marker) end return end
	
	dxDrawRectangle(panelX, panelY, panelSize[1], panelSize[2], tocolor(0, 0, 0, 170))
	dxDrawRectangle(panelX, panelY, panelSize[1], 25, tocolor(0, 0, 0, 230))
	dxDrawText("IRG Roleplay - #4286f4"..Player:getData("char:name"):gsub("_", " "), panelX+panelSize[1]/2, panelY+25/2, panelX+panelSize[1]/2, panelY+25/2, tocolor(255, 255, 255, 230), 1, Font, "center", "center", false, false, false, true)
	
	for index, value in ipairs (active_Menu) do 
		if Player:getData("char.Cuffed") == 1  and value[1] == "DastBand" or value[1] == "Azad" then 
			Text = "Azad"
		else
			Text = "DastBand"
		end
		if isInSlot(panelX+10, panelY-20+index*55, panelSize[1]-20, 50) then 
			
			
			if value[1] ~= "Cancel" and value[1] ~= "DastBand" then 
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(166, 134, 244, 170))
				dxDrawText(value[1], panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			elseif value[1] ~= "DastBand" then
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(66, 134, 244, 170))
				dxDrawText(value[1], panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			end

			if value[1] == "DastBand"  then 
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(66, 134, 244, 170))
				dxDrawText(Text, panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			end
		else
			dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(0, 0, 0, 170))
			if value[1] == "DastBand" then 
				dxDrawText(Text, panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(255, 255, 255, 230), 1, "default-bold", "center", "center", false, false, false, true)
			else
				dxDrawText(value[1], panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(255, 255, 255, 230), 1, "default-bold", "center", "center", false, false, false, true)
			end
		end
	end
end

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(dobozbaVan(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end




addEventHandler ( 'onClientResourceStart', getResourceRootElement(getThisResource()), function()
	txd = engineLoadTXD('cuff.txd',364)
	engineImportTXD(txd,364)
	dff = engineLoadDFF('cuff.dff',364)
	engineReplaceModel(dff,364)
	end)


	
	function animSped(player,anim, speed)
		setPedAnimationSpeed(player,anim, speed)
		setPedAnimationProgress(player, 'pass_Smoke_in_car', 0)
		toggleControl('fire', false)
	end
	addEvent("animSped", true)
	addEventHandler( "animSped", root, animSped)
