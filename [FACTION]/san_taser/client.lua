if fileExists("client.lua") then 
	fileDelete("client.lua")
end

if fileExists("client.luac") then 
	fileDelete("client.luac")
end


function loadTaser()

	engineImportTXD (engineLoadTXD("data/taser.txd"), 347)
	engineReplaceModel(engineLoadDFF("data/taser.dff", 347), 347)
end

addEventHandler("onClientResourceStart", getResourceRootElement(), loadTaser)

--addCommandHandler("tezer",
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), 
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
   
	if weapon == 23 and getElementType(localPlayer)=="player" then 
		local px, py, pz = getElementPosition(localPlayer)
		local distance = getDistanceBetweenPoints3D(hitX, hitY, hitZ, px, py, pz)
		
		if (distance<10) then
			fxAddSparks(hitX, hitY, hitZ, 1, 1, 1, 1, 10, 0, 0, 0, true, 3, 1)
		end
		playSoundFrontEnd(38)
		triggerServerEvent("tazerFired", localPlayer, hitX, hitY, hitZ, hitElement) 
	end

end)

function showTazerEffect(x, y, z, player)
	fxAddSparks(x, y, z, 1, 1, 1, 1, 100, 0, 0, 0, true, 3, 2)
	playSoundFrontEnd(38)
end
addEvent("showTazerEffect", true )
addEventHandler("showTazerEffect", getRootElement(), showTazerEffect)


function cancelTazerDamage(attacker, weapon, bodypart, loss)


	if (weapon==23)  then
	
		cancelEvent()
	
	end

end
addEventHandler("onClientPlayerDamage", localPlayer, cancelTazerDamage)
