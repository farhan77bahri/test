local monitorSize = {guiGetScreenSize()}
local font = dxCreateFont('files/calibri.ttf', 12, true)
local traveledFont = dxCreateFont('files/calibri.ttf', 9, true)
local vehNameFont = dxCreateFont('files/calibri.ttf', 12, false)
local speedFont = dxCreateFont('files/calibri.ttf', 30, true)
local circleTextures = {}
local maskShader = dxCreateShader("files/mask3d.fx")
local maskTexture = nil
local number = 0
local vehicleName  = false
local panelSize = {
	["speedo"] = {240, 240},
	--["fuel"] = {240, 240},
	--["nos"] = {240, 240},
}

local speedoPos = {
	['speedo'] = {monitorSize[1]-panelSize['speedo'][1]-25, monitorSize[2]-panelSize['speedo'][2]+10},
	['fuel'] = {monitorSize[1]-panelSize['speedo'][1]-5, monitorSize[2]-panelSize['speedo'][2]-4},
	['nos'] = {monitorSize[1]-panelSize['speedo'][1]-49, monitorSize[2]-panelSize['speedo'][2]-4},
}

addEventHandler("onClientResourceStart", resourceRoot, function ()
	outputDebugString("WLS SPEEDO: Creating mask shader...")
	maskShader = dxCreateShader("files/mask3d.fx")
	local maskTexture = dxCreateTexture("files/mask.png")
	if not maskTexture then 
		maskTexture = dxCreateTexture("files/mask.png")
	end
	dxSetShaderValue(maskShader,"sMaskTexture", maskTexture)
	for i = 1, 3 do
		circleTextures[i] = dxCreateTexture("files/circle/circle"..tostring(i)..".png")
	end
	dxSetShaderValue(maskShader, "gUVRotCenter", 0.5, 0.5)
end)

local beltVehicles = {
	["Automobile"] = true,
	["Plane"] = true,
	["Helicopter"] = true,
	-- ["Boat"] = true,
	["Train"] = true,
	["Monster Truck"] = true
}

local enableSpeedo = {
	["Automobile"] = true,
	["Bike"] = true,
}

local toggleLightColor = {
	[416]=true, 
	[427]=true, 
	[490]=true, 
	[528]=true, 
	[407]=true, 
	[544]=true, 
	[523]=true, 
	[596]=true, 
	[597]=true, 
	[598]=true, 
	[601]=true, 
	[428]=true, 
	[470]=true,
	[525]=true, 
	[403]=true, 
	[514]=true, 
	[515]=true, 
	[524]=true, 
	[486]=true, 
	[552]=true, 
	[599]=true,
}

function drawSpeedo()
	if not isPedInVehicle(getLocalPlayer()) then
		hideSpeedo()
	end
	if getElementData(getLocalPlayer(), "loggedin") == 0   then
		hideSpeedo()
	end
	if getElementData(getLocalPlayer(), "screen") then
		return
	end
	--if not getVehicleEngineState(getPedOccupiedVehicle(localPlayer)) then return end
		
		
	if not isPedInVehicle ( localPlayer ) then
		return
	end	
	if not enableSpeedo[getVehicleType(getPedOccupiedVehicle(localPlayer))] then
		hideSpeedo()
		return
	end
	local vehicleSpeed = getVehicleSpeed()
	
	local rpm = getVehicleRPM(getPedOccupiedVehicle(localPlayer)) / 6000 * 270
	local angle = math.max(-270, -rpm)
	local imageIndex = math.min(math.floor(-angle / 90) + 1, 3)
	angle = angle + 90 * (imageIndex - 1)
	if imageIndexPrev ~= imageIndex and circleTextures[imageIndex] then
		dxSetShaderValue(maskShader, "sPicTexture", circleTextures[imageIndex])
		imageIndexPrev = imageIndex
		-- outputChatBox(imageIndexPrev)
	end
	dxSetShaderValue(maskShader, "gUVRotAngle", math.rad(angle))
	
	dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/bg.png')
	local r, g, b = 255, 255, 255
	if not toggleLightColor[getElementModel(getPedOccupiedVehicle(localPlayer))] then 
		r, g, b = getVehicleHeadLightColor(getPedOccupiedVehicle(localPlayer))
	end
	
	dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/numberbg.png', 0, 0, 0, tocolor(r, g, b, 255))
	
	if rpm > 270 then 
		rpm = 270
	end	
	
	-- if rpm > 272 then 
		-- rpm = 272
	-- end
	dxDrawImage(speedoPos['speedo'][1]-1, speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], maskShader, 0, 0, 0, tocolor(r, g, b, 255))
	
	dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/needle.png', rpm, 0, white)
	
	dxDrawText(getGearVehicle(), speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]+panelSize['speedo'][2]/2+43, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, font, 'center', 'top', false, false, false, true)
	dxDrawText(getFormatSpeed(getVehicleSpeed()), speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]+panelSize['speedo'][2]/2-60, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, speedFont, 'center', 'top', false, false, false, true)
	dxDrawText('#BFBFBFkm/h', speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]+panelSize['speedo'][2]/2-20, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, font, 'center', 'top', false, false, false, true)
	
	local traveled = tonumber(getElementData(getPedOccupiedVehicle(localPlayer), 'kilometers')) or 0
	
	dxDrawText(pointScript(math.round(traveled, 2)) .. ' #BFBFBFkm', speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]+panelSize['speedo'][2]/2+78, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, traveledFont, 'center', 'top', false, false, false, true)
	
	local left,right,mid = getVehicleIndicatorState(getPedOccupiedVehicle(localPlayer)) 
	local vehLightStat = tonumber(getElementData(getPedOccupiedVehicle(localPlayer), "vehicle >> light")) or 0
	local fuels = tonumber(getElementData(getPedOccupiedVehicle(localPlayer), "veh:fuel")) or 0
	
	local nos = math.floor(tonumber(getElementData(getPedOccupiedVehicle(localPlayer), "tuning.nitroLevel"))or 0) 
	
	----dxDrawImage(speedoPos['nos'][1]-1, speedoPos['nos'][2], panelSize['nos'][1], panelSize['nos'][2], 'files/nitroalap.png', 0, 0, 0, tocolor(255, 255, 255, 255))
	if nos > 10 then
		--dxDrawImage(speedoPos['nos'][1]-1, speedoPos['nos'][2], panelSize['nos'][1], panelSize['nos'][2], 'files/nitroicon.png', 0, 0, 0, tocolor(255, 255, 255, 255))
	else
		--dxDrawImage(speedoPos['nos'][1]-1, speedoPos['nos'][2], panelSize['nos'][1], panelSize['nos'][2], 'files/nitroicon.png', 0, 0, 0, tocolor(255, 0, 0, 255))
	end
	
	
	--dxDrawImage(speedoPos['fuel'][1]-1, speedoPos['fuel'][2], panelSize['fuel'][1], panelSize['fuel'][2], 'files/fuelbg.png', 0, 0, 0, tocolor(255, 255, 255, 255))
	if fuels > 10 then 
		--dxDrawImage(speedoPos['fuel'][1]-1, speedoPos['fuel'][2], panelSize['fuel'][1], panelSize['fuel'][2], 'files/fuelicon.png', 0, 0, 0, tocolor(255, 255, 255, 255))
	else
		if getTickCount() % 1000 < 500 then 
			--dxDrawImage(speedoPos['fuel'][1]-1, speedoPos['fuel'][2], panelSize['fuel'][1], panelSize['fuel'][2], 'files/fuelicon.png', 0, 0, 0, tocolor(255, 255, 255, 255))
		end
	end
	
	--dxDrawText(vehicleName, speedoPos['speedo'][1]+panelSize['speedo'][1]/2+1, speedoPos['speedo'][2]-20+1, speedoPos['speedo'][1]+panelSize['speedo'][1]/2+1, 0, tocolor(0, 0, 0, 255), 1, vehNameFont, 'center', 'top', false, false, false, true)
	--dxDrawText(vehicleName, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]-20, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, vehNameFont, 'center', 'top', false, false, false, true)
	if getElementData(getPedOccupiedVehicle(localPlayer), 'cc') then 
		dxDrawText('C#F7CA18C', speedoPos['speedo'][1]+panelSize['speedo'][1]/2, speedoPos['speedo'][2]+panelSize['speedo'][2]/2-80, speedoPos['speedo'][1]+panelSize['speedo'][1]/2, 0, tocolor(255, 255, 255, 255), 1, font, 'center', 'top', false, false, false, true)
	end
	if nos > 1 then
		dxDrawImageSection(speedoPos['nos'][1]-1, speedoPos['nos'][2] + panelSize['nos'][1], panelSize['nos'][2], panelSize['nos'][1]*-(nos/100), 0, 0, panelSize['nos'][2], panelSize['nos'][1]*-(nos/100), "files/nitrocsik.png",0, 0, 0, tocolor(255, 255, 255, 255))
	end
	--dxDrawImageSection(speedoPos['fuel'][1]-1, speedoPos['fuel'][2] + panelSize['fuel'][1], panelSize['fuel'][2], panelSize['fuel'][1]*-(fuels/100), 0, 0, panelSize['fuel'][2], panelSize['fuel'][1]*-(fuels/100), "files/fuelbar.png", 0, 0, 0, tocolor(255, 255, 255, 255))
	--dxDrawImageSection(speedoPos['nos'][1]-1, speedoPos['nos'][2] + panelSize['nos'][1], panelSize['nos'][2], panelSize['nos'][1]*-(nos/100), 0, 0, panelSize['nos'][2], panelSize['nos'][1]*-(fuels/100), "files/nitrocsik.png", 0, 0, 0, tocolor(255, 255, 255, 255))
	if right then
		dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/r_index.png', 0, 0, 0, tocolor(255, 179, 0, 255))
	end	
	
	if isVehicleLocked(getPedOccupiedVehicle(localPlayer)) then
		dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/lock.png', 0, 0, 0, tocolor(210, 77, 87, 255))
	end

	if vehLightStat == 1 then
		dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/light.png', 0, 0, 0, tocolor(0, 255, 0, 255))
	end	 	
	
	if left then
		dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/l_index.png', 0, 0, 0, tocolor(255, 179, 0, 255))
	end	 
	
	 if beltVehicles[getVehicleType(getPedOccupiedVehicle(localPlayer))] then
		if not getElementData(localPlayer, "ov") then
			if getTickCount() % 2000 < 1000 then 
				dxDrawImage(speedoPos['speedo'][1], speedoPos['speedo'][2], panelSize['speedo'][1], panelSize['speedo'][2], 'files/belt.png', 0, 0, 0, tocolor(210, 77, 87, 255))
			end
		end
	end
end
addEventHandler("onClientRender", getRootElement(), drawSpeedo, true, 'low-5')

function hideSpeedo()
	removeEventHandler("onClientRender", getRootElement(), drawSpeedo)
end

function onVehicleEnter(thePlayer, seat)
	if (thePlayer==getLocalPlayer()) then
		if (seat<2) then
			if enableSpeedo[getVehicleType(source)] then 
				local id = getElementModel(source)
				vehicleName = exports.san_realname:getVehicleRealName(localPlayer, id)
				addEventHandler("onClientRender", getRootElement(), drawSpeedo, true, 'low-5')
			end
		end
	end
end
addEventHandler("onClientVehicleEnter", getRootElement(), onVehicleEnter)

function getGearVehicle()
    if getVehicleEngineState((getPedOccupiedVehicle(getLocalPlayer()))) then
    
    if getVehicleSpeed() == 0 then 
        return "N" 
    end
        if getVehicleCurrentGear((getPedOccupiedVehicle(getLocalPlayer()))) > 0 then
            return (getVehicleCurrentGear((getPedOccupiedVehicle(getLocalPlayer()))))
        else
            return "R"
        end
        
    else
        return "N"
    end
end

function getVehicleSpeed()
	if getPedOccupiedVehicle ( getLocalPlayer ( ) ) then 
		local vehicle = getPedOccupiedVehicle(localPlayer)
		if isPedInVehicle(localPlayer) then
			local vx, vy, vz = getElementVelocity(vehicle)
			return math.sqrt(vx^2 + vy^2 + vz^2) * 161		
		end
		return 0
	end
end

function getVehicleIndicatorState(vehicle)
	local stater = getElementData(vehicle, "index:r") 
	local statel = getElementData(vehicle, "index:l") 
	local middle = getElementData(vehicle, "index:mid") 
	return stater,statel,middle
end

function getFormatSpeed(unit)
    unit = math.floor(unit)
	if unit < 10 then
        unit = "00" .. unit
    elseif unit < 100 then
        unit = "0" .. unit
    elseif unit >= 1000 then
        unit = "999"
    end
    return unit
end

function getVehicleRPM(vehicle)
local vehicleRPM = 0
    if (vehicle) then  
        if (getVehicleEngineState(vehicle) == true) then
            if getVehicleCurrentGear(vehicle) > 0 then             
                vehicleRPM = math.floor((getVehicleVelocity((getPedOccupiedVehicle(getLocalPlayer())))/getVehicleCurrentGear(vehicle))*120 + 0.5)
                if (vehicleRPM < 650) then
                    vehicleRPM = math.random(650, 750)
                elseif (vehicleRPM >= 9800) then
                    vehicleRPM = math.random(9800, 9900)
                end
            else
                vehicleRPM = math.floor(getVehicleVelocity((getPedOccupiedVehicle(getLocalPlayer())))*120 + 0.5)
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

local factor = 1.5
function getVehicleVelocity(vehicle)
	speedx, speedy, speedz = getElementVelocity (vehicle)
	return relateVelocity((speedx^2 + speedy^2 + speedz^2)^(0.5)*100)
end

function relateVelocity(speed)
	return factor * speed
end


local soundStarter = -1
local occupants = {}
local beltSound = nil

setElementData(localPlayer, "ov", false)

function playSounds(sounds, bool)
	if not bool then bool = false end
	if sounds == "ov" then
		beltSound = playSound("files/ov/files/".. sounds ..".mp3", bool)
	else
	    playSound("files/ov/files/".. sounds ..".mp3", bool)
	end
end

addEventHandler('onClientVehicleEnter', root, function()
	if player == localPlayer and beltVehicles[getVehicleType(getPedOccupiedVehicle(localPlayer))] then
		setElementData(localPlayer, "ov", false)
		playSounds("ov", false)
	end

end)

setTimer(
    function()
    	--if not isPedInVehicle(localPlayer) then return end
	    local veh = getPedOccupiedVehicle(localPlayer)
		local seat = getPedOccupiedVehicleSeat(localPlayer)
		if veh and beltVehicles[getVehicleType(veh)] then
		    for seat, player in pairs(getVehicleOccupants(veh)) do
			    occupants[seat] = player
			    if not getElementData(player, "ov") then
		        	if not isElement(beltSound) then
					    --outputChatBox("asd")
			        	playSounds("ov", false)
						soundStarter = seat
						return
				    else
					    if soundStarter == seat then
						    stopSound(beltSound)
							return
						end
			    	end
				elseif getElementData(player, "ov") then
				    if isElement(beltSound) and soundStarter == seat then
					    stopSound(beltSound)
						soundStarter = -1
						return
					end
				end
			end
		else
			setElementData(localPlayer, "ov", false)
		end
	end, 1000, 0
)



addEventHandler("onClientVehicleExit", root, function(player)
	if player == localPlayer then
		if isElement(beltSound) then
			stopSound(beltSound)
		end
	end
	for k,v in pairs(occupants) do    
	    if v == player then
            if isElement(beltSound) then
			    stopSound(beltSound)
		    end
		end
	end
end)

function math.round(number, decimals, method) 
    decimals = decimals or 0 
    local factor = 10 ^ decimals 
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor 
    else return tonumber(("%."..decimals.."f"):format(number)) end 
end 

function pointScript(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function belt2 (key, pressed, source)
	if getPedOccupiedVehicle(localPlayer) and beltVehicles[getVehicleType(getPedOccupiedVehicle(localPlayer))] then
		name = getPlayerName(localPlayer):gsub("_", " ")
		if not getElementData(localPlayer, "ov") then
			setElementData(localPlayer, "ov", true)
			if isElement(beltSound) then 
				stopSound(beltSound)
			end
			exports.san_chat:sendLocalMeMessage(localPlayer, "KamarBand Ra Mibandad.")
			playSound("files/ov/files/ovbe.mp3", false)
			--triggerServerEvent('wlsMTA->#setPlayerMe', localPlayer, localPlayer, "becsatolja a biztonsági övét.")
		else
			setElementData(localPlayer, "ov", false)

			playSound("files/ov/files/ovki.mp3", false)
			exports.san_chat:sendLocalMeMessage(localPlayer, "KamarBand Ra Baz Mikonad.")
			--triggerServerEvent('wlsMTA->#setPlayerMe', localPlayer, localPlayer, "kicsatolja a biztonsági övét.")
			if soundStarter == -1 then
		       playSounds("ov", true)
				--triggerClientEvent(localPlayer, "privatUzenetErkezett1", localPlayer)
			end
		end
	end
end
--addCommandHandler("belt", belt2)
bindKey("x","down",belt2)

local didSpeed = 0

function traveled()
	if getPedOccupiedVehicle(localPlayer) then
		if getVehicleOccupant(getPedOccupiedVehicle(localPlayer), 0) == localPlayer then
			if getVehicleSpeed() > 0 then
				local kmh = getVehicleSpeed()
				local km = (kmh/60)/60
				didSpeed = didSpeed + km
				setElementData(getPedOccupiedVehicle(localPlayer), "kilometers", didSpeed)
			end
		end
	end
end
setTimer(traveled, 1000, 0)

function saveKilometer(theVehicle, seat)
	if source == localPlayer and seat == 0 then
		triggerServerEvent("saveKilometer", theVehicle, theVehicle, didSpeed)
		--setElementData(getPedOccupiedVehicle(localPlayer), "kilometers", 0 )
	end
end

addEventHandler("onClientPlayerVehicleExit",getRootElement(),saveKilometer)

addEventHandler("onClientResourceStart", resourceRoot, function ()
	if getPedOccupiedVehicle(localPlayer) and getElementData(getPedOccupiedVehicle(localPlayer),"veh:id") > 0 then
		if enableSpeedo[getVehicleType(getPedOccupiedVehicle(localPlayer))] then 
			didSpeed = 0
			setElementData(getPedOccupiedVehicle(localPlayer), "kilometers", 0 )
			triggerServerEvent("loadVehiclesKilometer",localPlayer,localPlayer,getElementData(getPedOccupiedVehicle(localPlayer),"veh:id"))
			local id = getElementModel(getPedOccupiedVehicle(localPlayer))
			vehicleName = exports.san_realname:getVehicleRealName(localPlayer, id)
		end
	end
end)

addEventHandler("onClientVehicleEnter", getRootElement(),
    function(thePlayer, seat)
        if thePlayer == getLocalPlayer() then
            
				didSpeed = 0
				triggerServerEvent("loadVehiclesKilometer",thePlayer,thePlayer,getElementData(getPedOccupiedVehicle(thePlayer),"veh:id"))
			
        end
    end
)
addEventHandler("onClientResourceStop", resourceRoot, function ()
	for index, value in ipairs(getElementsByType("player")) do
		if getPedOccupiedVehicle(value) then 
			local vehicle = getPedOccupiedVehicle(value)
		--if getElementData(vehicle,"dbid") > 0 then
			if didSpeed >= 0 then 
				triggerServerEvent("saveKilometer", vehicle, vehicle, getElementData(getPedOccupiedVehicle(value),"kilometers"))
			end
		end
	end
end)

function loadInKilometer(km)
	didSpeed = km
	setElementData(getPedOccupiedVehicle(localPlayer), "kilometers", didSpeed)
end
addEvent("loadInKilometer", true)
addEventHandler("loadInKilometer", getRootElement(), loadInKilometer)

