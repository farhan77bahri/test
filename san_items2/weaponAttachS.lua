--[[

local playerWeaponCache = {}
local playerStickerCache = {}

addEvent("weapons->attach", true)
addEventHandler("weapons->attach", root, function(player, weapon, texture)
	triggerEvent("attachWeapon", resourceRoot, player, weapon, texture);
end);

addEvent("weapons->detach", true)
addEventHandler("weapons->detach", root, function(player, weapon)
	triggerEvent("detachWeapon", resourceRoot, player, weapon);
end);



function attachWeapon(player, wep, value)
	local wep = tonumber(wep) or 0
	if wep > 0 then
		if value then

			if exports["btc_fegyverPJ"]:isStickerValid(value) then
				sticker = value
				triggerClientEvent(root, "attachWeaponToBody", root, player, wep, sticker)
				if not playerStickerCache[player] then
					playerStickerCache[player] = {}
				end
				playerStickerCache[player][wep] = sticker
			end
		else

			triggerClientEvent(root, "attachWeaponToBody", root, player, wep)
		end
		if not playerWeaponCache[player] then
			playerWeaponCache[player] = {}
		end
		playerWeaponCache[player][wep] = true
	end
end
addEvent("attachWeapon", true)
addEventHandler("attachWeapon", root, attachWeapon)



function detachWeapon(player, wep)
	triggerClientEvent(root, "removeWeaponFromBone", root, player, wep)
	if playerWeaponCache[player] then
		playerWeaponCache[player][wep] = nil
	end
	if playerStickerCache[player] then
		playerStickerCache[player][wep] = nil
	end
end
addEvent("detachWeapon", true)
addEventHandler("detachWeapon", root, detachWeapon)

addEvent("getAllWeaponCache", true)
addEventHandler("getAllWeaponCache", root, function()
	triggerClientEvent(client, "receiveWeaponCache", client, playerWeaponCache, playerStickerCache)
end)

addEventHandler("onPlayerQuit", root, function()
	if playerWeaponCache[source] then
		playerWeaponCache[source] = nil
	end
	if playerStickerCache[source] then
		playerStickerCache[source] = nil
	end
end)

]]--