addEvent("updateINTDIM2", true)
addEventHandler("updateINTDIM2", getRootElement(), function (vehicleId)
		for index, value in ipairs (getElementsByType("vehicle")) do
			if getElementData(value, "veh:id") == tonumber(vehicleId) then 
				if getElementData(value, "veh:owner") == getElementData(source, "char:id") then

					
					setElementInterior(value,0) 
					setElementDimension(value,0) 
					local x, y, z = getElementPosition(source)
					setElementPosition(value, x + 3, y, z)
					warpPedIntoVehicle(source,value)
                  --  setElementData(source, "spawn:vehicle", true)
			end
		end
	end
end
)




addEvent("updateINTDIM22", true)
addEventHandler("updateINTDIM22", getRootElement(), function (vehicleId)
		for index, value in ipairs (getElementsByType("vehicle")) do
			if getElementData(value, "veh:id") == tonumber(vehicleId) then 
				if getElementData(value, "veh:owner") == getElementData(source, "char:id") then
					setElementInterior(value,0) 
					setElementDimension(value,0) 
			end
		end
	end
end
)

addEvent("respawnVehicle", true)
addEventHandler("respawnVehicle", getRootElement(), function (thePlayer)
--[[
    local theVehicle = getPedOccupiedVehicle ( thePlayer )
	if theVehicle then
		 setTimer(setElementDimension, 2500, 1, theVehicle, math.random(9999))
		 setTimer(setElementInterior, 2500, 1, theVehicle, 4)
		 toggleControl(thePlayer, "enter_exit", false)
		 setElementFrozen(theVehicle, true)
		 removeElementData(thePlayer, "spawn:vehicle")
		 setTimer(setElementFrozen, 4000, 1, theVehicle, false)
		 setTimer(toggleControl, 3000, 1, thePlayer, "enter_exit", true)
         removePedFromVehicle(thePlayer)
		 outputChatBox("#7cc576[BGO MTA] #ffffffVeiculo guardado com sucesso.", thePlayer ,0,0,0,true)
		 setTimer(desbugG, 5500, 1, thePlayer)
	end
	--]]
end
)
function desbugG (thePlayer)
     if getElementDimension(thePlayer) ~= 0 then
         local theVehicle = getPedOccupiedVehicle ( thePlayer )
	     if theVehicle then	
             removePedFromVehicle(thePlayer)
             setElementDimension(thePlayer, 0)		
             setElementInterior(thePlayer, 0)
             else
             setElementDimension(thePlayer, 0)		
             setElementInterior(thePlayer, 0)					 
		 end
	 end
	 if getElementData(thePlayer, "spawn:vehicle") then
	     setElementData(thePlayer, "spawn:vehicle", false)
	 end
end

--[[addEvent("vCar", true)
addEventHandler("vCar", getRootElement(), function (thePlayer)
local theVehicle = getPedOccupiedVehicle ( thePlayer )
     if (theVehicle) then
	     if getElementData(theVehicle, "veh:owner") then
		     if getElementData(theVehicle, "veh:owner") == getElementData(thePlayer, "char:id") then
			      toggleControl ( source, "vehicle_secondary_fire", false )
			 end
		 end
	 end
end)
--]]

local detranZ = createColCuboid(1483.98596, -2276.24121, 8.13257, 82.108642578125, 71.719482421875, 10.100041770935)

addEventHandler("onColShapeHit", detranZ,
function (thePlayer)
     if (getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 21) then
         ifVWithCar ()
	 end
end)

addEventHandler("onColShapeLeave", detranZ,
function (thePlayer)
     if (getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 21) then
         ifVWithCar ()
	 end
end)

function ifVWithCar ()
     for index, isEvent in pairs(getElementsWithinColShape(detranZ, "vehicle")) do
         if not (getElementData(isEvent, "detranAP")) then
             setElementData(isEvent, "detranAP", true)
			 outputDebugString("Veiculo ".. getVehicleName ( isEvent ) .." Apreendido com sucesso")
		 end
	 end
end


function Dregister (thePlayer, commandName, Mode)
     if Mode == "veiculo" then
	     if (getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 21) then
			 local theVehicle = getPedOccupiedVehicle ( thePlayer )
			 if (theVehicle) then
				 if not (getElementData(theVehicle, "detranAP")) then
				     return
			     else
			         outputChatBox(" ", thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[BGO DETRAN] #FFFFFFVeiculo liberado com sucesso.", thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[BGO DETRAN] #FFFFFFLiberado por: #7cc576"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", ""), thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[BGO DETRAN] #FFFFFFNome do veiculo: #7cc576" .. getVehicleName ( theVehicle ), thePlayer, 255,255,255, true)
				     removeElementData(theVehicle, "detranAP")
				 end
			 end
		 end
	 end
end
addCommandHandler("liberar", Dregister)