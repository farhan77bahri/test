
function clickTheTruck ( button, state, _, _, _, _, _, clickCar)
  if button == "left" and state == "down" then
	if ( clickCar ) then
		if ( getElementType ( clickCar ) == "vehicle" ) then
	     	local cx, cy, cz = getElementPosition ( clickCar )
	     	local px, py, pz = getElementPosition ( localPlayer )
	     	local distance	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
	        if ( distance <= 5 ) then
			     triggerServerEvent ( "san:Galao", root, localPlayer, clickCar )
		        end
	        end
        end
    end
end
addEventHandler ( "onClientClick", root, clickTheTruck)