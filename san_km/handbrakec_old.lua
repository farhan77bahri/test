function getElementSpeed(element,unit)
	if (unit == nil) then unit = 0 end
	if (isElement(element)) then
		local x,y,z = getElementVelocity(element)
		if (unit=="mph" or unit==1 or unit =='1') then
			return (x^2 + y^2 + z^2) ^ 0.5 * 100
		else
			return (x^2 + y^2 + z^2) ^ 0.5 * 161
		end
	else
		return false
	end
end

addEventHandler ("onClientKey", getRootElement(),
	function (button, press)
		if button == "lalt" and press then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
				if getElementSpeed (veh) < 5 then
					if isElementFrozen(veh) then
						setElementFrozen(veh, false)
						--outputChatBox("Kézifék feloldva!", 0,255,0)
					else
						setElementFrozen(veh, true)
						--outputChatBox("Kézifék behúzva!", 255,0,0)
						playSound("files/handbrake.wav", false)
					end
				end
			end
		end
	end
)