local ATM_PROGRESS_TIME = 300000
local ATM_TIMEOUT = 3600000
local ATM_PICKUPS = 1
local ATM_ROB_PAY_PER_PICKUP = 20000

local atmCooldown = {}
local atmBag = {}
local atmBagColShape = {}
local atmTimer = {}
local atmSerial = {}


ATMs = 
{
       {1145.7039794922, -1098.7727050781, 19.297250747681},
   -- { 1817.2287597656, -1406.0472412109, 13.60000038147 },
}


function onATMShapeHit2 ( element )
	if ( isElement(element) and getElementType(element) == "player"  ) then
		if ( not isPedInVehicle(element) and isPedOnGround(element) ) then
				if ( atmIsAbleToRob2(element) and not atmIsPlayerRobbing2 (element) ) then
					bindKey(element, "N", "down", atmStartRobbing2)
					drawNote('ATMRobbery', 'Baraye Start Rob [N] Ra Bezanid', element, 255, 0, 0, 5000)
				else
					drawNote('ATMRobbery', 'You cannot steal this cashier right now, you must wait '.. atmGetTimeOut2 ( element ) .. ' segundos', element, 255, 0, 0, 5000)
                end
		end
	end
end





function onATMShapeLeave2 ( element)
	if ( isElement(element) and getElementType(element) == "player" ) then
		if ( not isPedInVehicle(element) and isPedOnGround(element) ) then
			unbindKey(element, "N", "down", atmStartRobbing2)
			drawNote('ATMRobbery', '', element, 0, 0, 0, 1)
		end
	end
end

function atmIsAbleToRob2 ( player )
	return not isTimer(atmCooldown[player])
end

function atmIsPlayerRobbing2 ( player )
	return isElement(atmBag[player])
end

function atmGetTimeOut2 ( player )
	if isTimer ( atmCooldown[player] ) then
		local miliseconds = getTimerDetails ( atmCooldown[player] )
		return math.ceil( miliseconds / 1000 )
	else
		return false
	end
end


function atmSetTimeOut2 ( player, time )
	atmCooldown[player] = setTimer( 
	function (player) 
	atmCooldown[player] = nil 
	end, time, 1, player)
end


--[[
function atmIsAbleToRob2 ( player )
	return not isTimer(atmCooldown[player])
end

function atmIsPlayerRobbing2 ( player )
	return isElement(atmBag[player])
end

function atmGetTimeOut2 ( player )
	if isTimer ( atmCooldown[player] ) then
		local miliseconds = getTimerDetails ( atmCooldown[player] )
		return math.ceil( miliseconds / 1000 )
	else
		return false
	end
end]]--

--[[
function atmSetTimeOut2 ( player, time )
	atmCooldown[player] = setTimer( 
	function (player) 
	atmCooldown[player] = nil 
	for _, player in ipairs(getElementsByType("player")) do
	setElementData(player, "poderassaltar", false)
	end
	end, time, 1, player)
end
]]--



function atmDrawProgress2 ( player, time )
	exports.san_hud:drawProgressBar( 'ATMRobbery_ProgressBar', 'Progresso do Roubo', player, 255, 0, 0, time )
end

function onATMPickupHit2 ( element )
	if ( isPedInVehicle(element) ) then return end		
			
	if ( getElementData(source, "ATMRobbery.owner") == element ) then
		atmPay2(element)
		setTimer(
			function (pickup)
				destroyElement(pickup)
			end, 50, 1, source)
	else
		cancelEvent()
	end
end



local gate = createObject (2634, 1143.9723632813,  -1099.302148437, 19.9, 0, 0, 90 )

local function resetBank()
	gate = createObject (2634, 1143.9723632813,  -1099.302148437, 19.9, 0, 0, 90 )
end

local element = {}
local doingbankrob = {}
local erbeutet = {}
local DINHEIRO = {}

local markerpos = {
	[1] = {1130.5842285156, -1109.4989013672, 19.297250747681},
	[2] = {1126.5777587891, -1109.6667480469, 19.297250747681}, 
	[3] = {1128.3203125, -1109.9036865234, 19.297250747681},
	[4] = {0, 0, 0},
	[5] = {0, 0, 0},
}


function onATMRobberyComplete2 ( player )
		local x, y, z = getElementPosition( atmBag[player] )
		--for index = 1, ATM_PICKUPS do
			local offset = 0 --index*0.1
			local randomNumber = math.random(0.1, 0.6)

			--local pickup = createPickup(x-offset, y+randomNumber, z, 3, 1212, 1)



			--local pickup = createPickup(1476.9976806641, -980.97088623047, 26.8125, 3, 1212, 1)


			--setElementData(pickup, "ATMRobbery.owner", player)
			--addEventHandler("onPickupHit", pickup, onATMPickupHit2)

		--end

		for i = 1, #markerpos, 1 do
		element["robmarker"..i] = createMarker(markerpos[i][1], markerpos[i][2], markerpos[i][3]-0.8, "cylinder", 1.0, 0, 255, 0, 50)
		local m = element["robmarker"..i]
		addEventHandler("onMarkerHit", m, function(hitElement)
			if(getElementType(hitElement) == "player") then
				destroyElement(source)
				destroyElement(element["canta"..i])
                                setElementFrozen ( hitElement, true )
				setPedAnimation(hitElement, "bomber", "BOM_Plant_Loop", -1, true, false, false)
				toggleAllControls(hitElement, false)

				Dinheiro222 = setTimer(function()
					DINHEIRO[hitElement] = createObject ( 1550, 0, 0, 0 )
                    setElementCollisionsEnabled (DINHEIRO[hitElement], false)
					attachElements ( DINHEIRO[hitElement], hitElement, 0, -0.3, 0.2 )
                                        setTimer(destroyElement,60000,1,DINHEIRO[hitElement])
					
					-- SICHERHEITSHINWEIS --
					setPedAnimation(hitElement)
					toggleAllControls(hitElement, true)
					atmPay2 ( hitElement )
					local geld3 = math.random(1000, 6000)
					doingbankrob[hitElement] = true
					erbeutet[hitElement] = geld3
                                        setElementFrozen ( hitElement, false )
					setTimer(function()
						doingbankrob[hitElement] = false
						erbeutet[hitElement] = 0
					end, 60000, 1)
				end, 15000, 1)
			end
		end)
end

		--for explosions = 1, 3 do
			createExplosion(x, y, z, 0)
		--end

		destroyElement(gate) 
		setElementDimension(gate,9875)

		destroyElement(atmBag[player])
		destroyElement(atmBagColShape[player])
		atmBag[player] = nil
		atmBagColShape[player] = nil
		triggerClientEvent(player, "terminaracao", player)
		--triggerClientEvent(root, "atmstopRobbing2", root, player)

end

addEventHandler("onPlayerWasted", getRootElement(), function()
	if(doingbankrob[source] == true) then
		if(erbeutet[source]) then
			doingbankrob[source] = false
			setElementData(source, "char:moneysujo", (getElementData(source,"char:moneysujo") or 0) - geld)
			if isTimer(Dinheiro222) then
            killTimer(Dinheiro222)
			end
			toggleAllControls(source, true)
			outputChatBox("Shoma Koshte Shodid Va Pol Be Bank Bargasht!", source, 255, 0, 0)
			exports.san_hud:dm("Shoma Koshte Shodid Va Pol Be Bank Bargasht!",source, 200, 0, 0 )
		end
	end
end)

addEventHandler("onPlayerQuit", getRootElement(), function(reason)
	if(reason ~= "Kicked") and (reason ~= "Timed out")  then
		if(doingbankrob[source] == true) then
			if(erbeutet[source]) then
				doingbankrob[source] = false
				--local geld = erbeutet[source]
					--local geld1 = math.random(5000, 10000)
							--takePlayerMoney( source, geld1 )
					if isTimer(Dinheiro222) then
                       killTimer(Dinheiro222)
				end
			end
		end
	end
end)



function atmPay2 ( player )
		geld = math.random(50000, 80000)
		exports.san_hud:dm("Você recebeu "..geld.." de dinheiro sujo!",player, 200, 0, 0 )
		setElementData(player, "char:moneysujo", (getElementData(player,"char:moneysujo") or 0) + geld )
		triggerClientEvent(player, "TESTE2", root, "Roubo efetuado com sucesso")
end

       
--local zone = createColCuboid(1813.44348, -1417.28772, 11.10156, 23.285034179688, 23.098999023438, 9.8000062942505)  

             local zone = createColCuboid(1470.21118, -984.09534, 24.61250, 25.22314453125, 14.347045898438, 5.2000144958496)
			 local zonesair = createMarker(1137.1459960938, -1116.7119140625, 24.609750747681-1, "cylinder", 2.0, 255, 255, 0, 0)--Zona falhar no assalto
			 local zonebandido = createColCuboid(1145.5384521484, -1098.3985595703, 19.297250747681, 25.0, 20.0, 20.0)-- zona bandido

	


function atmStartRobbing2 ( element )
	unbindKey(element, 'N', 'down', atmStartRobbing2)
	if ( isElement(element) ) then
	
	local policiaTeam = getTeamFromName ( "Policia" )
            	local groveCount = countPlayersInTeam ( policiaTeam )
									if groveCount >= 2 then
			
			

		count = {}
		for i,v in pairs(getElementsWithinColShape(zonebandido,"player")) do
		--if getTeamName(getPlayerTeam(v)) == "Criminals" then
			table.insert(count,v)
		--end
		end
		
		if #count < 4 then
		exports.san_hud:dm("Shoma Bayad Hade Aghal 4 Nafar Bashid.",element, 200, 0, 0 )
		return
		end


		exports.san_anims:setJobAnimation(element, "BOMBER", "BOM_Plant", 2500, false, false, true, false )
		toggleAllControls(element, false)
		setTimer(toggleAllControls, 2500, 1, element, true)
		atmDrawProgress2 ( element, ATM_PROGRESS_TIME )
		
		for _, player in ipairs(getElementsByType("player")) do
		atmSetTimeOut2(player, ATM_TIMEOUT)
		end
--[[
		setTimer(function()
		resetBank()
		end , ATM_TIMEOUT, 1)]]--

		bankTimer = setTimer(resetBank, ATM_TIMEOUT, 1) 

		


		
		--local wantedLvl = getPlayerWantedLevel ( element )
		--setPlayerWantedLevel ( element, wantedLvl + 3 )
		
		  local x, y, z = getElementPosition ( element )
		local location = getZoneName ( x, y, z )
		local city = getZoneName ( x, y, z, true )

		for _, players in ipairs(getElementsByType("player")) do
		triggerClientEvent(players, "TESTE22", root, "Estão roubando o Banco Central")
		if getPlayerTeam(players) == getTeamFromName("Policia")  then
		exports.san_hud:drawNote("assalto2" .. location .. "", "[Alarm]: Az Bank Markazi Serghat Shode!", players, 255, 255, 255, 10000)
		--triggerClientEvent(players, "TESTE22", root, "Estão roubando o banco itaú!")
		end
		end

		local x, y, z = getElementPosition(element)
		atmBag [ element ] = createObject( 1654, x+0.3, y, z-0.9, -90, 0, 0)
		triggerClientEvent(root, "setObjectUnbreakable2", root, atmBag[element] )
		
		local x, y, z = getElementPosition( atmBag[element] )
		atmBagColShape [ element ] = createColSphere ( x, y, z, 2 )
		setElementData(atmBagColShape[element], "atmParent", atmBag[element])
		setElementData(atmBagColShape[element], "atmOwner", element)
		addEventHandler("onColShapeHit", atmBagColShape[element], onATMBagColShapeHit2)
		addEventHandler("onColShapeLeave", atmBagColShape[element], onATMBagColShapeLeave2)
		
		atmTimer[element] = setTimer(onATMRobberyComplete2, ATM_PROGRESS_TIME, 1, element)
		local ms = getTimerDetails(atmTimer[element])
--		triggerClientEvent(root, "bomb2", root, ms, atmBag[element], atmBagColShape[element])
		triggerClientEvent(root, "bomb2", root, ms, atmBag[element])
		else
			outputChatBox("#dc143c[IRG-MTA]:#ffffff Baraye Serghat Az Bank Bayad 8 Police Dar Shahr Bashad!",element, 255, 255, 255, true)
		end
	end
end
			
function stopRobbing2 (player)
	if ( isElement(atmBag[player]) )then
		destroyElement(atmBag[player])
		destroyElement(atmBagColShape[player])
		atmBag[player] = nil
		atmBagColShape[player] = nil
	end
	if ( isTimer(atmTimer[player]) ) then
		killTimer(atmTimer[player])
		atmTimer[player] = nil
	end
	triggerClientEvent(root, "terminaracao", root)
	exports.san_hud:drawProgressBar( 'ATMRobbery_ProgressBar', '', player, 255, 0, 0, 1 )
	drawNote('ATMRobbery', '', player, 255, 0, 0, 1)
end

addEventHandler("onPlayerJailed", root, 
	function ()
		stopRobbing2(source)
	end
)

function onATMBagColShapeHit2 ( element )
	if getPlayerTeam(element) == getTeamFromName("Policia") then
	if ( isElement(element) and getElementType(element) == "player" ) then --and not getElementData(source, "atmOwner") and dim ) then
		if ( not isPedInVehicle(element) ) then
			bindKey(element, 'N', 'down', atmUnplanting2, source)
			drawNote('ATMRobbery', "Baraye Gozashtane Bomb [N] Ra Feshar Dahid. "..getPlayerName(getElementData(source, "atmOwner")).."", element, 30, 125, 255, 5000)
		end
	end
end
end


function onATMBagColShapeLeave2 ( element)
	if ( isElement(element) and getElementType(element) == "player" and not getElementData(source, "atmOwner") and dim ) then
		unbindKey(element, 'N', 'down', atmUnplanting2)
		drawNote('ATMRobbery', '', element, 0, 0, 0, 1)
	end
end

function atmUnplanting2 ( cop, _, _, colshape )
	if ( not isElement(colshape) or getElementData(colshape, "atmIsBeingDefused") ) then
		return exports.san_hud:dm("Esta bomba" .. (isElement(colshape) and "já esta desarmada" or "já está sendo neutralizada!"), cop, 255, 0, 0)
	end
	local ms = getTimerDetails(atmTimer[getElementData(colshape, "atmOwner")])
		if ( ms < 10000 ) then
			unbindKey(cop, 'N', 'down', atmUnplanting2)
			exports.san_hud:dm("É muito tarde! Afaste-se da bomba!", cop, 255, 0, 0)
		return end
		unbindKey(cop, 'N', 'down', atmUnplanting2)
		exports.san_anims:setJobAnimation(cop, "BOMBER", "BOM_Plant", 7500, true, false, true, false )
		exports.san_hud:drawProgressBar( 'ATMRobbery_Unplanting', 'Progresso do desarme', cop, 30, 125, 255, 7500 )
		local criminal = getElementData(colshape, "atmOwner")

		setElementData(colshape, "atmIsBeingDefused", true)
		toggleAllControls(cop, false)
		setTimer(
				function ( )
					if ( isElement(cop) and not isPedDead(cop) ) then
						exports.san_hud:dm("O policial "..getPlayerName(cop).." Defusou sua bomba.", criminal, 255, 0, 0)
						exports.san_hud:dm("Você desativou com sucesso a bomba do "..getPlayerName(criminal)..".", cop, 255, 0, 0)
						
								for _, player in ipairs(getElementsByType("player")) do
						triggerClientEvent(player, "TESTE22", root, "Assalto ao banco Central falhou")
						end
		
		
						stopRobbing2(criminal)	
						--givePlayerMoney(cop, 2500)
						--triggerClientEvent(source, "onClientPlayerGiveMoney2", source, 2500)
						
						
						toggleAllControls(cop, true)
					end
					if ( isElement(colshape) ) then
						setElementData(colshape, "atmIsBeingDefused", false)
					end
				end, 7500, 1)
end


function drawNote(id, text, player, r, g, b, time)
	exports.san_hud:drawNote(id, text, player, r, g, b, time)
end

addEventHandler("onResourceStart", resourceRoot, function()
	for i,v in ipairs(ATMs) do
		local colshape = createMarker(v[1], v[2], v[3]-1, "cylinder", 2, 25, 255, 25, 150)
		atmBlip = createBlip ( v[1], v[2], v[3], 36, 1, 0, 0, 0, 0, 0, 300 )
		addEventHandler("onMarkerHit", colshape, onATMShapeHit2)
		addEventHandler("onMarkerLeave", colshape, onATMShapeLeave2)
	end
end)

addEventHandler("onPlayerWasted", root,
	function ()
		if ( atmIsPlayerRobbing2(source) ) then
			stopRobbing2(source)
			
			for _, player in ipairs(getElementsByType("player")) do
--			triggerClientEvent(player, "TESTE22", root, "Assalto ao banco Central falhou")
			end
						
		end
	end
)

addEventHandler ("onPlayerArrested", root, 
	function ()
		if ( atmIsPlayerRobbing2(source) ) then
			stopRobbing2(source)
		end
	end
)

addEventHandler("onPlayerGetJob", root,
	function ()
		unbindKey(source, "N", "down", atmStartRobbing2)
		drawNote('ATMRobbery', '', source, 0, 0, 0, 1)
	end
)

addEventHandler("onPlayerGetJob", root,
	function (job, new)
		if ( job and new ~= "Criminal" and atmIsPlayerRobbing2(source)) then
			stopRobbing2(source)
		end
	end
)

addEventHandler("onResourceStop", resourceRoot, 
	function ()
		for index, players in ipairs ( getElementsByType("player") ) do
			if ( atmIsPlayerRobbing2(players) ) then
				stopRobbing2(players)
			end
		end
	end
)

addEventHandler("onPlayerQuit", root,
	function ()
		if ( atmIsPlayerRobbing2(source) ) then
			stopRobbing2(source)
			
			for _, player in ipairs(getElementsByType("player")) do
--			triggerClientEvent(player, "TESTE22", root, "Assalto ao banco Central falhou")
			end
			
		end
	end
)


function jailZoneLeave ( thePlayer )
   --if getElementType ( thePlayer ) == "player" then 
   		if ( atmIsPlayerRobbing2(thePlayer) ) then	
		for _, player in ipairs(getElementsByType("player")) do
		stopRobbing2(player)	
		triggerClientEvent(player, "TESTE22", root, "Assalto ao Banco Central falhou")
		--end
	end
   end
end
addEventHandler ( "onMarkerHit", zonesair, jailZoneLeave )



		
		
addEventHandler("onPlayerQuit", root,
	function ()
		if ( atmGetTimeOut2(source) ) then
			atmSerial[getPlayerSerial(source)] = atmGetTimeOut2(source)
		end
	end
)

addEventHandler("onPlayerQuit", root,
	function ()
		for _, pickups in ipairs ( getElementsByType("pickup") ) do
			if ( getElementData(pickups, "ATMRobbery.owner") == source ) then
				removeEventHandler("onPickupHit", pickups, onATMPickupHit2)
				destroyElement(pickups)
			end
		end
	end
)

addEventHandler("onPlayerArrested", root,
	function ()
		for _, pickups in ipairs ( getElementsByType("pickup") ) do
			if ( getElementData(pickups, "ATMRobbery.owner") == source ) then
				removeEventHandler("onPickupHit", pickups, onATMPickupHit2)
				destroyElement(pickups)
			end
		end
	end
)

addEventHandler("onPlayerWasted", root,
	function ()
		for _, pickups in ipairs ( getElementsByType("pickup") ) do
			if ( getElementData(pickups, "ATMRobbery.owner") == source ) then
				removeEventHandler("onPickupHit", pickups, onATMPickupHit2)
				destroyElement(pickups)
			end
		end
	end
)

addEventHandler("onPlayerJoin", root,
	function ()
		for serial, cooldown in pairs ( atmSerial ) do
			if ( getPlayerSerial(source) == serial ) then
				atmSetTimeOut2(source, cooldown*1000)
				atmSerial[serial] = nil
			end
		end
	end
)
   