local monitorScreen = {guiGetScreenSize()}
local panelSize = {200, 260}
local panelX 
local panelY  
local Player = false
local Marker
local Font = dxCreateFont("files/myriadproregular.ttf", 9)
local Font2 = dxCreateFont("files/myriadproregular.ttf", 12)
local active_Menu = {{"Pegar M16"}, {"Pegar Deagle"}, {"Pegar AK-47"}, {"Fechar"},}

local show = false

setElementData(localPlayer, "ComM16", false)
setElementData(localPlayer, "ComDeagle", false)
setElementData(localPlayer, "ComAK", false)

addEventHandler("onClientClick", root, function(button, state, absX, absY, elementX, elementY, elementZ, clickedElement)
	if button == "right" and state == "down" and clickedElement and clickedElement ~= localPlayer and getElementType(clickedElement)=="player" then 
		if getElementHealth(clickedElement) <= 30 then
		if getElementData(localPlayer, "acc:admin") >= 9 or getElementData(localPlayer, "char:dutyfaction") == 20 or getElementData(localPlayer, "char:dutyfaction") == 21 or getElementData(localPlayer, "char:dutyfaction") == 22 or getElementData(localPlayer, "char:dutyfaction") == 23 or getElementData(localPlayer, "char:dutyfaction") == 24 or getElementData(localPlayer, "char:dutyfaction") == 25 or getElementData(localPlayer, "char:dutyfaction") == 26 or getElementData(localPlayer, "char:dutyfaction") == 27 or getElementData(localPlayer, "char:dutyfaction") == 28 or getElementData(localPlayer, "char:dutyfaction") == 1 or getElementData(localPlayer, "char:dutyfaction") == 2 or getElementData(localPlayer, "char:dutyfaction") == 3 or getElementData(localPlayer, "char:dutyfaction") == 4 or getElementData(localPlayer, "char:dutyfaction") == 5 or getElementData(localPlayer, "char:dutyfaction") == 6 or getElementData(localPlayer, "char:dutyfaction") == 7 or getElementData(localPlayer, "char:dutyfaction") == 8 or getElementData(localPlayer, "char:dutyfaction") == 9 or getElementData(localPlayer, "char:dutyfaction") == 10 or getElementData(localPlayer, "char:dutyfaction") == 11 or getElementData(localPlayer, "char:dutyfaction") == 12 or getElementData(localPlayer, "char:dutyfaction") == 13 or getElementData(localPlayer, "char:dutyfaction") == 14 or getElementData(localPlayer, "char:dutyfaction") == 15 then
		local x, y, z = getElementPosition(localPlayer)
		local playerx, playery, playerz = getElementPosition(clickedElement)
		if (getDistanceBetweenPoints3D(x, y, z, playerx, playery, playerz) <= 1) then	
			panelX = absX
			panelY = absY
			Player = clickedElement	
			show = true
			triggerServerEvent("VerificarM16", Player, Player)
			triggerServerEvent("VerificarDeagle", Player, Player)
			triggerServerEvent("VerificarAK", Player, Player)
			
			removeEventHandler("onClientRender", root, createPlayerPanel)
			addEventHandler("onClientRender", root, createPlayerPanel)
		end
	end
	end
	elseif button == "left" and state == "down" and show then 
		for index, value in ipairs (active_Menu) do 
			if dobozbaVan(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, absX, absY) then 
				if value[1] == "Pegar M16" then 
				if getElementData(Player, "ComM16") == true or getElementData(Player, "ComM16") == false then 
					triggerServerEvent("VerificarM16", Player, Player)
					--POLÍCIA NÃO PODE LOTEAR ESTA CATEGORIA
					if getElementData(localPlayer, "char:dutyfaction") == 1 or getElementData(localPlayer, "char:dutyfaction") == 2 or getElementData(localPlayer, "char:dutyfaction") == 3 or getElementData(localPlayer, "char:dutyfaction") == 4 or getElementData(localPlayer, "char:dutyfaction") == 5 or getElementData(localPlayer, "char:dutyfaction") == 6 or getElementData(localPlayer, "char:dutyfaction") == 7 or getElementData(localPlayer, "char:dutyfaction") == 8 or getElementData(localPlayer, "char:dutyfaction") == 9 or getElementData(localPlayer, "char:dutyfaction") == 10 or getElementData(localPlayer, "char:dutyfaction") == 11 or getElementData(localPlayer, "char:dutyfaction") == 12 or getElementData(localPlayer, "char:dutyfaction") == 13 or getElementData(localPlayer, "char:dutyfaction") == 14 or getElementData(localPlayer, "char:dutyfaction") == 15 then outputChatBox("#7cc576*ERROR #FFFFFFVocê só pode pegar AK-47 & Deagle.", 255, 255, 255, true) return end
					if getElementData(localPlayer, "TempLoot") then outputChatBox("#7cc576*ERROR #FFFFFFVocê looteou um jogador recentemente, Aguarde 10 minutos.", 255, 255, 255, true) return end
							 setElementData(localPlayer, "TempLoot", true)
							 setTimer(setElementData, 60000 * 10, 1, localPlayer, "TempLoot", false)
						if getElementData(Player, "ComM16") == true then 
						
						exports.san_chat:sendLocalMeMessage(localPlayer, "Pegou uma M16 do jogador.(".. Player:getData("char:name") .. ")" )
						setElementData(Player, "ComM16", false)
						triggerServerEvent("AnimLoot", localPlayer, localPlayer)
						triggerServerEvent("RetirarM16", Player, Player)
						triggerServerEvent("DarM16", localPlayer, localPlayer)
					else
						triggerServerEvent("VerificarM16", Player, Player)
						outputChatBox("#7cc576[Erro]: #ffffffEste jogador não tem uma #7cc576M16#FFFFFF.", 255, 255, 255, true)
					end				
					end
					
				elseif value[1] == "Pegar Deagle" then 
				if getElementData(Player, "ComDeagle") == true or getElementData(Player, "ComDeagle") == false then 
					triggerServerEvent("VerificarDeagle", Player, Player)
					if getElementData(localPlayer, "char:dutyfaction") == 20 or getElementData(localPlayer, "char:dutyfaction") == 21 or getElementData(localPlayer, "char:dutyfaction") == 22 or getElementData(localPlayer, "char:dutyfaction") == 23 or getElementData(localPlayer, "char:dutyfaction") == 24 or getElementData(localPlayer, "char:dutyfaction") == 25 or getElementData(localPlayer, "char:dutyfaction") == 26 or getElementData(localPlayer, "char:dutyfaction") == 27 or getElementData(localPlayer, "char:dutyfaction") == 28 then outputChatBox("#7cc576*ERROR #FFFFFFVocê só pode pegar M16 & AK-47.", 255, 255, 255, true) return end
					if getElementData(localPlayer, "TempLoot") then outputChatBox("#7cc576*ERROR #FFFFFFVocê looteou um jogador recentemente, Aguarde 10 minutos.", 255, 255, 255, true) return end
							 setElementData(localPlayer, "TempLoot", true)
							 setTimer(setElementData, 60000 * 10, 1, localPlayer, "TempLoot", false)
						if getElementData(Player, "ComDeagle") == true then 
						
						exports.san_chat:sendLocalMeMessage(localPlayer, "Pegou uma Deagle do jogador.(".. Player:getData("char:name") .. ")" )
						setElementData(Player, "ComDeagle", false)
						triggerServerEvent("AnimLoot", localPlayer, localPlayer)
						triggerServerEvent("RetirarDeagle", Player, Player)
						triggerServerEvent("DarDeagle", localPlayer, localPlayer)
					else
						outputChatBox("#7cc576[Erro]: #ffffffEste jogador não tem uma #7cc576Deagle#FFFFFF.", 255, 255, 255, true)
						triggerServerEvent("VerificarDeagle", Player, Player)
					end
					end
				
				elseif value[1] == "Pegar AK-47" then 
				if getElementData(Player, "ComAK") == true or getElementData(Player, "ComAK") == false then 
					triggerServerEvent("VerificarAK", Player, Player)
					if getElementData(localPlayer, "TempLoot") then outputChatBox("#7cc576*ERROR #FFFFFFVocê looteou um jogador recentemente, Aguarde 10 minutos.", 255, 255, 255, true) return end
							 setElementData(localPlayer, "TempLoot", true)
							 setTimer(setElementData, 60000 * 10, 1, localPlayer, "TempLoot", false)
						if getElementData(Player, "ComAK") == true then 
						
						exports.san_chat:sendLocalMeMessage(localPlayer, "Pegou uma AK-47 do jogador.(".. Player:getData("char:name") .. ")" )
						setElementData(Player, "ComAK", false)
						triggerServerEvent("AnimLoot", localPlayer, localPlayer)
						triggerServerEvent("RetirarAK", Player, Player)
						triggerServerEvent("DarAK", localPlayer, localPlayer)
					else
						outputChatBox("#7cc576[Erro]: #ffffffEste jogador não tem uma #7cc576AK-47#FFFFFF.", 255, 255, 255, true)
						triggerServerEvent("VerificarAK", Player, Player)
					end
					end
					
				elseif value[1] == "Fechar" then 
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

	Marker = createMarker ( PlayerX,PlayerY,PlayerZ+1.7, "arrow", 0.4, 144,238,144, 170 )
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
	dxDrawText("Looteando - #7cc576"..Player:getData("char:name"):gsub("_", " "), panelX+panelSize[1]/2, panelY+25/2, panelX+panelSize[1]/2, panelY+25/2, tocolor(255, 255, 255, 230), 1, Font, "center", "center", false, false, false, true)
	
	for index, value in ipairs (active_Menu) do 
		if exports['san_items']:hasItem(Player, 1) and value[1] == "Pegar M16" or value[1] == "Com M16" then 
			Text = "Com M16"
		else
			Text = "Pegar M16"
		end
		if exports['san_items']:hasItem(Player, 1) and value[1] == "Pegar M16" or value[1] == "Com M16" then 
			Text = "Com M16"
		else
			Text = "Pegar M16"
		end
		if isInSlot(panelX+10, panelY-20+index*55, panelSize[1]-20, 50) then 
			
			
			if value[1] ~= "Fechar" and value[1] ~= "Pegar M16" then 
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(144,238,144, 170))
				dxDrawText(value[1], panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			elseif value[1] ~= "Pegar M16" then
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(255,0,0, 170))
				dxDrawText(value[1], panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			end

			if value[1] == "Pegar M16"  then 
				dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(144,238,144, 170))
				dxDrawText(Text, panelX+192/2, panelY-20+index*55+50/2, panelX+192/2, panelY-20+index*55+50/2, tocolor(0, 0, 0, 230), 1, "default-bold", "center", "center", false, false, false, true)
			end
		else
			dxDrawRectangle(panelX+10, panelY-20+index*55, panelSize[1]-20, 50, tocolor(0, 0, 0, 170))
			if value[1] == "Pegar M16" then 
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


	
	function animSped(player,anim, speed)
		setPedAnimationSpeed(player,anim, speed)
		setPedAnimationProgress(player, 'pass_Smoke_in_car', 0)
		toggleControl('fire', false)
	end
	addEvent("animSped", true)
	addEventHandler( "animSped", root, animSped)
