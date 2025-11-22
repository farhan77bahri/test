local connection = exports["san_mysql"]:getConnection() -- // SQL kapcsolat

addEventHandler("onResourceStart", root, function(startedRes)
	if getResourceName(startedRes) == "san_mysql" then
		connection = exports['san_mysql']:getConnection()
		restartResource(getThisResource())
	end
end)

local modellID = 868
local destroyModelID = 807

local stoneTable = {}
local stoneTimer = {}

local oreTable = {
	-- { ID, Min db, MaxDB, minPay, maxPay},
	{249, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{250, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{251, 10, 30, 1, 20},
	{252, 10, 30, 1, 20},
	{253, 10, 30, 1, 25},
	{253, 10, 30, 1, 25},
	{253, 10, 30, 1, 25},
	{253, 10, 30, 1, 25},
	{254, 10, 30, 1, 25},
	{254, 10, 30, 1, 25},
	{254, 10, 30, 1, 25},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{255, 10, 30, 1, 20},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{256, 10, 30, 1, 25},
	{257, 10, 30, 1, 20},
	{258, 10, 30, 1, 25},
	{259, 10, 80, 1, 12},
	{260, 1, 20, 1, 20},
	{261, 5, 30, 1, 25},
	{262, 100, 10, 0, 1},
	{262, 100, 10, 0, 1},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
	{263, 10, 30, 10, 20},
}

Async:setPriority("high")
Async:setDebug(true)

------------------------------

-- // Kövek Betöltés

------------------------------

function loadMinerStone()
	Async:setPriority(500, 100)
	
	dbQuery(function(loadStoneQuery)
		local queryElement, queryNumber = dbPoll(loadStoneQuery, 0)
		if queryNumber > 0 then
			Async:foreach(queryElement, function(stoneTable)
				local value = fromJSON(stoneTable['value'])
				local ID = stoneTable['id']
				createStone(868, ID, value[1], value[2], value[3], value[4], value[5], value[6])
			end)
			
			local time = ((queryNumber*100)/60/1000)

			outputDebugString("Loaded Stone (".. queryNumber .." DB) ("..math.floor(time).." mp)", 0, 25, 181, 254)
		end
	end, connection, "SELECT * FROM miner" ) 
end 
loadMinerStone()

------------------------------

-- // Kövek Létrehozása

------------------------------

function createIStone(player)
	if getElementData(player, 'acc:admin') >= 7 then 
		local x, y, z = getElementPosition(player)
		local _, _, rot = getElementRotation(player)
		local int, dim = getElementInterior(player), getElementDimension(player)
		local values = toJSON({ x, y, z, rot, int, dim })
		local insertQuery = dbQuery(connection, "INSERT INTO miner SET Value=?", values)
		local dt, insert, ID = dbPoll(insertQuery,-1)
		if dt then
			createStone(modellID, ID, x, y, z, rot, int, dim)
			outputChatBox("[sanMTA ~ Miner]: #ffffffVocê criou pedras minadas com sucesso!", player, 124, 197, 118, true)
		end
	end
end
addCommandHandler('createStone', createIStone)
addCommandHandler('createstone', createIStone)

function createStone (modellID, ID, x, y, z, rot, int, dim)
	local stone = createObject(modellID, x, y, z, 0, 0, rot)
	setElementInterior(stone, int)
	setElementDimension(stone, dim)
	setElementData(stone, 'stone >> ID', ID)
	setElementData(stone, 'stone >> Health', 1000)
end

addEventHandler('onElementDataChange', root, function(dataName)
	if source and getElementType(source) == 'object' and (getElementData(source, 'stone >> ID') or 0) > 0 then 
		if tostring(dataName) == 'stone >> Health' then 
			if getElementData(source, dataName) <= 0 then 
				setElementModel(source, destroyModelID)
				stoneTimer[source] = setTimer(function(source)
					setElementData(source, 'stone >> Health', 1000)
				end, 1000*60*15, 1, source)
			elseif getElementData(source, dataName) == 1000 then 
				setElementModel(source, modellID)
			end
		end
	end
end)

------------------------------

-- // Érc Adá / Leadás

------------------------------

function giveOre(player)
	if isTimer(minerTImer) then
		return
	end
	if player then 
		if not isTimer(minerTImer) then
		local randomOre = math.random(#oreTable)
		local itemID = tonumber(oreTable[randomOre][1])
		local count = tonumber( math.random( oreTable[randomOre][2], oreTable[randomOre][3] ) )
		minerTImer = setTimer(function() end,5000,1)
		exports['san_items']: giveItem(player, itemID, 1, count, 0, true) 
	--	exports['san_items']: giveItem(player, 296, 1, 1, 0, true) 
		exports.san_info:addNotification(player,'você tem '.. count .. ' db '..exports.san_items:getItemName(itemID) .. '.','info')
		outputChatBox('#c0c0c0[minerador]: #ffffffvocê tem #F7CA18'.. count .. ' #ffffffdb #7cc576'..exports.san_items:getItemName(itemID) .. '#ffffff.', player, 255, 255, 255, true)
		setElementData(player,"char >> showedItem",{true, itemID, exports.san_items:getItemName(itemID),exports.san_items:getItemDescription(itemID),getTickCount()})
		setTimer(function(player)
			setElementData(player,"char >> showedItem",{false,nil,nil,nil,nil})
		end,5000,1, player)		
		end
	end
end
addEvent('sanMTA->#giveOre', true)
addEventHandler('sanMTA->#giveOre', root, giveOre)

function SellOre(element)
	for key, value in ipairs(oreTable) do
		local money = math.random(value[4], value[5])
		exports["san_items"]:deleteItemById(element, value[1], money)
	end
end
addEvent("sanMTA->#SellOre", true)
addEventHandler("sanMTA->#SellOre", root, SellOre)
