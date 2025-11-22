local connection = exports["mysql"]:getConnection(getThisResource()) -- // SQL kapcsolat
loadallItem = {} -- // Server oldalon tárolt Itemek táblázata

addEventHandler("onResourceStart", root, function(startedRes)
	if getResourceName(startedRes) == "mysql" then
		connection = exports['mysql']:getConnection(getThisResource())
		restartResource(getThisResource())
	end
end)


------------------------------

-- // Item Betöltés

------------------------------

addEventHandler("onResourceStart", resourceRoot, function()
	loadItemToTable()
	setElementData(root, 'item >> loaded', false)
end)

Async:setPriority("high")
Async:setDebug(true)

function loadItemToTable()
	Async:setPriority(500, 100)
	local typeText = "bag"
	
	dbQuery(function(loadedItemQuery)
		local queryElement, queryNumber = dbPoll(loadedItemQuery, 0)
		if queryNumber > 0 then
			Async:foreach(queryElement, function(itemtables)
				if tonumber(itemtables["type"]) == 1 or tonumber(itemtables["type"]) == 2 then 
					typeText = "bag"
				else
					typeText = getItemType(tonumber(itemtables["itemid"]))
				end
									
				if not loadallItem[tonumber(itemtables["type"])] then 
					loadallItem[tonumber(itemtables["type"])] = {} 
				end	
				if not loadallItem[tonumber(itemtables["type"])][tonumber(itemtables["owner"])] then 
					loadallItem[tonumber(itemtables["type"])][tonumber(itemtables["owner"])] = {} 
				end
				if not loadallItem[tonumber(itemtables["type"])][tonumber(itemtables["owner"])][typeText] then
					loadallItem[tonumber(itemtables["type"])][tonumber(itemtables["owner"])][typeText] = {} 
				end				
				loadallItem[tonumber(itemtables["type"])][tonumber(itemtables["owner"])][typeText][tonumber(itemtables["slot"])] = {
					["dbID"] = tonumber(itemtables["id"]),
					["itemID"] = tonumber(itemtables["itemid"]),
					["value"] = (itemtables["value"]),
					["count"] = tonumber(itemtables["count"]),
					["duty"] = tonumber(itemtables["dutyitem"]),
					["slot"] = tonumber(itemtables["slot"]),	
					["itemtype"] = tonumber(itemtables["type"]),	
					["actionSlot"] = tonumber(itemtables["actionslot"]),	
					["healt"] = tonumber(itemtables["healt"]),	
				}
			end)
			
			local time = ((queryNumber*100)/60/1000)

			outputDebugString("Loaded Item (".. queryNumber .." DB) ("..math.floor(time).." mp)", 0, 25, 181, 254)
			setElementData(root, 'item >> loaded', true)
		end
	end, connection, "SELECT * FROM items" ) 
end

addEvent('wlsMTA->#getElementItem', true)
addEventHandler('wlsMTA->#getElementItem', root, function (element)
	if loadallItem[getType(element)] and  loadallItem[getType(element)][getOwnerID(element)] then 
		triggerClientEvent(source, 'wlsMTA->#loadItemToClient', source, loadallItem[getType(element)][getOwnerID(element)])
	else
		triggerClientEvent(source, 'wlsMTA->#loadItemToClient', source, {})
	end
end)

------------------------------

-- // Jármű csomagtartó

------------------------------

function checkVehicleInvenroty(player, vehicle)
	setElementData(vehicle, "clickToVehicle", tonumber(getElementData(vehicle, "clickToVehicle") or 0) + 1) 
	if getElementData(vehicle, "clickToVehicle") == 1 then
		local vehID = getElementModel(vehicle)
		local vehName = exports.wls_vehicleshop:getVehicleRealName(player, vehID) or "Ismeretlen jármű"
		triggerClientEvent(player, "wlsMTA->#checkVehicleInfo", player, vehicle)
		setElementData(vehicle, "inUse", true)
		setElementData(player, "openVehInventory", true)
		exports.global:sendLocalMeAction(player ,"belenézett egy ".. vehName .." csomagtartójába.")
		local playerName = getPlayerName(player)
		exports.logs:logMessage("[csomagtartó]  "..playerName.." belenézett egy ".. vehName .." csomagtartójába.", 34)	
		doorState(vehicle, 1)
	end
end
addEvent("wlsMTA->#checkVehicleInvenroty", true)
addEventHandler("wlsMTA->#checkVehicleInvenroty", root, checkVehicleInvenroty)

function doorState(vehicle, type)
	if type == 1 then
		setVehicleDoorOpenRatio(vehicle, 1, 1, 800)
	else
		setVehicleDoorOpenRatio(vehicle, 1, 0, 800)
		setElementData(vehicle, "inUse", false)
		setElementData(vehicle, "clickToVehicle", 0)
	end
end
addEvent("wlsMTA->#doorState", true)
addEventHandler("wlsMTA->#doorState", root, doorState)

------------------------------

-- // Item frisítések

------------------------------

addEvent('wlsMTA->#updateValue', true)
addEventHandler('wlsMTA->#updateValue', root, function (element, itemType, slot, item, val, db, duty, actionSlot)
	if not val then val = 0 end
	if not db then db = 1 end
	
	
	dbExec(connection, "UPDATE items SET value = ?, dutyitem = ? WHERE owner = ? AND slot = ? AND type = ? AND itemid = ?", val, duty, getOwnerID(element), slot, tonumber(getType(element)) or 0, item)
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['value'] = val
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['duty'] = duty
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]["actionSlot"] = actionSlot
end)

function setSlotCount(element, itemType, slot, val, db, duty, actionSlot, itemid)
	if not val then val = 0 end
	if not db then db = 1 end

	
	dbExec(connection, "UPDATE items SET count = ?, dutyitem = ? WHERE owner = ? AND slot = ? AND type = ? AND itemid = ?", db, duty, getOwnerID(element), slot, tonumber(getType(element)) or 0, itemid)
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['count'] = db
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['value'] = val
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['duty'] = duty
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['actionSlot'] = actionSlot
end
addEvent('wlsMTA->#setSlotCount', true)
addEventHandler('wlsMTA->#setSlotCount', root, setSlotCount)

addEvent('wlsMTA->#setActionBarSlot', true)
addEventHandler('wlsMTA->#setActionBarSlot', root, function (element, itemType, slot, val, db, actionSlot, item)
	if not val then val = 0 end
	if not db then db = 1 end
	
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['count'] = db
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['value'] = val
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['actionSlot'] = actionSlot
	dbExec(connection, "UPDATE items SET actionslot = ? WHERE slot = ? AND owner = ? AND itemid = ?", actionSlot, slot, getOwnerID(element), item)
end)

function setSlotItem(element, itemType, slot, item, val, count, duty)
	if not val then val = 0 end
	if not count then count = 1 end
	
	dbExec(connection, "INSERT INTO items SET slot = ?, itemid = ?, value = ?, count = ?, owner = ?, type = ?, dutyitem = ?", slot, item, val, count, getOwnerID(element), tonumber(getType(element)) or 0, duty)
	
	local types = getItemToType(element, item)	
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
	end
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
	end	
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types][slot] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types][slot] = {}
	end
	loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types][slot] = {
		["dbID"] = tonumber(-1),
		["itemID"] = tonumber(item),
		["value"] = val,
		["count"] = tonumber(count),
		["duty"] = tonumber(duty),
		["slot"] = tonumber(slot),	
		["itemtype"] = tonumber(getType(element)),	
		["actionSlot"] = tonumber(-1),	
	}
end
addEvent('wlsMTA->#setSlotItem', true)
addEventHandler('wlsMTA->#setSlotItem', root, setSlotItem)

function deleteItem(element, itemType, slot)
	if not val then val = 0 end
	if not db then db = 1 end
	
	if not loadallItem[tonumber(getType(element)) or 0] then
		loadallItem[tonumber(getType(element)) or 0] = {}
	end			
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
	end			
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][itemType] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][itemType] = {}
	end	
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][itemType][slot] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][itemType][slot] = {}
	end
	
	if getElementType(element) == 'player' and itemLists[loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['itemID']].weaponID then 
		triggerEvent("detachWeapon", element, element, itemLists[loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['itemID']].weaponID)
	end
		
	dbExec(connection, "DELETE FROM items WHERE owner = ? AND slot = ? AND type = ? AND itemid = ?", getOwnerID(element), slot, tonumber(getType(element)) or 0, loadallItem[getType(element)][getOwnerID(element)][itemType][slot]['itemID'])
	
	loadallItem[getType(element)][getOwnerID(element)][itemType][slot] = {
		["dbID"] = -1,
		["itemID"] = -1,
		["value"] = -1,
		["count"] = -1,
		["duty"] = -1,
		["slot"] = -1,	
		["itemtype"] = -1,	
		["actionSlot"] = -1,	
	}
	
	if loadallItem and loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] then 
		triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, loadallItem[getType(element)][getOwnerID(element)])
	end
end
addEvent('wlsMTA->#deleteItem', true)
addEventHandler('wlsMTA->#deleteItem', root, deleteItem)

addEvent('wlsMTA->#movedItemToElement', true)
addEventHandler('wlsMTA->#movedItemToElement', root, function (element, targetElement, slot, item, val, count)
	
	local types = getItemToType(element, item)
	
	if giveItem(targetElement, item, val, count, 0, true) then 
		setPlayerAnimation(element, "DEALER","DEALER_DEAL", 3000, false, false, false, false)
		setPlayerAnimation(targetElement, "DEALER","DEALER_DEAL", 3000, false, false, false, false)
		if getElementType(element) == "player" and getElementType(targetElement) == "player" then 
			meAction(element, "átad egy tárgyat ".. getPlayerName(targetElement):gsub("_"," ").."-nak/nek (".. getItemName(item)..")")
			local playerName = getPlayerName(element)
			exports.logs:logMessage("[átadás]  "..playerName.." átad egy tárgyat ".. getPlayerName(targetElement):gsub("_"," ").."-nak/nek (".. getItemName(item)..")", 34)			
		elseif getElementType(element) == "vehicle" and getElementType(targetElement) == "player" then 
			local playerName = getPlayerName(targetElement)
			meAction(targetElement, "kivesz egy tárgyat a jármű csomagtartójából. (".. getItemName(item) ..")")
			exports.logs:logMessage("[csomagtartó]  "..playerName.." kivesz egy tárgyat a jármű csomagtartójából. (".. getItemName(item) ..")", 34)			
		elseif getElementType(element) == "player" and getElementType(targetElement) == "object" then 
			local playerName = getPlayerName(element)
			meAction(element, "berak egy tárgyat a széfbe. (".. getItemName(item) ..")")
			exports.logs:logMessage("[széf]  "..playerName.." berak egy tárgyat a széfbe. (".. getItemName(item) ..")", 34)			
		elseif getElementType(element) == "object" and getElementType(targetElement) == "player" then 
			local playerName = getPlayerName(targetElement)
			meAction(targetElement, "kivett egy tárgyat a széfből. (".. getItemName(item) ..")")
			exports.logs:logMessage("[széf]  "..playerName.." kivett egy tárgyat a széfből. (".. getItemName(item) ..")", 34)		
		end
		if getElementType(element) == "player" then 
			deleteItem(element, types, slot)
			if loadallItem and loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] then 
				triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, loadallItem[getType(element)][getOwnerID(element)])
			end		
		elseif getElementType(element) == "object" then
			deleteItem(element, types, slot)
			if loadallItem and loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] then 
				triggerClientEvent(targetElement, 'wlsMTA->#loadItemToClient', targetElement, loadallItem[getType(element)][getOwnerID(element)])
			end
		elseif getElementType(element) == "vehicle" then 
			deleteItem(element, types, slot)
			if loadallItem and loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] then 
				triggerClientEvent(targetElement, 'wlsMTA->#loadItemToClient', targetElement, loadallItem[getType(element)][getOwnerID(element)])
			end	
		end
				
		if getElementType(element) == "player" then 
			triggerClientEvent(element, "updatePlayerWeapons", element, element)
		end
		if getElementType(targetElement) == "player" then 
			triggerClientEvent(targetElement, "updatePlayerWeapons", targetElement, targetElement)
		end
		
	else
		if getElementType(element) == "player" then 
			outputChatBox('#D24D57[IRG~Items] #ffffffNincs elég hely az adott inventory-ban!', element, 255, 255, 255, true)
		elseif getElementType(element) == "vehicle" then
			outputChatBox('#D24D57[IRG~Items] #ffffffNincs elég hely az adott inventory-ban!', targetElement, 255, 255, 255, true)
		end
	end
end)

------------------------------

-- // Give Item 

------------------------------

addCommandHandler("giveitem",
	function(playerSource, cmd, id, item, value, count)
		if getElementData( playerSource, "acc:admin" ) >= 14 then
			if (getElementData (playerSource, "adminduty") or 0) == 1 then
				if id and item and value and count then
					local targetPlayer, targetPlayerName = exports.global:findPlayerByPartialNick(playerSource, id)			
					if targetPlayer then
						if giveItem(targetPlayer, tonumber(item), tonumber(value), tonumber(count), 0, true) then -- 0 -> dutyitem
							local comy = getElementData(playerSource, "anick")
							outputChatBox("#7cc576[Információ]: #ffffffKaptál #00AEFF".. comy .."#FFFFFF-tól/től egy #D75555" ..getItemName(tonumber(item)).." #ffffffitemet.", targetPlayer,255,255,255,true)				
							outputChatBox("#7CC576[#7CC576wls#ffffffMTA #ffffff- #53bfdcAdmin információ#7CC576]: #00AEFF".. targetPlayerName:gsub("_", " ") .."#FFFFFF-nak/nek adtál egy #D75555" ..getItemName(tonumber(item)).." #ffffffitemet.", playerSource,255,255,255,true)				
							exports.global:sendMessageToAdmins("#7CC576[#7CC576wls#ffffffMTA #ffffff- #53bfdcAdminnapló#7CC576]#ffffff: #00AEFF" .. comy .. " #FFFFFFadott #00AEFF".. targetPlayerName:gsub("_", " ") .."#ffffff-nak/nek egy #D75555" ..getItemName(tonumber(item)).."#ffffff nevezetű itemet.", 255, 0, 0,true)
							exports.logs:logMessage("[addolás]  ".. comy .. " adott ".. targetPlayerName:gsub("_", " ") .."-nak/nek egy " ..getItemName(tonumber(item)).." nevezetű itemet.", 34)			
						else
							outputChatBox("#7CC576[#7CC576wls#ffffffMTA #ffffff- #53bfdcAdmin információ#7CC576]: #ffffffNem fér el több tárgy az adott játékosnál!", playerSource, 255 ,255, 255, true)
						end
					end
				else
					outputChatBox("#7cc576[Használat]: #ffffff/"..cmd.." [Név / ID] [ItemId] [Érték] [Db]", playerSource, 255, 255, 255, true)
				end
			else
				outputChatBox("#d24d57[IRG - Defend]: #FFFFFFNem vagy adminszolgálatba!", playerSource,255,255,255,true)	
			end
		end
	end
)

function giveItem (element, item, value, count, duty, state)
	if(not value)then value=0 end
	if(not count)then count=1 end
	if(not duty)then duty=0 end
	if(not state)then state=false end
	
	if (getItemsWeight(element) + getItemsWeightElement(element, item, count) <= getMaxWeight(element))  then 
		local slot = getFreeSlot(element, item)
		if(slot~=false)then
			local types = getItemToType(element, item)
			setSlotItem(element, types, slot, item, value, count, duty)
			if state then
				if loadallItem and loadallItem[getType(element)] and  loadallItem[getType(element)][getOwnerID(element)] then 
					triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, loadallItem[getType(element)][getOwnerID(element)])
				end
			end
			if getElementType(element) == 'player' and itemLists[item].weaponID then 
				if getStickerWeapon(item) then
					triggerEvent("weapons->attach", element, element, getWeaponID(item), getStickerWeapon(item))
				else
					triggerEvent("weapons->attach", element, element, getWeaponID(item))
				end
			end
			return true, "Siker!"
		else
			return false, "Nincs elég hely!"
		end
	else
		return false, "Nincs elég hely!"
	end
end
addEvent('wlsMTA->#inventoryGiveItem', true)
addEventHandler('wlsMTA->#inventoryGiveItem', root, giveItem)

------------------------------

-- // Súly / Item lekérdezések

------------------------------

function getItemsWeightElement(element, itemID, count)
	local all = 0
	all = all + getItemWeight(itemID)*count
	return all
end

function getItemsWeight(element)
	local all = 0
	for i = 1, row * column do	
		for index, value in ipairs (inventoryElem) do 
			
			if not loadallItem[tonumber(getType(element)) or 0] then
				loadallItem[tonumber(getType(element)) or 0] = {}
			end			
			
			if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
				loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
			end			
			
			if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][value] then
				loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][value] = {}
			end	
			
			if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][value][i] then
				loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][value][i] = {}
			end		
			
			if(loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] and loadallItem[getType(element)][getOwnerID(element)][value] and loadallItem[getType(element)][getOwnerID(element)][value][i] and tonumber(loadallItem[getType(element)][getOwnerID(element)][value][i]['itemID']) or -1 > 0)then
				all = all + (getItemWeight(loadallItem[getType(element)][getOwnerID(element)][value][i]['itemID']) or 1)*tonumber(loadallItem[getType(element)][getOwnerID(element)][value][i]['count'] or 1)
			end
		end
	end
	return all
end

function getFreeSlot(element, itemID)
	local types = getItemToType(element, itemID)

	for i = 1, row * column do	
		if not loadallItem[tonumber(getType(element)) or 0] then
			loadallItem[tonumber(getType(element)) or 0] = {}
		end			
		
		if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
			loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
		end			
		
		if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
			loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
		end	
		
		if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types][i] then
			loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types][i] = {}
		end		
		
		if not loadallItem[tonumber(getType(element))][getOwnerID(element)][types][i]['itemID'] then
			loadallItem[tonumber(getType(element))][getOwnerID(element)][types][i]['itemID'] = -1
		end
		
		if loadallItem[tonumber(getType(element))][getOwnerID(element)][types][i]['itemID'] < 0 then
			return i
		end
	end
	return false
end

function hasItemS(element, itemID, itemValue)
	local types = getItemToType(element, itemID)
	
	if not loadallItem[tonumber(getType(element)) or 0] then
		loadallItem[tonumber(getType(element)) or 0] = {}
	end		
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
	end			
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
	end	
	
	for k,v in pairs(loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] or {}) do
		if itemValue then
			if v['itemID'] == itemID and v['value'] == itemValue then
				return true, k, v["value"], v["count"]
			end
		else
			if v['itemID'] == itemID then
				return true, k, v["value"], v["count"]
			end
		end
	end
	return false
end

------------------------------

-- // remove Item cuccok

------------------------------

function RemovePlayerDutyItems(element)
	for i = 1, row * column do	
		for index, value in ipairs (inventoryElem) do 
			if(loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] and loadallItem[getType(element)][getOwnerID(element)][value] and loadallItem[getType(element)][getOwnerID(element)][value][i] and tonumber(loadallItem[getType(element)][getOwnerID(element)][value][i]['duty'] or -1) > 0)then
				deleteItem(element, value, loadallItem[getType(element)][getOwnerID(element)][value][i]['slot'])
				if getElementType(element) == 'player' and getItemWeaponID(loadallItem[getType(element)][getOwnerID(element)][value][i]['itemID']) then 
					triggerEvent("detachWeapon", element, element, getItemWeaponID(loadallItem[getType(element)][getOwnerID(element)][value][i]['itemID']))
				end
			end
		end
	end
	if loadallItem[getType(element)] and  loadallItem[getType(element)][getOwnerID(element)] then 
		triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, loadallItem[getType(element)][getOwnerID(element)])
	else
		triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, {})
	end
end
addEvent('wlsMTA->#RemovePlayerDutyItems', true)
addEventHandler('wlsMTA->#RemovePlayerDutyItems', root, RemovePlayerDutyItems)

function takePlayerItemToID(element, itemID, all)
	if not all then all = false end 
	
	local types = getItemToType(element, itemID)
	
	if not loadallItem[tonumber(getType(element)) or 0] then
		loadallItem[tonumber(getType(element)) or 0] = {}
	end		
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
	end			
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
	end	
	
	
	for i = 1, row * column do	
		if loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] and loadallItem[getType(element)][getOwnerID(element)][types] and loadallItem[getType(element)][getOwnerID(element)][types][i] and tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['itemID'] or  - 1)  == tonumber(itemID) then --
			if not all then 
				if tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['count']) > 1 then  
					setSlotCount(element, types, i, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['value']), tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['count'])-1, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['duty']), -1, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['itemID']))
					break
				else
					deleteItem(element, types, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['slot']))
					break
				end
			else
				deleteItem(element, types, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['slot']))
			end
		end
	end
	if loadallItem[getType(element)] and  loadallItem[getType(element)][getOwnerID(element)] then 
		triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, loadallItem[getType(element)][getOwnerID(element)])
	else
		triggerClientEvent(element, 'wlsMTA->#loadItemToClient', element, {})
	end
end
addEvent("wlsMTA->#takePlayerItemToID", true)
addEventHandler("wlsMTA->#takePlayerItemToID", root, takePlayerItemToID)

function deleteItemById(element, itemID, itemPrice)
	if not itemPrice then itemPrice = 0 end
	local types = getItemToType(element, itemID)
	
	if not loadallItem[tonumber(getType(element)) or 0] then
		loadallItem[tonumber(getType(element)) or 0] = {}
	end		
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
	end			
	
	if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
		loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
	end	
	
	local giveMoney = 0
	for i = 1, row * column do	
		if loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] and loadallItem[getType(element)][getOwnerID(element)][types] and loadallItem[getType(element)][getOwnerID(element)][types][i] and tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['itemID'] or  - 1)  == tonumber(itemID) then 
			giveMoney = giveMoney + (tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['count'])*itemPrice)
			deleteItem(element, types, i)
		end
	end
	if math.abs(giveMoney) > 0 then
		setElementData(element, "money", getElementData(element, "money") + math.abs(giveMoney))
		outputChatBox("#7cc576Josh: #ffffffMegveszem tőled a #00AEFF"..getItemName(itemID).." #ffffffitemet!", element, 255, 255, 255, true)
		outputChatBox("#7cc576Josh: #ffffffKapsz érte mondjuk: #00AEFF"..formatMoney(giveMoney).." #ffffffForintot!", element, 255, 255, 255, true)
	end
end
addEvent("wlsMTA->#deleteItemById", true)
addEventHandler("wlsMTA->#deleteItemById", root, deleteItemById)

function formatMoney(amount)
	local formatted = tonumber(amount)
	if formatted then
		while true do  
			formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1 %2')
		if (k==0) then
			break
		end
	end
		return formatted
	else
		return amount
	end
end

function deleteGoldItem(element, itemID, _, state)
	if state then 
		local types = getItemToType(element, itemID)
	
		if not loadallItem[tonumber(getType(element)) or 0] then
			loadallItem[tonumber(getType(element)) or 0] = {}
		end		
		
		if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
			loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
		end			
		
		if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] then
			loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] = {}
		end	
		
		local text = 0
		for i = 1, row * column do	
			if loadallItem[getType(element)] and loadallItem[getType(element)][getOwnerID(element)] and loadallItem[getType(element)][getOwnerID(element)][types] and loadallItem[getType(element)][getOwnerID(element)][types][i] and tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['itemID'] or  - 1)  == tonumber(itemID) then 
				deleteItem(element, types, tonumber(loadallItem[getType(element)][getOwnerID(element)][types][i]['slot']))
				local money = math.random(500000, 1500000)
				text = text + money 
			end
		end
		if text ~= 0 then 
			outputChatBox("#7cc576Jason Power: #ffffffKaptál az aranyrudakért #00AEFF"..text.." #ffffffForintot!", element,124,197,118,true) -- sikeresen leadtad az aranyat gecóó
			setElementData(element, 'money', getElementData(element, 'money') + text)
		end
	end
end
addEvent("wlsMTA->#deleteGoldItem", true)
addEventHandler("wlsMTA->#deleteGoldItem", root, deleteGoldItem)


addEventHandler('onPlayerWasted', root, function ()
	takePlayerItemToID(source, 82, true)
	takePlayerItemToID(source, 230, true)
end)

------------------------------

-- // Animáció ~ / me 

------------------------------

function setPlayerAnimation (element, animName, animtoName, animTime)
	if not animTime then animTime = -1 end
	setPedAnimation(element, animName, animtoName, animTime, true, false, false, false)
end
addEvent("wlsMTA->#setPlayerAnimation", true)
addEventHandler("wlsMTA->#setPlayerAnimation", getRootElement(), setPlayerAnimation)

function meAction(player, text)
	exports.global:sendLocalMeAction(player, text)
end
addEvent("wlsMTA->#setPlayerMe", true)
addEventHandler("wlsMTA->#setPlayerMe", getRootElement(), meAction)

------------------------------

-- // Kukához tartozó dolgok

------------------------------

local kuka 

function loadTrash()
	Async:setPriority(500, 100)
	
	dbQuery(function(loadedItemQuery)
		local queryElement, queryNumber = dbPoll(loadedItemQuery, 0)
		if queryNumber > 0 then
			Async:foreach(queryElement, function(trash)
				trashPos = fromJSON(trash["pos"]) or "[[ 0,0,0,0,0,0,0,0 ]]"
				
				kuka = createObject(1359, trashPos[1],trashPos[2], trashPos[3]-0.4, trashPos[4], trashPos[5], trashPos[6])
				setElementData(kuka, "kukaID", trash['id'])
				setElementInterior(kuka, trashPos[7])
				setElementDimension(kuka, trashPos[8])
			end)
			local time = ((queryNumber*100)/60/1000)

			outputDebugString("Loaded Trash (".. queryNumber .." DB) ("..math.floor(time).." mp)", 0, 25, 181, 254)
		end
	end, connection, "SELECT * FROM bins" ) 
end
addEventHandler("onResourceStart", resourceRoot, loadTrash)


addCommandHandler("createkuka",
function(playerSource, cmd)
	if (getElementData(playerSource,"acc:admin") >= 6) then
		local x, y, z = getElementPosition(playerSource)
		local rx, ry, rz = getElementRotation(playerSource)
		local int = getElementInterior(playerSource)
		local Dim = getElementDimension(playerSource)
		
		local Query, _, insertID = dbQuery(connection,"INSERT INTO bins SET pos = ?", toJSON({x, y, z, rx, ry, rz, int ,Dim})) -- SQL BEszúrás
		local checkQuery, _, insertID = dbPoll ( Query, -1 )
		if checkQuery then
			outputChatBox("#7cc576[IRG~Items] #ffffff Kuka létrehozva.", playerSource, 255,255, 255, true)
			kuka = createObject(1359, x, y, z-0.4, rx, ry, rz)
			setElementData(kuka, "kukaID", insertID)
			setElementInterior(kuka, int)
			setElementDimension(kuka, Dim)
		end
	end
end)

addCommandHandler("delkuka",
function(playerSource, cmd)
	if getElementData( playerSource, "acc:admin" ) >= 6 then
		local x, y, _ = getElementPosition(playerSource)
		local kukashape = createColCircle ( x, y, 3 )
		local kukaszam = 0
		for _,v in ipairs(getElementsWithinColShape ( kukashape, "object" ) ) do
				local kukaid = getElementData(v,"kukaID") or 0
				kukaszam = kukaszam + 1
				destroyElement(kukashape)
				if kukaid >= 1 then 
					destroyElement(v)
				end
				dbPoll ( dbQuery( connection, "DELETE FROM bins WHERE id = '?'", kukaid), 0 )
				outputChatBox("#7cc576[IRG~Items] #ffffffKuka sikeresen törölve. ID: #F7CA18"..kukaid, playerSource, 255, 255, 255, true)		
				return
		end
		if(kukaszam == 0) then
			destroyElement(kukashape)
			outputChatBox("#D24D57[IRG~Items] #ffffffNincs Kuka a közeledben.", playerSource, 255, 255, 255, true)
		end
	end
end)

------------------------------

-- // Attach

------------------------------

local object = {}
local attachedTable = {
	-- [ItemID] = {OBJID, boneID, x, y, z, rotx, roty, rotz}
	[1] = {2703, 12, 0, 0.05, 0.095, 0, 300, 0},
	[2] = {2769, 12, 0, 0.05, 0.095, 0, 300, 0},
	[3] = {2880, 12, -0.05, 0.1, 0.03, 90, 300, 0},
	[5] = {2702, 12, -0.04, 0.02, 0.08, 120, -80, 0},
	[7] = {1543, 11, -0.25, -0.12, 0.12, 3000, -70, 190},
	[8] = {1484, 11, 0.05, 0.02, 0.15, 200, 0, 190},
	[9] = {1486, 11, -0.01, 0, 0.08, 180, 300, 190},
	[10] = {1668, 11, -0.05, 0, 0.12, 180, 300, 190},
	[11] = {1520, 11, -0.1, 0, 0.15, 180, 300, 190},
	[12] = {2647, 11, 0.02, -0.02, 0.12, 180, 300, 190},
	[215] = {3027, 12, 0, 0.05, 0.095, 0, 300, 0},
	[144] = {1485, 12, -0.02, 0, -0.02, 0, 270, 0},
}

function createAttachObj (element, itemID, anim, destroy)
	if attachedTable[itemID] then 
		if not destroy then 
			if not (object[element]) then
				object[element] = createObject(attachedTable[itemID][1],0,0,0)
				setElementInterior(object[element], getElementInterior(element))
				setElementDimension(object[element], getElementDimension(element))
				exports.irg_bone:attachElementToBone(object[element], element, attachedTable[itemID][2], attachedTable[itemID][3], attachedTable[itemID][4], attachedTable[itemID][5], attachedTable[itemID][6], attachedTable[itemID][7], attachedTable[itemID][8])
			else
				exports.irg_bone:detachElementFromBone(object[element])
				destroyElement(object[element])
				object[element] = nil
			end
		else
			if isElement(object[element]) then 
				exports.irg_bone:detachElementFromBone(object[element])
				destroyElement(object[element])
				object[element] = nil
			end
		end
	end
end
addEvent('wlsMTA->#createAttachObj', true)
addEventHandler('wlsMTA->#createAttachObj', root, createAttachObj)

------------------------------

-- // Weapon

------------------------------

function toggleGun(element, slot, item,itemValue)
	if item and itemLists[item].weaponID and getPedWeapon(element) > 0 and tonumber(getPedWeapon(element)) ~= tonumber(itemLists[item].weaponID) then
		outputChatBox("#D24D57[IRG~Items] #ffffffElőbb rakd el a fegyvered", element, 255, 255, 255, true)
		return
	end

	takeAllWeapons(element)

	if item and itemLists[item].weaponID and (getElementData(element, "char:weaponInHand") or {-1, -1, -1})[1] < 1 then
		local ammo = 0
		
		if itemLists[item].AmmoID then
			for i = 1, row * column do	 -- loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)][types] or {}
				if not loadallItem[tonumber(getType(element)) or 0] then
					loadallItem[tonumber(getType(element)) or 0] = {}
				end		
				
				if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] then
					loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)] = {}
				end			
				
				if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'] then
					loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'] = {}
				end					
				
				if not loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i] then
					loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i] = {}
				end	
				
				if loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'] and loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i] and  tonumber(loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i]['itemID']) == tonumber(itemLists[item].AmmoID) then
					
					if loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'] and loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i] and  (loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i]['count'] or -1) > 0 and tonumber(getPedWeapon(element)) ~= itemLists[item].weaponID then
						ammo = ammo + loadallItem[tonumber(getType(element)) or 0][getOwnerID(element)]['weapon'][i]['count']
					end
				end
			end
		else
			ammo = 999999
		end
		
		if ammo <= 0 then
			outputChatBox("#D24D57[IRG~Items] #ffffffNincs elég lőszered!", element, 255, 255, 255, true)
			return
		end
		
		if tonumber(itemLists[item].AmmoID) then 
			setPedAnimation(element, "BUDDY", "buddy_reload", 1000, false, true, true)
		end
		
		triggerEvent("server->applyTexture", element, element, exports["irg_sticker"]:getWeaponWeaponShaderName(getWeaponID(item)), getStickerWeapon(item));
		triggerEvent("weapons->detach", element, element, getWeaponID(item))
		giveWeapon(element, itemLists[item].weaponID, ammo, true)
		meAction(element, "elővett egy fegyvert ("..itemLists[item].name.. ")")
		setElementData(element, "char:weaponInHand", {item, slot, itemLists[item].weaponID})
		setElementData(element, "char:weaponGettin"..getItemType(item)..slot, true)		
	else
		if getStickerWeapon(item) then
			triggerEvent("weapons->attach", element, element, getWeaponID(item), getStickerWeapon(item))
		else
			triggerEvent("weapons->attach", element, element, getWeaponID(item))
		end
		if getElementData(element, "char:weaponGettin"..getItemType(item)..slot or 0) then
			-- triggerEvent("server->destroyTexture",element,element,element)
			meAction(element, "elrakott egy fegyvert ("..itemLists[item].name.. ")")
			setElementData(element, "char:weaponInHand", {-1, -1, -1})
			setElementData(element, "char:weaponGettin"..getItemType(item)..slot, false)
		end
	end
end
addEvent("toggleGun", true)
addEventHandler("toggleGun", root, toggleGun)

------------------------------

-- // Bag

------------------------------

function getBagToElement(element)
	if hasItemS(element, oneLevelBagID) then -- // Sima Táska
		return oneLevelBag
	elseif hasItemS(element, premiumLevelBagID) then  -- // Prémium Táska
		return premiumLevelBag
	else
		return baseWeight
	end
end


function getMaxWeight(element)
	if(tostring(getElementType(element))=="player")then
		return getBagToElement(element)
	elseif(tostring(getElementType(element))=="vehicle")then
		return 50
	elseif(tostring(getElementType(element))=="object")then
		return 100
	end
	return 0
end

------------------------------

-- // Skill

------------------------------

local weaponSkillBook = {
	[231] = 77, --// AK
	[232] = 78, -- // M4
	[233] = 71, -- // Deagle
	[234] = 72, -- // Shotgun
	[235] = 73, -- // Lefűrészelt csövű sörétes
	[236] = 69, -- // Colt-45
	[237] = 79, -- // Magnum ( Sniper )
	[238] = 80, -- // M4A01 ( Puska )
	[239] = 76, -- // MP5
	[240] = 75, -- // Micro Uzi
}

addEvent("wlsMTA->#insertStat", true)
addEventHandler("wlsMTA->#insertStat", root, function (source, itemID, itemSlot)
	local ownerID = getElementData(source, "acc:id")
	local loadSkill, queryNumber = dbPoll(dbQuery(connection, "SELECT * FROM statAttac WHERE owner = ? AND stat = ?", ownerID, weaponSkillBook[itemID]), -1)
	if queryNumber >  0 then 
		for index, value in ipairs(loadSkill) do
			if value['value'] < 1000 then 
				dbExec(connection, "UPDATE statAttac SET owner = ?, value = ? WHERE stat = ?", ownerID, 1000, weaponSkillBook[itemID])
				deleteItem(source, getItemType(itemID), itemSlot)
				setPedStat(source, weaponSkillBook[itemID], 1000)
				outputChatBox('#7cc576[IRG~Items] #ffffffSikeresen kitanúltad a mesterkönyvet!', source, 255, 255, 255, true)
			else
				outputChatBox('#D24D57[IRG~Items] #ffffff Ezt a mesterkönyvet már kitanúltad!', source, 255, 255, 255, true)
			end
		end
	else
		dbExec(connection, "INSERT INTO statAttac SET stat = ?, owner = ?, value = ?", weaponSkillBook[itemID], ownerID, 1000)
		deleteItem(source, getItemType(itemID), itemSlot)
		setPedStat(source, weaponSkillBook[itemID], 1000)
		outputChatBox('#7cc576[IRG~Items] #ffffffSikeresen kitanúltad a mesterkönyvet!', source, 255, 255, 255, true)
	end
end)

------------------------------

-- // Shield

------------------------------

local shields = {}

addEvent("wlsMTA->#createShield", true)
addEventHandler("wlsMTA->#createShield", root, function ()
	if not isPedInVehicle(source) then 
		if (shields[source]) then
			destroyElement(shields[source])
			shields[source] = nil
			toggleControl(source, 'jump', true)
		else
			local x, y, z = getElementPosition(source)
			local rot = getPedRotation(source)
			
			x = x + math.sin(math.rad(rot)) * 1.5
			y = y + math.cos(math.rad(rot)) * 1.5
			
			local object = createObject(1631, x, y, z)
			attachElements(object, source, 0, 1, 0)
			setElementData(object, 'obj >> element', shields[source])
			setElementData(shields[source], 'obj >> player', source)
			shields[source] = object
			toggleControl(source, 'jump', false)
		end
	end
end)

addEventHandler('onPlayerQuit', root, function()
	if source and isElement(shields[source]) then 
		destroyElement(shields[source])
	end	
	
	if source and isElement(object[source]) then 
		destroyElement(object[source])
	end
end)

------------------------------

-- // Debug dolgok

------------------------------

addEventHandler("onResourceStart", resourceRoot, function()
	for key, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "dbid") or -1 > 0 then
			takeAllWeapons(player)
			setElementData(player, "char:weaponInHand", {-1, -1, -1})
			setTimer(function()
				triggerClientEvent(player, "updatePlayerWeapons", player,player)
			end,1000,1)
		end
	end
end)

------------------------------

-- // Széfhez tartozó dolgok

------------------------------

function loadSafeToServer()
	Async:setPriority(500, 100)
	
	dbQuery(function(loadedItemQuery)
		local queryElement, queryNumber = dbPoll(loadedItemQuery, 0)
		if queryNumber > 0 then
			Async:foreach(queryElement, function(safeTable)
				local pos = fromJSON(safeTable["Position"])
				local safe = createObject(2332, pos[1], pos[2], pos[3], pos[4], pos[5], pos[6])
				
				setElementInterior(safe, safeTable["Interior"])
				setElementDimension(safe, safeTable["Dimension"])
				setElementData(safe, "safe->ID", safeTable["ID"])
				setElementData(safe, "safe->State", safeTable["Status"])
			end)
			local time = ((queryNumber*100)/60/1000)

			outputDebugString("Loaded Safe (".. queryNumber .." DB) ("..math.floor(time).." mp)", 0, 25, 181, 254)
		end
	end, connection, "SELECT * FROM Safe" ) 
end
addEventHandler("onResourceStart", resourceRoot, loadSafeToServer)

addEvent("item->createSafe", true)
addEventHandler("item->createSafe", root, function (player)
	if player then 
		local x, y, z = getElementPosition(player)
		local rx, ry, rz = getElementRotation(player)
		local int = getElementInterior(player)
		local dim = getElementDimension(player)
		local pos = toJSON({x, y, z-0.5, rx, ry, rz-180})
		local InsertSafe = dbQuery(connection, "INSERT INTO Safe SET Position	=?, Interior = ?, Dimension=?", pos, int, dim)
		if InsertSafe then 
			local safe = createObject(2332, x, y, z-0.5, rx, ry, rz-180)
			setElementInterior(safe, int)
			setElementDimension(safe, dim)
			
			local QueryState, _, SafeIDs = dbPoll(InsertSafe, -1)
			if QueryState then
				setElementData(safe, "safe->ID", SafeIDs)
				setTimer(function()
					giveItem(player, 19, SafeIDs, 1,0)
				end, 100, 1)
			end
		end
	end
end)

addCommandHandler("nearbysafe",
function(playerSource, cmd)
	if (tonumber(getElementData(playerSource, "acc:admin")) >= 6) then
		local pX,pY,pZ = getElementPosition(playerSource)
		for k,v in ipairs(getElementsByType("object")) do
			vX,vY,vZ = getElementPosition(v)
			local dist = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
			local id = getElementData(v,"safe->ID") or "ismeretlen"
			local interior = getElementInterior(playerSource)
			local dimension = getElementDimension(playerSource)			
			local interior1 = getElementInterior(v)
			local dimension1 = getElementDimension(v)
			if dist <= 15 and interior == interior1 and dimension == dimension1 then
				outputChatBox("#F7CA18[Object]#ffffff Object neve: #F89406 Széf #F89406| #ffffffTávolság: #F89406" ..math.ceil(dist) .. " méter #F89406| #ffffffID:#F89406[" .. id .. "]", playerSource, 255,255,255,true)			
			end
		end
	end
end)

addCommandHandler("delsafe", function(player, _, safeID)
	if getElementData(player, "acc:admin") < 7 then return end
	if not tonumber(safeID) then
		outputChatBox(" /delsafe [ID]", player, 0, 0, 0, true)
		return
	end
	
	safeID = tonumber(safeID)
	if (getElementData (player, "adminduty") or 0) == 1 then
		for _, safe in ipairs(getElementsByType("object")) do
			if tonumber(getElementData(safe,"safe->ID")) == safeID then
				destroyElement(safe)
				local delQuery = dbPoll(dbQuery(connection, "DELETE FROM Safe WHERE id=?", safeID), -1)
				local delQuery = dbPoll(dbQuery(connection, "DELETE FROM items WHERE owner=?", safeID), -1)
				for k, v in ipairs(getElementsByType("player")) do
					if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v, "acc:admin") or 0) >= 7 then
						outputChatBox("#D64541[Developer]#ffffff #7cc576"..getElementData(player, "anick").." #fffffftörölt egy Széfet (ID: #7cc576"..safeID.."#ffffff)", v,255, 255, 255, true)
						exports.global:sendMessageToAdmins("#7CC576[#7CC576IRG#ffffffMTA #ffffff- #53bfdcAdminnapló#7CC576] #00aeff"..getElementData(player, "anick").." #fffffftörölt egy Széfet (ID: #7cc576"..safeID.."#ffffff)", 255, 0, 0,true)
						exports.logs:logMessage("[széf]  "..getElementData(player, "anick").." törölt egy Széfet (ID: "..safeID..")", 34)
					end
				end
			end
		end
	else
		outputChatBox("#d24d57[IRG - Defend]: #FFFFFFNem vagy adminszolgálatba!", player, 255, 255, 255, true)
	end
end)

addCommandHandler("movesafe", function(player, _, safeID)
	if getElementData(player, "acc:admin") < 7 then return end
	if not tonumber(safeID) then
		outputChatBox(" /movesafe [ID]", player, 255, 255, 255, true)
		return
	end
	safeID = tonumber(safeID)
	if (getElementData (player, "adminduty") or 0) == 1 then
		for _, safe in ipairs(getElementsByType("object")) do
			if tonumber(getElementData(safe,"safe->ID")) == safeID then
				
				local x, y, z = getElementPosition(player)
				local rx, ry, rz = getElementRotation(player)
				local int = getElementInterior(player)
				local dim = getElementDimension(player)
				if int > 0 and dim > 0 then 
					setElementPosition(safe, x, y, z-0.5 )
					setElementRotation(safe, rx, ry, rz-180)
					setElementInterior(safe, int)
					setElementDimension(safe, dim)
					local pos = toJSON({x, y, z-0.5, rx, ry, rz-180})
					dbExec(connection, "UPDATE Safe SET Position = ?, Interior = ?, Dimension = ? WHERE ID = ?", pos, int, dim, safeID)
					for k, v in ipairs(getElementsByType("player")) do
						if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v, "acc:admin") or 0) >= 7 then
							outputChatBox("#D64541[Developer]#ffffff #7cc576"..getElementData(player, "anick").." #ffffffmegváltoztatta a pozícióját a széfnek (ID: #7cc576"..safeID.."#ffffff)", v,255, 255, 255, true)
							exports.global:sendMessageToAdmins("#7CC576[#7CC576wls#ffffffMTA #ffffff- #53bfdcAdminnapló#7CC576] #00aeff"..getElementData(player, "anick").." #ffffffmegváltoztatta egy széfnek a pozícióját! (ID: #7cc576"..safeID.."#ffffff)", 255, 0, 0,true)
							exports.logs:logMessage("[széf]  "..getElementData(player, "anick").." megváltoztatta egy széfnek a pozícióját! (ID: "..safeID..")", 34)			

						end
					end
				end
			end
		end
	else
		outputChatBox("#d24d57[IRG - Defend]: #FFFFFFNem vagy adminszolgálatba!", player, 255, 255, 255, true)
	end
end)

addEvent("Items-->DeleteSafes", true)
addEventHandler("Items-->DeleteSafes", root, function (player, safeElement, safeID)
	destroyElement(safeElement)
	local delQuery = dbPoll(dbQuery(connection, "DELETE FROM Safe WHERE id=?", safeID), -1)
	local delQuery = dbPoll(dbQuery(connection, "DELETE FROM items WHERE owner=?", safeID), -1)
	loadPlayerItems(player)
end)

function ugyislebuksz(player, item)
	local comy = getElementData(player, "anick")
	local item = getItemName(item)
	--exports.global:sendMessageToAdmins("#7CC576[#7CC576wls#ffffffMTA #ffffff- #53bfdcAdminnapló#7CC576] #00aeff"..comy.." #ffffffleaddolt egy tárgyat amelynek a neve: #d24d57".. item.."", 255, 0, 0,true)
	--exports.logs:logMessage("[ADDOLÁS] --> "..comy.." leaddolt egy tárgyat amelynek a neve: ".. item.."", 34)			
end
addEvent("ugyislebuksz", true)
addEventHandler("ugyislebuksz", getRootElement(), ugyislebuksz)

function ugyislebuksz3(player, item)
	local comy = getElementData(player, "anick") or getPlayerName(player) 
	local item = getItemName(item)
	--exports.logs:logMessage("[kuka] --> "..comy.." kidobott egy tárgyat a kukába! [".. item .."]", 34)			
end
addEvent("ugyislebuksz3", true)
addEventHandler("ugyislebuksz3", getRootElement(), ugyislebuksz3)