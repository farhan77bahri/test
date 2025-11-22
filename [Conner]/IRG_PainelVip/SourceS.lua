local connection = exports['san_mysql']:getConnection()

function PremiumPontbuyItem(player, item, amount ,db)
	if (tonumber(item) == 16) then
		exports["mta_phone"]:addPhone(player)
	else
		if db then 
			exports.san_items:giveItem(player, item, 1, db, 0, true)
		else
			exports.san_items:giveItem(player, item, 1, db, 0, true)
		end
	end
	dbExec(connection,"UPDATE characters SET premiumpont = ? WHERE id = ?", player:getData("char:pp")-amount, getElementData(player,"acc:id"))
end
addEvent("PremiumPontbuyItem", true)
addEventHandler("PremiumPontbuyItem", getRootElement(), PremiumPontbuyItem)