local farmTrigo = createColCuboid(-374.52991, -1438.51367, 23.52661, 12.186553955078, 6.836669921875, 7.9)
local zone = createColCuboid(-416.28134, -1473.95154, 23.09867, 54.827545166016, 64.978515625, 28.9)

local Trigo = {}
local timerex = {}
local timerde = {}

function enterZone (thePlayer)
     if isElement(Trigo[thePlayer]) then
	     exports.san_hud:dm("Leve a Trigo até o caminhão.",thePlayer, 255, 255, 255)
	 else
	     exports.san_hud:dm("Pressione [E] para iniciar a colheita.",thePlayer, 255, 255, 255)
	     bindKey(thePlayer, "e", "down", startTheFunctionCTrigo)
	 end
end
addEventHandler("onColShapeHit", farmTrigo, enterZone)

function startTheFunctionCTrigo (thePlayer)
     if not isElement(Trigo[thePlayer]) then
	     unbindKey(thePlayer, "e", "down", startTheFunctionCTrigo)
	     setElementFrozen(thePlayer, true)
	     setPedAnimation( thePlayer, "bomber", "bom_plant_loop", 50, false, true, false, true)
		 triggerClientEvent(thePlayer, "progressService", thePlayer, 10)
		 if not exports['san_items']:hasItemS(thePlayer, 237) then
			 exports['san_items']:giveItem(thePlayer, 237, 1, 1, 0, false)
		 end
		 timerex[thePlayer] = setTimer(
		 function ()
		     local x,y,z = getElementPosition(thePlayer)
		     setPedAnimation( thePlayer )
			 Trigo[thePlayer] = createObject(3374,x,y,z)
			 setElementCollisionsEnabled(Trigo[thePlayer],false)
			 setObjectScale(Trigo[thePlayer],0.13)
			 attachElements(Trigo[thePlayer],thePlayer,0,0.45,0.45,1,0,0)
			 setElementFrozen(thePlayer, false)
             toggleAllControls(thePlayer, false, true, false)
             toggleControl(thePlayer, "enter_passenger", false)
			 setPedAnimation(thePlayer, "CARRY", "crry_prtial", 50, false, true, false, true)
			 exports.san_hud:dm("Leve a Trigo até o seu caminhão.",thePlayer, 255, 255, 255)
			 timerde[thePlayer] = setTimer(deletObj, 1000, 100, thePlayer)
		 end, 10000, 1)
	 end
end

function exitObjectCTrigo (thePlayer)
	 if isElement(Trigo[thePlayer]) then
	     if exports['san_items']:hasItemS(thePlayer, 237) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Trigo[thePlayer]) then
			     destroyElement(Trigo[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
				 exports.san_hud:dm("Trigo removida pelo motivo que você saiu da zona.",thePlayer, 255, 255, 255)
				 if exports['san_items']:hasItemS(thePlayer, 237) then
				     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 237, false)
				 end
				 unbindKey(thePlayer, "e", "down", startTheFunctionCTrigo)
             end	
		 end
     end
end
addEventHandler("onColShapeLeave", zone, exitObjectCTrigo)

function deletObj (thePlayer)
     if thePlayer then
	     if not isElementWithinColShape ( thePlayer, zone) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Trigo[thePlayer]) then
			     destroyElement(Trigo[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
				 if exports['san_items']:hasItemS(thePlayer, 237) then
				     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 237, false)
				 end
             end	
		 end
	     if not exports['san_items']:hasItemS(thePlayer, 237) then
		     if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end
			 if isTimer(timerex[thePlayer]) then
			     killTimer(timerex[thePlayer])
			 end
			 if isTimer(timerde[thePlayer]) then
			     killTimer(timerde[thePlayer])
			 end		
             if isElement(Trigo[thePlayer]) then
			     destroyElement(Trigo[thePlayer])
                 for i,ctrl in ipairs({"forwards", "backwards", "left", "right", "walk"}) do
                     toggleControl(thePlayer, ctrl, true)
                 end
             end			 
		 end
	 end
end