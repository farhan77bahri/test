function getAdmins()
	local players = exports.pool:getPoolElementsByType("player")
	
	local admins = { }
	local count = 1
	
	for key, value in ipairs(players) do
		if isPlayerAdmin(value) and getPlayerAdminLevel(value) <= 100 then
			admins[count] = value
			count = count + 1
		end
	end
	return admins
end

function isRpSeged(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 1
end

function isEgyesAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 2
end

function isKettesAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 3
end

function isHarmasAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 4
end

function isNegyesAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 5
end

function isOtosAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 6
end

function isFoAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 7
end

function isRendszerGazda(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 9
end

function isTulaj(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 10
end

function isSuperAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 8
end

function isScripter(thePlayer)
	return getPlayerAdminLevel(thePlayer) == 11
end

function isVezerScripter(thePlayer)
	return getPlayerAdminLevel(thePlayer) == 12
end

function isPlayerAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 1
end

function isPlayerFullAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 2
end

function isPlayerSuperAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 3
end

function isPlayerHeadAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 5
end

function isPlayerLeadAdmin(thePlayer)
	return getPlayerAdminLevel(thePlayer) >= 4
end

function getPlayerAdminLevel(thePlayer)
	return isElement( thePlayer ) and tonumber(getElementData(thePlayer, "acc:admin")) or 0
end

local titles = { "Staff", "Admin 1", "Admin 2", "Admin 3", "Admin 4", "Admin 5", "principal admin", "Admin de chumbo", "Guarda do Servidor", "proprietário", "Fundador" }
function getPlayerAdminTitle(thePlayer)
	local text = titles[getPlayerAdminLevel(thePlayer)] or "jogador"
	
	local hiddenAdmin = getElementData(thePlayer, "hiddenadmin") or 0
	if (hiddenAdmin==1) then
		text = text .. " (escondido)"
	end

	return text
end

function isPlayerScripter(thePlayer)
	return isScripter(thePlayer)
end


function getPlayerAdminNick(p)  
	return getElementData(p,"anick") or getPlayerName(p):gsub("_"," ")
end
