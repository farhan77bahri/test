addEvent("updateINTDIM2C", true)
addEventHandler("updateINTDIM2C", getRootElement(), function (vehicleId)
		for index, value in ipairs (getElementsByType("vehicle")) do
			if getElementData(value, "veh:id") == tonumber(vehicleId) then 
				if getElementData(value, "veh:owner") == getElementData(source, "char:id") then

					
					setElementInterior(value,0) 
					setElementDimension(value,0) 
					local x, y, z = getElementPosition(source)
					setElementPosition(value, x, y, z)
					warpPedIntoVehicle(source,value)

			end
		end
	end
end
)




addEvent("updateINTDIM22C", true)
addEventHandler("updateINTDIM22C", getRootElement(), function (vehicleId)
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




local prfZ = createColCuboid(1863.11255, 863.64459, 9.89443, 122.86950683594, 39.386352539063, 24.800014877319)

addEventHandler("onColShapeHit", prfZ,
function (thePlayer)
     if (getElementData(thePlayer, "char:dutyfaction") == 21) then
         ifVWithCar ()
	 end
end)

addEventHandler("onColShapeLeave", prfZ,
function (thePlayer)
     if (getElementData(thePlayer, "char:dutyfaction") == 21) then
         ifVWithCar ()
	 end
end)

function ifVWithCar ()
     for index, isEvent in pairs(getElementsWithinColShape(prfZ, "vehicle")) do
         if not (getElementData(isEvent, "prfAP")) then
             setElementData(isEvent, "prfAP", true)
			 outputDebugString("Veiculo ".. getVehicleName ( isEvent ) .." Apreendido com sucesso PRF")
		 end
	 end
end


function Dregister (thePlayer, commandName, Mode)
     if Mode == "veiculo" then
	     if (getElementData(thePlayer, "char:dutyfaction") == 21) then
			 local theVehicle = getPedOccupiedVehicle ( thePlayer )
			 if (theVehicle) then
				 if not (getElementData(theVehicle, "prfAP")) then
				     return
			     else
			         outputChatBox(" ", thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[PRF] #FFFFFFVeiculo liberado com sucesso.", thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[PRF] #FFFFFFLiberado por: #7cc576"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", ""), thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[PRF] #FFFFFFNome do veiculo: #7cc576" .. getVehicleName ( theVehicle ), thePlayer, 255,255,255, true)
				     removeElementData(theVehicle, "prfAP")
				 end
			 end
		 end
	 end
end
addCommandHandler("liberar", Dregister)