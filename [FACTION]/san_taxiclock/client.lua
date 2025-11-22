--Scriptet Írta: Csoki
--SanMTA 2017

if fileExists("client.lua") then
	fileDelete("client.lua")
end
if fileExists("client.luac") then
	fileDelete("client.luac")
end

local sX, sY = guiGetScreenSize()
local width, height = 200, 100
local left, top = sX - width - 15, sY/2 - height/2

local font = dxCreateFont("font.ttf", 25)
local font2 = "default-bold"

local taxi_clock_state = false
local taxi_seat_player = -1
local traveledMeters = -1
local taxi_veh_startX, taxi_veh_startY, taxi_veh_startZ = 0, 0, 0

local isDraggingPanel = false
local windowOffsetX, windowOffsetY = 0, 0
addEventHandler("onClientRender", getRootElement(),
    function()
		--if not getElementData(localPlayer,"togHUD") then return end
        if not taxi_clock_state then return end
        if not conditionToShow() then return end
		
		if isCursorShowing() then
			cursorX, cursorY = getCursorPosition()
			cursorX, cursorY = cursorX * sX, cursorY * sY
		end
		if isDraggingPanel then
			left, top = cursorX + windowOffsetX, cursorY + windowOffsetY
		end
		
		
			local veh = getPedOccupiedVehicle(localPlayer)
			dxDrawRectangle(left, top, width, height, tocolor(0, 0, 0, 130))
			dxDrawBorder(left, top, width, height, 2, tocolor(0, 0, 0, 255))
			local clockState = tonumber(getElementData(veh, "Taxi->clockState") or 0)
			if clockState == 1 then
				dxDrawRectangle(left + 5, top + height - 35, width - 10, 30, tocolor(205, 55, 55, 210))
				dxDrawText("STOP", left + 5, top + height - 35, width - 10 + left + 5, 30 + top + height - 35, tocolor(0, 0, 0, 255), 1.15, font2, "center", "center", false, false, false, true)
			else
				dxDrawRectangle(left + 5, top + height - 35, width - 10, 30, tocolor(124, 197, 118, 210))
				dxDrawText("START", left + 5, top + height - 35, width - 10 + left + 5, 30 + top + height - 35, tocolor(0, 0, 0, 255), 1.15, font2, "center", "center", false, false, false, true)
			end

			local miles = yardToKm(tonumber(getElementData(veh, "Taxi->traveledMeters") or 0))*100
			local ft = math.ceil(miles * 10)*10
			if ft < 10 then
				dxDrawText("#7cc576"..ft.."#fb8293000000000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 100 then
				dxDrawText("#7cc576"..ft.."#fb829300000000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)	
			elseif ft < 1000 then
				dxDrawText("#7cc576"..ft.."#fb82930000000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)	
			elseif ft < 10000 then
				dxDrawText("#7cc576"..ft.."#fb8293000000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 100000 then
				dxDrawText("#7cc576"..ft.."#fb829300000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 1000000 then 
				dxDrawText("#7cc576"..ft.."#fb82930000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 10000000 then
				dxDrawText("#7cc576"..ft.."#fb8293000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 100000000 then
				dxDrawText("#7cc576"..ft.."#fb829300", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 1000000000 then 
				dxDrawText("#7cc576"..ft.."#fb82930", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			elseif ft < 10000000000 then
				dxDrawText("#7cc576"..ft.."#fb8293", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			else 
				dxDrawText("#fb82930000000000", left + width, top + height - 80, left, top, tocolor(255, 255, 255, 200), 1, font, "center", "top", false, false, false, true)
			end
			
			dxDrawText("#f5f018IRG Taxi #FFFFFF- Money($):", left, top, width + left, 20 + top, tocolor(255, 255, 255, 255), 1.2, font2, "center", "center", false, false, false, true)
	end 
)

addEventHandler("onClientClick", getRootElement(),
	function(button, state, x, y, wx, wy, wz, element)
		if button == "left" and state == "down" and x and y then
			if x >= left and x < left + width and y >= top and y < top + 15 then
				windowOffsetX, windowOffsetY = (left) - x, (top) - y
				isDraggingPanel = true
			end
		end

		if button == "left" and state == "up" and isDraggingPanel then
			isDraggingPanel = false
		end 
end)



function dxDrawBorder(x, y, w, h, radius, color)
	dxDrawRectangle(x - radius, y, radius, h, color)
	dxDrawRectangle(x + w, y, radius, h, color)
	dxDrawRectangle(x - radius, y - radius, w + (radius * 2), radius, color)
	dxDrawRectangle(x - radius, y + h, w + (radius * 2), radius, color)
end

addEventHandler("onClientClick", root, function(button, state, absX, absY)
	if button == "left" and state == "down" then
		if not taxi_clock_state then return end
		local veh = getPedOccupiedVehicle(localPlayer)
		if isInBox(left + 5, top + height - 35, width - 10, 30, absX, absY) then
			if isPlayerOnTaxiFaction() and taxi_seat_player == 0 then
				if veh then
					local clockState = tonumber(getElementData(veh, "Taxi->clockState") or 0)
					if clockState == 0 then		
						setElementData(veh, "Taxi->traveledMeters", 0)
						setElementData(veh, "Taxi->clockState", 1)
						taxiCounter(true, veh)
						taxi_veh_startX, taxi_veh_startY, taxi_veh_startZ = getElementPosition(veh)
						return
					else
						setElementData(veh, "Taxi->clockState", 0)
						taxiCounter(false, veh)
						return
					end
				end
			end
		end
	end
end)

local taxiTimer
local oldX, oldY, oldZ = -1, -1, -1
function taxiCounter(state, veh)
	if state then
		if not isTimer(taxiTimer) then
			taxiTimer = setTimer(function()
				if getElementSpeed(veh, "mph") > 0 then
					local current_veh_x, current_veh_y, current_veh_z = getElementPosition(veh)
					if oldX == -1 then
						oldX, oldY, oldZ = current_veh_x, current_veh_y, current_veh_z
					end
					local distance = getDistanceBetweenPoints3D(oldX, oldY, oldZ, current_veh_x, current_veh_y, current_veh_z)

					setElementData(veh, "Taxi->traveledMeters", math.ceil(getElementData(veh, "Taxi->traveledMeters") + math.abs(distance)))
					oldX, oldY, oldZ = current_veh_x, current_veh_y, current_veh_z
				end
			end, 1000,0)
		end
	else
		if isTimer(taxiTimer) then
			killTimer(taxiTimer)
		end
	end
end

function getElementSpeed(element, unit)
	if (unit == nil) then
		unit = 0
	end
	if (isElement(element)) then
		local x, y, z = getElementVelocity(element)

		if (unit == "mph" or unit == 1 or unit == '1') then
			return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 20)
		else
			return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 20 * 1.609344)
		end
	else
		return false
	end
end

function conditionToShow()
	local vehicle = getPedOccupiedVehicle(localPlayer)
    if isPedInVehicle(localPlayer) and vehicle then
		return true
	end
	return false
end

function isPlayerOnTaxiFaction()
	--if tonumber(getElementData(localPlayer, "Char->organization") or 0) ~= 18 then return false end
	return true
end

function yardToKm(yard)
	if yard then
		yard = (yard * 0.0009144) -- 1 yard = 0.0009144 km
	end
	return yard
end

function isInBox(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
            if isPlayerOnTaxiFaction() then
				if getElementModel(source) == 420 then
					taxi_clock_state = true
					taxi_seat_player = seat
				end
			end
        end
    end
)

addEventHandler("onClientVehicleExit", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
           taxi_clock_state = false
        end
    end
)

