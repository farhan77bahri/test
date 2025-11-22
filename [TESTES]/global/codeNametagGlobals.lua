

function updateNametagColor(jatekos)
	local admin = getElementData( jatekos, "adminlevel" )
	local adminduty = getElementData(jatekos, "adminduty")
	local loggedin = getElementData(jatekos, "loggedin")
	local vip = tonumber(getElementData(jatekos, "vip"))
	
	if not (loggedin) or (loggedin == 0) then
		setPlayerNametagColor ( jatekos, 160, 160, 160 )
	elseif not (admin) or (admin == 0) then
		setPlayerNametagColor ( jatekos, 255, 255, 255 )
	 elseif (adminduty) and (adminduty == 1) then
		 setPlayerNametagColor ( jatekos, 255, 45, 14 )
	else
		if (vip) and (vip == 1) then
			setPlayerNametagColor ( jatekos, 0, 255, 0 )
		else
			setPlayerNametagColor ( jatekos, 255, 255, 255 )
		end
	end
end