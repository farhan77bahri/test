fuellessVehicle = { [510]=true, [481]=true, [509]=true, [441]=true, [464]=true, [501]=true, [465]=true, [564]=true, [594]=true }

enginelessVehicle = { [510]=true, [509]=true, [481]=true }
local active = true
local olaj = 0

text = nil

g_screenWidth, g_screenHeight = guiGetScreenSize()

g_ImageW = 512
g_ImageH = 256

blink = false
elinditva = false

local digital = dxCreateFont( "ds-digi.ttf", 14 )
local distancefont = dxCreateFont( "files/distancefont.ttf", 14 )
local opensans = dxCreateFont( "files/opensans.ttf", 64 )
local vehiclestatefont = dxCreateFont( "files/vehiclestatefont.ttf", 14 )

function getVehicleSpeed(veh)
	if veh then
		local x, y, z = getElementVelocity (veh)
		return math.sqrt( x^2 + y^2 + z^2 ) * 187.5
	end
end



function drawSpeedo()
	if active and not isPlayerMapVisible() then
	
		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		if (vehicle) then
--ez nem			speed = exports.sgs_core:getVehicleVelocity(vehicle)
			local width, height = guiGetScreenSize()
			local x = width
			local y = height
			local light = 1
			if getElementData(vehicle, "lights") then
				light = getElementData(vehicle, "lights") + 1
			end
			local speedoX, speedoY = x-280,y-250
           	if getVehicleEngineState ( vehicle, true ) then
			--local streetname = getElementData(getLocalPlayer(), "speedo:street" )
			--if streetname and getVehicleType(vehicle) ~= "Boat" and getVehicleType(vehicle) ~= "Helicopter" and getVehicleType(vehicle) ~= "Plane" then
			--	local width = dxGetTextWidth( streetname )
			--	local x = width < 200 and ( x - 110 - width / 2 ) or ( x - 10 - width )
			--	dxDrawRectangle( x - 8, y - 296-10, width + 17, 24, tocolor( 5, 5, 5, 220 ) )
			--	dxDrawText( streetname, x, y - 292-10 )
			--end
			
			disc = dxDrawImage(speedoX, speedoY, 256, 256, "files/speedo/dash.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)
			fuelka = dxDrawImage(speedoX-104, speedoY, 360, 256, "files/speedo/fuel.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)

			local speed = getVehicleSpeed (vehicle)
			local percentOfAngle = speed/360
			local guageAngle = percentOfAngle * 180
			if speed > 300 then
				guageAngle = 220
			end
			dxDrawImage(speedoX, speedoY, 256, 256, "files/speedo/guage.png", guageAngle, 0, 0, tocolor(255, 255, 255, 255), true)
			
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/left.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			if(getElementData(vehicle, "i:left") and getElementData(vehicle, "i:left") == true) then
				if getTickCount() % 1000 < 500 then
					dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/left_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
					--playSound("files/turnsignal.mp3")
					--playSound("files/turnsignal.mp3", false)
					
				end
			end
			
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/right.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			if(getElementData(vehicle, "i:right") and getElementData(vehicle, "i:right") == true) then
				if getTickCount() % 1000 < 500 then
					dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/right_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
					--turner()
				end
			end
--			dxDrawRectangle( x - 210, y - 70, 128, 24, tocolor( 5, 5, 5, 180 ), false )
			--dxDrawText( tostring(math.floor(getDistanceTraveled(vehicle)/1000)) .. " KM", speedoX, speedoY, 5, 5, tocolor (255,255,255, 200), 1, "pricedown" )
			
			--if getVehicleUpgradeOnSlot(vehicle, 8) == true then
				--dxDrawImage(x - 50, y-318, 30, 66, "files/speedo/nitro/bar.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)
		    --local nitro = getVehicleNitroLevel(vehicle)
			--if nitro > 64 then
			--	nitro = 64
			--end
			--vannitri = nitro+1
			
			--end
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/lightoff.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			if ( getVehicleOverrideLights ( vehicle ) == 2 ) then
				dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/lighton.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
				--local sound = playSound("files/lightswitch.mp3") --by scripti
			    --setSoundVolume(sound, 1)
			end
			
			--dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/checkengine.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			--if getVehicleEngineState ( vehicle, true ) then
				dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/checkengine_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			--end

			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/handbrake.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			if isElementFrozen ( vehicle, true ) then
			--if hand.state == true then
				dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/handbrake_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			end
--lowfuel	
            dxDrawImage(speedoX+188, speedoY-80, 74, 79,"files/speedo/nitro/txt.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/door1.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			if (getElementData(vehicle, "vehicle:windowstat") == 0) then
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/door2.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			end
			
			dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/lowfuel.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			
            --getElementData(vehicle,"fuel"
			
            --dxDrawText ( "Benzin:"..nitro.."/100", speedoX+152, speedoY+146, 8, 20, tocolor ( 255, 255, 255, 255 ), 0.6, "pricedown" )	
--			handbrake = getElementData(vehicle, "kezifek")
--			dxDrawImage(speedoX, speedoY, 400, 400,"files/speedo/handbrake.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
--			if handbrake == true then
--			dxDrawImage(speedoX, speedoY, 400, 400,"files/speedo/handbrake_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
--			end
			--local olaj = getElementData(vehicle,"olajszint")
			
			local speed = ( function( x, y, z ) return math.floor( math.sqrt( x*x + y*y + z*z ) * 155 ) end )( getElementVelocity( vehicle ) )
			local osztospeed = speed

			if (osztospeed < 10) then
			dxDrawText ( "00"..osztospeed.."", speedoX+80, speedoY+90, 40, 40, tocolor ( 255, 255, 255, 255 ), 0.6, opensans )
			elseif (osztospeed > 9) and (osztospeed < 100) then
			dxDrawText ( "0"..osztospeed.."", speedoX+80, speedoY+90, 40, 40, tocolor ( 255, 255, 255, 255 ), 0.6, opensans )
			elseif (osztospeed > 99) and (osztospeed < 1000) then
			dxDrawText ( ""..osztospeed.."", speedoX+80, speedoY+90, 40, 40, tocolor ( 255, 255, 255, 255 ), 0.6, opensans )
			end			
			
			
			dxDrawText ( tostring(math.floor(getDistanceTraveled()/1000)) .." km", speedoX+118, speedoY+74, 20, 20, tocolor ( 255, 255, 255, 255 ), 1, distancefont )
			
			 
			dxDrawText ( getFormatGear(), speedoX+235, speedoY, 20, 20, tocolor ( 255, 0, 0, 255 ), 1.4, vehiclestatefont )
			
			
			local drawFuel = getElementData(vehicle,"veh:fuel") or 100
			--if drawFuel ~= false and drawFuel ~= nil and drawFuel > 0 then
			if drawFuel then
				--local x,y = speedoX + 200, speedoY + 260
				--dxDrawImage (x,y,128,64,"files/speedo/nitro/bg.png")
				local bzkefeles = drawFuel/2
				dxDrawImage(speedoX-25, speedoY-16, 300, 300, "files/speedo/fuelarrow.png", bzkefeles, 0, 0, tocolor(255, 255, 255, 255), true)
				--dxDrawImageSection (x,y,width,64,0,0,width,64,"files/speedo/nitro/bar.png")
			--else
			end	
			if drawFuel < 10  then
			    dxDrawImage(speedoX, speedoY, 256, 256,"files/speedo/lowfuel_on.png",0.0,0.0,0.0,tocolor(255,255,255,255),false)
			end
			--local car = getPedOccupiedVehicle(localPlayer)
			if getVehicleUpgradeOnSlot(vehicle, 8) == 1008 or getVehicleUpgradeOnSlot(vehicle, 8) == 1009 or getVehicleUpgradeOnSlot(vehicle, 8) == 1010 then
			--local nitrof = isVehicleNitroRecharging ( vehicle, theVehicle )
			--else
	        local nitro = (getVehicleNitroLevel(vehicle))*66
			if nitro then

				dxDrawImage(x - 49, y-251-nitro, 30,nitro, "files/speedo/nitro/bar.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

			end
			end

			end
		end
	end
end


function syncolaj(iolaj)--syncFuel
	if not (iolaj) then
		olaj = 100
	else
		olaj = iolaj
	end
end
addEvent("syncFuel", true)
addEventHandler("syncFuel", getRootElement(), syncolaj)

function round(num, idp)
  return math.floor(num * 10 ^ (idp or 0) + 0.5) / 10 ^ (idp or 0)
end
--ELEJE

function getFormatSpeed(unit)
    unit = math.round(unit)
	if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end
function getFormatGear()
    local gear = getVehicleCurrentGear(getPedOccupiedVehicle(getLocalPlayer()))
	local sebes = getVehicleSpeed (getPedOccupiedVehicle(getLocalPlayer()))
    local rear = "R"
	local neutral = "N"
	--local nullas = "0"
	--if (gear > 0) then
     --   gear = gear
	--elseif (gear < 0) then
	 --   gear = "R"
    --elseif (gear == 0) then	
	 --   gear = "0"
	--end
	if (sebes > 0) then
		if (gear > 0)then 
			return gear
		else
			return rear
        end
	end

	if (sebes == 0) then 
        return neutral
    --else
     --   return rear
    end
end
function getElementSpeed(element,unit)
    if (unit == nil) then unit = 0 end
    if (isElement(element)) then
        local x,y,z = getElementVelocity(element)
        if (unit=="mph" or unit==1 or unit =='1') then
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100)
        else
            return math.floor((x^2 + y^2 + z^2) ^ 0.5 * 100 * 1.609344)
        end
    else
        return false
    end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function getVehicleRPM(vehicle)
local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor(((getElementSpeed(vehicle, "kmh")/getVehicleCurrentGear(vehicle))*180) + 0.5) 
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            else
                vehicleRPM = math.floor((getElementSpeed(vehicle, "kmh")*180) + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            end
        else
            vehicleRPM = 0
        end
        return tonumber(vehicleRPM)
    else
        return 0
    end
end

-- function drawFuel()
	-- if active and not isPlayerMapVisible() then
		-- local vehicle = getPedOccupiedVehicle(getLocalPlayer())
		-- if (vehicle) then
			
			-- local width, height = guiGetScreenSize()
			-- local x = width
			-- local y = height
			
			-- dxDrawImage(x-265, y-165, 100, 100, "fueldisc.png", 0, 0, 0, tocolor(255, 255, 255, 200), false)
			-- movingx = x + math.sin(math.rad(-(fuel)-50)) * 50
			-- movingy = y + math.cos(math.rad(-(fuel)-50)) * 50
			-- dxDrawLine(x-215, y-115, movingx-210, movingy-115, tocolor(255, 0, 0, 255), 2, true)
			
			-- if fuel < 10 then
				-- local ax, ay = x - 274, y - 202
				-- if (getElementData(vehicle, "vehicle:windowstat") == 1) then
					-- ay = ay - 32
				-- end
				-- if getTickCount() % 1000 < 500 then
					-- dxDrawImage(ax,ay,32,37,"images/fuel.png")
				-- else
					-- dxDrawImage(ax,ay,32,37,"images/fuel2.png")
				-- end
			-- end
		-- end
	-- end
-- end

--function drawWindow()
--	if active and not isPlayerMapVisible() then
--		local vehicle = getPedOccupiedVehicle(getLocalPlayer())
--		if (vehicle) then
--			local width, height = guiGetScreenSize()
--			local x = width
--			local y = height
--
--			if (getElementData(vehicle, "vehicle:windowstat") == 1) then
--				local ax, ay = x - 274, y - 202
--				dxDrawImage(ax,ay,32,37,"images/window.png")
--			end
--		end
--	end
--end

function onVehicleEnter(thePlayer, seat)
	if (thePlayer==getLocalPlayer()) then
		if (seat<2) then
			local id = getElementModel(source)
			if seat == 0 and not (fuellessVehicle[id]) then
				drawFuel = true
				-- addEventHandler("onClientRender", getRootElement(), drawFuel)
			end
			if not (enginelessVehicle[id]) then
				addEventHandler("onClientRender", getRootElement(), drawSpeedo)
				--addEventHandler("onClientRender", getRootElement(), drawWindow)
			end
		end
	end
end
--addEventHandler("onClientVehicleEnter", getRootElement(), onVehicleEnter)

function onVehicleExit(thePlayer, seat)
	if (thePlayer==getLocalPlayer()) then
		if (seat<2) then
			local id = getElementModel(source)
			if seat == 0 and not (fuellessVehicle[id]) then
				drawFuel = false
				-- removeEventHandler("onClientRender", getRootElement(), drawFuel)
			end
			if not(enginelessVehicle[id]) then
				removeEventHandler("onClientRender", getRootElement(), drawSpeedo)
				--removeEventHandler("onClientRender", getRootElement(), drawWindow)
			end
		end
	end
end
--addEventHandler("onClientVehicleExit", getRootElement(), onVehicleExit)

function hideSpeedo()
	removeEventHandler("onClientRender", getRootElement(), drawSpeedo)
	drawFuel = false
	-- removeEventHandler("onClientRender", getRootElement(), drawFuel)
	--removeEventHandler("onClientRender", getRootElement(), drawWindow)
end

function showSpeedo()
	source = getPedOccupiedVehicle(getLocalPlayer())
	if source then
		if getVehicleOccupant( source ) == getLocalPlayer() then
			onVehicleEnter(getLocalPlayer(), 0)
		elseif getVehicleOccupant( source, 1 ) == getLocalPlayer() then
			onVehicleEnter(getLocalPlayer(), 1)
		end
	end
end

--[[
function removeSpeedo()
	if not (isPedInVehicle(getLocalPlayer())) then
		hideSpeedo()
	end
end
setTimer(removeSpeedo, 1000, 0)]]--

--addEventHandler( "onClientResourceStart", getResourceRootElement(), showSpeedo )

addEvent("addWindow", true)
addEventHandler("addWindow", getRootElement(), 
	function ()
		if source == getLocalPlayer() then
			--addEventHandler("onClientRender", getRootElement(), drawWindow)
		end
	end
)

addEvent("removeWindow", true)
addEventHandler("removeWindow", getRootElement(), 
	function ()
		if source == getLocalPlayer() then
			--removeEventHandler("onClientRender", getRootElement(), drawWindow)
		end
	end
)






local sx, sy = guiGetScreenSize()
local localPlayer = getLocalPlayer()
distanceTraveled = 0
local syncTraveled = 0
local oX, oY, oZ
local carSync = false
local lastVehicle = nil

function setUp(startedResource)
	if(startedResource == getThisResource()) then
		oX,oY,oZ = getElementPosition(localPlayer)
	end
end
addEventHandler("onClientResourceStart",getRootElement(),setUp)

function monitoring()
	local x,y,z = getElementPosition(localPlayer)
	if(isPedInVehicle(localPlayer)) then
		local x,y,z = getElementPosition(localPlayer)
		local thisTime  = getDistanceBetweenPoints3D(x,y,z,oX,oY,oZ) -- / 2.1
		distanceTraveled = distanceTraveled + thisTime
		syncTraveled = syncTraveled + thisTime
	end
	oX = x
	oY = y
	oZ = z
end
addEventHandler("onClientRender",getRootElement(),monitoring)

function getDistanceTraveled()
	return distanceTraveled
end

function receiveDistanceSync( amount )
	if (isPedInVehicle(localPlayer)) then
		if (source == getPedOccupiedVehicle(localPlayer)) then
			distanceTraveled = amount or 0
			carSync = true
		end
	end
end
addEvent("distancialis", true)
addEventHandler("distancialis", getRootElement(), receiveDistanceSync)

function onResourceStart()
	if (isPedInVehicle(localPlayer)) then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if (theVehicle) then
			carSync = false
			triggerServerEvent("distancialis", theVehicle)
		end
	end
	setTimer(stopCarSync, 1000, 0)
	setTimer(syncBack, 60000, 0)
end
addEventHandler("onClientResourceStart", getResourceRootElement(), onResourceStart)

function syncBack(force)
	if (isPedInVehicle(localPlayer) or force) then
		local theVehicle = getPedOccupiedVehicle(localPlayer)
		if (theVehicle or force) then
			if carSync then
				triggerServerEvent("distancialis", force and lastVehicle or theVehicle, distanceTraveled, syncTraveled)
				syncTraveled = 0
			end
		end
	end
end

function stopCarSync()
	if not (isPedInVehicle(localPlayer)) then
		if carSync then
			syncBack(true)
		end
		carSync = false
		distanceTraveled = 0
		syncTraveled = 0
	else
		lastVehicle = getPedOccupiedVehicle(localPlayer)
	end
end
--[[
function bikeSpeed(theVehicle)
    if getPedOccupiedVehicle(getLocalPlayer()) then
        if getVehicleType(theVehicle) == "Bike" then
            if getControlState("accelerate") then
				toggleControl("steer_forward", false)
			else
                toggleControl("steer_forward", true)
			end
			setTimer(bikeSpeed, 50, 1, theVehicle)
		else
			toggleControl("steer_forward", true)
		end
	else
		toggleControl("steer_forward", true)
    end
end
addEventHandler("onClientPlayerVehicleEnter", getLocalPlayer(), bikeSpeed)]]--














--[[


addEventHandler("onClientPlayerVehicleEnter", localPlayer, function(vehicle, seat)
	if source == localPlayer then
		local vehfk = getElementData(vehicle,"veh:faction")
		local vehowner = getElementData(vehicle,"veh:owner")
		--if  getElementData(getPedOccupiedVehicle(localPlayer), "veh:job") ~= getElementData(localPlayer, "acc:id") then 
			if vehowner > 0 and vehfk <= 0 then
				if seat == 0 then
				--outputChatBox("#FFFFFFPara ligar o veículo, pressione #7cc576J#FFFFFF! ",255,255,255,true)
				exports.san_tutors:createDebugNotification2("veiculo")
			end
		end
	end
end)]]--