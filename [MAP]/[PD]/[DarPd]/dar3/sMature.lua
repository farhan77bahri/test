Port1 = createObject ( 2930, 1565.8723144531, -1684.705688476, 18.19532394,-0, 0, 270.35998535156 )
Port2 = createObject (2930,  1567.3723144531, -1684.705688476, 18.19532394,-0, 0, 270.35998535156 )
setElementAlpha(Port1, 0)
setElementAlpha(Port2, 0)


--Port21 = createObject ( 1502, 1571.1127929688, -1676.6706298828, 15.395323944, -0, 0, 89.700416564941 )
Port21 = createObject ( 1499, 1564.343505859, -1684.82455566, 15.195323944,  -0, 0, 360.31262207031 )
--Port22 = createObject ( 1499, 1564.343505859, -1684.82455566, 15.195323944,  -0, 0, 360.31262207031 )
Port22 = createObject ( 1499, 1567.3859863281, -1684.7884521484, 15.195323944, -0, 0, 180.35693359375 )
setElementCollisionsEnabled(Port21, false)
setElementCollisionsEnabled(Port22, false)

colPort1 =  createColSphere(1565.1636962891, -1684.2980957031, 16.195323944092,1)
colPort2 = createColSphere(1566.4058837891, -1684.2989501953, 16.195323944092,1)

open1 = false
open2 = false

function gatePort1 (thePlayer)
     if isElementWithinColShape(thePlayer, colPort1) then
     local gx,gy,gz = getElementPosition(Port1)
		 if (open1 == false) then
		     moveObject (Port1, 100, 1565.8723144531, -1684.705688476, 5.19532394)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 1)
			 setElementCollisionsEnabled(Port21, true)
			 open1 = true
			 else
			 moveObject (Port1, 100, 1565.8723144531, -1684.705688476, 18.19532394)
			 if isElement(Port21) then
			     destroyElement(Port21)
			 end
			 Port21 = createObject ( 1499, 1564.343505859, -1684.82455566, 15.195323944,  -0, 0, 360.31262207031 )
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 1)
			 setElementCollisionsEnabled(Port21, false)
			 open1 = false
		 end
	 end
     if isElementWithinColShape(thePlayer, colPort2) then
     local gx,gy,gz = getElementPosition(Port2)
		 if (open2 == false) then
		    moveObject (Port2, 100, 1567.3723144531, -1684.705688476, 5.19532394)
			 triggerClientEvent(root, "gateStatus", root, "(Unlock)", 2)
			 setElementCollisionsEnabled(Port22, true)
			 open2 = true
			 else
			 moveObject (Port2, 100, 1567.3723144531, -1684.705688476, 18.19532394)
			 if isElement(Port22) then
			     destroyElement(Port22)
			 end
			 triggerClientEvent(root, "gateStatus", root, "(Lock)", 2)
			 Port22 = createObject (   1499, 1567.3859863281, -1684.7884521484, 15.195323944, -0, 0, 180.35693359375 )
			 setElementCollisionsEnabled(Port22, false)
			 open2 = false
		 end
	 end
end


function enterZone (thePlayer)
	 --if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then
		if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then

		setElementData(thePlayer, "zoneInfo3", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort2, enterZone)

function exitZone (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then
if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo3", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort2, exitZone)


function enterZone2 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
		setElementData(thePlayer, "zoneInfo4", true)
		 bindKey( thePlayer, "e","down", gatePort1)
	 end
end
addEventHandler("onColShapeHit", colPort1, enterZone2)

function exitZone2 (thePlayer)
--	 if (getElementData(thePlayer, "char:dutyfaction") == 17 or getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 24 or  getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 21 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 or getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "char:adminduty") == 1) then

if exports.san_dashboard:isPlayerInFaction(thePlayer, 1) or getElementData(thePlayer, "acc:admin") > 20  then
	
		setElementData(thePlayer, "zoneInfo4", false)
		 unbindKey( thePlayer, "e","down", gatePort1) 
	 end
end
addEventHandler("onColShapeLeave", colPort1, exitZone2)


-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



local con = exports.btc_mysql:getConnection()




function prendendo(thePlayer, targetPlayer, timerP, reason)
	local reason = table.concat({reason}, " ")
    if getElementData(targetPlayer, "VIP") then
	     ido = tonumber(timerP) / 2
		 ido = math.floor(ido)
	else
	     ido = tonumber(timerP)
	end
	setElementData(targetPlayer, "player:preso", true)
	if getElementData(targetPlayer, "VIP") then
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. getPlayerName(targetPlayer) .. " #ffffffpor #1a75ff" .. ido .. "#ffffff anos.", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Decreto]:#7cc576 Pelo fato do preso ser VIP a sentença foi alterada: #dc143c(#ffffff"..tonumber(timerP).." anos #ffffffpara " .. ido .. " anos#dc143c)", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 Motivo:#ffffff Os artigos do preso se encontram em sigilo.", root ,255, 255, 255, true)
	else
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. getPlayerName(targetPlayer) .. " #ffffffpor #1a75ff" .. ido .. "#ffffff anos.", root ,255, 255, 255, true)
	outputChatBox("#dc143c[Departamento de policia]:#7cc576 Motivo:#ffffff " .. reason, root ,255, 255, 255, true)
	end

	takeAllWeapons(targetPlayer)
	if exports['btc_items']:hasItemS(targetPlayer, 38) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 38, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 32) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 32, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 64) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 64, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 84) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 84, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 52) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 52, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 50) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 50, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 49) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 49, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 44) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 51) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 51, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 53) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 53, 0)
	end
	if exports['btc_items']:hasItemS(targetPlayer, 44) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end		
	if exports['btc_items']:hasItemS(targetPlayer, 125) then 
	exports['btc_items']:takePlayerItemToID(targetPlayer, 125, 0)
	end		
	local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
	local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
	if isTimer(theTimerCheck) then
		killTimer(theTimerCheck)
	end
	if isTimer(theTimerCheck2) then
		killTimer(theTimerCheck2)
	end
	if isPedInVehicle(targetPlayer) then
		removePedFromVehicle(targetPlayer)
	end
	setElementData(targetPlayer, "player:preso", true)
	fadeCamera(targetPlayer, false, 1.0)
	setElementFrozen(targetPlayer, true)
	if isPedInVehicle(targetPlayer) then
		toggleAllControls(targetPlayer, false, false, false)
	end
	if (getElementData(targetPlayer, "algemado")) then
	     setElementData(targetPlayer, "algemado", false)
	end
	setTimer(function()
		triggerClientEvent(targetPlayer, "triggerAdminjail", targetPlayer, thePlayer, reason, ido, 1, false)
	end, 500, 1)
	setTimer( function()
		local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
		local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
		local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
		local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
		setElementPosition(targetPlayer, 1571.6392822266, -1692.9930419922, 13.589937210083)
		setElementInterior(targetPlayer, 0)
		setElementDimension(targetPlayer, 0)
		local adminjailed = setElementData(targetPlayer, "adminjail", 1)
		local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
		local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
		local admin = setElementData(targetPlayer, "adminjail:admin", getPlayerName(thePlayer))
		local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", getPlayerSerial(thePlayer))
	end, 1500, 1)
	local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 1, reason, ido, ido, getPlayerName(thePlayer), getPlayerSerial(thePlayer))

					
	setTimer(function()
		fadeCamera(targetPlayer, true, 2.5)
		setElementFrozen(targetPlayer, false)
		toggleAllControls(targetPlayer, true, true, true)
	end, 7500, 1)
end
addEvent ("prendendo",true)
addEventHandler ("prendendo", root,  prendendo)



function idoTelikLe(targetPlayer)
	if isElement(targetPlayer) and (getElementType(targetPlayer) == "player") then
		local idoTelik = tonumber(getElementData(targetPlayer, "idoTelik")) or false
		local idoLetelt = tonumber(getElementData(targetPlayer, "idoLetelt")) or false
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "idoTelik", idoTelik-1)
			setElementData(targetPlayer, "idoLetelt", idoLetelt+1)
			if (idoTelik) <= 1 then
				outputChatBox("Sua sentença expirou e Você foi solto!.", targetPlayer, 255, 255, 255, true)
				setElementData(targetPlayer, "player:preso", false)
				local theTimer = getElementData(targetPlayer, "adminjail:theTimer")
				if not (theTimer) then
					return false
				end
				--killTimer(theTimer)
							if (theTimerCheck) then
								killTimer(theTimerCheck)
								setElementData(targetPlayer, "adminjail:timer", false)
							end
							if (theTimerCheck2) then
								killTimer(theTimerCheck2)
								setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
							end	
				setElementData(targetPlayer, "adminjail:theTimer", false)
				local adminjailed = setElementData(targetPlayer, "adminjail", false)
				local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
				local alapido = setElementData(targetPlayer, "adminjail:ido", false)
				local admin = setElementData(targetPlayer, "adminjail:admin", false)
				local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
				local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
				local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
				local setPosition = setTimer(setElementPosition, 2000, 1,targetPlayer, 1580.5162353516, -1683.5106201172, 14.996187210083)
				local setInterior = setElementInterior(targetPlayer, 0)
				local setDimension = setElementDimension(targetPlayer, 0)

								--sql
								local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)

								
			end
		end
	end
end

local prision = createColCuboid(1569.07898, -1695.11023, 12.58994, 13.476196289063, 4.4530029296875, 4.0000003814697)

function exitZ (thePlayer)
     if (getElementData(thePlayer, "player:preso")) then
         outputChatBox("#FFA000*BTC ERROR #FFFFFFVocê ainda está preso!, Aguarde.", thePlayer, 255,255,255, true)
		 setElementPosition(thePlayer, 1571.615, -1692.737, 13.59)
	 end
end
addEventHandler("onColShapeLeave", prision, exitZ)