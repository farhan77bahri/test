local rName = getResourceName ( getThisResource ( ) )
function sendClientMessage ( msg, who, r, g, b, pos, time )
	if ( msg and who ) then
		if ( isElement ( who ) ) then
			triggerClientEvent ( who, rName..":sendClientMessage", who, msg, r, g, b, pos, time )
			return true
		else return false end
	else return false end
end

addEventHandler ( "onLoginClick", root, function ( )

	sendClientMessage ( "#CDCDCD"..getElementData(source,"char:name")..' #00FF00Entered.', root, 255, 255, 255, false )
end )

addEventHandler ( 'onPlayerQuit', root, function ( tp, reason, respons )
	sendClientMessage ( "#CDCDCD"..getElementData(source,"char:name").." #FF0000Leaved. ", root, 255, 255, 255, false )
end )

addEventHandler ( 'onPlayerWasted', root, function ( totalAmmo, killer, killerWeapon, bodypart, stealth)
	if killer then
		--sendClientMessage ( "#CDCDCD"..getPlayerName(killer).." #FFFFFFmatou #CDCDCD" ..getPlayerName(source),  root, 255, 255, 255, false )
	else
		sendClientMessage ( "#CDCDCD"..getElementData(source,"char:name").." #FFFFFFWasted.",  root, 255, 255, 255, false )
	end
end )



--[[
function onChat ( message, messageType )
	local curMaxPlayers = getMaxPlayers()

	if curMaxPlayers == 0 then

		cancelEvent()
	end
end
addEventHandler ( "onPlayerJoin", getRootElement(), onJoin)
]]--



--[[

addEventHandler( "onPlayerConnect", getRootElement(),
    function ( _,_,_,_, clientVersion )
		local curMaxPlayers = getPlayerCount()
		if curMaxPlayers >= 150 then
            cancelEvent( true, "SE VOCÊ RECEBEU ESSA MENSAGEM É SÓ UM TESTE!" );
        end
    end
)
]]--