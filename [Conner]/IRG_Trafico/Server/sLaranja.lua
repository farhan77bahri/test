local farmLaranja = createColSphere (-2065.334, -2535.109, 30.396, 40)

local laranja = {}
local timerex = {}
local timerde = {}

function enterZone (thePlayer)
local prTeam = getTeamFromName ( "PR" )
local prCount = countPlayersInTeam ( prTeam )
     if prCount >= 0 then
	     exports.san_hud:dm("Para iniciar o serviço necessita de 6 Policias Rodoviários.",thePlayer, 255, 255, 255)
	     return
	 end
     if isElement(laranja[thePlayer]) then
	     exports.san_hud:dm("Leve a Laranja até o caminhão.",thePlayer, 255, 255, 255)
	 else
	     exports.san_hud:dm("Pressione [E] para iniciar a colheita.",thePlayer, 255, 255, 255)
	     bindKey(thePlayer, "e", "down", startTheFunctionCLaranja)
	 end
end
addEventHandler("onColShapeHit", farmLaranja, enterZone)

function startTheFunctionCLaranja (thePlayer)
     if not isElement(laranja[thePlayer]) then
	     unbindKey(thePlayer, "e", "down", startTheFunctionCLaranja)
	     setElementFrozen(thePlayer, true)
	     setPedAnimation( thePlayer, "bomber", "bom_plant_loop", 50, false, true, false, true)
		 triggerClientEvent(thePlayer, "progressService", thePlayer, 10)
		 if not exports['san_items']:hasItemS(thePlayer, 235) then
			 exports['san_items']:giveItem(thePlayer, 235, 1, 1, 0, false)
		 end
		 timerex[thePlayer] = setTimer(
		 function ()
		     local x,y,z = getElementPosition(thePlayer)
		     setPedAnimation( thePlayer )
			 laranja[thePlayer] = createObject(2060,x,y,z)
			 setElementCollisionsEnabled(laranja[thePlayer],false)
			 setObjectScale(laranja[thePlayer],1)
			 attachElements(laranja[thePlayer],thePlayer,0,0.45,0.37,1,0,0)
			 setElementFrozen(thePlayer, false)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setPedAnimation(thePlayer, "CARRY", "crry_prtial", 50, false, true, false, true)
			 exports.san_hud:dm("Leve a laranja até o seu caminhão.",thePlayer, 255, 255, 255)
			 timerde[thePlayer] = setTimer(deletObj, 1000, 100, thePlayer)
		 end, 10000, 1)
	 end
end

function exitObjectCLaranja (thePlayer)
	 if isElement(laranja[thePlayer]) then
	     if exports['san_items']:hasItemS(thePlayer, 235) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(laranja[thePlayer]) then
			     destroyElement(laranja[thePlayer])
				 setElementData(thePlayer, "Object:Jobs", false)
				 exports.san_hud:dm("Laranja removida pelo motivo que você saiu da zona.",thePlayer, 255, 255, 255)
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 235, false)
				 unbindKey(thePlayer, "e", "down", startTheFunctionCLaranja)
             end	
		 end
     end
end
addEventHandler("onColShapeLeave", farmLaranja, exitObjectCLaranja)

function deletObj (thePlayer)
     if thePlayer then
	     if not isElementWithinColShape ( thePlayer, farmLaranja) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(laranja[thePlayer]) then
			     destroyElement(laranja[thePlayer])
				 setElementData(thePlayer, "Object:Jobs", false)
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 235, false)
             end	
		 end
	     if not exports['san_items']:hasItemS(thePlayer, 235) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(laranja[thePlayer]) then
			     destroyElement(laranja[thePlayer])
				 setElementData(thePlayer, "Object:Jobs", false)
             end			 
		 end
	 end
end