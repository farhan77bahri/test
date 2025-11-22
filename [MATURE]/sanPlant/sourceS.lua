local connection = exports["san_mysql"]:getConnection() -- // SQL kapcsolat

addEventHandler("onResourceStart", root, function(startedRes)
	if getResourceName(startedRes) == "mysql" then
		connection = exports['san_mysql']:getConnection()
		restartResource(getThisResource())
	end
end)
local TempTable = {}
local tileData = {}
local plantObject = {}
local plantShrubObject = {}
----------
 -- [Events] --
 addEvent("fmPlant.loadTableData",true)
 addEvent("playerAnimationToServer", true)
 addEvent("fmPlant.destoyTile", true)
 addEvent("fmPlant.harvestedTile", true)
 addEvent("fmPlant.irrigation", true)
 addEvent("sanMTA->#createPlant", true)
----------
function createPlant(flyPlayer, type)
	local x,y,z = getElementPosition(flyPlayer)
	local rx,ry,rz = getElementRotation(flyPlayer)
	local dim = getElementDimension(flyPlayer)
	local int = getElementInterior(flyPlayer)
	local accountID = tonumber(getElementData(flyPlayer, 'acc:id')) or 0
	local position = toJSON({x, y, z, rx, ry, rz, dim, int})

	dbQuery(function(qh, position, type, accountID)
		local res, err, lastID = dbPoll(qh, 0)
		if lastID > 0 then
			outputDebugString("DrogPlant letéve [SQL ID: "..lastID.."]")
			LoadPlant(x, y, z, rx, ry, rz, dim, int, type, accountID, lastID)
			if type == 1 then 
			--	exports['san_items']:takePlayerItemToID(flyPlayer, 140)
				local hasItem, slot = exports["san_items"]:hasItemS(flyPlayer, 143)
				exports["san_items"]:deleteItem(flyPlayer, exports['san_items']:getItemType(140), slot)			
			elseif type == 2 then 
			--	exports['san_items']:takePlayerItemToID(flyPlayer, 140)
				local hasItem, slot = exports["san_items"]:hasItemS(flyPlayer, 142)
				exports["san_items"]:deleteItem(flyPlayer, exports['san_items']:getItemType(140), slot)
			end
		end
	end, {position, type, accountID}, connection, "INSERT INTO plants SET plant_pos=?, plant_type=?, plant_owner=?, water=?", position, type, accountID, 100)
end
 addEventHandler("sanMTA->#createPlant", root, createPlant)

function LoadPlant(x,y,z,rx,ry,rz,dim,int,type,owner,sqlID)
	TempTable[#TempTable + 1] = {#TempTable + 1}

	tileData[#TempTable] = {}		
	tileData[#TempTable]["id"] = #TempTable
	tileData[#TempTable]["type"] = type
	tileData[#TempTable]["growth"] = 0
	tileData[#TempTable]["pos"] = toJSON({x,y,z,rx,ry,rz,dim,int})
	tileData[#TempTable]["owner"] = owner
	tileData[#TempTable]["grow"] = true
	tileData[#TempTable]["harvested"] = 0
	tileData[#TempTable]["water"] = 0
	
	plant_format_cserep = 16404
	if type == 1 then
		shrubID = 18470
	elseif type == 2 then
		shrubID = 18471
	end

	plantObject[#TempTable] = createObject(plant_format_cserep,x,y,z-0.8,rx,ry,rz)
	plantShrubObject[#TempTable] = createObject(shrubID,x,y,z-2.5 + tileData[#TempTable]["growth"]/61,rx,ry,rz)
	
	setElementInterior(plantObject[#TempTable],int)
	setElementInterior(plantShrubObject[#TempTable],int)
	
	setElementDimension(plantObject[#TempTable],dim)
	setElementDimension(plantShrubObject[#TempTable],dim)
	
	setElementData(plantObject[#TempTable],"Plant.id",tonumber(#TempTable))
	setElementData(plantObject[#TempTable],"Plant.SQLid",sqlID)
	setElementData(plantObject[#TempTable],"Plant.Object",true)
	setElementData(plantObject[#TempTable],"Plant.owner", owner)
end

function LoadPlants()
	removeWorldModel(16404,9999999,0,0,0)
	removeWorldModel(18470,9999999,0,0,0)
	removeWorldModel(18471,9999999,0,0,0)
	dbQuery(function(qh)
		local element, rows, err = dbPoll(qh, 0)
		if (rows > 0) then
			for i, ertek in ipairs(element) do
				TempTable[#TempTable + 1] = {i}
				plant_pos = fromJSON(tostring(ertek["plant_pos"])) or "[[0,0,0,0,0,0,0,0]]" -- X Y W RotX RotY RotZ Dim Int
				tileData[i] = {}		
				tileData[i]["id"] = i
				tileData[i]["type"] = tonumber(ertek["plant_type"])
				tileData[i]["growth"] = tonumber(ertek["plant_growth"])
				tileData[i]["pos"] = tostring(ertek["plant_pos"])
				tileData[i]["owner"] = tonumber(ertek["plant_owner"])
				tileData[i]["grow"] = ertek["plant_grow"]
				tileData[i]["harvested"] = tonumber(ertek["harvested"])
				tileData[i]["water"] = tonumber(ertek["water"])
				
				plant_format_cserep = 16404
				if tonumber(ertek["plant_type"]) == 1 then
					cserjeID = 18470
				elseif tonumber(ertek["plant_type"]) == 2 then
					cserjeID = 18471
				end
		
				plantObject[i] = createObject(plant_format_cserep,plant_pos[1],plant_pos[2],plant_pos[3]-0.8,plant_pos[4],plant_pos[5],plant_pos[6])
				plantShrubObject[i] = createObject(cserjeID,plant_pos[1],plant_pos[2],plant_pos[3]-2.5 + tileData[i]["growth"]/61,plant_pos[4],plant_pos[5],plant_pos[6])
				setElementInterior(plantObject[i],tonumber(plant_pos[8]))
				setElementInterior(plantShrubObject[i],tonumber(plant_pos[8]))
				setElementDimension(plantObject[i],tonumber(plant_pos[7]))
				setElementDimension(plantShrubObject[i],tonumber(plant_pos[7]))
				
				setElementData(plantObject[i],"Plant.Object",true)
				setElementData(plantObject[i],"Plant.id",i)
				setElementData(plantObject[i],"Plant.SQLid",tonumber(ertek["ID"]))
				setElementData(plantObject[i],"Plant.owner", tonumber(ertek["plant_owner"]))
			end
		end
	end, connection, "SELECT * FROM plants")
end

addEventHandler('onResourceStart', resourceRoot, function()
	LoadPlants()
	setTimer(function()
		for k=1,#tileData do
			if checkGrowth(k) and tonumber(tileData[k]["harvested"] or 0) < 10 and tonumber(tileData[k]["water"] or 0) > 0 then
				tileData[k]["growth"] = tileData[k]["growth"] + 1
				plant_pos = fromJSON(tostring(tileData[k]["pos"])) or "[[0,0,0,0,0,0]]"
				if not isElement(plantShrubObject[k]) then return end
				setElementPosition(plantShrubObject[k],plant_pos[1],plant_pos[2],plant_pos[3]-2.5 + tileData[k]["growth"]/61)
			end
		end
	end,1*60*800,0)
	
	setTimer(function()
		for k=1,#tileData do
			if checkGrowth(k) and tonumber(tileData[k]["harvested"] or 0) < 10 and tonumber(tileData[k]["water"] or 0) > 0 then
				if not isElement(plantShrubObject[k]) then return end
				tileData[k]["water"] = tileData[k]["water"] - 1
			end
		end
	end,1*60*200,0)
end)


addEventHandler("fmPlant.destoyTile",getRootElement(),function(p,id,pid)
	if isElement(plantObject[pid]) and isElement(plantShrubObject[pid]) then
		exports['san_items']:giveItem(p, 140, 1, 1, -1, true) 
		destroyElement(plantObject[pid])
		destroyElement(plantShrubObject[pid])
			
		plantShrubObject[pid] = nil
		plantObject[pid] = nil
		tileData[pid] = {}
		tileData[pid]["growth"] = 0
		tileData[pid]["grow"] = false
		
		dbExec(connection, "DELETE FROM `plants` WHERE ID=?", id)
	end
	if tileData[pid]["type"] == 1 then 
		--exports['san_items']:giveItem(p, 140, 1, 1, -1, true) 
	elseif tileData[pid]["type"] == 2 then 
		--exports['san_items']:giveItem(p, 140, 1, 1, -1, true) 
	end
end)

addEventHandler("fmPlant.harvestedTile",getRootElement(),function(p,id,pid)
	if tileData[pid]["type"] == 1 then
		exports['san_items']:giveItem(p, 145, 1, 16, -1, true) 
	elseif tileData[pid]["type"] == 2 then
		exports['san_items']:giveItem(p, 218, 1, 16, -1, true) 
	end
	tileData[pid]["harvested"] = tileData[pid]["harvested"] + 1
	tileData[pid]["water"] = 0
	tileData[pid]["growth"] = 0
	tileData[pid]["grow"] = false
	plant_pos = fromJSON(tostring(tileData[pid]["pos"])) or "[[0,0,0,0,0,0]]"
	if not isElement(plantShrubObject[pid]) then return end
	setElementPosition(plantShrubObject[pid],plant_pos[1],plant_pos[2],plant_pos[3]-2.5 + tileData[pid]["growth"]/61)
	
	dbExec(connection, "UPDATE plants SET harvested = ?, plant_growth = ? WHERE ID = ?",tonumber(tileData[pid]["harvested"]),0, id)
	
end)

addEventHandler("fmPlant.irrigation",getRootElement(),function(p,id,pid)
	tileData[pid]["water"] = 100
end)

function checkGrowth(szam)
	if tileData[szam]["growth"] == 100 then
		tileData[szam]["grow"] = false
	else
		tileData[szam]["grow"] = true
	end
	return tileData[szam]["grow"]
end

function playerAnimationToServer (flyPlayer, animName, animtoName, animTime)
	if not animTime then animTime = -1 end
	setPedAnimation(flyPlayer, animName, animtoName, animTime, true, false, false, false)
end
addEventHandler("playerAnimationToServer", getRootElement(), playerAnimationToServer)

addEventHandler("fmPlant.loadTableData",getRootElement(),function(flyPlayer)
	triggerClientEvent(flyPlayer, "fmPlant.loadTableDataClient", flyPlayer, tileData)
end)

-- Mentés
function saveCserepek(p)
	if isElement(p) then
		dbExec(connection, "UPDATE plants SET plant_growth = ?,harvested=?, water=? WHERE ID = ?",tonumber(tileData[getElementData(p, "Plant.id")]["growth"]),tonumber(tileData[getElementData(p, "Plant.id")]["harvested"]), tonumber(tileData[getElementData(p, "Plant.id")]["water"]), getElementData(p, "Plant.SQLid"))
	end
end

function saveAllCserep()
	local count = 0
	for i, p in ipairs(getElementsByType("object")) do
		if (getElementData(p, "Plant.SQLid")) then
			saveCserepek(p)
			count = count + 1
		end
	end
	outputDebugString("Ele foi salvo "..count.." agulha de telha!")
end
setTimer(saveAllCserep, 1000*60*10, 0)

addEventHandler ("onResourceStop", root, function ( resource )
  if resource ~= getThisResource() then return end
  local count = 0
	  for i, p in ipairs(getElementsByType("object")) do
		if (getElementData(p, "Plant.SQLid")) then
			saveCserepek(p)
			count = count + 1
		end
	end
	outputDebugString("Ele foi salvo "..count.." agulha de telha!")
end)