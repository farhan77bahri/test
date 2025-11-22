local con = exports.san_mysql:getConnection()

function yunkDeleteVehicle(player, veh, cost)
	if isElement(player) and isElement(veh) and (math.floor(cost)) then
		if getElementData(player, "loggedin") then
			local vehid = tonumber(getElementData(veh, "veh:id"))
			local result = dbPoll(dbQuery(con, "DELETE FROM vehicle WHERE id='" .. vehid .. "'"), -1)
			if result then
				if getElementData(veh, "veh:id") == vehid and getElementData(player, "acc:id") == getElementData(veh, "veh:owner") or getElementData(player, "acc:admin") >= 7 then
					
					destroyElement(veh)
				--	exports.san_admin:outputAdminMessage("[Zúzatásinfó] (JárműID:" .. vehid .. "#ffffff) bez")
					
					setTimer( function()
						setElementData(player, "char:money", getElementData(player, "char:money")+math.floor(cost))
						dbExec(con, "UPDATE characters SET money='" .. getElementData(player, "char:money") .. "' WHERE account='" .. getElementData(player, "acc:id") .. "'")
						return
					end, 200, 1)
					return
				end
			end
		end
	end
end
addEvent("junk:deleteVehicle", true)
addEventHandler("junk:deleteVehicle", root, yunkDeleteVehicle)