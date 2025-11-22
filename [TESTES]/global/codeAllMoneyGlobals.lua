--[[
mysql = exports.mysql


-- ////////////////////////////////////

function giveMoney(thePlayer, amount)
	amount = tonumber( amount ) or 0
	if amount == 0 then
		return true
	elseif thePlayer and isElement(thePlayer) and amount > 0 then
		amount = math.floor( amount )
		if tonumber(amount) > 0 then
		end
		exports['anticheat-system']:changeProtectedElementDataEx(thePlayer, "char:money", getElementData( thePlayer,"char:money" ) + amount )
		if getElementType(thePlayer) == "player" then
			mysql:query_free("UPDATE characters SET money = money + " .. amount .. " WHERE id = " .. getElementData( thePlayer, "dbid" ) )
			givePlayerMoney( thePlayer, amount )
		elseif getElementType(thePlayer) == "team" then
			mysql:query_free("UPDATE factions SET bankbalance = bankbalance + " .. amount .. " WHERE id = " .. getElementData( thePlayer, "id" ) )
		end
		return true
	end
	return false
end

function takeMoney(thePlayer, amount, rest)
	amount = tonumber( amount ) or 0
	if amount == 0 then
		return true, 0
	elseif thePlayer and isElement(thePlayer) and amount > 0 then
		amount = math.ceil( amount )
		
		local money = getElementData( thePlayer,"char:money" )
		if rest and amount > money then
			amount = money
		end
		
		if amount == 0 then
			return true, 0
		elseif hasMoney(thePlayer, amount) then
			exports['anticheat-system']:changeProtectedElementDataEx(thePlayer, "char:money", money - amount )

			if getElementType(thePlayer) == "player" then
				mysql:query_free("UPDATE characters SET money = money - " .. amount .. " WHERE id = " .. getElementData( thePlayer, "dbid" ) )
				takePlayerMoney( thePlayer, amount )
				local ujpenz = getMoney( thePlayer )
				if ujpenz > 0 then
				end
			elseif getElementType(thePlayer) == "team" then
				mysql:query_free("UPDATE factions SET bankbalance = bankbalance - " .. amount .. " WHERE id = " .. getElementData( thePlayer, "id" ) )
			end
			return true, amount
		end
	end
	return false, 0
end

function setMoney(thePlayer, amount, onSpawn)
	amount = tonumber( amount ) or 0
	if thePlayer and isElement(thePlayer) and amount >= 0 then
		amount = math.floor( amount )
		
		exports['anticheat-system']:changeProtectedElementDataEx(thePlayer, "char:money", amount )
		

		if tonumber(amount) > 0 then
		end
				
		if getElementType(thePlayer) == "player" then
			if not onSpawn then
				mysql:query_free("UPDATE characters SET money = " .. amount .. " WHERE id = " .. getElementData( thePlayer, "dbid" ) )
			end
			setPlayerMoney( thePlayer, amount )
		elseif getElementType(thePlayer) == "team" then
			mysql:query_free("UPDATE factions SET bankbalance = " .. amount .. " WHERE id = " .. getElementData( thePlayer, "id" ) )
		end
		return true
	end
	return false
end

function hasMoney(thePlayer, amount)
	amount = tonumber( amount ) or 0
	if thePlayer and isElement(thePlayer) and amount >= 0 then
		amount = math.floor( amount )
		
		return getElementData(thePlayer,"char:money") >= amount
	end
	return false
end

function getMoney(thePlayer, nocheck)
	if not nocheck then
		checkMoneyHacks(thePlayer)
	end
	return getElementData(thePlayer, "char:money") or 0
end

function checkMoneyHacks(thePlayer)
	if not getMoney(thePlayer, true) or getElementType(thePlayer) ~= "player" then return end
	
	local safemoney = getMoney(thePlayer, true)
	local hackmoney = getElementData(thePlayer,"char:money")
	if (safemoney < hackmoney) then
		getElementData(thePlayer,"char:money" ,safemoney)
		--sendMessageToAdmins("Moneyhack gyanú: "..getPlayerName(thePlayer))
		return true
	else
		return false
	end
end

-- ////////////////////////////////////

function formatMoney(amount)
	local left,num,right = string.match(tostring(amount),'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end
]]--