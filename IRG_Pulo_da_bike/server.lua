function addHelmetOnEnter ( thePlayer, seat, jacked )
    if ( getElementModel ( source ) == 509 or getElementModel ( source ) == 510 or getElementModel ( source ) == 481 ) then
        toggleAllControls ( thePlayer, false )
		
		toggleControl ( thePlayer, "enter_exit", true )
		toggleControl ( thePlayer, "accelerate", true )
		toggleControl ( thePlayer, "vehicle_left", true )
		toggleControl ( thePlayer, "vehicle_right", true )
		toggleControl ( thePlayer, "brake_reverse", true )
		toggleControl ( thePlayer, "vehicle_mouse_look", true )
		toggleControl ( thePlayer, "steer_forward", true )
		toggleControl ( thePlayer, "steer_back", true )
		toggleControl ( thePlayer, "chatbox", true )
		toggleControl ( thePlayer, "handbrake", true )
		toggleControl ( thePlayer, "horn", true )
		toggleControl ( thePlayer, "screenshot", true )--horn 
    end
end
addEventHandler ( "onVehicleEnter", getRootElement(), addHelmetOnEnter )

function removeHelmetOnExit ( thePlayer, seat, jacked )
    if ( getElementModel ( source ) == 509 or getElementModel ( source ) == 510 or getElementModel ( source ) == 481  ) then
        toggleAllControls ( thePlayer, true )
    end
end
addEventHandler ( "onVehicleExit", getRootElement(), removeHelmetOnExit )