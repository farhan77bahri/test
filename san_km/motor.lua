--[[
local engineKey = get("@sgs_systemaut.engineKey")


function changeEngineState(source)
    if not isPedInVehicle(source) then return end
	local sourceVehicle = getPedOccupiedVehicle( source )
	setVehicleEngineState ( sourceVehicle, not getVehicleEngineState ( sourceVehicle ) )
end

--[[
addEventHandler ( "onPlayerVehicleEnter",root,function( veh, driver, jacker )
    if driver ~= 0 or jacker then return end 
	setVehicleEngineState ( theVehicle, true ) 
end)
addEventHandler ( "onPlayerVehicleExit",root,function( theVehicle, driver, jacker )
    if driver ~= 0 or jacker then return end 
	setVehicleEngineState ( theVehicle, false ) 
end)]]--


addEventHandler ( "onResourceStart",resourceRoot,function(res)
	if res~= getThisResource() then return end
	for _,p in ipairs(getElementsByType("player")) do
		bindKey(p,engineKey, "down", changeEngineState )
	end
end)
addEventHandler("onResourceStop",resourceRoot,function(res)
	if res~= getThisResource() then return end
	for _,p in ipairs(getElementsByType("player")) do
		unbindKey(p,engineKey, "down", changeEngineState )
	end
end)
addEventHandler ( "onPlayerJoin",root,function()
	bindKey (source,engineKey, "down", changeEngineState)
end)
addEventHandler ( "onPlayerQuit",root,function()
	unbindKey (source,engineKey, "down", changeEngineState)
end)]]--