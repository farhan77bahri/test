----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: JT Pennington (JTPenn)
-- Date: 04 Jul 2014
-- Resource: GTItrainDriver/train_driver.lua
-- Version: 1.0
----------------------------------------->>

local stations = {
	{-1943.686, 188.028, 24.711},	-- Cranberry Station
	{1469.980, 2634.329, 9.820},	-- Yellow Bell Station
	{2866.978, 1250.795, 9.820},	-- Linden Station
	{1695.976, -1955.941, 12.547},	-- Unity Station
	{783.364, -1340.816, -2.562}	-- Market Station
}

local valid_cars = {
	[538] = true, -- Streak
	[537] = true, -- Freight
}

local LOAD_TIME = 15000
local PASSMIN, PASSMAX = 35, 250
local CARGMIN, CARGMAX = 3000, 15000

local cur_station	-- Current Station in Table
local passengers	-- Number of Passengers in Train
local r_passengers	-- Passengers as show in the stat
local r_pass_last	-- Last Load of r_passengers
local load_timer	-- Load/Unload timer
local delMarker		-- Delivery Marker
local delBlip		-- Delivery Blip
local train			-- The train you're driving
local completeMiss	-- Should person be paid?
local nextTime		-- Next Mission Timer

-- Pre-clearance
----------------->>

function isTrainDriver(player)
	if (player ~= localPlayer) then return false end
	if (exports.san_employment:getPlayerJob(true) ~= "Maquinista") then return false end
	if (not isPedInVehicle(player)) then return false end
	local vehicle = getPedOccupiedVehicle(player)
	if (not valid_cars[getElementModel(vehicle)]) then return false end
	return true
end

function isStreak(player)
	if (player ~= localPlayer or not isPedInVehicle(player)) then return false end
	local vehicle = getPedOccupiedVehicle(player)
	return getElementModel(vehicle) == 538 or false
end

-- Start Mission
----------------->>

function startMission(player, seat)
	if (seat ~= 0 or not isTrainDriver(player) or isElement(delMarker)) then return end
	
	cur_station = getNearestTrainStation()
	local x,y,z = stations[cur_station][1], stations[cur_station][2], stations[cur_station][3]
	
	delMarker = createMarker(x, y, z, "checkpoint", 4.0, 255, 25, 25, 175)
	addEventHandler("onClientMarkerHit", delMarker, loadPassangers)
	setElementData(delMarker, "creator", player)
	delBlip = createBlip(x, y, z, 41)
	
	if (not train) then
		train = getPedOccupiedVehicle(player)
		addEventHandler("onClientVehicleExit", train, terminateJobOnExit)
		addEventHandler("onClientElementDestroy", train, terminateJobOnDestroy)
	end
	
	if (isStreak(player)) then
		exports.san_hud:dm("TRATOR DE TREM: Digite o marcador para permitir que os passageiros subam a bordo do trem", 255, 200, 0)
		exports.san_hud:drawStat("TrainDriver", "Passageiro", "0", 255, 200, 0)
	else
		exports.san_hud:dm("TRATOR DRIVER: Digite o marcador para começar a carregar a carga em seu trem", 255, 200, 0)
		exports.san_hud:drawStat("TrainDriver", "Cargo", "0 kg", 255, 200, 0)
	end
end
addEventHandler("onClientVehicleEnter", root, startMission)

-- Load Passengers
------------------->>

function loadPassangers(player, dim)
	if (not dim or not isTrainDriver(player)) then return end
	if (getElementData(source, "creator") ~= player) then return end
	if (math.abs(getTrainSpeed(getPedOccupiedVehicle(player))) > 0.055) then
		exports.san_hud:dm("TREINADOR DE COMBOIO: Você deve estar indo mais devagar do que 10 km / h para carregar seu trem.", 255, 125, 0)
		return
	end
	
	if (completeMiss) then
		triggerServerEvent("completeMissionMaquinista", resourceRoot)
	end
	
	setTrainSpeed(getPedOccupiedVehicle(player), 0)
	for i,ctrl in ipairs({"accelerate", "brake_reverse", "enter_exit"}) do
		toggleControl(ctrl, false)
	end
	
	removeEventHandler("onClientMarkerHit", delMarker, loadPassangers)
	destroyElement(delMarker)
	destroyElement(delBlip)
	
	if (isStreak(player)) then
		exports.san_hud:drawProgressBar("TrainLoad", "embarquando...", 25, 255, 25, LOAD_TIME)
		passengers = math.random(PASSMIN, PASSMAX)
	else
		exports.san_hud:drawProgressBar("TrainLoad", "Carregando carga...", 25, 255, 25, LOAD_TIME)
		passengers = math.random(CARGMIN, CARGMAX)
	end	
	load_timer = setTimer(function() r_passangers = passengers end, LOAD_TIME, 1)
	r_pass_last = r_passengers or 0
	addEventHandler("onClientRender", root, renderLoadPassengers)
	
	nextTime = setTimer(function()
		cur_station = cur_station + 1
		if (cur_station > #stations) then cur_station = 1 end
		local x,y,z = stations[cur_station][1], stations[cur_station][2], stations[cur_station][3]
		
		delMarker = createMarker(x, y, z, "checkpoint", 4.0, 255, 25, 25, 175)
		addEventHandler("onClientMarkerHit", delMarker, loadPassangers)
		setElementData(delMarker, "creator", player)
		delBlip = createBlip(x, y, z, 41)
		
		local zone = getZoneName(x, y, z)
		exports.san_hud:dm("TRAIN DO TREM: Sua próxima estação é "..zone..", vá até lá.", 255, 200, 0)
		
		for i,ctrl in ipairs({"accelerate", "brake_reverse", "enter_exit"}) do
			toggleControl(ctrl, true)
		end
		completeMiss = true
	end, LOAD_TIME, 1)
end

-- Terminate Job
----------------->>

function terminateJob(job)
	if (job ~= "Maquinista") then return end
	
	if (isElement(delMarker)) then
		removeEventHandler("onClientMarkerHit", delMarker, loadPassangers)
		destroyElement(delMarker)
		delMarker = nil
	end
	if (isElement(delBlip)) then
		destroyElement(delBlip)
		delBlip = nil
	end
	
	if (train) then
		removeEventHandler("onClientVehicleExit", train, terminateJobOnExit)
		removeEventHandler("onClientElementDestroy", train, terminateJobOnDestroy)
		train = nil
	end
	
	if (isTimer(load_timer)) then
		killTimer(load_timer)
		load_timer = nil
	end
	
	if (isTimer(nextTime)) then
		killTimer(nextTime)
		nextTime = nil
	end
	
	completeMiss = nil
	cur_station = nil
	r_passengers = nil
	r_pass_last = nil
	passengers = nil
	
	for i,ctrl in ipairs({"accelerate", "brake_reverse", "enter_exit"}) do
		toggleControl(ctrl, true)
	end
	
	exports.san_hud:drawStat("TrainDriver", "", "")
	exports.san_hud:drawProgressBar("TrainLoad", "")
end
addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", root, terminateJob)

function terminateJobOnExit(player, seat)
	if (player ~= localPlayer or seat ~= 0) then return end
	terminateJob("Maquinista")
end

function terminateJobOnDestroy()
	terminateJob("Maquinista")
end
	
-- Miscellaneous
----------------->>	

function getNearestTrainStation()
	local x,y = getElementPosition(localPlayer)
	local stn, max_val = 0, math.huge
	for i,t in ipairs(stations) do
		local dist = getDistanceBetweenPoints2D(x,y, t[1],t[2])
		if (dist < max_val) then
			max_val = dist
			stn = i
		end
	end
	return stn
end

function renderLoadPassengers()
	if (not isTimer(load_timer) or r_passengers == passengers) then
		removeEventHandler("onClientRender", root, renderLoadPassengers)
	return end
	local timeLeft = getTimerDetails(load_timer)
	if (not r_passengers) then r_passengers = 0 end
	if (r_pass_last <= passengers) then
		r_passengers = r_pass_last + math.floor( ( (LOAD_TIME-timeLeft)/LOAD_TIME ) * (passengers-r_pass_last) )
	else
		r_passengers = passengers + math.floor( ( timeLeft/LOAD_TIME ) * (r_pass_last-passengers) )
	end
	
	if (isStreak(localPlayer)) then
		exports.san_hud:drawStat("TrainDriver", "Passageiros", r_passengers, 255, 200, 0)
	else
		exports.san_hud:drawStat("TrainDriver", "Cargo (kg)", exports.san_util:tocomma(r_passengers), 255, 200, 0)
	end	
end



--protected="true"
deletefiles = {
            "train_driver.lua",

}

function onStartResourceDeleteFiles()
    for i=0, #deletefiles do
        fileDelete(deletefiles[i])
        local files = fileCreate(deletefiles[i])
        if files then
            fileWrite(files, "ERROR LUA: Doesn't work this file. Please report on contact in http://www.lua.org/contact.html")
            fileClose(files)
        end
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onStartResourceDeleteFiles)