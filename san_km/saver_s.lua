mysql = exports.san_mysql

function round(num, idp)
  local mult = 10^(idp or 0)
  return math.floor(num * mult + 0.5) / mult
end

function saveVehicle(kocsi)
	local dbid = tonumber(getElementData(kocsi, "dbid")) or -1
	
	if isElement(kocsi) and getElementType(kocsi) == "vehicle" and dbid >= 0 then
		local owner = getElementData(kocsi, "owner")
		if (owner~=-1) then
			local olajszint = getElementData(kocsi, "olajszint")
			local kilometerek = getElementData(kocsi, "kilometerek")
			local fuel = getElementData(kocsi, "fuel")
			local engine = getElementData(kocsi, "engine")
			local locked = isVehicleLocked(kocsi) and 1 or 0		
			local lights = getVehicleOverrideLights(kocsi)
			local sirens = getVehicleSirensOn(kocsi) and 1 or 0
			local Impounded = getElementData(kocsi, "Impounded") or 0
			local handbrake = getElementData(kocsi, "handbrake") or 0
			local health = getElementHealth(kocsi)
			local dimension = getElementDimension(kocsi)
			local interior = getElementInterior(kocsi)
			local x, y, z = getElementPosition(kocsi)
			local wheel1, wheel2, wheel3, wheel4 = getVehicleWheelStates(kocsi)
			local wheelState = toJSON( { wheel1, wheel2, wheel3, wheel4 } )
			local rx, ry, rz = getVehicleRotation(kocsi)
			local panel0 = getVehiclePanelState(kocsi, 0)
			local panel1 = getVehiclePanelState(kocsi, 1)
			local panel2 = getVehiclePanelState(kocsi, 2)
			local panel3 = getVehiclePanelState(kocsi, 3)
			local panel4 = getVehiclePanelState(kocsi, 4)
			local panel5 = getVehiclePanelState(kocsi, 5)
			local panel6 = getVehiclePanelState(kocsi, 6)
			local panelState = toJSON( { panel0, panel1, panel2, panel3, panel4, panel5, panel6 } )
				
			local door0 = getVehicleDoorState(kocsi, 0)
			local door1 = getVehicleDoorState(kocsi, 1)
			local door2 = getVehicleDoorState(kocsi, 2)
			local door3 = getVehicleDoorState(kocsi, 3)
			local door4 = getVehicleDoorState(kocsi, 4)
			local door5 = getVehicleDoorState(kocsi, 5)
			local doorState = toJSON( { door0, door1, door2, door3, door4, door5 } )

			local upgrade0 = getElementData( kocsi, "oldupgrade" .. 0 ) or getVehicleUpgradeOnSlot(kocsi, 0)
			local upgrade1 = getElementData( kocsi, "oldupgrade" .. 1 ) or getVehicleUpgradeOnSlot(kocsi, 1)
			local upgrade2 = getElementData( kocsi, "oldupgrade" .. 2 ) or getVehicleUpgradeOnSlot(kocsi, 2)
			local upgrade3 = getElementData( kocsi, "oldupgrade" .. 3 ) or getVehicleUpgradeOnSlot(kocsi, 3)
			local upgrade4 = getElementData( kocsi, "oldupgrade" .. 4 ) or getVehicleUpgradeOnSlot(kocsi, 4)
			local upgrade5 = getElementData( kocsi, "oldupgrade" .. 5 ) or getVehicleUpgradeOnSlot(kocsi, 5)
			local upgrade6 = getElementData( kocsi, "oldupgrade" .. 6 ) or getVehicleUpgradeOnSlot(kocsi, 6)
			local upgrade7 = getElementData( kocsi, "oldupgrade" .. 7 ) or getVehicleUpgradeOnSlot(kocsi, 7)
			local upgrade8 = getElementData( kocsi, "oldupgrade" .. 8 ) or getVehicleUpgradeOnSlot(kocsi, 8)
			local upgrade9 = getElementData( kocsi, "oldupgrade" .. 9 ) or getVehicleUpgradeOnSlot(kocsi, 9)
			local upgrade10 = getElementData( kocsi, "oldupgrade" .. 10 ) or getVehicleUpgradeOnSlot(kocsi, 10)
			local upgrade11 = getElementData( kocsi, "oldupgrade" .. 11 ) or getVehicleUpgradeOnSlot(kocsi, 11)
			local upgrade12 = getElementData( kocsi, "oldupgrade" .. 12 ) or getVehicleUpgradeOnSlot(kocsi, 12)
			local upgrade13 = getElementData( kocsi, "oldupgrade" .. 13 ) or getVehicleUpgradeOnSlot(kocsi, 13)
			local upgrade14 = getElementData( kocsi, "oldupgrade" .. 14 ) or getVehicleUpgradeOnSlot(kocsi, 14)
			local upgrade15 = getElementData( kocsi, "oldupgrade" .. 15 ) or getVehicleUpgradeOnSlot(kocsi, 15)
			local upgrade16 = getElementData( kocsi, "oldupgrade" .. 16 ) or getVehicleUpgradeOnSlot(kocsi, 16)
			
			local paintjob =  getElementData(kocsi, "oldpaintjob") or getVehiclePaintjob(kocsi)
			
			local upgrades = toJSON( { upgrade0, upgrade1, upgrade2, upgrade3, upgrade4, upgrade5, upgrade6, upgrade7, upgrade8, upgrade9, upgrade10, upgrade11, upgrade12, upgrade13, upgrade14, upgrade15, upgrade16 } )
				
			mysql:query_free("UPDATE vehicles SET `upgrades`='" .. mysql:escape_string(upgrades) .. "', paintjob='" .. mysql:escape_string(paintjob) .. "', `olajszint`='" .. mysql:escape_string(olajszint) .. "', `kilometerek`='" .. mysql:escape_string(kilometerek) .. "', `fuel`='" .. mysql:escape_string(fuel) .. "', `engine`='" .. mysql:escape_string(engine) .. "', `locked`='" .. mysql:escape_string(locked) .. "', `lights`='" .. mysql:escape_string(lights) .. "', `hp`='" .. mysql:escape_string(health) .. "', `sirens`='" .. mysql:escape_string(sirens) .. "', `Impounded`='" .. mysql:escape_string(tonumber(Impounded)) .. "', `handbrake`='" .. mysql:escape_string(tonumber(handbrake)) .. "', `panelStates`='" .. mysql:escape_string(panelState) .. "', `wheelStates`='" .. mysql:escape_string(wheelState) .. "', `doorStates`='" .. mysql:escape_string(doorState) .. "', `hp`='" .. mysql:escape_string(health) .. "', sirens='" .. mysql:escape_string(sirens) .. "', Impounded='" .. mysql:escape_string(tonumber(Impounded)) .. "', handbrake='" .. mysql:escape_string(tonumber(handbrake)) .. "' WHERE id='" .. mysql:escape_string(dbid) .. "'")

		end
	end
end

function saveVehicleMods(kocsi)
	saveVehicle(kocsi)
end

--function saveVehicleOnExit(thePlayer, seat)
--saveVehicle(source)
--end
--addEventHandler("onVehicleExit", getRootElement(), saveVehicleOnExit)

function saveAllVehicles()
	for key, value in ipairs(getElementsByType("vehicle")) do
		saveVehicle(value)
	end
end