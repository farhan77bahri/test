local sx,sy = guiGetScreenSize()
local panelX, panelY, state, panelHeight = 0, 0, 0, 70
local playerElement = false
local showedExamine = false
local panelSize = {
	[1] = {200, 215},
	[2] = {300, 175},
}
local ammoInPlayer = {}

local ammoNumber = {}

local font = dxCreateFont("files/Calibri.ttf",10,false)

local color = {
	["red"] = {215,86,86,"#D75656"},
	["green"] = {124,197,118,"#7CC576"},
}

local menuPoints = {
	{'Examinar', color['green'][1], color['green'][2], color['green'][3]},
	{'Salvar', color['green'][1], color['green'][2], color['green'][3]},
	{'Fornecimento de rupturas', color['green'][1], color['green'][2], color['green'][3]},
	{'Fechar', color['red'][1], color['red'][2], color['red'][3]},
}

function convert(id)
    local table = {
		[4] = "Pescoço",
		[5] = "Mão esquerda",
		[6] = "Mão direita",
		[7] = "Pé esquerdo",
		[8] = "Pé direito",
		[9] = "cabeça",
		[10] = "bacia",
		[11] = "Tendão",
		[12] = "tórax",
    }
    return table[id] or "desconhecido"
end

setElementData(localPlayer,"ammoInBody",{})
setElementData(localPlayer,"player->dead", false)
setElementData(localPlayer, 'injured', false)


addEventHandler('onClientClick', root, function(button, states, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if button == 'left' and states == 'down' then 
		-- outputChatBox(tostring(showedExamine) .. ' ' .. tostring(showMedicPanel) .. '  ')
	end
	if button == 'left' and states == 'down' and not showedExamine and clickedElement and clickedElement~=localPlayer and (getElementType(clickedElement) == "player" or (getElementType(clickedElement) == "ped" and getElementData(clickedElement, 'deadped') or false)) and not showMedicPanel then


		if getElementData(localPlayer, "char:dutyfaction") == 31 then --and getElementData(localPlayer, "char:duty") then 
		if not (getElementData(localPlayer, "maca:area") == true) then outputChatBox("#FF0000[AVISO]#FFFFFF: para curar é preciso da maca ao seu lado!.", 255,255,255, true) return end
			local x, y, z = getElementPosition(getLocalPlayer())
			local playerx, playery, playerz = getElementPosition(clickedElement)
			if (getDistanceBetweenPoints3D(x, y, z, playerx, playery, playerz) <= 5) then
				
				ammoInPlayer = getElementData(clickedElement,"ammoInBody")
				
				state = 1
				
				panelX = math.max( 10, math.min( absoluteX, sx - panelSize[state][1] - 10 ) )
				panelY = math.max( 10, math.min( absoluteY, sy - panelSize[state][2] - 10 ) )
				
				playerElement = clickedElement
				showedExamine = true
				removeEventHandler("onClientRender", root, createPlayerPanel)
				addEventHandler("onClientRender", root, createPlayerPanel, true, 'low-5')
			end
		-- else
			
		 end
	elseif button == "left" and states == "down" and showedExamine then
		if state == 1 then 
			for index, value in ipairs (menuPoints) do 
				if isMouseInPosition(panelX+10, panelY-10+index*45, panelSize[1][1]-20, 40) then
					state = index + 1
					if state == 2 then
						ammoInPlayer = getElementData(playerElement,"ammoInBody")
					elseif state == 3 then
						if getElementData(playerElement, 'dead.info') == 9 then 
							outputChatBox('#90EE90[MEDICO]: #ffffffVocê não pode reviver uma pessoa morta com tiro na cabeça!',124,197,118,true)
							state = 1
						else
							if getElementHealth(playerElement) >= 0 and getElementHealth(playerElement) <= 50 then 
								if getPlayerToAmmo() then
									if getElementData(localPlayer, "char:dutyfaction") == 31 then
										if getElementHealth(playerElement) >= 0 and getElementHealth(playerElement) <= 2 then
											if exports['san_items']:hasItem(localPlayer, 81) then 
												startMedMinigame(playerElement)
											else
												outputChatBox('#90EE90[MEDICO]: #ffffffNão há nenhum objeto para você executar a operação. #F7CA18(Desfibrilador)', 255, 255, 255, true)
											end
										else
											if exports['san_items']:hasItem(localPlayer, 64) then 
												triggerEvent('bgoMTA->#startMinigame', localPlayer, true, 8, 22, "entMinigameToRespawn")
												triggerServerEvent('bgoMTA->#removeMedicItem', localPlayer, localPlayer)
											end
										end
									else
										if not getElementData(playerElement, 'player->dead') then 
											if exports['san_items']:hasItem(localPlayer, 64) then 
												triggerEvent('bgoMTA->#startMinigame', localPlayer, true, 20, 58, "entMinigameToRespawn") 
												triggerServerEvent('bgoMTA->#removeMedicItem', localPlayer, localPlayer)
											end
										else
											outputChatBox('#90EE90[Salvamento]: #ffffffVocê não pode fazer a tarefa várias vezes!',124,197,118,true)
										end
									end
									ammoInPlayer = {}
									removeEventHandler("onClientRender", root, createPlayerPanel) 
									showMedicPanel = false
									showedExamine = false
								else
									outputChatBox('#90EE90[MEDICO]: #ffffffPrimeiro tire as balas do jogador.', 255, 255, 255, true)
									ammoInPlayer = {}
									removeEventHandler("onClientRender", root, createPlayerPanel) 
									showedExamine = false
									showMedicPanel = false
								end
							else
								state = 1
							end
						end
					elseif state == 4 then
						if getElementData(localPlayer, "char:dutyfaction") == 31 then --and getElementData(localPlayer, "char:duty") == true then 

							if getElementData(playerElement, 'injured') then 
								if isTimer(timer) then return end
								timer = setTimer(function() end, 2000, 1) --- spam védelem
								triggerServerEvent('bgoMTA->#setElementFrozen', playerElement, localPlayer, true)
								triggerEvent('bgoMTA->#startMinigame', localPlayer, true, 8, 1, "entMinigameToStabilizated") 
								ammoInPlayer = {}
								removeEventHandler("onClientRender", root, createPlayerPanel) 
								showedExamine = false
								showMedicPanel = false
								state = 1	
							else
								removeEventHandler("onClientRender", root, createPlayerPanel) 
								showedExamine = false
								showMedicPanel = false
								state = 1	
								outputChatBox('#90EE90[MEDICO]#ffffff O jogador não tem nada quebrado !!', 255, 255, 255, true)
							end
						else
							outputChatBox('#90EE90[MEDICO]#ffffffAs fraturas só podem ser fornecidas por pessoas de serviço de resgate!!', 255, 255, 255, true)
							removeEventHandler("onClientRender", root, createPlayerPanel) 
							showedExamine = false
							showMedicPanel = false
							state = 1	
						end
					elseif state == 5 then 
						ammoInPlayer = {}
						removeEventHandler("onClientRender", root, createPlayerPanel) 
						showedExamine = false
						showMedicPanel = false
					end
				end
			end
		elseif state == 2 then
			if isMouseInPosition(panelX+10, panelY+panelHeight-35, panelSize[state][1]-20, 30) then
				state = 1
			end
			local elem = 0
			for index, value in pairs(ammoInPlayer) do
				if value[1] > 0 then 
					elem = elem + 1
					if isMouseInPosition(panelX+panelSize[state][1]-110, panelY-20+elem*35, 100, 25) then 
						if isTimer(timer) then return end
						timer = setTimer(function() end, 2000, 1) --- spam védelem
						if exports['san_items']:hasItem(localPlayer, 80) then 
							triggerServerEvent('bgoMTA->#removeAmmo', localPlayer, localPlayer, playerElement, index)
							ammoInPlayer = {}
							removeEventHandler("onClientRender", root, createPlayerPanel) 
							showedExamine = false
						else
							outputChatBox('#90EE90[MEDICO]: #ffffffNão há nenhum objeto para você realizar a operação. #F7CA18(pinça)', 255, 255, 255, true)
						end
					end
				end
			end
		end
	end
end)
function createPlayerPanel()
	if not showedExamine then return end
	local jX, jY, jZ = getElementPosition(getLocalPlayer())
	local bX, bY, bZ = getElementPosition(playerElement)
	
	-- if (getDistanceBetweenPoints3D(jX, jY, jZ, bX, bY, bZ) > 15 ) then removeEventHandler("onClientRender", root, createPlayerPanel) showedExamine = false end
	if state == 1 then
		dxDrawRectangle(panelX, panelY, panelSize[state][1], panelSize[state][2], tocolor(0, 0, 0, 200))
		dxDrawRectangle(panelX, panelY, panelSize[state][1], 25, tocolor(0, 0, 0, 200))
		dxDrawText("IRG Roleplay", panelX+panelSize[state][1]/2, panelY+25/2, panelX+panelSize[state][1]/2, panelY+25/2, tocolor(245, 245, 245, 240), 1, font, "center", "center", false, false, false, true)
		for index, value in ipairs(menuPoints) do 
			dxDrawRectangle(panelX+10, panelY-10+index*45, panelSize[state][1]-20, 40, tocolor(0, 0, 0, 170))
			if isMouseInPosition(panelX+10, panelY-10+index*45, panelSize[state][1]-20, 40) then 
				dxDrawRectangle(panelX+15, panelY-10+index*45+5, panelSize[state][1]-30, 30, tocolor(value[2], value[3], value[4], 170))
				dxDrawText(value[1], panelX+panelSize[state][1]/2, panelY-10+index*45+40/2, panelX+panelSize[state][1]/2, panelY-10+index*45+40/2, tocolor(0, 0, 0, 240), 1, font, "center", "center", false, false, false, true)			
			else
				dxDrawText(value[1], panelX+panelSize[state][1]/2, panelY-10+index*45+40/2, panelX+panelSize[state][1]/2, panelY-10+index*45+40/2, tocolor(255, 255, 255, 240), 1, font, "center", "center", false, false, false, true)
			end
		end
	elseif state == 2 then
		dxDrawRectangle(panelX, panelY, panelSize[state][1], panelHeight, tocolor(0, 0, 0, 200))
		if isMouseInPosition(panelX+10, panelY+panelHeight-35, panelSize[state][1]-20, 30) then
			dxDrawRectangle(panelX+10, panelY+panelHeight-35, panelSize[state][1]-20, 30, tocolor(210, 77, 87, 200))
		else
			dxDrawRectangle(panelX+10, panelY+panelHeight-35, panelSize[state][1]-20, 30, tocolor(210, 77, 87, 150))
		end
		dxDrawText("Fechar", panelX+10+(panelSize[state][1]-20)/2, panelY+panelHeight-35+30/2, panelX+10+(panelSize[state][1]-20)/2, panelY+panelHeight-35+30/2, tocolor(0, 0, 0, 240), 1, font, "center", "center", false, false, false, true)
		
		local elem = 0
		for index, value in pairs(ammoInPlayer) do
			if value[1] > 0 then 
				elem = elem + 1
				if isMouseInPosition(panelX+panelSize[state][1]-110, panelY-20+elem*35, 100, 25) then
					dxDrawRectangle(panelX+panelSize[state][1]-110, panelY-20+elem*35, 100, 25, tocolor(color['green'][1], color['green'][2], color['green'][3], 200))
				else
					dxDrawRectangle(panelX+panelSize[state][1]-110, panelY-20+elem*35, 100, 25, tocolor(color['green'][1], color['green'][2], color['green'][3], 150))
				end
				dxDrawText("Tirar", (panelX+panelSize[state][1]-110)+100/2, panelY-20+elem*35+25/2, (panelX+panelSize[state][1]-110)+100/2, panelY-20+elem*35+25/2, tocolor(0, 0, 0, 240), 1, font, "center", "center", false, false, false, true)
				dxDrawText(value[1] .. " balas a ".. convert(index), panelX+20, panelY-25+elem*35+30/2, 200, panelY-20+elem*35+30/2, tocolor(255, 255, 255, 240), 1, font, "left", "center", false, false, false, true)
				panelHeight = (elem*40)+40
			-- else
				-- elem = elem +1 
				-- dxDrawText(value[1] .. " vágás a ".. convert(index), panelX+20, panelY-25+elem*35+25/2, 200, panelY-20+elem*35+30/2, tocolor(255, 255, 255, 240), 1, font, "left", "center", false, false, false, true)
				-- panelHeight = (elem*40)+40
			end
		end
		if elem == 0 then 
			dxDrawText('Nenhum dano encontrado.', panelX+panelSize[state][1]/2, panelY+10, panelX+panelSize[state][1]/2, panelSize[state][2], tocolor(255, 255, 255, 240), 1, font, "center", "top", false, false, false, true)
		end
	end
end

addEvent('bgoMTA->#entMinigameToStabilizated', true)
addEventHandler('bgoMTA->#entMinigameToStabilizated', root, function(win)
	if win then 
		setElementData(playerElement, 'injured', false)
		triggerServerEvent('bgoMTA->#stabilizated', playerElement, playerElement)
		triggerServerEvent('bgoMTA->#setElementFrozen', playerElement, localPlayer, false)
		outputChatBox('#7cc576[Curar]: #ffffffCurou com sucesso das fraturas!',124,197,118,true)
		ammoInPlayer = {}
		removeEventHandler("onClientRender", root, createPlayerPanel) 
		showedExamine = false
		showMedicPanel = false
	end
end)

addEvent('bgoMTA->#entMinigameToRespawn', true)
addEventHandler('bgoMTA->#entMinigameToRespawn', root, function(win)
	if win then 
		triggerServerEvent('bgoMTA->#respawnPed', localPlayer, localPlayer, playerElement, 2)
		--setElementData(localPlayer,"char:money", getElementData(localPlayer,"char:money") + 500)
	else
		if getElementData(localPlayer, "char:dutyfaction") == 31 then
			setElementData(playerElement, 'player->dead', true)
		end
		outputChatBox('#FF0000[Curar]: #ffffffNão conseguiu reviver a pessoa!',124,197,118,true)
	end
end)

function cancelPedDamage ( attacker )
	if getElementData(source, 'deadped') or false then 
		cancelEvent() 
	end
end
addEventHandler ( "onClientPedDamage", getRootElement(), cancelPedDamage )

function getPlayerToAmmo()
	local permit = true
	for index, value in pairs(ammoInPlayer) do
		if value[1] > 0 then 
			permit = false
		end
	end
	return permit
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