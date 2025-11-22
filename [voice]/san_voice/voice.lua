-- Voice system
local streamedOut = {}
local BolandGooVehicles = {
	[433] = true,
	[416] = true,
	[427] = true,
	[490] = true,
	[528] = true,
	[407] = true,
	[470] = true,
	[596] = true,
	[598] = true,
	[599] = true,
	[597] = true,
	[601] = true,
}

local ActiveBolandgo = {}

addEventHandler("onClientPreRender", root,
	function ()
        local players = getElementsByType("player") 
        for k, v in ipairs(players) do
			local vecSoundPos = v.position
            local vecCamPos = Camera.position
            local fDistance = (vecSoundPos - vecCamPos).length
            local fMaxVol = v:getData("maxVol") or 5
            local fMinDistance = v:getData("minDist") or 5
            local fMaxDistance = v:getData("maxDist") or 25

            local fPanSharpness = 1.0
            if (fMinDistance ~= fMinDistance * 2) then
                fPanSharpness = math.max(0, math.min(1, (fDistance - fMinDistance) / ((fMinDistance * 2) - fMinDistance)))
            end

            local fPanLimit = (0.65 * fPanSharpness + 0.35)

            local vecLook = Camera.matrix.forward.normalized
            local vecSound = (vecSoundPos - vecCamPos).normalized
            local cross = vecLook:cross(vecSound)
            local fPan = math.max(-fPanLimit, math.min(-cross.z, fPanLimit))

            local fDistDiff = fMaxDistance - fMinDistance;

            local fVolume
            if (fDistance <= fMinDistance) then
                fVolume = fMaxVol
            elseif (fDistance >= fMaxDistance) then
                fVolume = 0.0
            else
                fVolume = math.exp(-(fDistance - fMinDistance) * (5.0 / fDistDiff)) * fMaxVol
            end
            setSoundPan(v, fPan)

            if isLineOfSightClear(localPlayer.position, vecSoundPos, true, true, false, true, false, true, true, localPlayer) then 
				if getElementData(getLocalPlayer(),"TalkingTo") and getElementData(v,"TalkingTo") then 
					if getElementData(getLocalPlayer(),"TalkingTo") == getPlayerName(v) and getElementData(v,"TalkingTo") == getPlayerName(getLocalPlayer()) then 
						fVolume = 10 
						setSoundPan(v,0)
					end
				end
				if getElementData(getLocalPlayer(),"PlayerRadioChannel") and getElementData(v,"PlayerRadioChannel") then 
					if tonumber(getElementData(getLocalPlayer(),"PlayerRadioChannel")) == tonumber(getElementData(v,"PlayerRadioChannel")) then 
						fVolume = 10 
						setSoundPan(v,0)
					end
				end
				----------------------------------------------------------------
				local PlayerVehicle = getPedOccupiedVehicle(v) 
				if PlayerVehicle then
					if BolandGooVehicles[tonumber(getElementModel(PlayerVehicle))] and ActiveBolandgo[PlayerVehicle] then
						local x,y,z = getElementPosition(getLocalPlayer())
						local xx,yy,zz = getElementPosition(v)
						local fasele = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
						if fasele < 30 then
							fVolume = 30
							setSoundPan(v,0)
						end
					end
				end
				----------------------------------------------------------------

                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", false)
            else
                local fVolume = fVolume * 0.5 
                local fVolume = fVolume < 0.01 and 0 or fVolume 
				if getElementData(getLocalPlayer(),"TalkingTo") and getElementData(v,"TalkingTo") then 
					if getElementData(getLocalPlayer(),"TalkingTo") == getPlayerName(v) and getElementData(v,"TalkingTo") == getPlayerName(getLocalPlayer()) then 
						fVolume = 10 
						setSoundPan(v,0)
					end
				end
				if getElementData(getLocalPlayer(),"PlayerRadioChannel") and getElementData(v,"PlayerRadioChannel") then 
					if tonumber(getElementData(getLocalPlayer(),"PlayerRadioChannel")) == tonumber(getElementData(v,"PlayerRadioChannel")) then 
						fVolume = 10 
						setSoundPan(v,0)
					end
				end
				----------------------------------------------------------------
				local PlayerVehicle = getPedOccupiedVehicle(v) 
				if PlayerVehicle then
					if BolandGooVehicles[tonumber(getElementModel(PlayerVehicle))] and ActiveBolandgo[PlayerVehicle] then
						local x,y,z = getElementPosition(getLocalPlayer())
						local xx,yy,zz = getElementPosition(v)
						local fasele = getDistanceBetweenPoints3D(x,y,z,xx,yy,zz)
						if fasele < 30 then
							fVolume = 30
							setSoundPan(v,0)
						end
					end
				end
				----------------------------------------------------------------
                setSoundVolume(v, fVolume)
                setSoundEffectEnabled(v, "compressor", true)
            end
        end
    end
, false)


bindKey("f6","down",function()
	local vehicle = getPedOccupiedVehicle(getLocalPlayer())
	if not vehicle then return end
	if not BolandGooVehicles[tonumber(getElementModel(vehicle))] then return end
	if ActiveBolandgo[vehicle] then 
		ActiveBolandgo[vehicle] = nil
		outputChatBox("Bolandgo Mashin Ghey're Fa'al Shod !",255,0,0)
	else
		ActiveBolandgo[vehicle] = true
		outputChatBox("Bolandgo Mashin Fa'al Shod !",0,255,0)
	end
end)
