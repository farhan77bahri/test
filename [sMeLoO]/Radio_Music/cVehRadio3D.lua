radioSound = { }

addEventHandler("onClientResourceStart", resourceRoot,
	function()
		bindKey("r", "down", clientToggleRadio)
	end
)



addEventHandler("onClientSoundStream", root,
function(success, length, streamName)
		    if streamName then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
			if radioSound[veh] == nil then return end
			if radioSound[veh].soundElement == source then
			end
		end
	end
 end
)

addEventHandler("onClientSoundChangedMeta", root,
function(streamTitle)
		     if streamTitle then
			 local veh = getPedOccupiedVehicle(getLocalPlayer())
			 if veh then
			 if radioSound[veh] == nil then return end
			 if radioSound[veh].soundElement == source then
			 outputChatBox("#696969Música: #AA2222 " .. streamTitle, 255, 255, 255, true)
		  end
	   end
	end
 end
)


addEventHandler("onClientVehicleEnter", root,
	function(thePlayer, seat)
		if thePlayer == getLocalPlayer() then
			local msg = "Aperte 'R' para ligar a Radio. Bom Jogo"
			if radioSound[source] == nil then
				outputChatBox(msg, 124, 252, 0)
			else
				if radioSound[source].soundElement == nil then
					outputChatBox(msg, 124, 252, 0)
				end
			end
		end
	end
)

addEventHandler("onClientSoundStream", root,
	function(success, length, streamName)
		if streamName then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
				if radioSound[veh] == nil then return end
				if radioSound[veh].soundElement == source then
					outputChatBox("#FF6000Rádio: #FFFFFF " .. streamName, 0, 0, 0, true)
				end
			end
		end
	end
)
addEventHandler("onClientSoundChangedMeta", root,
	function(streamTitle)
		if streamTitle then
			local veh = getPedOccupiedVehicle(getLocalPlayer())
			if veh then
				if radioSound[veh] == nil then return end
				if radioSound[veh].soundElement == source then
					outputChatBox("#FF6000Música: #FFFFFF " .. streamTitle, 0, 0, 0, true)
				end
			end
		end
	end
)

addEvent("onServerToggleRadio", true)
addEventHandler("onServerToggleRadio", getLocalPlayer(), 
	function(toggle, url, veh, volume)	
		if not isElement(veh) then
			if radioSound[veh] ~= nil then
				stopSound(radioSound[veh].soundElement)
				radioSound[veh].soundElement = nil
			end
			return
		end
		
		if toggle == true then
			local x, y, z = getElementPosition(veh)
			if radioSound[veh] ~= nil then
				if (radioSound[veh].soundElement) then 
				stopSound(radioSound[veh].soundElement)
				end

				local sound = playSound3D(url, x, y, z)
				if volume ~= nil then
					setSoundVolume(sound, volume)
				end

				applyDopplerEffectToSound(sound) 



				setSoundMaxDistance(sound, 20.0)
				attachElements(sound, veh)
				
				radioSound[veh] = { }
				radioSound[veh].soundElement = sound
			else
				local sound = playSound3D(url, x, y, z)
				if volume ~= nil then
					setSoundVolume(sound, volume)
				end
				applyDopplerEffectToSound(sound) 
				setSoundMaxDistance(sound, 20.0)
				attachElements(sound, veh)
				
				radioSound[veh] = { }
				radioSound[veh].soundElement = sound
			end
		else
			if radioSound[veh] ~= nil then
				if (radioSound[veh].soundElement) then 
				stopSound(radioSound[veh].soundElement)
				end
				radioSound[veh].soundElement = nil
			end
		end
	end
)

addEvent("onServerRadioURLChange", true)
addEventHandler("onServerRadioURLChange", getLocalPlayer(), 
	function(newurl, veh, volume)
		if radioSound[veh] ~= nil then
			if (radioSound[veh].soundElement) then 
			stopSound(radioSound[veh].soundElement)
			end
			
			local x, y, z = getElementPosition(veh)
			local sound = playSound3D(newurl, x, y, z)
			if volume ~= nil then
				setSoundVolume(sound, volume)
			end
			applyDopplerEffectToSound(sound) 
				setSoundMaxDistance(sound, 20.0)
			attachElements(sound, veh)
		
			radioSound[veh] = { }
			radioSound[veh].soundElement = sound
		end
	end
)

addEvent("onServerVolumeChangeAccept", true)
addEventHandler("onServerVolumeChangeAccept", getLocalPlayer(), 
	function(veh, newVolume)
		if veh then
			if radioSound[veh] ~= nil then
				setSoundVolume(radioSound[veh].soundElement, newVolume)
			end
		end
	end
)

function clientToggleRadio()
	triggerServerEvent("onPlayerToggleRadio", getLocalPlayer())
end













local map_setSoundProperty = {["SampleRate"] = 1, ["Tempo"] = 2, ["Pitch"] = 3, ["Reversed"] = 4} 
function setSoundProperty(sound, property, value) 
    -- Only handle sound elements 
    if (not isElement(sound) or getElementType(sound) ~= "sound") then return end 
  
    -- Get the current properties 
    local properties = { getSoundProperties(sound) } 
  
    -- Get the index by using the property parameter 
    local index = map_setSoundProperty[property] 
  
    -- Apply the value if there is an index for it 
    if (index) then properties[index] = tonumber(value) end 
  
    -- Return the property-success boolean 
    return setSoundProperties(sound, unpack(properties)) 
end 
  
function applyDopplerEffectToSound(sound) 
    -- Get the receiver (use localPlayer if we have no vehicle) 
    local receiver = { e = getPedOccupiedVehicle(localPlayer) } 
    if (not receiver.e) then receiver.e = localPlayer end 
     
    -- Get the sender (abort if it's invalid or if it equals to the receiver) 
    local sender = { e = getElementAttachedTo(sound) } 
    if (not sender.e or sender.e == receiver.e) then return end 
  
    -- Receiver information 
    receiver.p = { getElementPosition(receiver.e) } 
    receiver.v = { getElementVelocity(receiver.e) } 
  
    -- Sender information 
    sender.p = { getElementPosition(sender.e) } 
    sender.v = { getElementVelocity(sender.e) } 
  
    -- Distance calculation (abort if there is no distance) 
    local dx, dy, dz, d = getDistanceBetweenPoints(receiver.p, sender.p) 
    if (d < 1) then return end 
  
    -- Calculate velocity dotproduct for receiver and sender 
    sender.vs = getVelocityDotproduct(sender.v, dx, dy, dz, d) 
    receiver.vr = getVelocityDotproduct(receiver.v, dx, dy, dz, d) 
  
    -- Calculate pitch 
    local p = ((1 + receiver.vr) / (1 + sender.vs)) * (4.5 * math.max(0, sender.vs - receiver.vr)) 
    setSoundProperty(sound, "Pitch", p) 
end 
  
function getDistanceBetweenPoints(pointA, pointB) 
    local x, y, z = math.abs(pointB[1] - pointA[1]), math.abs(pointB[2] - pointA[2]), math.abs(pointB[3] - pointA[3]) 
    local distance = getDistanceBetweenPoints3D(pointA[1], pointA[2], pointA[3], unpack(pointB)) 
    return x, y, z, distance 
end 
  
function getVelocityDotproduct(point, dx, dy, dz, d) 
    if (d == 0) then return 1 end 
    return (math.abs(point[1] * dx) + math.abs(point[2] * dy) + math.abs(point[3] * dz)) / d 
end 