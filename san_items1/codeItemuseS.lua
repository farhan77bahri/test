local connection = exports.mysql:getConnection()
local szinez = "#88D373"
local r,g,b = 136,211,115



addEvent("checkCarKey",true)
addEventHandler("checkCarKey",getRootElement(),function(player,dbid,value)
	dbQuery(function(qh)
		local result = dbPoll(qh,0)
		if #result > 0 then
			outputChatBox(szinez.."[Inventario]:#FFFFFF Não há ação para este item!",player,255,255,255,true)
		else
			outputChatBox(szinez.."[Inventario]:#FFFFFF Eu não consegui encontrar um veículo assim, então eu deletei sua chave!",player,255,255,255,true)
			dbExec(connection,"DELETE FROM items WHERE id = ?",dbid)
			setTimer(function()
			exports["san_items"]:loadPlayerItems(player)end,500,1)
		end	
	end,connection,"SELECT * FROM vehicles WHERE id = ?",value)
end)


addEvent("fixCardUse",true)
addEventHandler("fixCardUse",getRootElement(),function(vehicle)
	fixVehicle(vehicle);
	setVehicleDamageProof(vehicle, false);
end)

addEvent("giveArmor",true)
addEventHandler("giveArmor",getRootElement(),function(player, amount)
	setPedArmor(player, amount)
end)

addEvent("addpp",true)
addEventHandler("addpp",getRootElement(),function(player)
	dbExec(connection,"UPDATE accounts SET wlspp = ? WHERE id = ?",getElementData(player,"wls:pp"),getElementData(player,"acc:id"))
end)