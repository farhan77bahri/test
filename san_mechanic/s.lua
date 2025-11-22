local partTableID = {["windscreen_dummy"] = 4, ["bump_front_dummy"] = 5, ["bump_rear_dummy"] = 6, ["bonnet_dummy"] = 0, ["boot_dummy"] = 1, ["door_lf_dummy"] = 2, ["door_rf_dummy"] = 3, ["door_lr_dummy"] = 4, ["door_rr_dummy"] = 5}

function repairCar(part, vehicle, cost)
--[[
	if getElementData(source,"char:money") >= cost then
		setElementData(source,"char:money",getElementData(source,"char:money") - cost)
	else
		outputChatBox("Nincs elég pénzed.",source)
		return
	end]]--

	setElementFrozen(source, false)
	setPedAnimation(source)
	if string.find(part, "windscreen") or string.find(part, "bump") then
		setVehiclePanelState(vehicle, partTableID[part], 0)
		if part == "bump_front_dummy" then
			setVehiclePanelState(vehicle, 0, 0)
			setVehiclePanelState(vehicle, 1, 0)
			setVehicleLightState(vehicle, 0, 0)
			setVehicleLightState(vehicle, 1, 0)
		elseif part == "bump_rear_dummy" then
			setVehiclePanelState(vehicle, 2, 0)
			setVehiclePanelState(vehicle, 3, 0)
			setVehicleLightState(vehicle, 2, 0)
			setVehicleLightState(vehicle, 3, 0)
		end
	elseif string.find(part, "wheel") then
		local fl, rl, fr, rr = getVehicleWheelStates(vehicle)
		if string.find(part, "rf") then--jobb első
			setVehicleWheelStates(vehicle, fl, rl, 0, rr)
		elseif string.find(part, "lf") then--bal első
			setVehicleWheelStates(vehicle, 0, rl, fr, rr)
		elseif string.find(part, "rb") then--jobb hátsó
			setVehicleWheelStates(vehicle, fl, rl, fr, 0)
		elseif string.find(part, "lb") then--bal hátsó
			setVehicleWheelStates(vehicle, fl, 0, fr, rr)
		elseif string.find(part, "front") then--első
			setVehicleWheelStates(vehicle, 0, rl, 0, rr)
		elseif string.find(part, "rear") then--hátsó
			setVehicleWheelStates(vehicle, fl, 0, fr, 0)
		end
		--front left, rear left, front right, rear right)
	elseif part == "Motor" then
		setElementHealth(vehicle, 1000)
       setVehicleDamageProof (vehicle, false ) 
        --exports['anticheat-system']:changeProtectedElementDataEx(vehicle, "enginebroke", 0)
		setVehicleDamageProof(vehicle, false)
	else
		setVehicleDoorState(vehicle, partTableID[part], 0)
	end
end
addEvent("repairCar", true)
addEventHandler("repairCar", getRootElement(), repairCar)


function repairCar2()
			local x,y,z = getElementPosition(source)
			triggerClientEvent("repairCar3", source, x,y,z)

			--setPedAnimation(source, "BOMBER","BOM_Plant_2Idle", -1, false, false, true)
			setElementFrozen(source, true)
			setPedAnimation(source, "bomber", "BOM_Plant_Loop", -1, true, false, false)


end
addEvent("repairCar2", true)
addEventHandler("repairCar2", getRootElement(), repairCar2)
