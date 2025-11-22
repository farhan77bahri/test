----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 09 May 2014
-- Resource: GTIrentalUI/rent_panel.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

local LABEL_OFFSET = 0.80	-- Label Offset from Disk Pickup
local restrictions = {}		-- Restriction Table for Gridlist
local weap_restrict = {}	-- Restriction Table for Weapons List
local sourcePickup			-- The current associated pickup

addEvent("onClientVehicleRent", true)
addEvent("onClientRentalVehicleHide", true)

-- Location Data
----------------->>

function renderPickupNames()
	for i,pickup in ipairs(getElementsByType("pickup", resourceRoot, true)) do
		local px, py, pz = getCameraMatrix()
		local name = getElementData(pickup, "name")
		local color = split(getElementData(pickup, "color"), ",")
		if (name and color) then			
			local tx, ty, tz = getElementPosition(pickup)
			tz = tz + LABEL_OFFSET
			local dist = getDistanceBetweenPoints3D(px, py, pz, tx, ty, tz)
			if (dist < 15) then
				if (isLineOfSightClear(px, py, pz, tx, ty, tz, true, true, false, true, true, false, false)) then
					local x,y = getScreenFromWorldPosition(tx, ty, tz)
					if (x) then
						local tick = getTickCount()/360
						local hover = math.sin(tick) * 10
						dxDrawText(name, x+1, y+1+hover, x+1, y+1+hover, tocolor(0,0,0), 1, "clear", "center", "center")
						dxDrawText(name, x, y+hover, x, y+hover, tocolor(color[1],color[2],color[3]), 1, "clear", "center", "center")
					end
				end
			end
		end
	end
end
addEventHandler("onClientRender", root, renderPickupNames)

-- Display Rental Panel
------------------------>>

function displayRentPanel(vehicleTbl, weaponsTbl, hasRental, ownedWeapons)
	sourcePickup = source
		-- Compile Vehicle Gridlist
	guiGridListClear(rentalGUI.gridlist[1])
	for i,v in ipairs(vehicleTbl) do
		local vehicleID = v[1]
		local row = guiGridListAddRow(rentalGUI.gridlist[1])
		guiGridListSetItemText(rentalGUI.gridlist[1], row, 1, vehicleID, false, true)
		local vehicleName = getVehicleNameFromModel(tonumber(vehicleID))
		guiGridListSetItemText(rentalGUI.gridlist[1], row, 2, vehicleName, false, false)
		local hr_cost = v[4]
		guiGridListSetItemText(rentalGUI.gridlist[1], row, 3, (v[5] and "$"..exports.bgo_util:tocomma(hr_cost).."/hr" or "Free"), false, false)
		-- Turn non-selectable items red
		if (not v[2]) then
			for col=1,3 do
				guiGridListSetItemColor(rentalGUI.gridlist[1], i-1, col, 255, 25, 25)
			end
		end
		
		restrictions[row] = v[3]
	end
		-- Compile Weapons Gridlist
	guiGridListClear(rentalGUI.gridlist[2])
	for i,v in ipairs(weaponsTbl) do
		local weaponID = v[1][1]
		local weaponAmmo = v[1][2]
		local row = guiGridListAddRow(rentalGUI.gridlist[2])
		guiGridListSetItemText(rentalGUI.gridlist[2], row, 1, getWeaponNameFromID(weaponID), false, false)
		guiGridListSetItemText(rentalGUI.gridlist[2], row, 2, weaponAmmo, false, false)
		-- Turn non-selectable items red
		if (not v[2]) then
			guiGridListSetItemColor(rentalGUI.gridlist[2], row, 1, 255, 25, 25)
			guiGridListSetItemColor(rentalGUI.gridlist[2], row, 2, 255, 25, 25)
		end
		
		weap_restrict[row] = v[3]
	end
	
	updateStoredWeapons(ownedWeapons)
	
	if (hasRental) then
		guiSetEnabled(rentalGUI.button[2], true)
	else
		guiSetEnabled(rentalGUI.button[2], false)
	end
	
	guiSetText(rentalGUI.label[2], "")
	guiSetVisible(rentalGUI.window[1], true)
	showCursor(true)
end
addEvent("GTIrentalUI.displayRentPanel", true)
addEventHandler("GTIrentalUI.displayRentPanel", root, displayRentPanel)

function hideRentPanel(button, state)
	if (button ~= "left" or state ~= "up") then return end
	restrictions = {}
	guiSetVisible(rentalGUI.window[1], false)
	showCursor(false)
end
addEventHandler("onClientGUIClick", rentalGUI.button[3], hideRentPanel, false)
addEventHandler("onClientGUIClick", rentalGUI.button[6], hideRentPanel, false)

addEventHandler("onClientVehicleRent", root, function()
	hideRentPanel("left", "up")
end)

addEvent("onClientPlayerQuitJob", true)
addEventHandler("onClientPlayerQuitJob", localPlayer, function()
	hideRentPanel("left", "up")
end)

-- Update Permissions
---------------------->>

function updateVehiclePerm(button)
	if (button ~= "left") then return end
	
	local row,col = guiGridListGetSelectedItem(rentalGUI.gridlist[1])
	if (not row or row == -1) then return end
	
	local rstn = restrictions[row]
	local rString = ""
	if (rstn) then
		for i,v in ipairs(restrictions[row]) do
			local rstns = split(v, ";")
			if (rString == "") then
				rString = "L"..rstns[2].." "..rstns[1].."s"
			else
				rString = rString..", L"..rstns[2].." "..rstns[1].."s"
			end
		end
		guiSetText(rentalGUI.label[2], "Este veículo é restrito aos seguintes grupos:\n"..rString)
	else
		guiSetText(rentalGUI.label[2], "")
	end	
end
addEventHandler("onClientGUIClick", rentalGUI.gridlist[1], updateVehiclePerm, false)

-- Rent Vehicle
---------------->>

function rentVehicleToPlayer(button)
	if (button ~= "left") then return end
	local row,col = guiGridListGetSelectedItem(rentalGUI.gridlist[1])
	if (not row or row == -1) then return end
	local id = guiGridListGetItemText(rentalGUI.gridlist[1], row, 1)
	triggerServerEvent("GTIrentalUI.rentVehicleToPlayer", resourceRoot, tonumber(id), sourcePickup)
end
addEventHandler("onClientGUIClick", rentalGUI.button[1], rentVehicleToPlayer, false)

-- Return Vehicle
------------------>>

function returnVehicle(button)
	if (button ~= "left") then return end
	triggerServerEvent("GTIrentalUI.returnVehicle", resourceRoot)
	guiSetEnabled(rentalGUI.button[2], false)
end
addEventHandler("onClientGUIClick", rentalGUI.button[2], returnVehicle, false)

-- Exchange Weapon
------------------->>

function exchangeWeapon(button)
	if (button ~= "left") then return end
	local row,col = guiGridListGetSelectedItem(rentalGUI.gridlist[2])
	if (not row or row == -1) then return end
	local weap_name = guiGridListGetItemText(rentalGUI.gridlist[2], row, 1)
	local ammo = guiGridListGetItemText(rentalGUI.gridlist[2], row, 2)
	
	triggerServerEvent("GTIrentalUI.exchangeWeapon", sourcePickup, weap_name, ammo)
end
addEventHandler("onClientGUIClick", rentalGUI.button[4], exchangeWeapon, false)

function updateStoredWeapons(weapons)
	guiGridListClear(rentalGUI.gridlist[3])
	for i,weap in ipairs(weapons) do
		local weaponID = weap[1]
		local weaponAmmo = weap[2]
		local row = guiGridListAddRow(rentalGUI.gridlist[3])
		guiGridListSetItemText(rentalGUI.gridlist[3], row, 1, getWeaponNameFromID(weaponID), false, false)
		guiGridListSetItemText(rentalGUI.gridlist[3], row, 2, weaponAmmo, false, false)
	end
end
addEvent("GTIrentalUI.updateStoredWeapons", true)
addEventHandler("GTIrentalUI.updateStoredWeapons", root, updateStoredWeapons)

-- Take Back Weapon
-------------------->>

function takeBackWeapon(button)
	if (button ~= "left") then return end
	local row,col = guiGridListGetSelectedItem(rentalGUI.gridlist[3])
	if (not row or row == -1) then return end
	local weap_name = guiGridListGetItemText(rentalGUI.gridlist[3], row, 1)
	local ammo = guiGridListGetItemText(rentalGUI.gridlist[3], row, 2)
	
	triggerServerEvent("GTIrentalUI.takeBackWeapon", resourceRoot, weap_name, tonumber(ammo))
end
addEventHandler("onClientGUIClick", rentalGUI.button[5], takeBackWeapon, false)
