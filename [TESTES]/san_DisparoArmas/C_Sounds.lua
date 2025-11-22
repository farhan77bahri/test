function disableSounds()
setAmbientSoundEnabled( "gunfire", false )
end
addEventHandler("onClientResourceStart",root,disableSounds)

--[[local function playGunfireSound(weaponID)
    local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(localPlayer)
    --local px, py, pz = getElementPosition ( localPlayer )
    local mode = getElementData(localPlayer, "silencedmode")
	--local localPlayer = getLocalPlayer()
      -- if weaponID == 22 then --colt45
        --	local sound = playSound3D("sounds/weap/Colt45.mp3", muzzleX, muzzleY, muzzleZ, false)
        --	setSoundMaxDistance(sound, 60)
	if weaponID == 23 then
	--local mode = getElementData(localPlayer, "silencedmode")
	--local localPlayer = getLocalPlayer()
	--if   mode == 1 and getElementData(localPlayer, "silencedmode") then return end
	        local sound = playSound3D("sounds/weap/Silenced.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 60)
			

	elseif  weaponID == 24 then 
		--deagle
            x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
	
	        local sound = playSound3D("sounds/weap/Deagle.mp3", x,y,z , false)
        	setSoundMaxDistance(sound, 9)
	
	elseif weaponID == 25 then--shotgun
	        local sound = playSound3D("sounds/weap/Shotgun.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 26 then--sawn-off
	        local sound = playSound3D("sounds/weap/Sawed-Off.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 27 then--combat shotgun
	        local sound = playSound3D("sounds/weap/Combat Shotgun.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 28 then--uzi
	        local sound = playSound3D("sounds/weap/UZI.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 32 then--tec-9
	        local sound = playSound3D("sounds/weap/tec9.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 29 then--mp5
	        local sound = playSound3D("sounds/weap/MP5.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 30 then--ak47
	        local sound = playSound3D("sounds/weap/AK-47.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 10)
	elseif weaponID == 31 then--m4
	        local sound = playSound3D("sounds/weap/M4.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 33 then--rifle
	        local sound = playSound3D("sounds/weap/Rifle.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
	elseif weaponID == 34 then--sniper
	        local sound = playSound3D("sounds/weap/Sniper.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 40)
    end
end
addEventHandler("onClientPlayerWeaponFire", root, playGunfireSound)

]]
function shakeCamera(weapon)
	x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
	--if weapon == 22  then 
	--	createExplosion ( x,y,z + 10,12,false,0.1,false)
	if weapon == 24  then 
		createExplosion ( x,y,z + 10,12,false,0.2,false)
	elseif weapon == 25  then 
		createExplosion ( x,y,z + 10,12,false,0.4,false)
		elseif weapon == 23  then 
		createExplosion ( x,y,z + 10,12,false,0.15,false)
	elseif weapon == 26  then
		createExplosion ( x,y,z + 10,12,false,0.5,false)
	elseif weapon == 27  then 
		createExplosion ( x,y,z + 10,12,false,0.3,false)
	elseif weapon == 28  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 29  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 30  then 
		createExplosion ( x,y,z+10,12,false,0.1,false)
        elseif weapon == 31  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 33  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 22  then
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 28  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 32  then 
		createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 38  then 
		createExplosion ( x,y,z + 10,12,false,0.4,false)
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), shakeCamera )


