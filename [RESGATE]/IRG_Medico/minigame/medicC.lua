local sx, sy = guiGetScreenSize()
local panelData = {sx/2-500/2, sy/2-400/2, 500, 400}
local font = dxCreateFont("files/Calibri.ttf",10,false)
local font1 = dxCreateFont("files/Calibri.ttf",14,false)
local currentBattery = 1
local currentBatteryPlayer = 0
local medicPlayer = 0
showMedicPanel = false
local currentChange = 0
local owner = nil

setElementData(localPlayer, "char.dead", false)

local batteryLife = {
	{50},
	{100},
	{150},
	{200},
	{250},
	{300},
}

 function startMedMinigame(player)
	--if not getElementData(player, "char.dead") or false then
		currentBattery = 1
		removeEventHandler('onClientRender', root, createRevivification)
		setTimer(function()
			addEventHandler('onClientRender', root, createRevivification, true, 'low-5')	
			
			showMedicPanel = true
			
			medicPlayer = player
			
			removeEventHandler('onClientClick', root, createRevivificationClick)
			addEventHandler('onClientClick', root, createRevivificationClick)
			currentBatteryPlayer = batteryLife[math.random(#batteryLife)][1]
			-- currentBatteryPlayer = 50
			
			if getElementData(medicPlayer, 'owner->element') then 
				owner = getElementData(medicPlayer, 'owner->element')
			else
				owner = medicPlayer
			end
		end,1000,1)
--	else
--		outputChatBox("#D24D57[Mentők]: #ffffffSajnálom de őt már nem tudod újraéleszteni!", 255, 255, 255, true)
--	end
end
addEvent('bgoMTA->#startMedMinigame', true)
addEventHandler('bgoMTA->#startMedMinigame', root,startMedMinigame)

function createRevivification()
	if not showMedicPanel then return end
	
	
	-- local x, y, z = getElementPosition(getLocalPlayer())
	-- local playerx, playery, playerz = getElementPosition(owner)
	-- if (getDistanceBetweenPoints3D(x, y, z, playerx, playery, playerz) > 5) then
		-- destroyMedKitPanel ()
	-- end
	
	
	dxDrawRectangle(panelData[1], panelData[2], panelData[3], panelData[4], tocolor(0, 0, 0, 200)) -- backGround
	dxDrawRectangle(panelData[1], panelData[2], panelData[3], 25, tocolor(0, 0, 0, 200)) -- Fejléc
	dxDrawText("IRG", panelData[1]+panelData[3]/2, panelData[2]+25/2, panelData[1]+panelData[3]/2, panelData[2]+25/2, tocolor(245, 245, 245, 240), 1, font, "center", "center", false, false, false, true)
	dxDrawRectangle(panelData[1]+12, panelData[2]+40, panelData[3]-24, 150, tocolor(255, 255, 255, 60)) -- EKG háttér
	
	if getElementHealth(owner) == 0 then 
		dxDrawText("____________________________________________________________________", panelData[1]+12, panelData[2]+40+150/2, panelData[1]+10+panelData[3]-20/2, panelData[2]+40+150/2, tocolor(255, 0, 0, 240), 1, font, "left", "center", false, false, false, true)
	elseif getElementHealth(owner) > 2 then
		dxDrawImage(panelData[1]+12, panelData[2]+40+80/2, panelData[3]-24, 80, 'files/ekg.png')
	end
	
	if isMouseInPosition(panelData[1]+200, panelData[2]+250, 200, 40)then
		dxDrawRectangle(panelData[1]+200, panelData[2]+250, 200, 40, tocolor(135, 211, 124, 200)) -- Start
	else
		dxDrawRectangle(panelData[1]+200, panelData[2]+250, 200, 40, tocolor(135, 211, 124, 170)) -- Start
	end
	dxDrawText("Ligar", panelData[1]+200+200/2, panelData[2]+250+40/2, panelData[1]+200+200/2, panelData[2]+250+40/2, tocolor(0, 0, 0, 240), 1, font1, "center", "center", false, false, false, true)
	
	if isMouseInPosition(panelData[1]+200, panelData[2]+300, 200, 40)then
		dxDrawRectangle(panelData[1]+200, panelData[2]+300, 200, 40, tocolor(210, 77, 87, 200)) -- Mégse
	else
		dxDrawRectangle(panelData[1]+200, panelData[2]+300, 200, 40, tocolor(210, 77, 87, 170)) -- Mégse
	end
	dxDrawText("cancelar", panelData[1]+200+200/2, panelData[2]+300+40/2, panelData[1]+200+200/2, panelData[2]+300+40/2, tocolor(0, 0, 0, 240), 1, font1, "center", "center", false, false, false, true)
	
	dxDrawText("carregando:", panelData[1]+10, panelData[2]+195, panelData[1]+panelData[3]/2, panelData[2]+25/2, tocolor(245, 245, 245, 240), 1, font1, "left", "top", false, false, false, true)

	
	for index, value in ipairs(batteryLife) do 
		if isMouseInPosition(panelData[1]+20, panelData[2]+190+index*30, 100, 25)then
			dxDrawRectangle(panelData[1]+17, panelData[2]+190+index*30, 3, 25, tocolor(255, 255, 255, 200))
		elseif currentBattery == index then
			dxDrawRectangle(panelData[1]+17, panelData[2]+190+index*30, 3, 25, tocolor(135, 211, 124, 200))
		end
		dxDrawRectangle(panelData[1]+20, panelData[2]+190+index*30, 100, 25, tocolor(0, 0, 0, 200))
		dxDrawText(value[1] .. "V", panelData[1]+20+100/2, panelData[2]+190+index*30+25/2, panelData[1]+20+100/2, panelData[2]+190+index*30+25/2, tocolor(245, 245, 245, 240), 1, font, "center", "center", false, false, false, true)
	end
end

function createRevivificationClick(button, states)
	if button == 'left' and states == 'down' then 
		if getElementHealth(owner) == 0 then 
			for index, value in ipairs(batteryLife) do 
				if isMouseInPosition(panelData[1]+20, panelData[2]+190+index*30, 100, 25) then
					currentBattery = index
				end
			end
		end
		if isMouseInPosition(panelData[1]+200, panelData[2]+250, 200, 40) then
			if getElementHealth(owner) == 0 then 
				if currentChange < 10 then 
					triggerServerEvent('bgoMTA->#medicedPlayer', localPlayer, localPlayer, owner, 1)
					if currentBatteryPlayer == batteryLife[currentBattery][1] then 
						triggerServerEvent('bgoMTA->#medicedPlayer', localPlayer, localPlayer, owner, 2)
						outputChatBox("#D24D57[Ambulância]: #ffffffA ressuscitação é bem #87D37C'sucedida'#ffffff!", 255, 255, 255, true)
						triggerServerEvent('bgoMTA->#respawnPed2', localPlayer, localPlayer, owner, 1)
						--setElementData(localPlayer,"char:money", getElementData(localPlayer,"char:money") + 500)
						removeEventHandler('onClientRender', root, createRevivification)
						destroyMedKitPanel ()
					else
						if currentChange < 2 then
							currentBatteryPlayer = batteryLife[math.random(#batteryLife)][1]
						end
						currentChange = currentChange + 1
						outputChatBox("#90EE90[Ambulância]: #ffffffRessuscitação #D24D57'falhou'#ffffff!", 255, 255, 255, true)
						triggerServerEvent('bgoMTA->#medicedPlayer', localPlayer, localPlayer, owner, 3)
					end
				else
					outputChatBox("#90EE90[Ambulância]: #ffffffMe desculpe, mas a ressuscitação falhou!", 255, 255, 255, true)
					setElementData(medicPlayer, 'char.dead', true)
					destroyMedKitPanel ()
				end
			end
		end		
		
		if isMouseInPosition(panelData[1]+200, panelData[2]+300, 200, 40) then
			destroyMedKitPanel ()
		end
	end
end

function destroyMedKitPanel ()
	removeEventHandler('onClientRender', root, createRevivification)
	removeEventHandler('onClientClick', root, createRevivificationClick)
	currentBatteryPlayer = nil
	showMedicPanel = false
	currentChange = 0
end

addEvent('bgoMTA->#refreshPanelData', true)
addEventHandler('bgoMTA->#refreshPanelData', root, function (player)
	currentBattery = 1
	removeEventHandler('onClientRender', root, createRevivification)
	addEventHandler('onClientRender', root, createRevivification, true, 'low-5')	
	
	showMedicPanel = true
	
	medicPlayer = player
	
	removeEventHandler('onClientClick', root, createRevivificationClick)
	addEventHandler('onClientClick', root, createRevivificationClick)
	currentBatteryPlayer = batteryLife[math.random(#batteryLife)][1]
	if getElementData(medicPlayer, 'owner->element') then 
		owner = getElementData(medicPlayer, 'owner->element')
	else
		owner = medicPlayer
	end
end)