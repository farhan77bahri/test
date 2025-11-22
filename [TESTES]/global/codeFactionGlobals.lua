function SendMessageToTeam(theTeam, uzenet, r, g, b)
	if not r then r = 255 end
	if not g then g = 255 end
	if not b then b = 255 end
	local CsapatID = getTeamFromName( tostring(theTeam) )
	if ( CsapatID ) then
		local teamPlayers = getPlayersInTeam( CsapatID )
		for k, v in ipairs(teamPlayers) do
			outputChatBox(uzenet, v, r, g, b,true)
		end
		return true
	else
		return false
	end
end

function FrakcioUzenet(theTeam, uzenet, r, g, b)
	if not r then r = 255 end
	if not g then g = 255 end
	if not b then b = 255 end
	local CsapatID = getTeamFromName( tostring(theTeam) )
	if ( CsapatID ) then
		local teamPlayers = getPlayersInTeam( CsapatID )
		for k, v in ipairs(teamPlayers) do
			outputChatBox(uzenet, v, r, g, b,true)
		end
		return true
	else
		return false
	end
end