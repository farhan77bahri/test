function stopMinigunDamage ( attacker, weapon, bodypart )
	if ( weapon == 22 ) then --if the weapon used was the minigun
		cancelEvent() --cancel the event
	end
end
addEventHandler ( "onClientPlayerDamage", getLocalPlayer(), stopMinigunDamage )