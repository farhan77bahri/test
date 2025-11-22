function getPlayerLevel(thePlayer)
	local onlineTime = tonumber(getElementData(thePlayer, "char:onlineTime") or 0)

	if onlineTime > 9999999999 then
		onlineTime = 9999999999
	end
	return onlineTime
end   


--[[
function getPlayerLevel1(thePlayer)
	local onlineTime1 = tonumber(getElementData(thePlayer, "char:onlineTime") or 0)

	if onlineTime1 > 9999999999 then
		onlineTime1 = 9999999999
	end
	return onlineTime1
end   ]]