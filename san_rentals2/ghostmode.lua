----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 11 May 2014
-- Resource: GTIrentVehicle/rent_vehicle.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>
--[[
local ghost_time	-- Ghostmode Timer

-- Ghost Protection
-------------------->>

function protectOnSpawn()
	ghostProtection(source)
	ghost_time = setTimer(ghostProtection, 2500, 0, source)
end
addEvent("onClientVehicleRent", true)
addEventHandler("onClientVehicleRent", root, protectOnSpawn)

function ghostProtection(myVehicle)
	if (not isElement(myVehicle)) then
		killTimer(ghost_time)
		ghost_time = nil
	end
	
	for _,vehicle in ipairs(getElementsByType("vehicle", root, true)) do
		local x1,y1,z1 = getElementPosition(myVehicle)
		local x2,y2,z2 = getElementPosition(vehicle)
		if (getDistanceBetweenPoints3D(x1,y1,z1, x2,y2,z2) < 20) then
			for _,vehicle in ipairs(getElementsByType("vehicle", root, true)) do
				setElementCollidableWith(myVehicle, vehicle, false)
			end
			return
		end
	end
	
	for _,vehicle in ipairs(getElementsByType("vehicle", root, true)) do
		setElementCollidableWith(myVehicle, vehicle, true)
	end
	if (ghost_time) then
		killTimer(ghost_time)
		ghost_time = nil
	end
end
--]]