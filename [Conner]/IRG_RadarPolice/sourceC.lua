local TrafiPos = {-- X, Y , Z ,Rot [1,2,3] ,Velocidade Maxima
	{458.99645996094, -1312.505859375, 15.350808143616,0, 0, 120,100},--2x2 sávos északi fele(szigeten) (POS)
	{2032.4040527344, -1746.4495849609, 13.546875,0, 0, 80,100},--déli benzinkút (POS)
	{1613.4154052734, -1739.3972167969, 13.546875,0,0,250,100},--rendőrségtől balra (POS)
	{1162.9130859375, -1389.0151367188, 13.676382064819,0,0,80,100},--kórháztól jobbra (POS)
	{1090.2261962891, -1411.9454345703, 13.662985801697,0,0,-100,100},--kórház jobbra túloldal (POS)
	{1306.1239013672, -1552.4890136719, 13.546875,0,0,350,100},--vh-nál 2x2 sávosnál (POS)
	{1831.3999023438, -1597.3576660156, 13.546875,0,0,180,100},--alhambra (POS)
	{1592.2755126953, -1585.5428466797, 13.546875,0,0,65,100},--rendőrségtől jobbra (POS)
	{2225.6877441406, -1835.3270263672, 13.552531242371,0,0,190,100},--kék sorházak(Ganton->Kékházak oldala) (POS)
	{377.15478515625, -1709.6251220703, 7.5561242103577,0,0,90,100},--Santa Maria Beach (POS)
	{-90.266494750977, -1427.2891845703, 12.521896362305,0,0,-25,100},--Santa Maria Beach (POS)
	{-99.943695068359, -1417.9799804688, 12.892049789429,0,0,-65,100},--Santa Maria Beach (POS)
	
}
local Trafipax = {}
local TrafipaxEffect = {}
local Distance = 12
local Elkapta = false
local ElkaptaTick = 0

function CreateTrafi ()
	for i,v in ipairs (TrafiPos) do
		Trafipax[i] = createObject(1337,v[1],v[2],v[3]-1.04,v[4], v[5], v[6])
	end
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(), CreateTrafi )
setElementData(localPlayer,"trafiBassza",false)
function TrafiSpeed()
	if isPedInVehicle(localPlayer) then
		local x, y, z = getElementPosition(getLocalPlayer())
		for i,v in ipairs (TrafiPos) do
			if getElementData(localPlayer, "acc:aseged") >= 1 then return end
			if getDistanceBetweenPoints3D(x, y, z, v[1], v[2], v[3]) <= Distance and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 561 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 461 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 546 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 404 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 400 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 466 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 416 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 427 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 490 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 523 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 528 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 596 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 597 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 598 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 599 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 601 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 407 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 418 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 481 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 509 and getElementModel(getPedOccupiedVehicle(localPlayer)) ~= 510 then
				if (getVehicleSpeed() > tonumber(v[7]+getVehicleSpeed()/10) or not getElementData(localPlayer, "char:ov")) then
					if not getElementData(localPlayer,"trafiBassza") and not Elkapta then
						if getVehicleController(getPedOccupiedVehicle(localPlayer)) == getLocalPlayer() then
							setElementData(localPlayer,"trafiBassza",true)
							Elkapta = true
							ElkaptaTick = ElkaptaTick + 1
							
							if ElkaptaTick == 1 then	
								if --[[getElementData(localPlayer, "char:ov") or]] getVehicleSpeed() > tonumber(v[7]+getVehicleSpeed()/10) then 
									Birsag = calculateBirsag(getVehicleSpeed() - v[7])/100 * 50
									Sebszam = getVehicleSpeed() - v[7]
									outputChatBox(" ",0,0,255,true)
									outputChatBox(" ",0,0,255,true)
									outputChatBox("#7cc576[IRG - Radar] #ffffffVocê ultrapassou o limite de velocidade! A velocidade permitida: #F4B350"..v[7].."#ffffff km/h!",0,0,255,true)
									outputChatBox("#7cc576[IRG - Radar] #ffffffSua velocidade Ultrapassada: #7cc576"..math.ceil(Sebszam).." km/h. #ffffffMulta De: #7cc576R$ "..math.ceil(Birsag),0,0,255,true)
									triggerServerEvent("onTrafiHit", localPlayer, localPlayer, Birsag)
									fadeCamera(false, 0.5,255,255,255)
									createEffect("camflash", v[1],v[2],v[3]+0.5)
									
									playSound("files/shutter.mp3")
									
									setTimer (function () 
										fadeCamera(true, 0.5)
									end,400,1)
								--[[elseif getElementData(localPlayer, "char:ov") and  getVehicleSpeed() > tonumber(v[7]+getVehicleSpeed()/10) and getVehicleType(getPedOccupiedVehicle(localPlayer)) ~= "Bike" then 
									Birsag = 10+calculateBirsag(getVehicleSpeed() - v[7])/100 * 50
									outputChatBox("#7cc576[Traffipax] #ffffffNem volt bekötve a biztonsági öved, ezért büntetésben részesültél. Bírság: #dc143c$".. Birsag,0,0,255,true)
								--	outputChatBox("#7cc576[Traffipax] #ffffffRemélem legközelebb odafigyel a saját biztonsága érdekében .",0,0,255,true)
									triggerServerEvent("onTrafiHit", localPlayer, localPlayer, Birsag)
									fadeCamera(false, 0.5,255,255,255)
									createEffect("camflash", v[1],v[2],v[3]+0.5)
									
									playSound("files/shutter.mp3")
									
									setTimer (function () 
										fadeCamera(true, 0.5)
									end,400,1)
								end]]
								--[[if not getElementData(localPlayer, "char:ov") and getVehicleType(getPedOccupiedVehicle(localPlayer)) ~= "Bike"  then 
									Birsag = 10
									outputChatBox("#7cc576[Traffipax] #ffffffNem volt bekötve a biztonsági öved, ezért büntetésben részesültél. Bírság: #dc143c$".. Birsag,0,0,255,true)
									--outputChatBox("#7cc576[Traffipax] #ffffffRemélem legközelebb odafigyel a saját biztonsága érdekében.",0,0,255,true)
									triggerServerEvent("onTrafiHit", localPlayer, localPlayer, Birsag)
									fadeCamera(false, 0.5,255,255,255)
									createEffect("camflash", v[1],v[2],v[3]+0.5)
									
									playSound("files/shutter.mp3")
									
									setTimer (function () 
										fadeCamera(true, 0.5)
									end,400,1)
								end]]
								end
							end
							aT = setTimer(function()
								Elkapta = false
								setElementData(localPlayer,"trafiBassza",false)
								ElkaptaTick = 0
								if isTimer(aT) then
									killTimer(aT)
								end
							end,1500,1)
						end
					end
				end
			end
		end
	end
end
addEventHandler ( "onClientRender", getRootElement(), TrafiSpeed )

function calculateBirsag(a)
	if math.ceil(a) > 100 then
		return math.ceil(a*10/2)
	else
		return math.ceil(a*5/2)
	end
end

function getVehicleSpeed()
	local vehicle = getPedOccupiedVehicle(localPlayer)
    if isPedInVehicle(localPlayer) then
        local vx, vy, vz = getElementVelocity(getPedOccupiedVehicle(localPlayer))
        return math.sqrt(vx^2 + vy^2 + vz^2) * 161		
	end
    return 0
end

--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------------------------------
local speedCamObject
local Kepernyom = {guiGetScreenSize()}
local limits = 0
local SQLTabla = true


function setSpeedCam(commandName, Limit)
	if not isPedInVehicle(localPlayer) and getElementHealth(localPlayer) > 0 and not speedCamObject then
		if getElementData(localPlayer, "acc:admin") >= 6 then 
			if not Limit then
				outputChatBox("#26C281[IRG]#ffffff: /" .. commandName .. " [Velocidade Maxíma]", 255, 194, 14, true)
			else
				speedCamObject = createObject(1337, 0, 0, 0)
				setElementCollisionsEnabled(speedCamObject, false)
				
				outputChatBox("#26C281[IRG] #ffffffVocê criou com êxito o taraffipax #EB9532'E' #ffffffpressionando o botão, você pode colocar o #EB9532'Backspace' #ffffffe você pode excluir o SpeedPax pressionando.",255,255,255,true)
				
				addEventHandler("onClientRender", getRootElement(), setSpeedCamRender)
				attachElements(speedCamObject,localPlayer,0.2,0.7,0.55,90,0,0)
				setElementRotation(speedCamObject, 90, 90, 0)
				toggleControl("sprint", false)
				toggleControl("jump", false)		
				limits = Limit
				setElementAlpha(speedCamObject, 155)
			end
		end
	end
end
addCommandHandler("criarradar", setSpeedCam, false, false)

function setSpeedCamRender()
	local playerX, playerY, playerZ = getElementPosition(localPlayer)
	local rotX, rotY, rotZ = getElementRotation(localPlayer)
	local angle = math.rad(rotZ + 45)

	local cornerX, cornerY = playerX, playerY
	local pointX, pointY = playerX + 0.75, playerY + 0.75

	local rotatedX = math.cos(angle) * (pointX - cornerX) - math.sin(angle) * (pointY- cornerY) + cornerX
	local rotatedY = math.sin(angle) * (pointX - cornerX) + math.cos(angle) * (pointY - cornerY) + cornerY
	
	local z = getGroundPosition(rotatedX, rotatedY, playerZ) + 0.5
	if getKeyState("e") then
		removeEventHandler("onClientRender", getRootElement(), setSpeedCamRender)
		destroyElement(speedCamObject)
		toggleControl("sprint", true)
		toggleControl("jump", true)
		speedCamObject = nil
		addEventHandler("onClientRender", getRootElement(), SpeedCamText)


		triggerServerEvent("syncSpeedCameras", resourceRoot, rotatedX, rotatedY, z + 1.15, rotZ,limits)
	elseif getKeyState("backspace") then
		removeEventHandler("onClientRender", getRootElement(), setSpeedCamRender)
		toggleControl("enter_exit", true)
		toggleControl("sprint", true)
		toggleControl("jump", true)
		destroyElement(speedCamObject)
		--destroyElement(speedCamObject)
		speedCamObject = nil
	end
end

function reMap(x, in_min, in_max, out_min, out_max)
	return (x - in_min) * (out_max - out_min) / (in_max - in_min) + out_min
end

function getElementSpeed(element, unit)
	if (unit == nil) then unit = 0 end
	if (isElement(element)) then
		local x,y,z = getElementVelocity(element)
		if (unit=="mph" or unit==1 or unit =='1') then
			return (x^2 + y^2 + z^2) ^ 0.5 * 100
		else
			return (x^2 + y^2 + z^2) ^ 0.5 * 1.8 * 100
		end
	else
		return false
	end
end

function SpeedCameraCreate ()
	dxDrawImage(Kepernyom[1] / 2 - 25, Kepernyom[2] / 2 - 25, 50, 50, "files/speedcam-pointer.png")
	
	local speedCamera = getElementData(localPlayer, "usingSpeedCamera")

	local x, y, z = getElementPosition(speedCamera)
	local rotX, rotY, rotZ = getElementRotation(speedCamera)

	local cursorX, cursorY = getCursorPosition()

	targetX = reMap(cursorX, 0, 1, 80, -80)
	targetZ = reMap(cursorY, 0, 1, z + 10, z - 10)

	local angle = math.rad(rotZ + 45)

	local cornerX, cornerY = x, y
	local pointX, pointY = cornerX + 10, cornerY + 10

	local rotatedX = math.cos(angle + math.rad(targetX)) * (pointX - cornerX) - math.sin(angle + math.rad(targetX)) * (pointY - cornerY) + cornerX
	local rotatedY = math.sin(angle + math.rad(targetX)) * (pointX - cornerX) + math.cos(angle + math.rad(targetX)) * (pointY - cornerY) + cornerY

	local cornerX2, cornerY2 = x, y
	local pointX2, pointY2 = cornerX2 + 0.3, cornerY2 + 0.3

	local rotatedX2 = math.cos(angle) * (pointX2 - cornerX2) - math.sin(angle) * (pointY2 - cornerY2) + cornerX2
	local rotatedY2 = math.sin(angle) * (pointX2 - cornerX2) + math.cos(angle) * (pointY2 - cornerY2) + cornerY2
	
	setCameraMatrix(rotatedX2, rotatedY2, z+1.5, rotatedX, rotatedY, targetZ)
	
	local vehicles = getElementsByType("vehicle", getRootElement(), true)
	local vehicle

	for k, v in ipairs(vehicles) do
		for i=1, 20 do
			local angle = math.rad(rotZ + 45)

			local cornerX, cornerY = x, y
			local pointX, pointY = cornerX + i, cornerY + i

			local worldX = math.cos(angle + math.rad(targetX)) * (pointX - cornerX) - math.sin(angle + math.rad(targetX)) * (pointY - cornerY) + cornerX
			local worldY = math.sin(angle + math.rad(targetX)) * (pointX - cornerX) + math.cos(angle + math.rad(targetX)) * (pointY - cornerY) + cornerY
			local worldZ = targetZ

			local vehX, vehY, vehZ = getElementPosition(v)

			local distance = getDistanceBetweenPoints3D(worldX, worldY, worldZ, vehX, vehY, vehZ)

			local lineClear = isLineOfSightClear(rotatedX2, rotatedY2, z + 0.7, worldX, worldY, worldZ, true, false)

	
			if distance < 5.4 * reMap(distance, 1, 500, 1, 30) and lineClear then
				vehicle = v
				break
			end
		end
	end
	dxDrawRectangle(0, 0, Kepernyom[1], 30, tocolor(0, 0, 0, 225))
	dxDrawRectangle(0, 30, 200, Kepernyom[2] - 30, tocolor(0, 0, 0, 225))


	local memory = getElementData(speedCamera, "memory")

	if not memory then
		memory = {}
	end

	if vehicle then 
		local speed = math.floor(getElementSpeed(vehicle) * 10) / 10
		local plate = getVehiclePlateText(vehicle)

		local speedRecord = getElementData(speedCamera, "speed" .. plate)

		if not speedRecord then 
			speedRecord = 0
		end

		if speedRecord < speed then
			speedRecord = speed
			setElementData(speedCamera, "speed" .. plate, speedRecord)
		end

		if limits + 5 < speed and getElementModel(vehicle) ~= 597 and getElementModel(vehicle) ~= 604 and getElementModel(vehicle) ~= 200 and getElementModel(vehicle) ~= 290 and getElementModel(vehicle) ~= 426 and getElementModel(vehicle) ~= 523 and getElementModel(vehicle) ~= 585 and getElementModel(vehicle) ~= 490 and getElementModel(vehicle) ~= 479 and getElementModel(vehicle) ~= 497 and getElementModel(vehicle) ~= 596 and getElementModel(vehicle) ~= 404 and getElementModel(vehicle) ~= 525 and getElementModel(vehicle) ~= 578 and getElementModel(vehicle) ~= 422 and getElementModel(vehicle) ~= 416 and getElementModel(vehicle) ~= 487 and getElementModel(vehicle) ~= 420 then
			local found

			for k, v in ipairs(memory) do
				if v[1] == plate then
					found = true
					memory[k] = {plate, speedRecord}
					break
				end
			end

			if not found then
				table.insert(memory, {plate, speedRecord})
			end
			--playSound("files/shutter.mp3")
			setElementData(speedCamera, "memory", memory)
			fadeCamera(false, 0.5,255,255,255)								
			setTimer (function () 
				fadeCamera(true, 0.5)
			end,400,1)
			if not (getElementData(vehicle, "Traffipax")) then 
				local occupants = getVehicleOccupants(vehicle) or {} 
				for seat, occupant in pairs(occupants) do 
					if (occupant and getElementType(occupant) == "player") then
						if seat == 0 then 
							if getElementData(player, "char:ov") then 
								triggerServerEvent("createAmount", localPlayer, localPlayer, occupant, tonumber(calculateTraffipaxBirsag(speed)), limits)
							else
								triggerServerEvent("createAmount", localPlayer, localPlayer, occupant, tonumber(calculateTraffipaxBirsag(speed)) + 10, limits)
							end
							player = occupant
						end
					end
				end
				if getElementData(player, "char:ov") then 
					setElementData(player, "char:money", getElementData(player,"char:money") - math.floor(tonumber(calculateTraffipaxBirsag(speed))))
				else
					setElementData(player, "char:money", getElementData(player,"char:money") - math.floor(tonumber(calculateTraffipaxBirsag(speed))) - 10)
				end
				setElementData(vehicle, "Traffipax", true)
				setTimer (function () 
					setElementData(vehicle, "Traffipax", false)
				end,4000,1)
			end
		end
		dxDrawText("[#87D37C" .. plate .. "#ffffff] #87D37C" ..math.floor( speed ).."#ffffffKM/h " .. "MAX: #87D37C" .. math.floor(speedRecord * 10) / 10 .. "#ffffffKM/h Limit: #87D37C" .. limits .. "#ffffff KM/h", 0, 10, Kepernyom[1], 10, tocolor(255, 255, 255, 255), 1, "sans", "center", "center",false,false,false,true)
	else
		dxDrawText("[Nenhum sinal]", 0, 10, Kepernyom[1], 10, tocolor(210, 77, 87, 200), 1, "sans", "center", "center")
	end

	local memoryString = "Memory:\n\n"

	for k, v in ipairs(memory) do
		dxDrawText("[" ..v[1] .. "] " ..math.floor(v[2]) .. "#87D37CKM/h \n", 25, 25+k*(11), 300, Kepernyom[2] - 100, tocolor(255, 255, 255, 200), 0.75, "sans","left", "top",false,false,false,true)
	end

	
	if getKeyState("backspace") then
		
		localPlayer:setData("togInterface",false)		
		setElementData(speedCamera, "inUse", false)
		setElementData(localPlayer, "usingSpeedCamera", false)
		removeEventHandler("onClientRender", getRootElement(), SpeedCameraCreate)

		setCameraTarget(localPlayer)
		showCursor(false)

		setCursorAlpha(255)

		showChat(true)
	end
end
setCursorAlpha(255)
fadeCamera(true, 0.5)

function calculateTraffipaxBirsag(a)
	if math.ceil(a) > 100 then
		return math.ceil(a*2)
	else
		return math.ceil(a*1)
	end
end

function getElementDataPlayerByAccountID(owner,elementDataName)
	for k,v in ipairs(getElementsByType("player")) do
		if getElementData(v,"acc:id") == owner then
			return getElementData(v,elementDataName)
		end
	end
end

-- getElementModel(vehicle) ~= 597 and getElementModel(vehicle) ~= 604 and getElementModel(vehicle) ~= 426 and getElementModel(vehicle) ~= 523 and getElementModel(vehicle) ~= 585 and getElementModel(vehicle) ~= 490 and getElementModel(vehicle) ~= 479 and getElementModel(vehicle) ~= 497 and getElementModel(vehicle) ~= 596 and getElementModel(vehicle) ~= 404 and getElementModel(vehicle) ~= 525 and getElementModel(vehicle) ~= 578 and getElementModel(vehicle) ~= 422 and getElementModel(vehicle) ~= 416 and getElementModel(vehicle) ~= 487 and getElementModel(vehicle) ~= 420 

function speedCameraClick(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if button == "right" and state == "up" and clickedElement and getElementData(clickedElement, "speedCamera") and not isPedInVehicle(localPlayer) then
		if getElementData(clickedElement, "inUse") then
			outputChatBox("#D24D57[IRG] #ffffffAlguém já está usando!",255,255,255,true)
			return
		end
		setElementData(clickedElement, "inUse", true)
		setElementData(localPlayer, "usingSpeedCamera", clickedElement)
		addEventHandler("onClientRender", getRootElement(), SpeedCameraCreate)
		localPlayer:setData("togInterface",true)

		showCursor(true)

		setCursorAlpha(0)

		showChat(false)
	end
end
addEventHandler("onClientClick", getRootElement(), speedCameraClick)