local connection = dbConnect("mysql",exports['mysql']:getSQLData())

local hivasok = {}

function addPhone(playerSource)
	local phoneID = generatePhoneNumber()
	local checkID = dbPoll(dbQuery(connection, "SELECT * FROM phones"), -1)
	if (checkID) then
		for k, v in ipairs(checkID) do
			if (tonumber(v["number"]) == tonumber(phoneID)) then			
				return addPhone(playerSource)
			end
		end
	end
	local insterT = dbQuery(connection, "INSERT INTO phones SET number = ?", phoneID)
	local QueryEredmeny, _, Beszurid = dbPoll(insterT, -1)
	if QueryEredmeny then
		exports.san_items:giveItem(playerSource, 16, tonumber(phoneID), 1, 0)
	end
end

function generatePhoneNumber()
	return math.random(111111,999999)
end

function chatToServer(playerSource, msg)
	if playerSource then 
		
		local dimension = getElementDimension(playerSource)
		local interior = getElementInterior(playerSource)
		local shownto = 1
		local kieg = ""
		for key, nearbyPlayer in ipairs(getElementsByType( "player" )) do
			local dist = getElementDistance( playerSource, nearbyPlayer )
			
			if dist < 20 then
				local nearbyPlayerDimension = getElementDimension(nearbyPlayer)
				local nearbyPlayerInterior = getElementInterior(nearbyPlayer)

				if (nearbyPlayerDimension==dimension) and (nearbyPlayerInterior==interior) then
					local logged = getElementData(nearbyPlayer, "loggedin")
					if not (isPedDead(nearbyPlayer)) and (logged == 1) then
						local message2 = message
						local pveh = getPedOccupiedVehicle(playerSource)
						local jatekos = nearbyPlayer
						outputChatBox("#7CC576"..getPlayerName(playerSource) .. " #ffffffmondja (Telefonba): " .. msg.. "", jatekos, 255, 255, 255, true)
							
						shownto = shownto + 1
					end
				end
			end
		end
	end
end
addEvent("chatToServer", true)
addEventHandler("chatToServer", getRootElement(), chatToServer)

function getPhoneDataFromServer(playerSource, phoneID)
	if tonumber(phoneID) then
		local checkID = dbPoll(dbQuery(connection, "SELECT * FROM phones WHERE number = ?", tonumber(phoneID)), -1)
		if (checkID) then
			for k, v in ipairs(checkID) do
				setElementData(playerSource, "musicID", v["music"])
				triggerClientEvent(playerSource, "getPhoneDataToClient", playerSource, v["wallpaper"], v["music"], 100)
			end
			--outputChatBox("Telefon adatai betöltve erre a telefonszámra: ".. phoneID)
		end	
		getPhoneContactFromServer(playerSource, phoneID)
	end
end
addEvent("getPhoneDataFromServer", true)
addEventHandler("getPhoneDataFromServer", getRootElement(), getPhoneDataFromServer)


function getPhoneContactFromServer(playerSource, ownerPhone)
	local phoneContacts = {}
	phoneContacts = {}
	local QueryEredmeny = dbPoll ( dbQuery( connection, "SELECT * FROM contacts WHERE owner = ?", ownerPhone), -1 )
	if (QueryEredmeny) then
		for k, v in ipairs(QueryEredmeny) do
			phoneContacts[#phoneContacts + 1] = {v["name"], tonumber(v["number"]), tonumber(v["id"])}
		end
		triggerClientEvent(playerSource, "getPhoneContactToClient", playerSource, phoneContacts)
	end
end
addEvent("getPhoneContactFromServer", true)
addEventHandler("getPhoneContactFromServer", getRootElement(), getPhoneContactFromServer)

function removeFromContactS(playerSource, row, id)
	if (dbExec(connection, "DELETE FROM contacts WHERE id = ?", id)) then
		triggerClientEvent(playerSource, "removeFromContactC", playerSource, row)
	end		
end
addEvent("removeFromContactS", true)
addEventHandler("removeFromContactS", getRootElement(), removeFromContactS)

function editContactS(playerSource, number, name, ownerPhone, row, id)
	if (name) and (number) and (ownerPhone) then
		if dbExec(connection, "UPDATE contacts SET name = ?, number = ? WHERE id = ?",name, number, id) then
			triggerClientEvent(playerSource, "editContactC", playerSource, name, number, row, id)
		end		
	end
end
addEvent("editContactS", true)
addEventHandler("editContactS", getRootElement(), editContactS)


function addContactMemberS(playerSource, number, name, ownerPhone)
	local query = dbQuery(connection, "INSERT INTO contacts SET name = ?, number = ?, owner = ?", name, number, ownerPhone)
	local QueryEredmeny,_,insertID = dbPoll(query, -1)	
	if QueryEredmeny then
		triggerClientEvent(playerSource, "addContactMemberC", playerSource, name, number, insertID)
	end
end
addEvent("addContactMemberS", true)
addEventHandler("addContactMemberS", getRootElement(), addContactMemberS)

function getChatFromServer(playerSource, phoneID)
	local chatS = {}
	chatS = {}
	if (tonumber(phoneID)) then
		if (tonumber(phoneID) > 0) then	
			local checkID = dbPoll(dbQuery(connection, "SELECT * FROM chat WHERE owner = ?", tonumber(phoneID)), -1)
			if (checkID) then
				for k, v in ipairs(checkID) do
					chatS[#chatS + 1] = {v["targetid"]}
				end
			end				
		end
		triggerClientEvent(playerSource, "getChatToClient", playerSource, chatS)
	end
end
addEvent("getChatFromServer", true)
addEventHandler("getChatFromServer", getRootElement(), getChatFromServer)

function sendMessagesInServer(playerSource, fromID, toID, msg, when, date)
	if playerSource and fromID and toID and msg then
		if (checkNumber(toID)) then
			if insertChat(playerSource, fromID, toID) then -- lokál pléjer
				triggerClientEvent(playerSource, "insertClientChat", playerSource, toID)
			end
			if insertChat(playerSource, toID, fromID) then -- target pléjer	
				local targetPlayer = checkOnline(toID)
				if targetPlayer then
					triggerClientEvent(targetPlayer, "insertClientChat", targetPlayer, fromID)			 
				end			
			end
			insertMsg(fromID, toID, fromID, msg, date, when, toID) -- lokál pléjer
			insertMsg(fromID, toID, toID, msg, date, when, fromID) -- target pléjer
			triggerClientEvent(playerSource, "sendMessagesInClient", playerSource, fromID, toID, toID, msg, date, when, toID, fromID)
			local targetPlayer = checkOnline(toID)
			if (targetPlayer) then
				triggerClientEvent(targetPlayer, "sendMessagesInClient", targetPlayer, fromID, toID, fromID, msg, date, when, fromID, toID)
				exports.global:sendLocalDoAction(targetPlayer, " kapott egy SMS-t.")	
				outputChatBox("#00AEFF[Telefon]: #ffffffAz üzenetet sikeresen elküldtük!", playerSource,255,255,255,true)
			else
				outputChatBox("#00AEFF[Telefon]: #ffffffEz a szám jelenleg nem kapcsolható de az üzenetet továbítottuk!", playerSource,255,255,255,true)
			end
		else
			outputChatBox("#00AEFF[Hiba]: #ffffffNincs ilyen telefonszám!", playerSource,255,255,255,true)
		end		
	end
end
addEvent("sendMessagesInServer", true)
addEventHandler("sendMessagesInServer", getRootElement(), sendMessagesInServer)

function editWallpaperInServer(playerSource, phoneID, wallPaperID)
	dbExec(connection, "UPDATE phones SET wallpaper = ? WHERE number = ?",wallPaperID, phoneID)
end
addEvent("editWallpaperInServer", true)
addEventHandler("editWallpaperInServer", getRootElement(), editWallpaperInServer)

function editRingInServer(playerSource, phoneID, musicID)
	if dbExec(connection, "UPDATE phones SET music = ? WHERE number = ?",musicID, phoneID) then
		--outputChatBox("Editelve a music erre: " .. musicID .. " ezen a telefonszámon: " .. phoneID)
	end
end
addEvent("editRingInServer", true)
addEventHandler("editRingInServer", getRootElement(), editRingInServer)

function checkOnline(phoneNumber)
	for k, v in ipairs(getElementsByType("player")) do
		if v and phoneNumber and exports.san_items:hasItemS(v, 16, phoneNumber) then
			return v
		end
	end
	return false
end

function checkNumber(phoneNumber)
	local checkID = dbPoll(dbQuery(connection, "SELECT * FROM phones"), -1)
	if (checkID) then
		for k, v in ipairs(checkID) do
			if (tonumber(v["number"]) == tonumber(phoneNumber)) then
				return true
			end
		end
	end	
	return false
end

function insertMsg(from, to, number, msg, date, when, fasz)
	local inster = dbExec(connection, "INSERT INTO messages SET msg = ?",toJSON({from, to, number, msg, date, when, fasz})) -- az sms küldőjének
	if insert then
		-- triggerClientEvent(play)
	end
end

function insertChat(playerSource, fromID, toID, phoneID)
	local checkID = dbPoll(dbQuery(connection, "SELECT * FROM chat"), -1)
	if (checkID) then
		for k, v in ipairs(checkID) do
			if (tonumber(v["owner"]) == tonumber(fromID)) then
				if (tonumber(toID) == tonumber(v["targetid"])) then
					return false
				end
			end
		end
		local insterT = dbQuery(connection, "INSERT INTO chat SET owner = ?, targetid = ?", fromID, toID)
		local QueryEredmeny, _, Beszurid = dbPoll(insterT, -1)
		if QueryEredmeny then
			return true
		end
	end
end

function callTargetInServer(playerSource, number, playerNumber)
	if number then
		targetPlayer = callMember(number)
		if targetPlayer ~= false and targetPlayer ~= "inCall" then
			triggerClientEvent(targetPlayer, "showMenu", targetPlayer, playerNumber, 6, playerSource, number)
			triggerClientEvent(playerSource, "showMenu", playerSource, number, 7, targetPlayer, playerNumber)
			triggerClientEvent(targetPlayer, "showSound", targetPlayer)	
			exports.global:sendLocalDoAction(targetPlayer, " csörög a telefonja")				
		elseif targetPlayer == "inCall" then
			outputChatBox("#00AEFF[Telefon]: #ffffffEz a szám már hívásban van!", playerSource,255,255,255,true)
		else
			outputChatBox("#00AEFF[Telefon]: #ffffffNem kapcsolható ez a szám!", playerSource,255,255,255,true)
		end
	end
end
addEvent("callTargetInServer", true)
addEventHandler("callTargetInServer", getRootElement(), callTargetInServer)

function sendCallMessages(playerSource, targetPlayerSource, msg, number)
	if (playerSource and targetPlayerSource and msg) then
		triggerClientEvent(playerSource, "insertMessages", playerSource, msg, 1, number)
		triggerClientEvent(targetPlayerSource, "insertMessages", targetPlayerSource, msg, 1, number)
	end
end
addEvent("sendCallMessages", true)
addEventHandler("sendCallMessages", getRootElement(), sendCallMessages)

function onClientCallAd(player, ad, ara, numberCall)
	local amout = math.ceil(ara)
	setElementData(player, "char:check", true) 
	local money = getElementData(player,"char:money")
	if(money<amout)then
		outputChatBox("00AEFF[Telefon]: #ffffffNincs elég pénzed a hírdetéshez!", player, 255,0,0,true)
		return
	end
	setElementData(player,"char:money",getElementData(player,"char:money") - amout)
	for index , value in ipairs (getElementsByType("player")) do  
		if (getElementData(value, "loggedin") and not getElementData(value, "char:check")) or player == value   then
			outputChatBox ("#7cc576 HIRDETÉS: #ffa700" ..ad.. " ((" ..getPlayerName(player):gsub("_", " ") .. "))",value,0, 233, 58,true)
			outputChatBox ("#7cc576 Kapcsolat: #ffa700" .. numberCall,value,0, 233, 58,true)
		end
	end
end
addEvent("onClientCallForAdData", true )
addEventHandler("onClientCallForAdData", getRootElement(), onClientCallAd)

function IllegalCallForAdData(player, ad, ara, numberCall)
	local amout = math.ceil(ara)
	setElementData(player, "char:check", true) 
	local money = getElementData(player,"char:money")
	if(money<amout)then
		outputChatBox("00AEFF[Telefon]: #ffffffNincs elég pénzed a hírdetéshez!", player, 255,0,0,true)
		return
	end
	setElementData(player,"char:money",getElementData(player,"char:money") - amout)
	for index , value in ipairs (getElementsByType("player")) do 
		if (getElementData(value, "loggedin") and not getElementData(value, "char:check")) or player == value  then
			if exports['wls_groups']:isPlayerInFaction(value, 1) or exports['wls_groups']:isPlayerInFaction(value, 2) then
			else
				outputChatBox ("#d24d57NON HIRDETÉS: #c0c0c0" ..ad.. " ((" ..getPlayerName(player):gsub("_", " ") .. "))",value, 0, 233, 58,true)
				outputChatBox ("#d24d57Kapcsolat: #c0c0c0" .. numberCall,value,0, 233, 58,true)
			end
		end
	end
end
addEvent("onClientIllegalCallForAdData", true )
addEventHandler("onClientIllegalCallForAdData", getRootElement(), IllegalCallForAdData)

function answerPhoneS(playerSource, targetPlayerSource, number)
	if tonumber(number) then
		if tonumber(number) == 1 then
			if playerSource then
				if targetPlayerSource then
					triggerClientEvent(playerSource, "answerPhone", playerSource, 1)
					triggerClientEvent(targetPlayerSource, "answerPhone", targetPlayerSource, 1)
				end
			end
		end
		if tonumber(number) == 2 then
			if playerSource then
				if targetPlayerSource then
					triggerClientEvent(playerSource, "answerPhone", playerSource, 2)
					triggerClientEvent(targetPlayerSource, "answerPhone", targetPlayerSource, 2)
					setElementData(targetPlayerSource, "char:money", getElementData(targetPlayerSource, "char:money") - math.random(1000, 1000))
				end
			end
		end		
	end
end
addEvent("answerPhoneS", true)
addEventHandler("answerPhoneS", getRootElement(), answerPhoneS)

function loadMessages(playerSource, phoneID)
	local messagesTable = {}
	messagesTable = {}
	local QueryEredmeny = dbPoll ( dbQuery( connection, "SELECT * FROM messages"), -1 )
	if (QueryEredmeny) then
		for k, v in ipairs(QueryEredmeny) do
			tableData = fromJSON(v["msg"])
			if tonumber(tableData[3]) == tonumber(phoneID) then
				if not messagesTable[tonumber(tableData[7])] then
					messagesTable[tonumber(tableData[7])] = {}
				end
				messagesTable[tonumber(tableData[7])][#messagesTable[tonumber(tableData[7])] + 1] = {tableData[1], tableData[2], tableData[3], tableData[4], tableData[5], tableData[6]}
			end
		end
		--outputChatBox("Üzenetek betöltve erre a telefonszámra: ".. phoneID)
		triggerClientEvent(playerSource, "loadMessagesInClient", playerSource, messagesTable)
	end
end
addEvent("loadMessages", true)
addEventHandler("loadMessages", getRootElement(), loadMessages)


function callMember(number)
	for k, v in ipairs(getElementsByType("player")) do
		if v and number and exports.san_items:hasItemS(v, 16, number) then
			if (getElementData(v, "inCall")) then
				setElementData(v, "inCall", false) -- ezt ki kell húzni
				return "inCall"
			else
				return v
			end
		end
	end
	return false
end

function getElementDistance( a, b )
	if not isElement(a) or not isElement(b) or getElementDimension(a) ~= getElementDimension(b) then
		return math.huge
	else
		local x, y, z = getElementPosition( a )
		return getDistanceBetweenPoints3D( x, y, z, getElementPosition( b ) )
	end
end