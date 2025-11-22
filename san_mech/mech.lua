----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: JT Pennington (JTPenn)
-- Date: 03 Jun 2013
-- Resource: GTImech/mech.lua
-- Version: 1.0
----------------------------------------->>

local DIAG_VISIBLE = 10			-- Visible Distance of Diagnosis

local veh_info = {}				-- Table of Vehicle Diagnosis Info
local veh_diag_text = ""		-- dxText
local veh_diag_text_nocol = ""	-- dxText No Color Codes
local mech_name = ""			-- Name of Mechanic that wants to repair your car
local repair_cost = ""			-- Repair Cost (for notice)
local mechanic					-- Mechanic that wants to fix your car
local accept					-- "Accept Repair" GUI Button
local deny						-- "Deny Repair" GUI Button
local rep_vehicle				-- The Vehicle that needs to be repaired
local enable_fire				-- Should fire be renabled?

-- Diagnose Problems
--------------------->>

--exports.san_employment:setPlayerJob(source, "Mecanico", "Mecanico", "37",true)


-- Notify of Repair
-------------------->>

function notifyRepair(button, state, sx, sy, wx, wy, wz, vehicle)
	if (button ~= "right" or state ~= "up") then return end
	if (getElementData(localPlayer, "char:dutyfaction") ~= 3) then return end
	if (not isElement(vehicle) or getElementType(vehicle) ~= "vehicle") then return end
	if (isPedInVehicle(localPlayer)) then
		outputChatBox("* Você deve estar a pé para consertar um veículo.", 255, 25, 25)
		return
	end
	local px, py, pz = getElementPosition(localPlayer)
	local tx, ty, tz = getElementPosition(vehicle)
	local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
	if (dist > 8) then
		exports.san_hud:dm("* Você deve estar mais perto do veículo para repará-lo.", 255, 25, 25)
		return
	end
	if (getElementHealth(vehicle) == 0) then
	triggerServerEvent("GTImech.notifyRepair", vehicle)
	end
end
addEventHandler("onClientClick", root, notifyRepair)

function sendNotice(mech, cost)
	mech_name = getPlayerName(mech)
	mechanic = mech
	rep_vehicle = source
	repair_cost = cost

	if (isElement(accept)) then
		removeEventHandler("onClientGUIClick", accept, acceptRepair)
		destroyElement(accept)
		accept = nil
	end
	if (isElement(deny)) then
		removeEventHandler("onClientGUIClick", deny, denyRepair)
		destroyElement(deny)
		deny = nil
	end

	local sx,sy = guiGetScreenSize()
	accept = guiCreateButton((sx/2)-110, sy/2, 105, 28, "Aceitar", false)
	addEventHandler("onClientGUIClick", accept, acceptRepair)
	deny = guiCreateButton((sx/2)+5, sy/2, 105, 28, "Recusar", false)
	addEventHandler("onClientGUIClick", deny, denyRepair)
	addEventHandler("onClientRender", root, renderNotice)

	showCursor(true, false)
	if (isContolEnabled("fire")) then
		toggleControl("fire", false)
		enable_fire = true
	end
end
addEvent("GTImech.sendNotice", true)
addEventHandler("GTImech.sendNotice", root, sendNotice)

function renderNotice()
	local sx,sy = guiGetScreenSize()
	dxDrawText(mech_name.." quer reparar seu veículo\nCusto de reparo: $"..repair_cost, (sx/2)+1, (sy/2)+1-10, (sx/2)+1, (sy/2)+1-10, tocolor(0, 0, 0, 255), 1.00, "default", "center", "bottom", false, false, true, true, true)
	dxDrawText(mech_name.." quer reparar seu veículo\nCusto de reparo: #19FF19$"..repair_cost, (sx/2), (sy/2)-10, (sx/2), (sy/2)-10, tocolor(255, 255, 255, 255), 1.00, "default", "center", "bottom", false, false, true, true, true)
end

function removeNotice()
	removeEventHandler("onClientRender", root, renderNotice)
	removeEventHandler("onClientGUIClick", accept, acceptRepair)
	destroyElement(accept)
	accept = nil
	removeEventHandler("onClientGUIClick", deny, denyRepair)
	destroyElement(deny)
	deny = nil

	mechanic = nil
	rep_vehicle = nil
	showCursor(false)
	
	if (enable_fire) then
		toggleControl("fire", true)
		enable_fire = nil
	end
end

-- Accept/Deny Repair
---------------------->>

function acceptRepair(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (not isElement(mechanic)) then
		exports.san_hud:dm("O mecânico que quer consertar seu veículo não pode ser encontrado.", 255, 125, 0)
	elseif (not isElement(rep_vehicle)) then
		exports.san_hud:dm("O veículo que você deseja reparar não pode ser encontrado.", 255, 125, 0)
	else
		triggerServerEvent("GTImech.acceptRepair", rep_vehicle, mechanic)
	end
	removeNotice()
end

function denyRepair(button, state)
	if (button ~= "left" or state ~= "up") then return end
	if (not isElement(mechanic)) then
		exports.san_hud:dm("O mecânico que quer consertar seu veículo não pode ser encontrado.", 255, 125, 25)
	else
		triggerEvent("GTImech.noiftyDenialOfRepair", mechanic, localPlayer)
	end
	removeNotice()
end

function noiftyDenialOfRepair(player)
	if (source ~= localPlayer) then return end
	exports.san_help:dm(getPlayeName(player).." recusou o reparo do veículo.", 255, 200, 0)
end
addEvent("GTImech.noiftyDenialOfRepair")
addEventHandler("GTImech.noiftyDenialOfRepair", root, noiftyDenialOfRepair)






--protected="true"
deletefiles = {

            "mech.lua",
}

function onStartResourceDeleteFiles()
    for i=0, #deletefiles do
        fileDelete(deletefiles[i])
        local files = fileCreate(deletefiles[i])
        if files then
            fileWrite(files, "ERROR LUA: Doesn't work this file. Please report on contact in http://www.lua.org/contact.html")
            fileClose(files)
        end
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onStartResourceDeleteFiles)
