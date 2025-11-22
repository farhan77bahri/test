function playerDamage(attacker, weapon, bodypart, loss)
	if attacker then
		 if weapon > 21 and weapon < 35 and bodypart == 9 then  
			if getPedArmor(source) > 0 then 
				setPedArmor(source, 0)
			end
		end
		if attacker ~= source and getElementType(source) == "player" then
			local oldData = getElementData(source,"ammoInBody") or {}
			local value = getWeaponNameFromID ( weapon )
			local count = 1
			  if weapon > 21 and weapon < 35 then 		
					if bodypart == 3 then 
						bodypart = math.random(10, 12)
					end
					if oldData[bodypart] then 
						count = oldData[bodypart][1] + 1
					end
					oldData[bodypart] = {count, weapon, value, bodypart}
					setElementData(source,"ammoInBody", oldData)
			  end
		end
	end
end
addEventHandler("onPlayerDamage", root, playerDamage)

addEvent('bgoMTA->#removeAmmo', true)
addEventHandler('bgoMTA->#removeAmmo', root, function(medicPlayer, targetPlayer, badyPart)
	local oldData = getElementData(targetPlayer,"ammoInBody") or {}
	local count = 1
	if oldData[badyPart] then 
		--if exports["san_items"]:giveItem(medicPlayer, 79, oldData[badyPart][3], 1, 0) then 
			count = oldData[badyPart][1] - 1
		--else
			--outputChatBox('#90EE90[Ambulância]: #ffffffVocê não tem espaço suficiente no inventário!', medicPlayer, 255, 255, 255, true)
			count = oldData[badyPart][1]
		end
	end
	if count < 1 then
		oldData[badyPart] = {}
	end
	setPedAnimation(medicPlayer, "BOMBER", "BOM_Plant", 1000, false, false, false)
	oldData[badyPart] = {count, oldData[badyPart][2], oldData[badyPart][3], oldData[badyPart][4]}
	setElementData(targetPlayer,"ammoInBody", oldData)
	exports.global:sendLocalMeAction(medicPlayer, "Tirar uma bala da lesão.")
end)

addEvent('bgoMTA->#respawnPed', true)
addEventHandler('wlsMTA->#respawnPed', root, function(medicPlayer, targetPlayer, state)
	if state == 1 then 
		local skin = getElementModel(targetPlayer)
		local x, y, z = getElementPosition(targetPlayer)
		
		spawnPlayer(targetPlayer, x, y, z+1, 0, skin, 0, 0)
		setElementData(targetPlayer,  'char:hunger', 20)
		setElementData(targetPlayer,  'char:thirst', 20)
		setElementHealth(targetPlayer, 40)
		setPedAnimation( targetPlayer, "ped", "FLOOR_hit", -1, false, false, false)
		triggerClientEvent(medicPlayer, 'wlsMTA->#refreshPanelData', medicPlayer, targetPlayer)
	elseif state == 2 then 
		local skin = getElementModel(targetPlayer)
		local x, y, z = getElementPosition(medicPlayer)
		
		spawnPlayer(targetPlayer, x, y, z+1, 0, skin, 0, 0)
		setElementHealth(targetPlayer, 60)
		setElementData(targetPlayer,  'char:hunger', 100)
		setElementData(targetPlayer,  'char:thirst', 100)
	end
end)


addEvent('bgoMTA->#respawnPed2', true)
addEventHandler('bgoMTA->#respawnPed2', root, function(medicPlayer, targetPlayer, state)
	--if state == 1 then 
		local skin = getElementModel(targetPlayer)
		local x, y, z = getElementPosition(targetPlayer)
		
		spawnPlayer(targetPlayer, x, y, z+1, 0, skin, 0, 0)
		setElementHealth(targetPlayer, 30)
		--setElementData(targetPlayer,  'char:hunger', 100)
		--setElementData(targetPlayer,  'char:thirst', 100)
		--[[
	elseif state == 2 then 
		local skin = getElementModel(targetPlayer)
		local x, y, z = getElementPosition(medicPlayer)
		
		spawnPlayer(targetPlayer, x, y, z+1, 0, skin, 0, 0)
		setElementHealth(targetPlayer, 60)
		setElementData(targetPlayer,  'char:hunger', 100)
		setElementData(targetPlayer,  'char:thirst', 100)
		]]--
	--end
end)

addEvent('bgoMTA->#removeMedicItem', true)
addEventHandler('bgoMTA->#removeMedicItem', root, function(medicPlayer)
	if medicPlayer then
		-- exports['san_items']:deleteItem(medicPlayer, 64)
		triggerEvent('bgoMTA->#takePlayerItemToID', medicPlayer, medicPlayer, 64, false)
	end
end)

addEvent('bgoMTA->#stabilizated', true)
addEventHandler('bgoMTA->#stabilizated', root, function(medicPlayer)
	if medicPlayer then
		triggerEvent('onPlayerHeal', medicPlayer, false)
	end
end)

addEvent('bgoMTA->#setElementFrozen', true)
addEventHandler('bgoMTA->#setElementFrozen', root, function(medicPlayer, state)
	if medicPlayer then
		if not state then state = false end
		setElementFrozen(source, state)
	end
end)

addEvent('bgoMTA->#medicedPlayer', true)
addEventHandler('bgoMTA->#medicedPlayer', root, function(medicPlayer, targetPlayer, state)
	if state == 1 then
		exports.global:sendLocalMeAction(medicPlayer, "Sacode ".. getPlayerName(targetPlayer):gsub("_", " ") .."-t.")
		exports.global:sendLocalDoAction(targetPlayer, "Sacode.")
		--setPedAnimation(medicPlayer, "medic", "cpr", 1000, false, false, false)
	elseif state == 2 then
		exports.global:sendLocalDoAction(targetPlayer, "Sacode e abre os olhos por um momento.")	
	elseif state == 3 then
		--exports.global:sendLocalDoAction(targetPlayer, "az újraélesztés sikertelen.")
	end
end)