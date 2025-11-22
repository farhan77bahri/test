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