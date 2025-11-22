local farmMadeira = createColSphere (-2043.786, -2385.561, 30.632, 25)

local Madeira = {}
local timerex = {}
local timerde = {}

function enterZone (thePlayer)
     if isElement(Madeira[thePlayer]) then
	     exports.san_hud:dm("Leve a Madeira até o caminhão.",thePlayer, 255, 255, 255)
	 else
	     exports.san_hud:dm("Pressione [E] para iniciar a colheita.",thePlayer, 255, 255, 255)
	     bindKey(thePlayer, "e", "down", startTheFunctionCMadeira)
	 end
end
addEventHandler("onColShapeHit", farmMadeira, enterZone)

function startTheFunctionCMadeira (thePlayer)
     if not isElement(Madeira[thePlayer]) then
	     unbindKey(thePlayer, "e", "down", startTheFunctionCMadeira)
	     setElementFrozen(thePlayer, true)
	     setPedAnimation( thePlayer, "bomber", "bom_plant_loop", 50, false, true, false, true)
		 triggerClientEvent(thePlayer, "progressService", thePlayer, 10)
		 if not exports['san_items']:hasItemS(thePlayer, 236) then
			 exports['san_items']:giveItem(thePlayer, 236, 1, 1, 0, false)
		 end
		 timerex[thePlayer] = setTimer(
		 function ()
		     local x,y,z = getElementPosition(thePlayer)
		     setPedAnimation( thePlayer )
			 Madeira[thePlayer] = createObject(1224,x,y,z)
			 setElementCollisionsEnabled(Madeira[thePlayer],false)
			 setObjectScale(Madeira[thePlayer],0.4)
			 attachElements(Madeira[thePlayer],thePlayer,0,0.45,0.45,1,0,0)
			 setElementFrozen(thePlayer, false)
			 setElementData(thePlayer, "Object:Jobs", true)
             toggleAllControls(thePlayer, false, true, false)
             toggleControl(thePlayer, "enter_passenger", false)
			 setPedAnimation(thePlayer, "CARRY", "crry_prtial", 50, false, true, false, true)
			 exports.san_hud:dm("Leve a Madeira até o seu caminhão.",thePlayer, 255, 255, 255)
			 timerde[thePlayer] = setTimer(deletObj, 1000, 100, thePlayer)
		 end, 10000, 1)
	 end
end

function exitObjectCMadeira (thePlayer)
	 if isElement(Madeira[thePlayer]) then
	     if exports['san_items']:hasItemS(thePlayer, 236) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Madeira[thePlayer]) then
			     destroyElement(Madeira[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
				 exports.san_hud:dm("Madeira removida pelo motivo que você saiu da zona.",thePlayer, 255, 255, 255)
				 if exports['san_items']:hasItemS(thePlayer, 236) then
				     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 236, false)
				 end
				 unbindKey(thePlayer, "e", "down", startTheFunctionCMadeira)
             end	
		 end
     end
end
addEventHandler("onColShapeLeave", farmMadeira, exitObjectCMadeira)

function deletObj (thePlayer)
     if thePlayer then
	     if not isElementWithinColShape ( thePlayer, farmMadeira) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Madeira[thePlayer]) then
			     destroyElement(Madeira[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
				 if exports['san_items']:hasItemS(thePlayer, 236) then
				     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 236, false)
				 end
             end	
		 end
	     if not exports['san_items']:hasItemS(thePlayer, 236) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Madeira[thePlayer]) then
			     destroyElement(Madeira[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
             end			 
		 end
	 end
end