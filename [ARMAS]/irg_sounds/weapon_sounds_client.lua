--Ez egy egyszeru script
--Fegyver hangok WLS-hez
local fegyverhang = true

function onClientPlayerWeaponFire ( weapon )
	local wX, wY, wZ = getPedWeaponMuzzlePosition ( getLocalPlayer() )
	if fegyverhang then
		if weapon == 22 then--colt45
			playSound ( "sounds/Colt45.wav", false )
		elseif weapon == 23 then--silenced
			playSound ( "sounds/Silenced.wav", false )
		elseif weapon == 24 then--deagle
			playSound ( "sounds/Deagle.wav", false )
		elseif weapon == 25 then--shotgun
			playSound ( "sounds/Shotgun.wav", false )
		elseif weapon == 26 then--sawn-off
			playSound ( "sounds/Sawed-Off.wav", false )
		elseif weapon == 27 then--combat shotgun
			playSound ( "sounds/Combat Shotgun.wav", false )
		elseif weapon == 32 then--tec-9
			playSound ( "sounds/TEC9.wav", false )
		elseif weapon == 28 then--uzi
			playSound ( "sounds/uzi.wav", false )
		elseif weapon == 29 then--mp5
			playSound ( "sounds/MP5.wav", false )
		elseif weapon == 31 then--m4
			playSound ( "sounds/M4.wav", false )
		elseif weapon == 30 then--ak47
			playSound ( "sounds/AK47.wav", false )
		elseif weapon == 33 then--rifle
			playSound ( "sounds/Rifle.wav", false )
		elseif weapon == 34 then--sniper
			playSound ( "sounds/Sniper.wav", false )
		end 
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getRootElement(), onClientPlayerWeaponFire )


function getWeaponSound()
	return fegyverhang
end

function setWeaponSounds()
	if fegyverhang then
		fegyverhang = false
	else
		fegyverhang = true
	end
end