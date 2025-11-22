local oldState = 0
local newState = 0
--[[
function checkVehiclesGearboxChange()
	local vehicle = getPedOccupiedVehicle(localPlayer)
	if vehicle and getElementData(vehicle, "veh:performance_turbo") == 5 then
		newState = getVehicleCurrentGear(vehicle)
		
		if newState ~= oldState then
			oldState = newState
			
			local x, y, z = getElementPosition(vehicle)
			local sound = playSound3D("files/BOV2.wav", x, y, z, false)
			setSoundMaxDistance(sound, 100)
			setSoundVolume(sound, 0.7)
		end
	end
end
setTimer(checkVehiclesGearboxChange, 500, 0)]]