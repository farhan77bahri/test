addEvent("updateINTDIM2", true)
addEventHandler("updateINTDIM2", getRootElement(), function (vehicleId)
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

addEvent("guardar", true)
addEventHandler("guardar", getRootElement(), function (vehicleId)
		for index, value in ipairs (getElementsByType("vehicle")) do
		local veiculo = getPedOccupiedVehicle(source)
			if getElementData(veiculo, "veh:id") == tonumber(vehicleId) then 
				if getElementData(veiculo, "veh.owner") == getElementData(source, "veh:id") then
				local gerarposicao = math.random(50,100)
					removePedFromVehicle(source)
					setElementPosition(veiculo,1805.39368, -2448.51196, 13.44729)
					setElementInterior(veiculo,gerarposicao) 
					setElementDimension(veiculo,gerarposicao) 
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

local detranZ = createColCuboid(1483.98596, -2276.24121, 8.13257, 82.108642578125, 71.719482421875, 10.100041770935)

addEventHandler("onColShapeHit", detranZ,
function (thePlayer)
     if getElementData(thePlayer, "char:dutyfaction") == 18 or getElementData(thePlayer, "acc:admin") >= 1 then
         ifVWithCar ()
	 end
end)

addEventHandler("onColShapeLeave", detranZ,
function (thePlayer)
     if getElementData(thePlayer, "char:dutyfaction") == 18 or getElementData(thePlayer, "acc:admin") >= 1 then
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

function Dregister (thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 18 or getElementData(thePlayer, "acc:admin") >= 1 then
		local theVehicle = getPedOccupiedVehicle ( thePlayer )
		if not (getElementData(theVehicle, "detranAP")) then return end
		if (theVehicle) then
			outputChatBox(" ", thePlayer, 255,255,255, true)
			outputChatBox("#7cc576[4i20 - DETRAN] #FFFFFFVeiculo liberado com sucesso.", thePlayer, 255,255,255, true)
			outputChatBox("#7cc576[4i20 - DETRAN] #FFFFFFLiberado por: #7cc576"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", ""), thePlayer, 255,255,255, true)
			outputChatBox("#7cc576[4i20 - DETRAN] #FFFFFFNome do veiculo: #7cc576" .. getVehicleName ( theVehicle ), thePlayer, 255,255,255, true)
			removeElementData(theVehicle, "detranAP")
		 end
	 end
end
addCommandHandler("liberar", Dregister)