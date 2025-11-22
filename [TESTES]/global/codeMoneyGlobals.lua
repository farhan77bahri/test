function hasMoney(thePlayer, amount)
	amount = tonumber( amount ) or 0
	if thePlayer and isElement(thePlayer) and amount > 0 then
		amount = math.floor( amount )
		
		return getElementData(thePlayer,"char:money") >= amount
	end
	return false
end

function getMoney(thePlayer)
	return getElementData(thePlayer,"char:money") or 0
end

function formatMoney(amount)
	local left,num,right = string.match(tostring(amount),'^([^%d]*%d)(%d*)(.-)$')
	return left..(num:reverse():gsub('(%d%d%d)','%1,'):reverse())..right
end