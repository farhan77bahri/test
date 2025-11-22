function onGuiHandbrakeStateChange(state, veh)
	if state == true then
		setElementFrozen(veh, true)
		setElementData(veh, "handbrake", 1)
		setElementData(veh, "kezifek", true)
	else
		setElementFrozen(veh, false)
		setElementData(veh, "handbrake", 0)
		setElementData(veh, "kezifek", false)
	end
end
addEvent("onGuiHandbrakeStateChange", true)
addEventHandler("onGuiHandbrakeStateChange", getRootElement(), onGuiHandbrakeStateChange)










function handlekilometerekRequest(totalDistance, syncDistance)
	if not totalDistance then
		local theVehicle = getPedOccupiedVehicle(client)
		if theVehicle == source then
			local totDistance = getElementData(theVehicle,"kilometerek") or 0
			triggerClientEvent(client, "distancialis", theVehicle, totDistance)			
		end
	else
		if not syncDistance then
			return
		end
		local theVehicle = getPedOccupiedVehicle(client)
		if theVehicle == source then
			local theSeat = getPedOccupiedVehicleSeat(client)
			if theSeat == 0 then
				local totDistance = getElementData(theVehicle,"kilometerek") or 0
				setElementData(theVehicle, 'kilometerek', totDistance + syncDistance )
				depeteFuel(theVehicle, syncDistance)
			end
		end
	end
end
addEvent("distancialis", true)
addEventHandler("distancialis", getRootElement(), handlekilometerekRequest)

function depeteFuel(theVehicle, syncDistance)
	return
end

function syncOdoOnEnter(thePlayer)
	local kilometerek = getElementData(source, "kilometerek") or 0
	triggerClientEvent(thePlayer, "distancialis", source, kilometerek)
end
addEventHandler("onVehicleEnter", getRootElement(), syncOdoOnEnter)