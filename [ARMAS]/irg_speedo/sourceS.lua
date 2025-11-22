local connection = exports["san_mysql"]:getConnection(getThisResource()) -- // SQL kapcsolat

addEventHandler("onResourceStart", root, function(startedRes)
	if getResourceName(startedRes) == "san_mysql" then
		connection = exports['san_mysql']:getConnection(getThisResource())
		restartResource(getThisResource())
	end
end)
--[[
addEventHandler("onVehicleStartExit", getRootElement(), function(thePlayer)
	if getElementData(thePlayer, "ov") then
		cancelEvent()
		exports['san_info']:createDebugNotification(thePlayer,"Előbb kapcsold ki az öved!", 1)
	end
end)]]

function saveKilometer(vehicle,km)
	exec= dbExec(connection, "UPDATE vehicle SET traveled = ? WHERE id = ?",km, getElementData(vehicle,"veh:id"))
	if exec then
	end	
end
addEvent("saveKilometer",true)
addEventHandler("saveKilometer",getRootElement(),saveKilometer)

function loadVehiclesKilometer(p,carID)
	local Query = dbPoll ( dbQuery( connection, "SELECT * FROM vehicle WHERE id=?",carID), -1 )
	if (Query) then
		for i, ertek in ipairs(Query) do
			-- outputDebugString(tonumber(ertek["odometer"]), 3)
			triggerClientEvent(p,"loadInKilometer",p,tonumber(ertek["traveled"]))
		end
	end
end
addEvent("loadVehiclesKilometer",true)
addEventHandler("loadVehiclesKilometer",getRootElement(),loadVehiclesKilometer)


function DanoAoBater(loss)
    local player = getVehicleController(source)
    if player then
        if getElementData(player, "ov") then return end
            local vida = getElementHealth(player)
            loss = loss/25 --- Porcentagem de vida que o jogador vai perder de vida quando bate sem cinto
            setElementHealth(player, vida-loss)
      --  end
    end
end
addEventHandler("onVehicleDamage", getRootElement(), DanoAoBater)
