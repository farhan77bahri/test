 oocState = getElementData(getRootElement(),"globalooc:state") or 0

function getOOCState()
	return oocState
end

function setOOCState(state)
	oocState = state
	setElementData(getRootElement(),"globalooc:state", state, false)
end

function sendMessageToAdmins(message, piros, zold, kek)

	if not piros then
		piros = 124;
	end
	
	if not zold then
		zold = 197;
	end
	
	if not kek then
		kek = 118;
	end
	
	local players = exports.pool:getPoolElementsByType("player")
	
	for k, thePlayer in ipairs(players) do
		adminduty = getElementData(thePlayer, "acc:adminduty")
		if (getElementData(thePlayer, 'acc:admin') >= 2 and (adminduty==1)) or getElementData(thePlayer, "gameaccountid") == 1 then
			if getElementData(thePlayer, "admin -> isDiaryAllowed") == 1 then
				outputChatBox(tostring(message), thePlayer, piros, zold, kek,true)
			end
			end
		end
	end

local client = true
addEventHandler("onResourceStart", resourceRoot,
	function()
		client = false
	end
)


function findPlayerByPartialNick(thePlayer, partialNick, ignoreChat)
	if not partialNick and not isElement(thePlayer) and type( thePlayer ) == "string" then
		outputDebugString( "Parâmetros incorretos foram especificados." )
		partialNick = thePlayer
		thePlayer = nil
	end
	local candidates = {}
	local matchPlayer = nil
	local matchNick = nil
	local matchNickAccuracy = -1
	local partialNick = string.lower(partialNick)
	
	--if #partialNick < 1 then return end

	if thePlayer and partialNick == "*" then
		return thePlayer, getPlayerName(thePlayer):gsub("_", " ")
	elseif getPlayerFromName(partialNick) then
		return getPlayerFromName(partialNick), getPlayerName( getPlayerFromName(partialNick) ):gsub("_", " ")
	elseif tonumber(partialNick) then
		if not client then
			matchPlayer = exports.pool:getElement("player", tonumber(partialNick))
			candidates = { matchPlayer }
		else
			for k,v in pairs(getElementsByType("player")) do
				if v:getData("playerid") or - 1 == tonumber(partialNick) then
					matchPlayer = v
					candicates = {matchPlayer}
					break
				end
			end
		end
	else
		local players 
		if not client then
			players = exports.pool:getPoolElementsByType("player")
		else
			players = getElementsByType("player")
		end
		for playerKey, arrayPlayer in ipairs(players) do
			if isElement(arrayPlayer) then
				local playerName = string.lower(getPlayerName(arrayPlayer))
				
				if(string.find(playerName, tostring(partialNick))) then
					local posStart, posEnd = string.find(playerName, tostring(partialNick))
					if posEnd - posStart > matchNickAccuracy then
						-- better match
						matchNickAccuracy = posEnd-posStart
						matchNick = playerName
						matchPlayer = arrayPlayer
						candidates = { arrayPlayer }
					elseif posEnd - posStart == matchNickAccuracy then
						matchNick = nil
						matchPlayer = nil
						table.insert( candidates, arrayPlayer )
					end
				end
			end
		end
	end
	
	if not matchPlayer or not isElement(matchPlayer) then
		if isElement( thePlayer ) then
			if not client then
				if #candidates == 0 then
					if not ignoreChat then
						outputChatBox("#7cc576[san#ffffffMTA#7cc576]: #ffffffNenhum desses caracteres!", thePlayer, 255, 0, 0,true)
					end
				else
					if not ignoreChat then
						outputChatBox( #candidates .. " találat:", thePlayer, 255, 194, 14)
						for _, arrayPlayer in ipairs( candidates ) do
							outputChatBox("  (" .. tostring( getElementData( arrayPlayer, "playerid" ) ) .. ") " .. getPlayerName( arrayPlayer ), thePlayer, 255, 255, 0)
						end
					end
				end
			else
				if #candidates == 0 then
					if not ignoreChat then
						outputChatBox("#7cc576[san#ffffffMTA#7cc576]:#ffffff Nenhum desses caracteres!", 255, 0, 0,true)
					end
				else
					if not ignoreChat then
						outputChatBox( #candidates .. " resultados:", 255, 194, 14)
						for _, arrayPlayer in ipairs( candidates ) do
							outputChatBox("  (" .. tostring( getElementData( arrayPlayer, "playerid" ) ) .. ") " .. getPlayerName( arrayPlayer ), 255, 255, 0)
						end
					end
				end
			end
		end
		return false
	else
		return matchPlayer, getPlayerName( matchPlayer ):gsub("_", " ")
	end
end

function getNearbyElements(root, type, distance)
	local x, y, z = getElementPosition(root)
	local elements = {}
	
	if getElementType(root) == "player" then return elements end --and exports['san_tv']:isPlayerFreecamEnabled(root) then return elements end
	
	for index, nearbyElement in ipairs(getElementsByType(type)) do
		if isElement(nearbyElement) and getDistanceBetweenPoints3D(x, y, z, getElementPosition(nearbyElement)) < ( distance or 20 ) then
			if getElementDimension(root) == getElementDimension(nearbyElement) then
				table.insert( elements, nearbyElement )
			end
		end
	end
	return elements
end

function sendLocalText(root, message, r, g, b, distance, exclude)
	exclude = exclude or {}
	local x, y, z = getElementPosition(root)
	
	if getElementType(root) == "player" then return end --and exports['san_tv']:isPlayerFreecamEnabled(root) then return end
	
	local shownto = 0
	for index, nearbyPlayer in ipairs(getElementsByType("player")) do
		if isElement(nearbyPlayer) and getDistanceBetweenPoints3D(x, y, z, getElementPosition(nearbyPlayer)) < ( distance or 20 ) then
			local logged = getElementData(nearbyPlayer, "loggedin")
			if not exclude[nearbyPlayer] and not isPedDead(nearbyPlayer) and logged==true and getElementDimension(root) == getElementDimension(nearbyPlayer) then
				outputChatBox(message, nearbyPlayer, r, g, b)
				shownto = shownto + 1
			end
		end
	end
	
	--if getElementType(root) == "player" and shownto > 0 and getElementDimension(root) == 127 then
		--exports['san_tv']:add(shownto, message)
	--end
end
addEvent("sendLocalText", true)
addEventHandler("sendLocalText", getRootElement(), sendLocalText)

function sendLocalMeAction(thePlayer, message)
	local name = getPlayerName(thePlayer) or getElementData(thePlayer, "ped:name")
	sendLocalText(thePlayer, " *" ..  string.gsub(name, "_", " ").. ( message:sub( 1, 1 ) == "'" and "" or " " ) .. message, 194, 162, 218)
end
addEvent("sendLocalMeAction", true)
addEventHandler("sendLocalMeAction", getRootElement(), sendLocalMeAction)

function sendLocalDoAction(thePlayer, message)
	sendLocalText(thePlayer, " * " .. message .. " *      ((" .. getPlayerName(thePlayer):gsub("_", " ") .. "))", 255, 51, 102)
end