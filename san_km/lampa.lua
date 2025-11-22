local root = getRootElement ()
local thisResourceRoot = getResourceRootElement(getThisResource())

function thisResourceStart ()
	local players = getElementsByType ( "player" )
	for k,v in ipairs(players) do
	    bindKey ( v, "l", "down", toggleVehicleLights, "Lâmpada ligar / desligar" )
	end
end

function playerJoin ()
    bindKey ( source, "l", "down", toggleVehicleLights, "Lâmpada ligar / desligar" )
end

addEventHandler ( "onResourceStart", thisResourceRoot, thisResourceStart )
addEventHandler ( "onPlayerJoin", root, playerJoin )

function toggleVehicleLights ( player, key, state )
	if ( getPlayerOccupiedVehicleSeat ( player ) == 0 ) then
		local veh = getPlayerOccupiedVehicle ( player )
		if ( getVehicleOverrideLights ( veh ) ~= 2 ) then
			setVehicleOverrideLights ( veh, 2 )
			--gombhang()
			--playSound("files/lightswitch.mp3")
			--local sound = playSound("files/lightswitch.mp3") --by scripti
			--setSoundVolume(sound, 1)
		else
			setVehicleOverrideLights ( veh, 1 )
			--gombhang()
			--playSound("files/lightswitch.mp3")
		end
	end
end
