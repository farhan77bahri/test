hpMin = 10
Tempo = {}
ColMedic = {}

function ChecarVida(attacker)
	for i, player in pairs (getElementsByType("player")) do
		if not getElementData(player, "PlayerCaido") then
			local conta = getAccountName(getPlayerAccount(player))
				if getElementHealth(player) >= 1 then
					if getElementHealth(player) <= hpMin then 
						removePedFromVehicle(player)
						setElementData(player, "PlayerCaido", true)
						setElementFrozen(player, true)
						exports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(player) .. " (" .. getElementData(player, "playerid") .. ") #ffffffAcabou de ser derrubado")
						setElementHealth(player, 10)
						setPedAnimation( player, "CRACK", "crckidle2", -1, false, false, false, true)
						setTimer(function()
							if getElementData(player, "PlayerCaido") then	
								killPed(player)
							end
						end, 240000, 1)
					end
				end
		else
			setPedAnimation( player, "CRACK", "crckidle2", -1, false, false, false, true)
		end
	end
end
setTimer(ChecarVida, 200, 0)

--addEvent("OnDano", true)
--addEventHandler("OnDano", getRootElement(), ChecarVida)



function ChecarVidaA()
	for i, player in pairs (getElementsByType("player")) do
		if  getElementData(player, "PlayerCaido") then
		local conta = getAccountName(getPlayerAccount(player))
			if getElementHealth(player) >= 11 then
				setElementData(player, "PlayerCaido", false)
				setPedAnimation(player, false)
				setElementFrozen(player, false )
			end
		end
	end
end
setTimer(ChecarVidaA, 200, 0)

function SetarCaidoComHS(attacker)
	player = source
	if not getElementData(player, "PlayerCaido") then
		removePedFromVehicle(player)
		setElementHealth(player, 10)
		setElementData(player, "PlayerCaido", true)
		--setPedAnimation(player, "SWEET", "Sweet_injuredloop", 1000, false, false, false, true)
		setPedAnimation( player, "CRACK", "crckidle2", -1, false, false, false, true)
		exports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(player) .. " (" .. getElementData(player, "playerid") .. ") #ffffffAcabou de ser derrubado pelo "..getPlayerName(attacker).."")
		setTimer(function()
			if getElementData(player, "PlayerCaido") then	
				killPed(player)
			end
		end, 240000, 1)
	end
end
addEvent("OnHS", true)
addEventHandler("OnHS", getRootElement(), SetarCaidoComHS)

function curar_jogador ( thePlayer, commandName, targetPlayer )			
			if getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 31 then 
			if not (targetPlayer) then
			outputChatBox("#7cc576[4i20] Use:#ffffff /" .. commandName .. " [Nome / ID]", thePlayer, 255 ,255, 255, true)
			return end
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
			
				local player_a_ser_curado    =   targetPlayer
				local samux, samuy, samuz = getElementPosition ( thePlayer )
				local curadox, curadoy, curadoz = getElementPosition ( player_a_ser_curado )
				local dist = getDistanceBetweenPoints3D ( samux, samuy, samuz, curadox, curadoy, curadoz )
				if player_a_ser_curado == thePlayer then
					outputChatBox("#bebebeVocê não pode se curar!",thePlayer,255,255,255,true)
					return
				end
				local health = getElementHealth(player_a_ser_curado)

				if health >= 11 then outputChatBox("#bebebeVocê só pode ajudar pessoas caidas!",thePlayer,255,255,255,true) return end

				if ( dist > 5 )  then
				outputChatBox("#bebebeChegue mais perto do jogador!", thePlayer, 255, 255, 255, true)
				elseif ( dist < 4 )then
				setPedAnimation( thePlayer, "MEDIC", "CPR", 4500, true, false, false, false)
				setTimer ( function()
					setElementHealth ( player_a_ser_curado, 100 )
					setPedAnimation(player_a_ser_curado, false)
					setElementFrozen( player_a_ser_curado, false )
					setElementData(player_a_ser_curado,"PlayerCaido",false)
				end, 4500, 1 )	
				end		
			end
		end
	end
--end
--addCommandHandler ( "curar", curar_jogador )






function ticketPlayer(thePlayer)
			if getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 31 or getElementData(thePlayer, "acc:admin") > 7 then 
			local posX1, posY1, posZ1 = getElementPosition(thePlayer)
			for _, player in ipairs(getElementsByType("player")) do
				local posX2, posY2, posZ2 = getElementPosition(player)
				local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
				if distance <= 1 then
					if player ~= thePlayer then
						local health = getElementHealth(player)
						if health >= 11 then outputChatBox("#bebebeVocê só pode ajudar pessoas caidas!",thePlayer,255,255,255,true) return end
						setPedAnimation( thePlayer, "MEDIC", "CPR", 4500, true, false, false, false)
						setTimer ( function()
							takeChar (player)
						end, 4500, 1 )
				return
				end
			end
		end
	end
end
addCommandHandler("curar", ticketPlayer, false, false)

function takeChar (thePlayer)
	setElementHealth ( thePlayer, 40 )
	setPedAnimation(thePlayer, false)
	setElementFrozen( thePlayer, false )
	setElementData(thePlayer,"PlayerCaido",false)
end



function reanimar(thePlayer)
	if getElementData(thePlayer, "char:dutyfaction") == 31 or getElementData(thePlayer, "acc:admin") > 7 then 
	local posX1, posY1, posZ1 = getElementPosition(thePlayer)
	for _, player in ipairs(getElementsByType("player")) do
		local posX2, posY2, posZ2 = getElementPosition(player)
		local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
		if distance <= 2 then
			if player ~= thePlayer then
				local health = getElementHealth(player)
				if health >= 98 then outputChatBox("#bebebeVocê só pode ajudar pessoas desanimadas!",thePlayer,255,255,255,true) return end
				setPedAnimation( thePlayer, "POLICE", "CopTraf_Stop", -1, false, false, true, false)
				setTimer ( function()
					takeChar2 (player)
				end, 4500, 1 )
		return
		end
	end
end
end
end
addCommandHandler("reanimar", reanimar, false, false)

function takeChar2 (thePlayer)
setElementHealth ( thePlayer, 100 )
setPedAnimation(thePlayer, false)
end


local myMarker = createMarker (1179.4001464844, -1322.9375, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1180.1021728516, -1323.0649414063, 14.65549659729)
		setPedRotation(hitplayer, 273.0)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker, checkMedicals )


local myMarker2 = createMarker (1170.7943115234, -1322.2213134766, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals2(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1172.0860595703, -1322.7254638672, 14.65549659729)
		setPedRotation(hitplayer, 98)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker2, checkMedicals2 )


local myMarker3 = createMarker (1146.4088134766, -1320.6085205078, 13.824970245, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals3(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1146.3813476563, -1321.3023681641, 14.855496406555)
		setPedRotation(hitplayer, 183)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker3, checkMedicals3 )


local myMarker4 = createMarker (1183.3087158203, -1333.7490234375, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals4(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1184.0024414063, -1333.8840332031, 14.855496406555)
		setPedRotation(hitplayer, 275)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker4, checkMedicals4 )


local myMarker5 = createMarker (1179.0314941406, -1337.6070556641, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )--talvez remover
function checkMedicals5(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1178.8238525391, -1338.3006591797, 14.855496406555)
		setPedRotation(hitplayer, 191)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker5, checkMedicals5 )


local myMarker6 = createMarker (1170.6496582031, -1378.2999267578, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals6(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1170.6010742188, -1377.5971679688, 14.755496025085)
		setPedRotation(hitplayer, 2.0)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker6, checkMedicals6 )


local myMarker7 = createMarker (1181.0776367188, -1378.3006591797, 13.824970245361, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals7(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 30 then return end

		setElementPosition(hitplayer, 1181.1253662109, -1377.5982666016, 14.755496025085)
		setPedRotation(hitplayer, 2.0)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker7, checkMedicals7 )


--[[local myMarker8 = createMarker (1183.505, -1336.915, 13.47, "cylinder", 0.9, 255, 255, 0, 0 )
function checkMedicals8(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

		if getElementData(hitplayer, "char:dutyfaction") == 16 or getElementData(hitplayer, "char:dutyfaction") == 31 then return end

		local health = getElementHealth(hitplayer)
		if health >= 50 then return end

		setElementPosition(hitplayer, 1183.031, -1335.598, 14.043)
		setPedRotation(hitplayer, 93.75)
		setPedAnimation( hitplayer, "CRACK", "crckidle2", -1, true, false, false)
	end
end
addEventHandler( "onMarkerHit", myMarker8, checkMedicals8 )--]]






function ChecarAnimo2(attacker)
	for i, player in pairs (getElementsByType("player")) do
		if not getElementData(player, "PlayerAnimo") then
			if getElementData(player, "PlayerCaido") == true then return end
				if getElementHealth(player) >= 1 then
					if getElementHealth(player) <= 30 then 
						setElementData(player, "PlayerAnimo", true)
						triggerClientEvent(player,"JoinQuitGtaV:notifications", player,"animo", "Você está desanimado vá para o hospital e tome um remedio!", 15 )
						toggleControl (player, "sprint", false ) 
						toggleControl (player, "jump", false )

						setPedWalkingStyle(player,120)
						setElementHealth(player, 30)
					end
				end
		else
			setPedWalkingStyle(player,120)
			toggleControl (player, "sprint", false ) 
			toggleControl (player, "jump", false )
		end
	end
end
setTimer(ChecarAnimo2, 200, 0)

function ChecarAnimo()
	for i, player in pairs (getElementsByType("player")) do
		if  getElementData(player, "PlayerAnimo") then
			if getElementHealth(player) >= 51 then
				setElementData(player, "PlayerAnimo", false)
				setPedAnimation(player, false)
				setPedWalkingStyle(player,0)
				toggleControl (player, "sprint", true ) 
				toggleControl (player, "jump", true )
			end
		end
	end
end
setTimer(ChecarAnimo, 200, 0)


------------------------------------------------ [ CIRURGIA ] ----------------------------------------------

function testecnr(thePlayer, commandName, id) 
	burger = createObject(id,0,0,0) 
	exports.bone_attach:attachElementToBone(burger,thePlayer,3,1,1,1,1,-0,0) 
end
addCommandHandler("connertest", testecnr, false, false)

function testecnr2(thePlayer) 
	exports.bone_attach:detachElementFromBone(burger)
	destroyElement(burger)
	burger = nil
end
addCommandHandler("connertest2", testecnr2, false, false)

---------------------TELEPORTE P/SALA DE CIRURGIA---------------------------
--ENTRAR: 1166.4602050781, -1301.2673339844, 13.824970245361
--SAIR: 1165.2221679688, -1303.1608886719, 19.35853385

local entrada = createMarker(1166.4602050781, -1301.2673339844, 13.824970245361-0.9, 'cylinder', 1.0, 255, 255, 255, 90)
function MarkerHit1( player )
    setElementPosition(player, 1168.4155273438, -1293.4302978516, 19.358533859253)
end
addEventHandler( "onMarkerHit", entrada, MarkerHit1 )

local saida = createMarker(1165.2221679688, -1303.1608886719, 19.35853385-0.9, 'cylinder', 1.0, 255, 255, 255, 90)
function MarkerHit2( player )
     setElementPosition(player, 1159.2609863281, -1302.1042480469, 13.824970245361)
end
addEventHandler( "onMarkerHit", saida, MarkerHit2 )
---------------------------------------------------------------------------

local cirurgiaarea = createColSphere(1177.3259277344, -1297.6839599609, 13.824970245361, 5)

function cirurgia(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 31 or getElementData(thePlayer, "acc:admin") >= 5 then
		local posX1, posY1, posZ1 = getElementPosition(thePlayer)
		for _, player in ipairs(getElementsByType("player")) do
			local posX2, posY2, posZ2 = getElementPosition(player)
			local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
			if distance <= 2 then
				if player ~= thePlayer then
					if isElementWithinColShape(player, cirurgiaarea) and isElementWithinColShape(thePlayer, cirurgiaarea) then
					if getElementData(player, "char:dutyfaction") == 31 or getElementData(player, "char:dutyfaction") == 16 then return end
						fadeCamera(player, false, 1.5)
						setElementData(player, "nacirurgia", true)
						toggleAllControls(player, false, false, false)
						setElementFrozen(player, true)
						setElementData(player, "tazed", 1, false)
						setPedAnimation(player, "CRACK", "crckidle2", -1, false, false, false, true)
					
						setTimer( function()
						end, 5000, 1)
					
						setTimer( function()
							triggerClientEvent(player, "cirurgiaIniciando", player, player)
						end, 10, 1)
						
						setTimer( function()
							fadeCamera(player, true, 2.5)
						end, 1000, 1)
						return
					end
				end
			end
		end
	end
end
addCommandHandler("cirurgia", cirurgia, false, false)



function ticketPlayer(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 31 or getElementData(thePlayer, "acc:admin") >= 1 then
		local posX1, posY1, posZ1 = getElementPosition(thePlayer)
		for _, player in ipairs(getElementsByType("player")) do
			local posX2, posY2, posZ2 = getElementPosition(player)
			local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
			if distance <= 2 then
				if player ~= thePlayer then
				if getElementData(player, "char:dutyfaction") == 31 or getElementData(player, "char:dutyfaction") == 16 then return end
					if isElementWithinColShape(player, cirurgiaarea) and isElementWithinColShape(thePlayer, cirurgiaarea) then
						triggerClientEvent(player, "acaboucirurgia", player, player)
						setElementData(player, "tazed", 0, false)
						toggleAllControls(player, true, true, true)
						setElementFrozen(player, false)
						return
					end
				end
			end
		end
	end
end
addCommandHandler("retirarcirurgia", ticketPlayer, false, false)




--[[function CirurgiaFinalizada(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 31 or getElementData(thePlayer, "acc:admin") >= 5 then
		local posX1, posY1, posZ1 = getElementPosition(thePlayer)
		for _, player in ipairs(getElementsByType("player")) do
			local posX2, posY2, posZ2 = getElementPosition(player)
			local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
			if distance <= 1 then
				if player ~= thePlayer then
					triggerClientEvent(player, "acaboucirurgia", player, player)
				end
			end
		end
	end
end
addCommandHandler("retirarcirurgia", CirurgiaFinalizada, false, false)--]]

function tiraranim(source)
setPedAnimation(source)
end
addEvent("tiraranim", true)
addEventHandler("tiraranim", getRootElement(), tiraranim)


