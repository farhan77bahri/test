local maxDistanceToOpen = 2

local components = {
    {"bonnet_dummy", 0, "motorháztető"},
    {"boot_dummy", 1, "csomagtartó"},
    {"door_lf_dummy", 2, "bal első"},
    {"door_rf_dummy", 3, "jobb első"},
    {"door_lr_dummy", 4, "bal hátsó"},
    {"door_rr_dummy", 5, "jobb hátsó"},
}

function boneBreaked(e)
    --char >> bone felépítése = {Has, Bal kéz, Jobb kéz, Bal láb, Jobb láb}
    local bone = getElementData(e, "char >> bone") or {true, true, true, true, true}
    if not bone[2] or not bone[3] then 
        return true
    end
    return false
end

function getNearbyVehicle(e)
    if e == localPlayer then
        local shortest = {5000, nil, nil}
        local px,py,pz = getElementPosition(localPlayer)
        for k,v in pairs(getElementsByType("vehicle", root, true)) do
            local locked = isVehicleLocked(v, vehicle)
            local x,y,z = getElementPosition(v)
            local firstDist = getDistanceBetweenPoints3D(x,y,z,px,py,pz)
            if firstDist < 4 then
                for k2,v2 in pairs(components) do
                    local x,y,z = getVehicleComponentPosition(v, v2[1], "world")
                    if x and y and z then
                        local dist = getDistanceBetweenPoints3D(x,y,z,px,py,pz)
                        if v2[1] == "bonnet_dummy" then
                            if dist < shortest[1] and dist < 3 and not locked then
                                shortest = {dist, v, v2}
                            end
                        else
                            if dist < shortest[1] and dist < maxDistanceToOpen and not locked then
                                shortest = {dist, v, v2}
                            end
                        end
                    end
                end
            end
        end
        if not shortest[2] or shortest[2] and not isElement(shortest[2]) then
            return false
        else
            return shortest
        end
    end
end

function interactVeh()
    if isTimer(spamTimer) then return end
    spamTimer = setTimer(function() end, 600, 1)
    if boneBreaked(localPlayer) then return end
	if isCursorShowing() then return end
    if getPedWeapon(localPlayer) ~= 0 then return end
    if not getPedOccupiedVehicle(localPlayer) then
        local veh = getNearbyVehicle(localPlayer)
        if veh then
            local dist, element, componentDetails = unpack(veh)
            local newState = getVehicleDoorOpenRatio(element, componentDetails[2]) == 1
            triggerServerEvent("changeDoorState2", localPlayer, element, componentDetails[2], newState)
            if not newState then
                if componentDetails[2] >= 2 then
                    playSound("files/dooropen.mp3")
                else
                    playSound("files/dooropen.mp3")
                end
            else
                if componentDetails[2] >= 2 then
                    playSound("files/doorclose.mp3")
                else
                    playSound("files/doorclose.mp3")
                end
            end
        end
    end
end
bindKey("mouse2", "down", interactVeh)
