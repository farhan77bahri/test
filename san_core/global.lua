function getPlayerID(player)
	for i = 1, 1024 do --1024 ig számol
		if (ids[i]==player) then
			return i
		end
	end	
end

function findPlayer(thePlayer, nick, msg, tipus)
	if not tipus then tipus = 1 end
	local byID = false
	if not nick and not isElement(thePlayer) and type( thePlayer ) == "string" then
		outputDebugString( "(core - FindPlayer) Hibás paraméterek lettek megadva." )
		return
	end
	
	if tonumber(nick) ~= nil then
		byID = true
	else
		byID = false
	end
	
	local tempTable = {}
	if not byID then
		nick = string.gsub(nick, " ", "_")
		nick = string.lower(nick)
		for key, value in ipairs(getElementsByType("player")) do
			local playerName = string.lower(getPlayerName(value))
			local playerName2 = getPlayerName(value)
			if string.find(playerName, tostring(nick)) then
				local stringStart, stringEnd = string.find(playerName, tostring(nick))
				if tonumber(stringStart) > 0 and tonumber(stringEnd) > 0 then
					tempTable[#tempTable + 1] = {value, playerName2}
				end
			end
		end
	else
		nick = tonumber(nick) or 0
		for key, value in ipairs(getElementsByType("player")) do
			local playerID = tonumber(getElementData(value, "playerid")) or 0
			local playerName2 = getPlayerName(value)
			if playerID == nick then
				tempTable[#tempTable + 1] = {value, playerName2}
			end
		end
	end
	
	if #tempTable == 1 then
		return tempTable[#tempTable][1], tempTable[#tempTable][2]
	elseif #tempTable == 0 then
		return false
	else
		if tipus == 1 then
			for k,v in ipairs(tempTable) do
				local vid = tonumber(getElementData(v[1], "playerid")) or 0
				outputChatBox(v[2] .. " - [" .. vid .. "]", thePlayer, 255, 0, 0)
			end
		else
			outputChatBox("[IRG MTA] #ffffffMais resultados.", 124, 197, 118, true)
			for k,v in ipairs(tempTable) do
				local vid = tonumber(getElementData(v[1], "playerid")) or 0
				outputChatBox(v[2] .. " - [" .. vid .. "]", 255, 255, 255, true)
			end
		end
		return false
	end
	return false
end

function var_dump(...)
	local verbose = false
	local firstLevel = true
	local outputDirectly = true
	local noNames = false
	local indentation = "\t\t\t\t\t\t"
	local depth = nil
 
	local name = nil
	local output = {}
	for k,v in ipairs(arg) do
		if type(v) == "string" and k < #arg and v:sub(1,1) == "-" then
			local modifiers = v:sub(2)
			if modifiers:find("v") ~= nil then
				verbose = true
			end
			if modifiers:find("s") ~= nil then
				outputDirectly = false
			end
			if modifiers:find("n") ~= nil then
				verbose = false
			end
			if modifiers:find("u") ~= nil then
				noNames = true
			end
			local s,e = modifiers:find("d%d+")
			if s ~= nil then
				depth = tonumber(string.sub(modifiers,s+1,e))
			end
		elseif type(v) == "string" and k < #arg and name == nil and not noNames then
			name = v
		else
			if name ~= nil then
				name = ""..name..": "
			else
				name = ""
			end
 
			local o = ""
			if type(v) == "string" then
				table.insert(output,name..type(v).."("..v:len()..") \""..v.."\"")
			elseif type(v) == "userdata" then
				local elementType = "no valid MTA element"
				if v then
					elementType = getElementType(v)
				end
				table.insert(output,name..type(v).."("..elementType..") \""..tostring(v).."\"")
			elseif type(v) == "table" then
				local count = 0
				for key,value in pairs(v) do
					count = count + 1
				end
				table.insert(output,name..type(v).."("..count..") \""..tostring(v).."\"")
				if verbose and count > 0 and (depth == nil or depth > 0) then
					table.insert(output,"\t{")
					for key,value in pairs(v) do
						local newModifiers = "-s"
						if depth == nil then
							newModifiers = "-sv"
						elseif  depth > 1 then
							local newDepth = depth - 1
							newModifiers = "-svd"..newDepth
						end
						local keyString, keyTable = var_dump(newModifiers,key)
						local valueString, valueTable = var_dump(newModifiers,value)
 
						if #keyTable == 1 and #valueTable == 1 then
							table.insert(output,indentation.."["..keyString.."]\t=>\t"..valueString)
						elseif #keyTable == 1 then
							table.insert(output,indentation.."["..keyString.."]\t=>")
							for k,v in ipairs(valueTable) do
								table.insert(output,indentation..v)
							end
						elseif #valueTable == 1 then
							for k,v in ipairs(keyTable) do
								if k == 1 then
									table.insert(output,indentation.."["..v)
								elseif k == #keyTable then
									table.insert(output,indentation..v.."]")
								else
									table.insert(output,indentation..v)
								end
							end
							table.insert(output,indentation.."\t=>\t"..valueString)
						else
							for k,v in ipairs(keyTable) do
								if k == 1 then
									table.insert(output,indentation.."["..v)
								elseif k == #keyTable then
									table.insert(output,indentation..v.."]")
								else
									table.insert(output,indentation..v)
								end
							end
							for k,v in ipairs(valueTable) do
								if k == 1 then
									table.insert(output,indentation.." => "..v)
								else
									table.insert(output,indentation..v)
								end
							end
						end
					end
					table.insert(output,"\t}")
				end
			else
				table.insert(output,name..type(v).." \""..tostring(v).."\"")
			end
			name = nil
		end
	end
	local string = ""
	for k,v in ipairs(output) do
		if outputDirectly then
			outputConsole(v)
		end
		string = string..v
	end
	return string, output
end








function inDistance3D(element1, element2, distance)
	if isElement(element1) and isElement(element2) then
	    local x1, y1, z1 = getElementPosition(element1)
	    local x2, y2, z2 = getElementPosition(element2)
	    local distance2 = getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)

	    if distance2 <= distance then
	        return true, distance2
	    end
	end

    return false, 99999
end

function inDistance2D(element1, element2, distance)
	if isElement(element1) and isElement(element2) then
	    local x1, y1, z1 = getElementPosition(element1)
	    local x2, y2, z2 = getElementPosition(element2)
	    local distance2 = getDistanceBetweenPoints2D(x1, y1, x2, y2)

	    if distance2 <= distance then
	        return true, distance2
	    end
	end
	
    return false, 99999
end

