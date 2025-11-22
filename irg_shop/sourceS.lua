local connection = exports["san_mysql"]:getConnection() -- // SQL kapcsolat
local shopPed = {}

addEventHandler("onResourceStart", root, function(startedRes)
	if getResourceName(startedRes) == "san_mysql" then
		connection = exports['san_mysql']:getConnection()
		restartResource(getThisResource())
	end
end)

------------------------------

-- // Shop betöltése

------------------------------

addEventHandler('onResourceStart', resourceRoot, function()
	loadShop()
end)

Async:setPriority("high")
Async:setDebug(true)

function loadShop()
	Async:setPriority(500, 100)
	
	dbQuery(function(loadedItemQuery)
		local queryElement, queryNumber = dbPoll(loadedItemQuery, 0)
		if queryNumber > 0 then
			Async:foreach(queryElement, function(shopTable)
				local position = fromJSON(shopTable["pos"])
				shopPed[shopTable["ID"]] = createPed(shopTable["skin"], position[1], position[2], position[3])
				if isElement(shopPed[shopTable["ID"]]) then 
					setPedRotation(shopPed[shopTable["ID"]], position[6] or 0)
					setElementDimension(shopPed[shopTable["ID"]], position[4])
					setElementInterior(shopPed[shopTable["ID"]], position[5])
					setElementFrozen(shopPed[shopTable["ID"]], true)
					setElementData(shopPed[shopTable["ID"]], "shop >> owner", shopTable["owner"])
					setElementData(shopPed[shopTable["ID"]], "shop >> type", shopTable["type"])	
					setElementData(shopPed[shopTable["ID"]], "shop >> npc", true)
					setElementData(shopPed[shopTable["ID"]], "shop >> id", shopTable["ID"])
					setElementData(shopPed[shopTable["ID"]], "ped >> death", true)
					setElementData(shopPed[shopTable["ID"]], "name:tags", "PED")
					setElementData(shopPed[shopTable["ID"]], "Ped:Name",shopTable["name"])
				end
			end)
			
			local time = ((queryNumber*100)/60/1000)

			outputDebugString("Loaded Shop (".. queryNumber .." DB) ("..math.floor(time).." mp)", 0, 25, 181, 254)
		end
	end, connection, "SELECT * FROM shops" ) 
end

------------------------------

-- // Shop törlése

------------------------------

addCommandHandler("delshop",
function(playerSource, cmd)
	if getElementData( playerSource, "acc:admin" ) >= 6 then
		local x, y, _ = getElementPosition(playerSource)
		local shopShape = createColCircle ( x, y, 3 )
		local shopNumber = 0
		for _,v in ipairs(getElementsWithinColShape ( shopShape, "ped" ) ) do
				local ShopID = getElementData(v,"shop >> id") or 0
				shopNumber = shopNumber + 1
				destroyElement(shopShape)
				if ShopID >= 1 then 
					destroyElement(v)
				end
				dbPoll ( dbQuery( connection, "DELETE FROM shops WHERE id = '?'", ShopID), 0 )
				outputChatBox("#7cc576[IRG~Items] #ffffffShop ba movafaghiat hazf shod. ID: #F7CA18"..ShopID, playerSource, 255, 255, 255, true)

				return
		end
		if(shopNumber == 0) then
			destroyElement(shopShape)
			outputChatBox("#D24D57[IRG~Items] #ffffffHich shopi dar nazdiki shoma nist.", playerSource, 255, 255, 255, true)

		end
	end
end)

------------------------------

-- // Shop létrehozása

------------------------------

function createShop(element, cmd, skin, type, name)
	if (getElementData(element, "acc:admin") >= 7) then 
		if not (skin) or not type or not name and tonumber(type) < 0 and tonumber(type) < #shopItemList+1 then
			outputChatBox("#7cc576[Estefadeh]:#ffffff /".. cmd .." [NPC Skin] [Model] [NPC name]", element, 255, 255, 255, true)

			outputChatBox("#ffffffModel: 1: Shop  2: GunShop ", element, 255, 255, 255, true)
			

		return
		end
		local x, y, z = getElementPosition(element)
		local dim = getElementDimension(element)
		local int = getElementInterior(element)
		local rot = getPedRotation(element)
		
		local position = toJSON( {x, y, z, dim, int, rot})
		local insertQuery = dbQuery( connection, "INSERT INTO `shops` SET `type`=?, `pos`=?, `skin`=?, `name`=?", tonumber(type), position, skin, name)
		local insertQueryData, _, insertID = dbPoll ( insertQuery, -1 )
		if (insertQueryData) then
			shopPed[insertID] = createPed(skin,x,y,z)
			setPedRotation(shopPed[insertID], rot)
			setElementDimension(shopPed[insertID], dim)
			setElementInterior(shopPed[insertID], int)
			setElementFrozen(shopPed[insertID], true)
			setElementData(shopPed[insertID], "shop >> type", type)	
			setElementData(shopPed[insertID], "ped >> death", true)
			setElementData(shopPed[insertID], "shop >> npc", true)
			setElementData(shopPed[insertID], "shop >> id", insertID)
			setElementData(shopPed[insertID], "name:tags", "Eladó")
			setElementData(shopPed[insertID], "Ped:Name", name)
		end
	end
end
addCommandHandler('addshop', createShop)
addCommandHandler('createshop', createShop)

------------------------------

-- // Item adás

------------------------------

function buyItem(player, item, value, count, amount, duty)
	money = getElementData(player,"char:money") or 0
	-- if money >= amount then
		if item == 16 then 
			-- if setElementData(player,"char:money",money-amount) then 
				exports['mta_Phone']:addPhone(player)
			-- end
		else
			-- if setElementData(player,"char:money",money-amount) then 
				if exports.san_items:giveItem(player, item, value, count, 0, true) then 
					outputChatBox("#ffffffBa movafaghiat yek #32B3FF".. exports.san_items:getItemName(item).." #ffffffbe esme tarfi kharidi.", player, 255, 0, 0, true)

				else
					-- setElementData(player, "char:money", money + amount)
				end
			-- end
		end
	-- else
		-- outputChatBox("#ffffffNincs elég pénzed meg venni a kiválasztott tárgyat! (#32B3FF".. amount .." #ffffffFt).",player,255,255,255,true)
	-- end
end
addEvent("wlsMTA->#buyItem", true)
addEventHandler("wlsMTA->#buyItem", getRootElement(), buyItem)
