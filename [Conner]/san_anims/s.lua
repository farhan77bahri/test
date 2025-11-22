
Timer = {}


function setJobAnimation (ped, block, anim, time, loop, update, inter, freeze)
        if ( ped and block ) then
			if ( anim == "phone_out" or anim == "phone_in" ) and ( getElementData(ped, "anims.setAnim") == false ) then
				setPedAnimation(ped, block, anim, time, loop, update, inter, freeze)
			return end --Droid bug fix 
			if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
            setElementData(ped, "anims.setAnim", true)
            setPedAnimation(ped, block, anim, time, loop, update, inter, freeze)
			if not (loop or freeze) and not ( anim == "crry_prtial" ) then
				Timer[ped] = setTimer(function(ped)
				if not isElement(ped) then return end
				setElementData(ped, "anims.setAnim", false)
				end,time,1,ped)
			elseif loop or freeze or ( anim == "crry_prtial" ) then
				Timer[ped] = setTimer(function(ped)
				if not isElement(ped) then return end
				setElementData(ped, "anims.setAnim", false)
				end,120000,1,ped) --as we dont know the time then...2mins
			end
            -- outputDebugString("Data set")

    else
		if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
        setPedAnimation(ped, false)
        setElementData(ped, "anims.setAnim", false)
        -- outputDebugString("Data removed")
        end
    end