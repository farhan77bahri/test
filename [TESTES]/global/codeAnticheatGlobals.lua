--[[
local gw = giveWeapon
local swa = setWeaponAmmo
local taw = takeAllWeapons
local tw = takeWeapon

function isACRunning()
	local running = getResourceState( getResourceFromName ("anticheat-system") ) == "running"
	if not running then
		outputDebugString("Figyelmeztetés: Anticheat kikapcsolva!")
	end
	return running
end

function giveWeapon(player, weapon, ammo, ascurrent)
	if isACRunning() then
		hasWeaponSlot(player, weapon)
		return call( getResourceFromName( "anticheat-system" ), "giveSafeWeapon", player, weapon, ammo, ascurrent)
	else
		return gw(player, weapon, ammo, ascurrent)
	end
end

function setWeaponAmmo(player, weapon, ammo, inclip)
	if isACRunning() then
		hasWeaponSlot(player, weapon)
		return call( getResourceFromName( "anticheat-system" ), "setSafeWeaponAmmo", player, weapon, ammo, inclip)
	else
		return swa(player, weapon, ammo, inclip)
	end
end

function takeAllWeapons(player)
	if isACRunning() then
		resetAllWeaponSlots(player)
		return call( getResourceFromName( "anticheat-system" ), "takeAllWeaponsSafe", player)
	else
		return taw(player)
	end
end

function takeWeapon(player, weapon)
	if isACRunning() then
		resetWeaponSlot(player, weapon)
		return call( getResourceFromName( "anticheat-system" ), "takeWeaponSafe", player, weapon)
	else
		return tw(player, weapon)
	end
end

function hasWeaponSlot(player, weapon)
	setElementData(player, "anticheat:" .. weapon, true, false)
end

function resetWeaponSlot(player, weapon)
	setElementData(player, "anticheat:" .. weapon, false, false)
end

function resetAllWeaponSlots(player)
	for weapon = 0, 47 do
		setElementData(player, "anticheat:" .. weapon, false, false)
	end
end
]]--