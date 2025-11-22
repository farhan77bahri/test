
function setCuffPlayer(player)
	setElementFrozen(player, true)

	setPedAnimation(player)
	--setPedAnimation(player,'ped', 'pass_Smoke_in_car', 0, true, true, true)
	--setTimer(setPedAnimationSpeed,60,1,player, 'pass_Smoke_in_car', 0)


	setPedAnimation( player, "GRAVEYARD", "mrnM_loop", -1, true, false, false, false)
--	setPedAnimationSpeed(player,"pass_Smoke_in_car", 0)
--	setPedAnimationProgress( player, "pass_Smoke_in_car", 1)

	--local x, y, z = getElementPosition(player)
	--local box = createObject(364, x, y, z)
	--exports.bone_attach:attachElementToBone(box, player, 12, 0,0,0,   0,40,-10)
	setElementCollisionsEnabled(box, false)
	setElementData(player,'cuffOb', box)
	toggleControl(player, 'jump', false)
	--setTimer(function(player)
	--	if getElementData(player,'cuff') and getElementData(player,'cuff') == true then
	--		toggleControl(player, 'fire', false)
	--	end
	--end,60,0,player)
	toggleControl(player, 'crouch', false)
	--toggleAllControls(player,false)


end



addEvent("onServerCuff", true)
addEventHandler("onServerCuff", root, function (player, element)
	if element:getData("char.Cuffed") == 1 then 
		if getElementData(element, "visz:status") == 2 then outputChatBox("#dc143c[BV]:#ffffff Enquanto o jogador estiver na mão, não é possível remover a algema.", source, 255, 255, 255, true) return end
		setElementData(element, "char.Cuffed", 0)
		setElementFrozen(element, false)
		toggleControl(element,'next_weapon',true)
		toggleControl(element,'previous_weapon',true)
		toggleControl(element,'fire',true)
		toggleControl(element,'aim_weapon',true)



		toggleControl(element,'forwards',true)
		toggleControl(element,'backwards',true)
		toggleControl(element,'left',true)
		toggleControl(element,'right',true)


		--toggleAllControls(element, true, true, true)
		--toggleAllControls(element,true)
		exports.san_chat:sendLocalMeAction(player, "Retirou as algemas do ".. element:getData("char:name"):gsub("_", " ")..".")
		--exports.san_item:giveItem(player, 42, 1)


		toggleControl(element, 'jump', true)
		toggleControl(element, 'crouch', true)
		setPedAnimation(element)


	else
		setElementData(element, "char.Cuffed", 1)
		--setElementFrozen(element, true)
		outputChatBox("#ffffff Você algemou " .. element:getData("char:name"):gsub("_", " ") .. ".", player, 255, 194, 14, true)
		outputChatBox("#ffffff " .. player:getData("char:name"):gsub("_", " ") .. " Algemou você.", element, 255, 194, 14, true)
		toggleControl(element,'next_weapon',false)
		toggleControl(element,'previous_weapon',false)
		toggleControl(element,'fire',false)
		toggleControl(element,'aim_weapon',false)

		toggleControl(element,'forwards',false)
		toggleControl(element,'backwards',false)
		toggleControl(element,'left',false)
		toggleControl(element,'right',false)


		

		setCuffPlayer(element)



		exports.san_chat:sendLocalMeAction(player, "Algemou ".. element:getData("char:name"):gsub("_", " ").."")
		--exports.san_item:deleteItem(player, 10)
	end
end)




addEvent("revistarANIM", true)
addEventHandler("revistarANIM", root, function (player)
	setPedAnimation(player, "POLICE", "plc_drgbst_01", 3100, true, false, false, false)
end)





addEventHandler('onPlayerQuit', root,function()
	if getElementData(source,'cuff') == true then
		destroyElement(getElementData(source,'cuffOb'))
		removeElementData(source, 'cuff')
	end
end)

addEventHandler('onPlayerWasted',root,function()
	if getElementData(source,'cuff') == true then
		destroyElement(getElementData(source,'cuffOb'))
		removeElementData(source, 'cuff')
	end
end)

addEventHandler('onVehicleStartEnter', getRootElement(),
function(player, seat)
	if getElementData(player,'cuff') == true then
		if seat ~= 0 then
			destroyElement(getElementData(player,'cuffOb'))
		else
			cancelEvent()
			--outputChatBox('Вы не можете сесть за руль, у вас наручники!',player,255,0,0)
		end
	end
end)

addEventHandler('onVehicleExit', getRootElement(),
function(player, seat)
	if getElementData(player,'cuff') == true then
		setCuffPlayer(player)
	end
end)








function ticketPlayer(thePlayer, commandName, ...)

	if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15 then	
		if not (...) then 
			outputChatBox("#7cc576Use:#ffffff /" ..commandName .. " [Motivo] - Fique perto da pessoa para limpar as coisas ilegais!", thePlayer, 255, 255, 255, true)
		else
			local reason = table.concat({...}, " ")

			local posX1, posY1, posZ1 = getElementPosition(thePlayer)
			for _, player in ipairs(getElementsByType("player")) do
				local posX2, posY2, posZ2 = getElementPosition(player)
				local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
				if distance <= 1 then
					--if player then
					if player ~= thePlayer then
                    outputChatBox(" Você limpou as coisas ilegais do jogador #7cc576" .. getPlayerName(player):gsub("_"," ") .. "", thePlayer, 255, 255, 255, true)
					outputChatBox(" Motivo: #7cc576" .. reason, thePlayer, 255, 255, 255, true)
					
					outputChatBox(" o Policial #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#ffffff limpou sua mochila ilegal ", player, 255, 255, 255, true)
					outputChatBox(" Motivo: #7cc576" .. reason, player, 255, 255, 255, true)

					takeChar (player)
					return
				--end
				end
			end
		end
	end
end
end
addCommandHandler("limpar", ticketPlayer, false, false)

function takeChar (thePlayer)
 setElementData(thePlayer, "card:job", 0 )
 setElementData(thePlayer, "char:moneysujo", 0)
 setElementData(thePlayer, "isPlayerRobbing", false)
 executeCommandHandler ( "demitir", thePlayer )
end














