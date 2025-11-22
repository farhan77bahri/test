--[[
local objs = {}
local playerCache = {}
local pedsToAttached = {}
local stickerCache = {}
local weaponModels = {
	--- uzi, mp5, tec9
	[28] = 352,
    [29] = 353,
	[32] = 372,
	--- colt, silenced, deagle
	[22] = 346,
	[23] = 347,
	[24] = 348,
	--- kés
	[4] = 335,
	--- shotgunok
	[25] = 349,
	[26] = 350,
	[27] = 351,
	--- nagykaliber
	[30] = 355,
	[31] = 356,
	--- ütőfegyverek
	-- [2] = 333,
	-- [3] = 334,
	[5] = 336,
	-- [6] = 337,
	-- [7] = 338,
	[8] = 339,
	--- sniper
	[33] = 357,
	[34] = 358,
	--- gránátok, egyéb
	-- [16] = 342,
	-- [17] = 343,
	-- [18] = 344,
	-- [39] = 363,
	--- spray, camera
	-- [41] = 365,
	-- [43] = 367,
}

local attachedRootCache = {}
local pedWeapons = {}
function isInTable(ped, wep)
	if pedWeapons[ped] then
		for k, v in ipairs(pedWeapons[ped]) do
			if v == wep then
				return true, k
			end
		end
	end
	
	return false
end

function addWep(ped, wep)
	if not pedWeapons[ped] then
		pedWeapons[ped] = {}
	end
	table.insert(pedWeapons[ped], wep)
end

function attachWeaponToBone(ped, wep, walkingstyle, sticker)
	if weaponModels[wep] then
		-- if not getElementData(ped, "hiddenweapon"..wep) then
			if not objs[ped] then
				objs[ped] = {}
			end
			if isInTable(ped, wep) then return end
			
			local this = #objs[ped]+1
			objs[ped][this] = createObject(weaponModels[wep], 0, 0, 0)
			setElementData(objs[ped][this], "wep", wep)
			setElementData(objs[ped][this], "owner", ped)
			setElementInterior(objs[ped][this], getElementInterior(ped))
			setElementDimension(objs[ped][this], getElementDimension(ped))
			if not pedsToAttached[ped] then
				pedsToAttached[ped] = {}
			end
			if not attachedRootCache[ped] then
				attachedRootCache[ped] = {}
			end
			table.insert(attachedRootCache[ped], {wep, objs[ped][this], getSlotFromWeapon(wep)})
			for _, value in ipairs(attachedRootCache[ped]) do 
				if wep ~= value[1] and (value[3] == getSlotFromWeapon(wep)) then 
					return  
				end
			end
			local newKey = #pedsToAttached[ped]
			pedsToAttached[ped][newKey] = objs[ped][this]
			if isElement(objs[ped][this]) and ped then 


				if wep == 29 or wep == 28 then
					exports.bone_attach:attachElementToBone(objs[ped][this], ped, 14, 0.1, 0.05, 0, 0, -90, 90)


				--elseif wep == 16 or wep == 17 or wep == 18 then
				--	exports.bone_attach:attachElementToBone(objs[ped][this], ped, 14, 0.15, -0.1, 0.2, 0, 0, 90)


				elseif wep == 32 then
					exports.bone_attach:attachElementToBone(objs[ped][this], ped, 14, 0.12, 0.05, 0, 0, -90, 90)
				elseif wep == 22 or wep == 23 or wep == 24 then
					exports.bone_attach:attachElementToBone(objs[ped][this], ped, 13, -0.08, 0.05, 0, 0, -90, 90)



				elseif wep == 4 then
					exports.bone_attach:attachElementToBone(objs[ped][this], ped, 13, -0.035, -0.1, 0.3, 0, 0, 90)
				elseif wep == 27 or wep == 26 or wep == 25 then
					if walkingstyle == 131 or walkingstyle == 132 or walkingstyle == 133 or walkingstyle == 129 or walkingstyle == 126 or walkingstyle == 121 or walkingstyle == 122 or walkingstyle == 124 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, -0, 0.3, 180, 330, -90)
					elseif walkingstyle == 125 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, -0, 0.3, 180, 330, -105)
					else
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, -0, 0.3, 180, 320, -110)
					end
				elseif wep == 33 or wep == 34 then
					if walkingstyle == 131 or walkingstyle == 132 or walkingstyle == 133 or walkingstyle == 129 or walkingstyle == 126 or walkingstyle == 121 or walkingstyle == 122 or walkingstyle == 124 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, 0, 0.3, 180, 330, -90)
					elseif walkingstyle == 125 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, 0, 0.3, 180, 330, -105)
					else
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 5, 0.16, 0, 0.3, 180, 320, -110)
					end
				elseif wep == 30 or wep == 31 then
					if walkingstyle == 131 or walkingstyle == 132 or walkingstyle == 133 or walkingstyle == 129 or walkingstyle == 126 or walkingstyle == 121 or walkingstyle == 122 or walkingstyle == 124 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.08, 0, 0.2, 10, 150, 82)
					elseif walkingstyle == 125 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.08, 0, 0.2, 10, 150, 92)
					else
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.05, 0, 0.2, 10, 150, 95)
					end
				elseif wep >= 2 and wep <= 8 and wep ~= 4 then
					if walkingstyle == 131 or walkingstyle == 132 or walkingstyle == 133 or walkingstyle == 129 or walkingstyle == 126 or walkingstyle == 121 or walkingstyle == 122 or walkingstyle == 124 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.08, 0, -0.02, 0, -90, 82)
					elseif walkingstyle == 125 then
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.08, 0, -0.02, 10, -90, 92)
					else
						exports.bone_attach:attachElementToBone(objs[ped][this], ped, 6, -0.08, 0, -0.02, 10, -90, 100)
					end



				end
			end
		
            if sticker then
               -- local element = objs[ped][this]
               -- local name = exports["btc_fegyverPJ"]:getWeaponWeaponShaderName(wep)
               -- local texture = sticker
             --   triggerEvent("client->applyTexture", localPlayer, element, name, texture)
			end
			
		-- end
	end
end

addEvent("onClientPlayerWalkingStyleChange", true)
addEventHandler("onClientPlayerWalkingStyleChange", root, function(p,s)
	if isElement(player) and isElementStreamedIn(player) and getDistanceBetweenElements(localPlayer, p) < 15 then
		if objs[p] then
			for k, v in ipairs(objs[p]) do
				if isElement(v) then
					destroyElement(v)
					exports.bone_attach:detachElementFromBone(v)
				end
			end
		end
		objs[p] = {}
		pedWeapons[p] = {}
		for k,v in pairs(attachedRootCache[p]) do
			-- if not getElementData(p, "hiddenweapon"..v[1]) then
				attachWeaponToBone(p, v[1], s)
				addWep(p, v[1])
			-- end
		end
	end
end)



addEvent("attachWeaponToBody", true)
addEventHandler("attachWeaponToBody", root, function(player, wep, sticker)
	if player and isElement(player) and wep then
		if not playerCache[player] then
			playerCache[player] = {}
		end
		if not playerCache[player][wep] then
			playerCache[player][wep] = true
		end

	
		if sticker then
			if not stickerCache[player] then
				stickerCache[player] = {}
			end
			if not stickerCache[player][wep] then
				stickerCache[player][wep] = sticker
			end
		end


		if isElement(player) and getDistanceBetweenElements(localPlayer, player) < 15 then
			if not isInTable(player, wep) then
				attachWeaponToBone(player, wep, getPedWalkingStyle(player), sticker)
				addWep(player, wep)
			end
		end
	end
end)

addEvent("removeWeaponFromBone", true)
addEventHandler("removeWeaponFromBone", root, function(player, wep)
	if playerCache[player] then
		if playerCache[player][wep] then
			local tbl, key = isInTable(player, wep)
			if tbl then
				pedWeapons[player][key] = nil
			end
			if attachedRootCache[player] then
				for k,v in pairs(attachedRootCache[player]) do
					if v[1] == wep and isElement(v[2]) then
						exports.bone_attach:detachElementFromBone(v[2])
						destroyElement(v[2])
						attachedRootCache[player][k] = nil
                            
                        setTimer(updatePlayerWeapons, 1000, 1)    
					end
				end
			end
			playerCache[player][wep] = nil
           if stickerCache[player] and stickerCache[player][wep] then
               stickerCache[player][wep] = nil
            end
		end
	end    
end)

addEventHandler("onClientElementStreamIn", root, function()
	if isElement(source) and getElementType(source) == "player" and not getElementData(source, 'invisible') then
		if playerCache[source] then
			if objs[source] then
				for k, v in ipairs(objs[source]) do
					if isElement(v) then
						destroyElement(v)
						exports.bone_attach:detachElementFromBone(v)
					end
				end
			end
			objs[source] = {}
			pedWeapons[source] = {}
			for wep,_ in pairs(playerCache[source]) do
				if not isInTable(player, wep) then
                    if stickerCache[source] and stickerCache[source][wep] then
                        attachWeaponToBone(source, wep, getPedWalkingStyle(source), stickerCache[source][wep])
                    else
                        attachWeaponToBone(source, wep, getPedWalkingStyle(source))
                    end
					addWep(source, wep)
				end
			end
		end
	end
end)

addEventHandler("onClientElementStreamOut", root, function()
	if isElement(source) and getElementType(source) == "player" then
		if objs[source] then
			for k, v in ipairs(objs[source]) do
				if isElement(v) then
					destroyElement(v)
					exports.bone_attach:detachElementFromBone(v)
				end
			end
		end
		objs[source] = {}
		pedWeapons[source] = {}
	end
end)

addEventHandler("onClientElementDataChange", getRootElement(), function(dataName)
	if source and getElementType(source) == "player" and source == localPlayer and dataName == "invisible" then
		if getElementData(source, dataName) then 
			if objs[source] then
				for k, v in ipairs(objs[source]) do
					if isElement(v) then
						destroyElement(v)
						exports.bone_attach:detachElementFromBone(v)
					end
				end
			end
			objs[source] = {}
			pedWeapons[source] = {}
		else
			if playerCache[source] then
				objs[source] = {}
				attachedRootCache[source] = {}
				pedsToAttached[source] = {}
				for wep,_ in pairs(playerCache[source]) do
					if not isInTable(player, wep) then
						if stickerCache[source] and stickerCache[source][wep] then
							attachWeaponToBone(source, wep, getPedWalkingStyle(source), stickerCache[source][wep])
						else
							attachWeaponToBone(source, wep, getPedWalkingStyle(source))
						end
						addWep(source, wep)
					end
				end
			end
		end
	end
end)

function updatePlayerWeapons(a)
	slot = getPedWeaponSlot(localPlayer)
	for k,v in pairs(getPlayeritems(localPlayer)) do
		local itemID, itemValue = v['itemID'], v['value']
		if isWeapon(itemID) then
			local wep = getWeaponID(itemID, itemValue, nbt)
			if wep > 0  and slot ~= getSlotFromWeapon(wep) and not isInTable(localPlayer, wep) then
				if getStickerWeapon(itemID) then
					triggerServerEvent("weapons->attach", localPlayer, localPlayer, wep, getStickerWeapon(itemID));
				else  
					triggerServerEvent("weapons->attach", localPlayer, localPlayer, wep);
				end
			end
		end
	end
end
addEvent("updatePlayerWeapons", true)
addEventHandler("updatePlayerWeapons", root, updatePlayerWeapons)

addEventHandler("onClientResourceStart", resourceRoot, function()
	if getElementData(localPlayer, "loggedin") == 1 then
		setTimer(updatePlayerWeapons, 1000, 1)
	end
	triggerServerEvent("getAllWeaponCache", localPlayer)
end)

addEvent("receiveWeaponCache", true)
addEventHandler("receiveWeaponCache", root, function(data, sticker)
	local x, y, z = getElementPosition(localPlayer)
    stickerCache = sticker
	for k,v in pairs(data) do
		if isElement(k) and k ~= localPlayer then
			local xx, yy, zz = getElementPosition(k)
			if getDistanceBetweenPoints3D(x, y, z, xx, yy, zz) < 15 then
				playerCache[v] = {}
				for wep,_ in pairs(v) do
					playerCache[v][wep] = true
					if isElement(k) and isElementStreamedIn(k) then
						if not isInTable(k, wep) then
                            if stickerCache[k] and stickerCache[k][wep] and type(stickerCache[k][wep]) == "string" then
                                attachWeaponToBone(k, wep, getPedWalkingStyle(k), stickerCache[k][wep])
                            else
                                attachWeaponToBone(k, wep, getPedWalkingStyle(k)) 
                            end
							addWep(k, wep)
						end
					end
				end
			end
		end
	end
end)

addEventHandler("onClientPlayerQuit", getRootElement(), function()
	if objs[source] then
		for k, v in ipairs(objs[source]) do
			if isElement(v) then
				destroyElement(v)
				exports.bone_attach:detachElementFromBone(v)
			end
		end
	end
	playerCache[source] = nil
    stickerCache[source] = nil
	pedWeapons[source] = nil
	objs[source] = nil
end)


addEventHandler("onClientResourceStop", root,
    function(stoppedRes)
        if getResourceName(stoppedRes) == "btc_items" then
            if objs[source] then
                for k, v in ipairs(objs[source]) do
                    if isElement(v) then
                        destroyElement(v)
                        exports.bone_attach:detachElementFromBone(v)
                    end
                end
            end
            playerCache[source] = nil
            stickerCache[source] = nil
            pedWeapons[source] = nil
            objs[source] = nil
        end
    end
)

function getDistanceBetweenElements(ele1,ele2)
	local x,y,z = getElementPosition(ele1)
	local xx,yy,yz = getElementPosition(ele2)
	return getDistanceBetweenPoints3D(x,y,z,xx,yy,yz)
end

]]--


