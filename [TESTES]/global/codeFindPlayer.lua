
function findPlayer(thePlayer, nick, msg, tipus)
	if not tipus then tipus = 1 end
	local byID = false
	if not nick and not thePlayer and type( thePlayer ) == "string" then
		return
	end
	
	if tonumber(nick) ~= nil then
		byID = true
	else
		byID = false
	end
	
	local tempTable = {}
	if not byID then
		if nick == "*" then
			return thePlayer, getPlayerName(thePlayer)
		end
		nick = string.gsub(nick, " ", "_")
		nick = string.lower(nick)
		for key, value in ipairs(getElementsByType("player")) do
			local name = getPlayerName(value)
			local playerName = tostring(string.lower(name))
			
			local adminName = getElementData(value,"anick") or getPlayerName(value):gsub("_"," ")
			if adminName and not adminName:find("Admin") then
				if getElementData(value, "char:adminduty") == 1 then
					name = adminName
					playerName = tostring(string.lower(adminName))
				end
			end
			
			if string.find(playerName, tostring(nick)) then
				local playerID = tonumber(getElementData(value, "playerid")) or 0
				local stringStart, stringEnd = string.find(playerName, tostring(nick))
				if tonumber(stringStart) > 0 and tonumber(stringEnd) > 0 then
					table.insert(tempTable, {value, name, playerID})
				end
			end
		end
	else
		nick = tonumber(nick) or 0
		for key, value in ipairs(getElementsByType("player")) do
			local playerID = tonumber(getElementData(value, "playerid")) or 0
			if playerID == nick then
				table.insert(tempTable, {value, getPlayerName(value), playerID})
			end
		end
	end
	
	if #tempTable == 1 then
		return tempTable[1][1], tempTable[1][2]
	elseif #tempTable == 0 then
		if not msg then
			if tipus == 1 then
				-- outputChatBox("#7CC576[san#ffffffMTA#7cc576]:#ffffffNem található a játékos.", thePlayer, 255, 0, 0, true)
			else
				-- outputChatBox("#7CC576[san#ffffffMTA#7cc576]:#ffffffNem található a játékos.", 255, 0, 0, true)
			end
		end
		return false
	else
		if not msg then
			if tipus == 1 then
				for k,v in ipairs(tempTable) do
					outputChatBox(v[2] .. " - [" .. v[3] .. "]", thePlayer, 255, 0, 0)
				end
			else
				for k,v in ipairs(tempTable) do
					outputChatBox("#7CC576[san#ffffffMTA#7cc576]:#ffffff" .. v[2] .. " - [" .. v[3] .. "]", 255, 0, 0, true)
				end
			end
		end
		return false
	end
	return false
end





