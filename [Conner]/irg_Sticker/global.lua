local weaponStickers = {
	[30] = "ak",
	[29] = "mp5lng",
	[24] = "deagle",
	[31] = "m4a1t",
	[28] = "uzi",
	[34] = "9f257c2f",
	[25] = "m870t",
	[32] = "Tec9BodyTex",
	[4] = "kabar",
	[22] = "mesh1",
}

local validStickers = {
	["ak_1"] = true,
	["ak_2"] = true,
	["ak_3"] = true,
	["ak_4"] = true,
	["ak_5"] = true,
	["ak_6"] = true,
	["mp_1"] = true,
	["mp_2"] = true,
	["mp_3"] = true,
	["mp_4"] = true,
	["mp_5"] = true,
	["mp_6"] = true,
	["desert_1"] = true,
	["desert_2"] = true,
	["desert_3"] = true,
	["m4_1"] = true,
	["m4_2"] = true,
	["m4_3"] = true,
	["m4_4"] = true,
	["uzi_1"] = true,
	["uzi_2"] = true,
	["uzi_3"] = true,
	["sniper_1"] = true,
	["sniper_2"] = true,
	["sniper_3"] = true,
	["sniper_4"] = true,
	["sniper_5"] = true,
	["sniper_6"] = true,
	["shoutgun_1"] = true,
	["shoutgun_2"] = true,
	["tec9_1"] = true,
	["tec9_2"] = true,
	["knife_1"] = true,
	["knife_2"] = true,
	["knife_3"] = true,
	["knife_4"] = true,
	["knife_5"] = true,
	["colt_1"] = true,
	["colt_2"] = true,
	["halloween"] = true,
}

function getWeaponWeaponShaderName(wep)
	if wep then
		if weaponStickers[wep] then
			return weaponStickers[wep]
		end
	end
	return false
end

function isStickerValid(value)
	if value then
		if validStickers[value] then
			return true
		end
	end
	return false
end