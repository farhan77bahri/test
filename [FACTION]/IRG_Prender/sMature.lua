my = {}
myVeh = {}

function exitCar (player, seat)
local vehicle = getPedOccupiedVehicle (player)
     if (vehicle) then
		 local xXx, yYy, zZz = getElementPosition(vehicle)
		 if getElementData(vehicle, "criar:colP") == true then return end
		 if (getElementModel(vehicle) == 426) or (getElementModel(vehicle) == 597) or (getElementModel(vehicle) == 427) or (getElementModel(vehicle) == 585) or (getElementModel(vehicle) == 598) or (getElementModel(vehicle) == 550) or (getElementModel(vehicle) == 566) or (getElementModel(vehicle) == 604) or (getElementModel(vehicle) == 529) then
	         local xX, yY, zZ = getElementPosition(vehicle)
			 if not isElement(my) then 
				--if not isElement(my[player]) then 
				 my[player] = createColSphere (xX + 2.5, yY + 7, zZ, 3)
				 --end
				 --if not isElement(myVeh[player]) then 
				 myVeh[player] = createColSphere (xXx, yYy, zZz, 5)
				 --end
				 setElementData(vehicle, "criar:colP", true)
		         attachElements (my[player], vehicle, 0, -4, -0.5 )
				 attachElements (myVeh[player], vehicle, 0, 0, 0 )
		         removeEventHandler("onColShapeHit", my[player], exitCar)
				 addEventHandler("onColShapeHit", my[player], exitCar)
				 
				addEventHandler( "onElementDestroy", vehicle,
				function ()
					setElementData(vehicle, "criar:colP", false)
					if isElement(myVeh[player]) then 
							 destroyElement(myVeh[player])
					end
					if isElement(my[player]) then 
						destroyElement(my[player])
					end
				end
				)
			end
	     end
	 end
end
addEventHandler("onVehicleStartExit", getRootElement(), exitCar)






function exitCar (player)
	local vehicle = getPedOccupiedVehicle (player)
		 if (vehicle) then

			setElementData(vehicle, "criar:colP", false)
			if isElement(myVeh[player]) then 
					 destroyElement(myVeh[player])
			end
			if isElement(my[player]) then 
				destroyElement(my[player])
			end
		 end
	end
--addEventHandler("onVehicleEnter", getRootElement(), exitCar)





local allowed = { { 48, 57 }, { 65, 90 }, { 97, 122 } } 

function generateString ( len )
    if tonumber ( len ) then
        math.randomseed ( getTickCount () )
        local str = ""
        for i = 1, len do
            local charlist = allowed[math.random ( 1, 3 )]
            str = str .. string.char ( math.random ( charlist[1], charlist[2] ) )
        end
        return str
    end
    return false
    
end

function warpVehicle (thePlayer, commandName, targetPlayer)
	if (getElementData(thePlayer, "char:dutyfaction") ==1) or (getElementData(thePlayer, "char:dutyfaction") ==2) or (getElementData(thePlayer, "char:dutyfaction") ==3) or (getElementData(thePlayer, "char:dutyfaction") ==4) or (getElementData(thePlayer, "char:dutyfaction") ==5) or (getElementData(thePlayer, "char:dutyfaction") ==6) or (getElementData(thePlayer, "char:dutyfaction") ==7) or (getElementData(thePlayer, "char:dutyfaction") ==8) or (getElementData(thePlayer, "char:dutyfaction") ==9) or (getElementData(thePlayer, "char:dutyfaction") ==10) or (getElementData(thePlayer, "char:dutyfaction") ==11) or (getElementData(thePlayer, "char:dutyfaction") ==12) or (getElementData(thePlayer, "char:dutyfaction") ==13) or (getElementData(thePlayer, "char:dutyfaction") ==14) or (getElementData(thePlayer, "char:dutyfaction") ==15) then
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [nome / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then

		 --wantedVeh (targetPlayer, isVehicle)
		 for index, isVehicle in pairs(getElementsWithinColShape(myVeh[thePlayer], "vehicle")) do


			local pX,pY,pZ = getElementPosition(targetPlayer)
				vX,vY,vZ = getElementPosition(thePlayer)
				local dist = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
				if dist <= 5 then
			setElementData(targetPlayer, "preso:carro", true)
		 setTimer(setPedAnimation, 1000, 1,targetPlayer, "CRACK", "crckidle1", -1, true, false, false )
		 setTimer(attachElements, 1000, 1,targetPlayer, isVehicle, 0, -2, 1)
				end
			end
		end
		end
	 end
end
addCommandHandler("pegarp", warpVehicle)

function wantedVeh (thePlayer, carPolice)
	for index, isPreso in pairs(getElementsWithinColShape(my[thePlayer], "player")) do
		 if not (getElementData(isPreso, "char:dutyfaction") ==1) or (getElementData(thePlayer, "char:dutyfaction") ==5) or (getElementData(thePlayer, "char:dutyfaction") ==2) or (getElementData(thePlayer, "char:dutyfaction") ==19) or (getElementData(thePlayer, "char:dutyfaction") ==20) or (getElementData(thePlayer, "char:dutyfaction") ==23) or (getElementData(thePlayer, "char:dutyfaction") ==16) then
		     --setVehicleDoorOpenRatio(carPolice, 1, 1, 2500)
			 setTimer(setPedAnimation, 1000, 1,isPreso, "CRACK", "crckidle1", -1, true, false, false )
	         setTimer(attachElements, 1000, 1,isPreso, carPolice, 0, -2, 1)
			 --setTimer(setVehicleDoorOpenRatio, 5500, 1,carPolice, 1, 0, 2500)
		 end
	 end
end

function warpVehicleD (thePlayer, commandName, targetPlayer)
	if (getElementData(thePlayer, "char:dutyfaction") ==1) or (getElementData(thePlayer, "char:dutyfaction") ==5) or (getElementData(thePlayer, "char:dutyfaction") ==2) or (getElementData(thePlayer, "char:dutyfaction") ==19) or (getElementData(thePlayer, "char:dutyfaction") ==20) or (getElementData(thePlayer, "char:dutyfaction") ==23) or (getElementData(thePlayer, "char:dutyfaction") ==16) then
	 for index, isVehicle in pairs(getElementsWithinColShape(myVeh[thePlayer], "vehicle")) do
		
	if not (targetPlayer) then
		outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [nome / ID]", thePlayer, 255, 255, 255, true)
	else
		local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
		if (targetPlayer) then
		 --wantedVehD (targetPlayer, isVehicle)
		 copPx, copPy, copPz = getElementPosition(thePlayer)

		 local pX,pY,pZ = getElementPosition(targetPlayer)
		 --vX,vY,vZ = getElementPosition(thePlayer)
		 local dist = getDistanceBetweenPoints3D(pX,pY,pZ,copPx, copPy, copPz)
		 if dist <= 5 then

		 setTimer(setPedAnimation, 1000, 1, targetPlayer)
		 setTimer(detachElements, 1000, 1, targetPlayer )
		 setTimer(setElementPosition, 1100, 1, targetPlayer, copPx, copPy + 1, copPz + 1)
		 setElementData(targetPlayer, "preso:carro", false)
				end
			end
			end
		end
	end
end
addCommandHandler("soltarp", warpVehicleD)

function wantedVehD (thePlayer, carPolice)
copPx, copPy, copPz = getElementPosition(thePlayer)
	for index, isPreso in pairs(getElementsWithinColShape(myVeh[thePlayer], "player")) do
		 if not (getElementData(isPreso, "char:dutyfaction") ==1) or (getElementData(thePlayer, "char:dutyfaction") ==5) or (getElementData(thePlayer, "char:dutyfaction") ==2) or (getElementData(thePlayer, "char:dutyfaction") ==19) or (getElementData(thePlayer, "char:dutyfaction") ==20) or (getElementData(thePlayer, "char:dutyfaction") ==23) or (getElementData(thePlayer, "char:dutyfaction") ==16) then
		     --setVehicleDoorOpenRatio(carPolice, 1, 1, 2500)
			 setTimer(setPedAnimation, 1000, 1, isPreso)
	         setTimer(detachElements, 1000, 1, isPreso )
			 setTimer(setElementPosition, 1100, 1, isPreso, copPx, copPy + 1, copPz + 1)
			--setTimer(setVehicleDoorOpenRatio, 5500, 1,carPolice, 1, 0, 2500)
	 end
	end
end