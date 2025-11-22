function fadefalse()
	driver = getVehicleOccupant(source)
	fadeCamera ( driver, false, 1, 255, 0, 0 )
	setTimer ( fadetrue, 300, 1 )
end
--Nuevo RADAR
--addEventHandler ( "onVehicleDamage", root, fadefalse )

function fadetrue()
	fadeCamera ( driver, true )
end