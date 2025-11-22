local connection = exports.btc_mysql:getConnection()



local groups = {}

local groupCount = 0



local playerGroups = {}



function loadPlayerGroupsCallback(queryHandler, thePlayer)

	if isElement(thePlayer) and getElementType(thePlayer) == "player" then

		setElementData(thePlayer, "char:factionPayment", 0)

		playerGroups[thePlayer] = {}

	end

	

	local i = 0

	local result, numAffectedRows, errorMsg = dbPoll(queryHandler, 0)

	if numAffectedRows > 0 then

		for result, row in pairs (result) do

			setElementData(thePlayer, "group_" .. i, row["groupID"], true)

			setElementData(thePlayer, "group_" .. i .. "_leader", row["isLeader"], true)

			setElementData(thePlayer, "group_" .. i .. "_rank", row["rank"], true)


			setElementData(thePlayer, "char:dutySkin_groupId_"..row["groupID"], row["dutySkin"])



			table.insert(playerGroups[thePlayer], {row["groupID"], row["rank"]})

			

			local currPay = getElementData(thePlayer, "char:factionPayment") or 0

			local thisPay = getGroupRankPay(row["groupID"], row["rank"]) or 0

			setElementData(thePlayer, "char:factionPayment", currPay+thisPay)

			

			--outputChatBox(getElementData(thePlayer, "char:name") or getPlayerName(thePlayer), root, 255, 255, 255)

			--outputChatBox("groupid: " .. row["groupID"] .. " leader: " .. row["isLeader"] .. " rank: " .. row["rank"])

			

			i = i + 1

		end

	end



	if isElement(thePlayer) and getElementType(thePlayer) == "player" then

		setElementData(thePlayer, "groupCount", i, true)

	end

	

	dbFree(queryHandler)

end



addCommandHandler("vgrupos", function (playerSource)

	if tonumber(getElementData(playerSource, "acc:admin"))  >= 6 then 

	dbQuery(function(queryHandler)

		local result, numAffectedRows, errorMsg = dbPoll(queryHandler, 0)

		if numAffectedRows > 0 then

			outputChatBox(" ", playerSource, 255, 255, 255, true)

			outputChatBox("Grupo:", playerSource, 25, 181, 254, true)

			for i,v in ipairs(result) do

				outputChatBox("ID: #1b96fe"..v['groupID'].. " #ffffffNome: #1b96fe".. v['Name'], playerSource, 255, 255, 255, true)

			end

		end

	end, connection, "SELECT * FROM groups")

end

end)



function loadPlayerGroups(thePlayer)

	if not isElement(thePlayer) then return end

	

	local count = getElementData(thePlayer, "groupCount") or false

	if count then

		for i=0, count-1 do

			removeElementData(thePlayer, "group_" .. i)

			removeElementData(thePlayer, "group_" .. i .. "_leader")

			removeElementData(thePlayer, "group_" .. i .. "_rank")

		end

	end



	charID = getElementData(thePlayer, "char:id")

	

	if charID then

		local query = dbQuery(loadPlayerGroupsCallback, {thePlayer}, connection, "SELECT * FROM groupattach WHERE characterID = ?", charID)

	end

end



addEventHandler("onPlayerSpawn", root, function()

	loadPlayerGroups(source)

end)



function reloadGroupDatasForPlayer(qh, player, sourcePlayer, sourceGroups, playerID, groupID)

	if isElement(player) then

		loadPlayerGroups(player)

	end



	if isElement(sourcePlayer) then

		requestGroupData(sourcePlayer, sourceGroups, playerID, groupID)

	end



	dbFree(qh)

end



addEvent("modifyRankForPlayer", true)

addEventHandler("modifyRankForPlayer", getRootElement(),

	function (playerID, currRank, groupID, state, player, sourceGroups)

		if playerID and currRank and groupID and state then

			if state == "up" then

				if currRank < 15 then

					dbQuery(reloadGroupDatasForPlayer, {player, source, sourceGroups, playerID, groupID}, connection, "UPDATE groupattach SET rank = ? WHERE groupID = ? AND characterID = ?", currRank + 1,  groupID, playerID)

				end

			elseif state == "down" then

				if currRank > 1 then

					dbQuery(reloadGroupDatasForPlayer, {player, source, sourceGroups, playerID, groupID}, connection, "UPDATE groupattach SET rank = ? WHERE groupID = ? AND characterID = ?", currRank - 1,  groupID, playerID)

				end

			end

		end

	end

)



addEvent("deletePlayerFromGroup", true)

addEventHandler("deletePlayerFromGroup", getRootElement(),

	function (playerID, groupID, player, sourceGroups)

		if playerID and groupID then

			dbQuery(reloadGroupDatasForPlayer, {player, source, sourceGroups}, connection, "DELETE FROM groupattach WHERE groupID = ? AND characterID = ?", groupID, playerID)

			loadPlayerGroups(player)

		end

	end

)



addEvent("invitePlayer", true)

addEventHandler("invitePlayer", getRootElement(),

	function (playerID, groupID, player, sourceGroups)

		if playerID and groupID then

			dbQuery(reloadGroupDatasForPlayer, {player, source, sourceGroups}, connection, "INSERT INTO groupattach (groupID, characterID) VALUES (?,?)", groupID, playerID)

		end

	end

)



local groups = {}

local groupCount = 0



addEvent("renameRank", true)

addEventHandler("renameRank", getRootElement(),

	function (rankId, rankName, groupId)

		dbQuery(

			function (qh)

				groups[groupId]["rank_" .. tonumber(rankId)] = rankName



				triggerClientEvent("renameGroupRank", getRootElement(), "rank_" .. tonumber(rankId), rankName, groupId)



				dbFree(qh)

			end, connection, "UPDATE groups SET rank_" .. tonumber(rankId) .. " = ? WHERE groupID = ?", rankName, groupId)

	end

)



addEvent("setRankPayment", true)

addEventHandler("setRankPayment", getRootElement(),

	function (rankId, payment, groupId)

		dbQuery(

			function (qh)

				groups[groupId]["rank_" .. tonumber(rankId) .. "_pay"] = payment



				triggerClientEvent("renameGroupRank", getRootElement(), "rank_" .. tonumber(rankId) .. "_pay", payment, groupId)



				dbFree(qh)

			end, connection, "UPDATE groups SET rank_" .. tonumber(rankId) .. "_pay = ? WHERE groupID = ?", payment, groupId)

	end

)



function requestGroupData(source, groups, playerID, groupID)

	local members = {}

	local vehicles = {}

	

	dbQuery(

		function (qh, client)

			local result = dbPoll(qh, 0)



			if not result then

				outputDebugString("MySQL error")

				return

			end

			

			for k, row in ipairs(result) do

				if row["characterName"] then

					local group = row["groupId"]



					if not members[group] then

						members[group] = {}

					end



					table.insert(members[group], row)

				end

			end



			dbFree(qh)

			triggerClientEvent(client, "sendGroupMembers", client, members, playerID, groupID)

	end, {source}, connection, "SELECT groupattach.groupID as groupId, groupattach.rank as rank, groupattach.isLeader as isLeader, groupattach.dutySkin as dutySkin, characters.charname as characterName, characters.id as id FROM groupattach LEFT JOIN characters ON characters.id=groupattach.characterID WHERE groupattach.groupID in (" .. table.concat(groups, ",") .. ") ORDER BY groupattach.groupID, groupattach.rank, characters.charname", groupId)

end



function getGroupBalance(groupId)

	if tonumber(groupId) then

		if groups[tonumber(groupId)] then

			return tonumber(groups[tonumber(groupId)]["balance"])

		else

			return false

		end

	else

		return false

	end

end



function setGroupBalance(groupId, balance)

	if tonumber(groupId) and tonumber(balance) then

		if groups[tonumber(groupId)] then

			local query = dbQuery(reloadGroupDatasForPlayer, connection, "UPDATE groups SET balance = ? WHERE groupID = ?", tonumber(balance), tonumber(groupId))

			groups[tonumber(groupId)]["balance"] = tonumber(balance)

			dbFree(query)

			loadGroups()

		else

			return false

		end

	else

		return false

	end

end

addEvent("setGroupBalance", true)

addEventHandler("setGroupBalance", root, setGroupBalance)



function giveGroupBalance(groupId, balance)

	if tonumber(groupId) and tonumber(balance) then

		if groups[tonumber(groupId)] then

			balance = getGroupBalance(tonumber(groupId))+tonumber(balance)

			local query = dbQuery(reloadGroupDatasForPlayer, connection, "UPDATE groups SET balance = ? WHERE groupID = ?", tonumber(balance), tonumber(groupId))

			groups[tonumber(groupId)]["balance"] = tonumber(balance)

			dbFree(query)

			loadGroups()

		else

			return false

		end

	else

		return false

	end

end



function getGroupRankPay(groupId, groupRank)

	if tonumber(groupId) and groupRank then

		if groups[tonumber(groupId)] then

			return groups[tonumber(groupId)]["rank_" .. groupRank .. "_pay"] or false

		else

			return false

		end

	else

		return false

	end

end



addEvent("requestGroupData", true )

addEventHandler("requestGroupData", getRootElement(),

		function (groups)	

			requestGroupData(source, groups)

		end

	)



addEvent("requestGroups", true )

addEventHandler("requestGroups", getRootElement(),

	function ()

		triggerClientEvent(source, "sendGroups", source, groups)

	end)



function loadGroups()

	local query = dbQuery(loadGroupsCallback, {playerSource}, connection, "SELECT * FROM groups")

	

	for _, v in ipairs(getElementsByType("player")) do

		loadPlayerGroups(v)

	end

end

addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadGroups)



function loadGroupsCallback(queryHandler, thePlayer)

	local result, numAffectedRows, errorMsg = dbPoll(queryHandler, 0)

	if numAffectedRows > 0 then

		local i = 1

		for _, row in pairs ( result ) do

			local id = row["groupID"]



			groups[id] = {}

			groups[id]["groupID"] = id

			groups[id]["name"] = row["Name"]

			groups[id]["type"] = row["type"]



			groups[id]["balance"] = row["balance"]

			

			groups[id]["description"] = row["description"]



			groups[id]["rank_1"] = row["rank_1"]	

			groups[id]["rank_2"] = row["rank_2"]	

			groups[id]["rank_3"] = row["rank_3"]	

			groups[id]["rank_4"] = row["rank_4"]	

			groups[id]["rank_5"] = row["rank_5"]	

			groups[id]["rank_6"] = row["rank_6"]	

			groups[id]["rank_7"] = row["rank_7"]	

			groups[id]["rank_8"] = row["rank_8"]	

			groups[id]["rank_9"] = row["rank_9"]	

			groups[id]["rank_10"] = row["rank_10"]	

			groups[id]["rank_11"] = row["rank_11"]	

			groups[id]["rank_12"] = row["rank_12"]	

			groups[id]["rank_13"] = row["rank_13"]	

			groups[id]["rank_14"] = row["rank_14"]	

			groups[id]["rank_15"] = row["rank_15"]



			groups[id]["rank_1_pay"] = row["rank_1_pay"]	

			groups[id]["rank_2_pay"] = row["rank_2_pay"]	

			groups[id]["rank_3_pay"] = row["rank_3_pay"]	

			groups[id]["rank_4_pay"] = row["rank_4_pay"]	

			groups[id]["rank_5_pay"] = row["rank_5_pay"]	

			groups[id]["rank_6_pay"] = row["rank_6_pay"]	

			groups[id]["rank_7_pay"] = row["rank_7_pay"]	

			groups[id]["rank_8_pay"] = row["rank_8_pay"]	

			groups[id]["rank_9_pay"] = row["rank_9_pay"]	

			groups[id]["rank_10_pay"] = row["rank_10_pay"]	

			groups[id]["rank_11_pay"] = row["rank_11_pay"]	

			groups[id]["rank_12_pay"] = row["rank_12_pay"]	

			groups[id]["rank_13_pay"] = row["rank_13_pay"]	

			groups[id]["rank_14_pay"] = row["rank_14_pay"]	

			groups[id]["rank_15_pay"] = row["rank_15_pay"]

			

			i = i + 1

		end

		groupCount = i

		setElementData(root, "FactionData", groups)

		outputDebugString(groupCount-1 .. " group(s) loaded")

	end

end



function isPlayerInFaction(element, groupId)

	if isElement(element) and getElementType(element) == "player" and getElementData(element, "loggedin") then

		local groupCount = getElementData(element, "groupCount")

		if groupCount > 0 then

			for key = 0, groupCount do

				if getElementData(element, "group_"..key) == tonumber(groupId) then

					return true

				end

			end

		else

			return false

		end

	else

		return false

	end

end



function isPlayerLeaderInFaction(element, groupId)

	if isPlayerInFaction(element, groupId) then

		local groupCount = getElementData(element, "groupCount")

		if groupCount > 0 then

			for key = 0, groupCount do

				if getElementData(element, "group_"..key) == tonumber(groupId) and getElementData(element, "group_"..key.."_leader") == 1 then

					return true

				end

			end

		else

			return false

		end

	else

		return false

	end

end



function getPlayerRankInFaction(element, groupId)

	if isPlayerInFaction(element, groupId) then

		return getElementData(element, "group_"..(groupId-1).."_rank")

	else

		return -1

	end

end



function getFactionName(groupId)

	if groups[groupID] then

		return groups[groupId]["name"]

	else

		return ""

	end

end

	

function getPlayerPayment(player)

	local allPayServer = 0



	for key, value in ipairs(playerGroups[player]) do

		if groups[value[1]]["type"] ~= (5 or 6) then

			if getGroupBalance(value[1]) >= getGroupRankPay(value[1], value[2]) then

				allPayServer = allPayServer + getGroupRankPay(value[1], value[2])

				setGroupBalance(value[1], getGroupBalance(value[1]) - getGroupRankPay(value[1], value[2]))

			end

		end

	end



	outputChatBox("Pagamento: #7cc576"..allPayServer.."", player, 255, 255 ,255, true)

	outputChatBox("------------------------------------------------", player, 255, 255 ,255, true)

	outputChatBox(" ", player)



	setTimer( function()

		--setElementData(player, "char:money", getElementData(player, "char:money") + allPayServer)

	end, 200, 1)

	

	return allPayServer

end

addEvent("getPlayerPayment", true)

addEventHandler("getPlayerPayment", root, getPlayerPayment)



addCommandHandler("criargrupo", function(player, cmd, type, ...)

	if player:getData("acc:admin") < 6 then return end

	

	if not (...) or (...) == "" or (...) == " " or not tonumber(type) then

		outputChatBox("#7cc576[BGO MTA]: #ffffff/criargrupo [Tipo] [Nome]", player, 255, 135, 0, true)

		outputChatBox("#ffffff1 - ordem de proteção, 2 - saúde, 3 - conselho, 4 - outros, 5 - Banda, 6 - Mafia", player, 255, 135, 0, true)

	else

		local groupName = table.concat({...}, " ")



		local qh = dbQuery(loadGroups, connection, "INSERT INTO groups (Name, type) VALUES (?, ?)", groupName, tonumber(type))

		if qh then

			dbFree(qh)

			exports.btc_admin:outputAdminMessage("#7cc576"..player:getData("char:anick").." #ffffffcriou uma facção #0094ff(Nome: "..groupName.." | ID: "..type..")")

		else

			outputChatBox("Não foi possível criar. Entre em contato com um desenvolvedor.", player, 255, 0, 0)

		end

	end

end)



addCommandHandler("setlider", function(player, cmd, target, groupId)

	if player:getData("acc:admin") < 6 then return end



	if not tonumber(groupId) then

		outputChatBox("#7cc576[BGO MTA]: #ffffff/setlider [nome / ID] [grupo ID]", player, 255, 135, 0, true)

	else

		groupId = tonumber(groupId)

		

		target, targetName = exports.btc_core:findPlayer(player, target)

		if target and target:getData("loggedin") then

			if groups[groupId] then

				loadGroups()

				local qh = dbQuery(reloadGroupDatasForPlayer, connection, "UPDATE groupattach SET isLeader=1 WHERE groupID=? AND characterID=?", groupId, target:getData("char:id"))

			

				if qh then

					exports.btc_admin:outputAdminMessage("#7cc576"..player:getData("char:anick").." #ffffffcolocou líder #7cc576"..targetName:gsub("_", " ").."#ffffff #0094ff(Grupo: "..groupId..")")

					dbFree(qh)

				end

			else

				outputChatBox("#7cc576[BGO MTA]: #ffffffID do grupo incorreto.", player, 255, 135, 0, true)

			end

		end

	end

end)



addCommandHandler("setpgrupo", function(player, cmd, target, groupId)

	if player:getData("acc:admin") < 6 then return end



	if not tonumber(groupId) then

		outputChatBox("#7cc576[BGO MTA]: #ffffff/setgrupo [Nome / ID] [grupo ID]", player, 255, 135, 0, true)

	else

		groupId = tonumber(groupId)

		

		target, targetName = exports.btc_core:findPlayer(player, target)

		if target and target:getData("loggedin") then

			if groups[groupId] then

				loadGroups()

				local qh = dbQuery(reloadGroupDatasForPlayer, connection, "INSERT INTO groupattach (groupID, characterID) VALUES (?,?)", groupId, target:getData("char:id"))			

				loadGroups()

				

				if qh then

					exports.btc_admin:outputAdminMessage("#1b96fe"..player:getData("char:anick").." #fffffffcolocar em ação #1b96fe"..targetName:gsub("_", " ").."#ffffff #0094ff(Grupo: "..groupId..")")

					dbFree(qh)

				end

			else

				outputChatBox("#dc143c[BGO MTA]: #ffffffID do grupo incorreto.", player, 255, 135, 0, true)

			end

		end

	end

end)



addCommandHandler("removergrupo", function(player, cmd, target, groupId)

	if player:getData("acc:admin") < 6 then return end



	if not tonumber(groupId) then

		outputChatBox("#7cc576[BGO MTA]: #ffffff/removegrupo [Nome / ID] [Grupo ID]", player, 255, 135, 0, true)

	else

		groupId = tonumber(groupId)

		

		target, targetName = exports.btc_core:findPlayer(player, target)

		if target and target:getData("loggedin") then

			if groups[groupId] and isPlayerInFaction(player, groupId) then

				--loadGroups()

				local qh = dbQuery(reloadGroupDatasForPlayer, connection, "DELETE FROM groupattach WHERE groupID = ? AND characterID = ?", groupId, target:getData("char:id"))			

				loadGroups()

				

				if qh then

					exports.btc_admin:outputAdminMessage("#1b96fe"..player:getData("char:anick").." #ffffffdemitido do grupo #1b96fe"..targetName:gsub("_", " ").."#ffffff #0094ff(Grupo: "..groupId..")")

					dbFree(qh)

				end

			else

				outputChatBox("#7cc576[BGO MTA]: #ffffffID do grupo incorreto.", player, 255, 135, 0, true)

			end

		end

	end

end)


--[[
addCommandHandler("changelock", function(player, cmd)

	local vehicle = getPedOccupiedVehicle(player)

	

	if vehicle and vehicle:getData("veh:faction") > 0 then

		local group = vehicle:getData("veh:faction")

		

		if isPlayerInFaction(player, group) then

			if isPlayerLeaderInFaction(player, group) then				

				exports["btc_item"]:giveItem(player, 34, vehicle:getData("veh:id"), 1, 0)

			end

		end

	end

end)]]--



--duty skin



addEvent("onUpdateModel", true)

addEventHandler("onUpdateModel", getRootElement(),

	function (modelId)

		if tonumber(modelId) then

			setElementModel(source, tonumber(modelId))

			--setElementData(source, "char:skin", tonumber(modelId))

		end

	end

)

addEvent("updateINTDIM", true)

addEventHandler("updateINTDIM", getRootElement(), function (vehicleId)

		for index, value in ipairs (getElementsByType("vehicle")) do

			if getElementData(value, "veh:id") == tonumber(vehicleId) then 

				if getElementData(value, "veh:owner") == getElementData(source, "char:id") then 
					setElementInterior(value,0) 
					setElementDimension(value,0) 

		end
end
end
	end

)




addEvent("updateDutySkin", true)
addEventHandler("updateDutySkin", getRootElement(),

	function (groupID, skin)

		if groupID and skin then

			local dbID = getElementData(source, "char:id")

			if dbID then

				dbExec(connection, "UPDATE groupattach SET dutySkin = ? WHERE groupID = ? AND characterID = ?", tonumber(skin), tonumber(groupID), tonumber(dbID))

				setElementData(source, "char:dutySkin_groupId_"..tostring(groupID), tonumber(skin))



				if groups[groupID]["type"] == (5 or 6) then

					setElementData(source, "char:skin", tonumber(skin))

					dbExec(connection, "UPDATE characters SET skin='"  .. skin .. "' WHERE id='" .. getElementData(source, "char:id") .. "'")

					setElementModel(source, tonumber(skin))

				end

			end

		end

	end

)



----------------------------------------------------------------------------------

addEvent("updateVehicleSlots", true)

addEventHandler("updateVehicleSlots", root, function(newValue)

	if tonumber(newValue) then

		dbExec(connection, "UPDATE characters SET carSlot=? WHERE id=?", tonumber(newValue), getElementData(source, "char:id"))

	end

end)



addEvent("updateInteriorSlots", true)

addEventHandler("updateInteriorSlots", root, function(newValue)

	if tonumber(newValue) then

		dbExec(connection, "UPDATE characters SET houseSlot=? WHERE id=?", tonumber(newValue), getElementData(source, "char:id"))

	end

end)



addEvent("setPedNextFightStyle", true)

addEventHandler("setPedNextFightStyle", root, function(newValue)

	setPedFightingStyle(source, newValue)

end)



addEvent("setPedNextWalkingStyle", true)

addEventHandler("setPedNextWalkingStyle", root, function(newValue)

	setPedWalkingStyle(source, newValue)

end)