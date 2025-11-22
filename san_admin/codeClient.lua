

-- Kliens fájlok törlése a kliens gépről --
if fileExists("codeClient.lua") then
	fileDelete("codeClient.lua")
end
if fileExists("codeClient.luac") then
	fileDelete("codeClient.luac")
end
-------------------------------------------

addEventHandler("onClientPlayerDamage", getRootElement(), --Nem sebződsz admindutyban
	function() 
		if getElementData(source, "char:adminduty") == 1 then
			cancelEvent()
		end
	end
)

function playerNotDamageinAJ() --Nem sebződsz adminjail ben.
	if getElementData(source, "adminjail") == 1 then
		cancelEvent()
		return
	end
end
addEventHandler("onClientPlayerDamage", getRootElement(), playerNotDamageinAJ)





function onStatsCreate(showP)
	if showStats then
		showStats = false
		showingPlayer = false
		showingPlayer = nil
		removeEventHandler("onClientRender", root, renderStatsPanel)
	else
		showStats = true
		
		if showP ~= localPlayer then
			showingPlayer = showP
		else
			showingPlayer = localPlayer
		end
		
		addEventHandler("onClientRender", root, renderStatsPanel)
	end
		
end
addEvent("onStatsCreate", true)
addEventHandler("onStatsCreate", root, onStatsCreate)


function renderStatsPanel()
		if not showingPlayer then removeEventHandler("onClientRender", root, renderStatsPanel) showStats = false return end
		if tonumber(getElementData(showingPlayer, "acc:admin") or 0) > 0 then
			admin = "tem [" .. getElementData(showingPlayer, "acc:admin") .. "]"
		else
			admin = "não [0]"
		end
		
		if (getElementData(showingPlayer, "adminjail") or 0) == 1 then
			ajailed = "sim"
		else
			ajailed = "não"
		end
	
	local monitorSize = {guiGetScreenSize()}
	local panelSize = {500, 500}
	local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2
	--- Lekérések --
local sx, sy = guiGetScreenSize()
local myScreenSource = dxCreateScreenSource(sx/2, sy/2)
--dxDrawRectangle(sx/2-250,sy/2-95,500,30,tocolor(0,0,0,150))
dxDrawRectangle(sx/2-250,sy/2-230,500,300,tocolor(0,0,0,100))
	local texts = {
	{"Conta ID: #7cc576" .. getElementData(showingPlayer, "acc:id") .. ""}, 
	{"Nome do personagem: #7cc576" .. getElementData(showingPlayer, "char:name") .. ""}, 
	{"Dinheiro do jogador: #7cc576R$: " .. convertNumber(getElementData(showingPlayer, "char:money")) .. ""}, 
	{"Saldo bancário: #7cc576R$: " .. convertNumber(getElementData(showingPlayer, "char:bankmoney")) .. ""}, 
	{"Nível de Administrador: #7cc576" .. admin .. ""}, 
	{"Slot de Veículo: #7cc576" .. getElementData(showingPlayer, "char:vehSlot") .. ""}, 
	{"TimePlaye: #7cc576" .. getElementData(showingPlayer, "char:onlineTime") .. "Saat"}, 
	
	{"Slot de Imóveis: #7cc576" .. getElementData(showingPlayer, "char:houseSlot") .. ""}, 
	{"PP disponível: #7cc576" .. convertNumber(getElementData(showingPlayer, "char:pp")) .. " pontos"},
	--{"TIME disponível: #7cc576" .. getElementData(showingPlayer, "char:OnlinePlayed") .. " pontos"},
	{"Prisão: #7cc576" .. ajailed .. ""},}
		
		--dxDrawRectangle(panelX, panelY, panelSize[1], panelSize[2], tocolor(0, 0, 0, 180))
		--dxDrawRectangle(panelX, panelY, panelSize[1], 25, tocolor(0, 0, 0, 230))
		

		for i, v in ipairs(texts) do
		
		--	dxDrawRectangle(panelX+10, panelY+32-30+(i*30), panelSize[1]-20, 25, tocolor(0, 0, 0, 230))
			dxDrawText(v[1], panelX+10+5, panelY+32-30+(i*30)+12.5, panelX+10, panelY+32-30+(i*30)+12.5, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, true)

		end

end



local getPlayerAdminName = function(p)
	local name = tostring(getElementData(p, "char:anick")) or ""
	return name
end

-- /fly
---- FLY ----

local flyingState = false
local keys = {}
keys.up = "up"
keys.down = "up"
keys.f = "up"
keys.b = "up"
keys.l = "up"
keys.r = "up"
keys.a = "up"
keys.s = "up"
keys.m = "up"

addEvent("onClientFlyToggle",true)
addEventHandler("onClientFlyToggle",getLocalPlayer(),function()
	flyingState = not flyingState
	
	if flyingState then
		addEventHandler("onClientRender",getRootElement(),flyingRender)
		bindKey("lshift","both",keyH)
		bindKey("rshift","both",keyH)
		bindKey("lctrl","both",keyH)
		bindKey("rctrl","both",keyH)
		
		bindKey("forwards","both",keyH)
		bindKey("backwards","both",keyH)
		bindKey("left","both",keyH)
		bindKey("right","both",keyH)
		
		bindKey("lalt","both",keyH)
		bindKey("space","both",keyH)
		bindKey("ralt","both",keyH)
		bindKey("mouse1","both",keyH)
		--setElementFrozen(getLocalPlayer(),true)
		setElementCollisionsEnabled(getLocalPlayer(),false)
	else
		removeEventHandler("onClientRender",getRootElement(),flyingRender)
		unbindKey("mouse1","both",keyH)
		unbindKey("lshift","both",keyH)
		unbindKey("rshift","both",keyH)
		unbindKey("lctrl","both",keyH)
		unbindKey("rctrl","both",keyH)
		
		unbindKey("forwards","both",keyH)
		unbindKey("backwards","both",keyH)
		unbindKey("left","both",keyH)
		unbindKey("right","both",keyH)
		
		unbindKey("space","both",keyH)
		
		keys.up = "up"
		keys.down = "up"
		keys.f = "up"
		keys.b = "up"
		keys.l = "up"
		keys.r = "up"
		keys.a = "up"
		keys.s = "up"
		--setElementFrozen(getLocalPlayer(),false)
		setElementCollisionsEnabled(getLocalPlayer(),true)
	end
end)

function flyingRender()
	local x,y,z = getElementPosition(getLocalPlayer())
	local speed = 10
	if keys.a=="down" then
		speed = 3
	elseif keys.s=="down" then
		speed = 50
	elseif keys.m=="down" then
		speed = 300
	end
	
	if keys.f=="down" then
		local a = rotFromCam(0)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	elseif keys.b=="down" then
		local a = rotFromCam(180)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	end
	
	if keys.l=="down" then
		local a = rotFromCam(-90)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	elseif keys.r=="down" then
		local a = rotFromCam(90)
		setElementRotation(getLocalPlayer(),0,0,a)
		local ox,oy = dirMove(a)
		x = x + ox * 0.1 * speed
		y = y + oy * 0.1 * speed
	end
	
	if keys.up=="down" then
		z = z + 0.1*speed
	elseif keys.down=="down" then
		z = z - 0.1*speed
	end
	
	setElementPosition(getLocalPlayer(),x,y,z)
end

function keyH(key,state)
	if key=="lshift" or key=="rshift" then
		keys.s = state
	end	
	if key=="lctrl" or key=="rctrl" then
		keys.down = state
	end	
	if key=="forwards" then
		keys.f = state
	end	
	if key=="backwards" then
		keys.b = state
	end	
	if key=="left" then
		keys.l = state
	end	
	if key=="right" then
		keys.r = state
	end	
	if key=="lalt" or key=="ralt" then
		keys.a = state
	end	
	if key=="space" then
		keys.up = state
	end	
	if key=="mouse1" then
		keys.m = state
	end	
end

function rotFromCam(rzOffset)
	local cx,cy,_,fx,fy = getCameraMatrix(getLocalPlayer())
	local deltaY,deltaX = fy-cy,fx-cx
	local rotZ = math.deg(math.atan((deltaY)/(deltaX)))
	if deltaY >= 0 and deltaX <= 0 then
		rotZ = rotZ+180
	elseif deltaY <= 0 and deltaX <= 0 then 
		rotZ = rotZ+180
	end
	return -rotZ+90 + rzOffset
end

function dirMove(a)
	local x = math.sin(math.rad(a))
	local y = math.cos(math.rad(a))
	return x,y
end


function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end




function privateMessage(player)

	local sound = playSound("1.mp3")
	setSoundVolume(sound, 1)

end
addEvent("privatUzenetErkezett1", true)
addEventHandler("privatUzenetErkezett1", getRootElement(), privateMessage)

function valasz(player)

	--local sound = playSound("files/cool_sms.mp3")
	--setSoundVolume(sound, 0.5)

end
addEvent("valaszKuldes", true)
addEventHandler("valaszKuldes", getRootElement(), valasz)

function enter(player)

	--local sound = playSound("files/enter.mp3")
	--setSoundVolume(sound, 0.5)

end
addEvent("enter", true)
addEventHandler("enter", getRootElement(), enter)

function asaySound(player)

--	local sound = playSound("files/asay.wav")
--	setSoundVolume(sound, 0.5)

end
addEvent("asaySound", true)
addEventHandler("asaySound", getRootElement(), asaySound)



local showaj = false
local admin
local reason
local ido
local state

function triggerAdminjail(admin, reason, ido, state, ido2)
	
	showaj = true
	addEventHandler("onClientRender", root, showAjPanel)
	
	if state == 1 then
		adminName = getPlayerName(admin)
	else
		adminName = admin
	end
	
	Reason = reason
	Ido = ido
	Ido2 = ido2 or 0
	State = state
	
	setTimer(function()
		showaj = false
		removeEventHandler("onClientRender", root, showAjPanel)
	end, 8000, 1)

end
addEvent("triggerAdminjail", true)
addEventHandler("triggerAdminjail", getRootElement(), triggerAdminjail)

function showAjPanel()
	if showaj then
		local monitorSize = {guiGetScreenSize()}
		local panelX, panelY = monitorSize[1]/2, monitorSize[2]/2

			if State == 1 then
				text = "#D64541Admin Jail#ffffff \n\n#7cc576" .. adminName .. "#ffffff Shoma Be Modate #0094ff" .. Ido .. "#ffffff Daghighe Jail Shodi.\n Dalil: #7cc576" .. Reason .. "\n\n#ffffffBaraye Didane Zamane Jail Az  #7cc576/tempo #ffffffEstefade Konid."
			elseif State == 2 then
				text = "#D64541Admin Jail#ffffff \n\n#7cc576" .. adminName .. "#ffffff Shoma Be Modate #0094ff" .. Ido .. "#ffffff Daghighe Jail Shodi. Vai sair em: #0094ff" .. Ido2 .. "#ffffff minuto.\ncausa: #7cc576" .. Reason .. "\n\n#ffffffBaraye Didane Zamane Jail Az  #7cc576/tempo #ffffffEstefade Konid."
			else
				text = "#D64541Admin Jail#ffffff \n\n#7cc576" .. adminName .. "#ffffff Shoma Be Modate #0094ff" .. Ido .. "#ffffff Daghighe Jail Shodi.\nDalil: #7cc576" .. Reason .. "\n\n#ffffffBaraye Didane Zamane Jail Az  #7cc576/tempo#ffffff Estefade Konid."
			end
		dxDrawText(text, panelX, panelY, panelX, panelY, tocolor(255, 255, 255, 255), 1.6, "default-bold", "center", "center", false, false, true, true)
	end
end

function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end

local showStats = false












local font = "default-bold" --dxCreateFont("roboto.ttf", 14)

function formatDate(sec)
	local min = math.floor(sec/60)
	sec = sec-(min*60)
	if(min<10)then
		min = "0"..min
	end
	if(sec<10)then
		sec = "0"..sec
	end
	return min..":"..sec
end

local alpha = 255
local shutdownTime = nil
local fadeState = "down"

addEvent("setCuccok",true)
addEventHandler("setCuccok",root,function(time,indok)
	shutdownTime = time*60
	
	shutdownTimer = setTimer(function()
		shutdownTime = shutdownTime -1
	end,1000,0)

	
end)


local sx,sy = guiGetScreenSize()


function getPos()
	if getElementData(localPlayer,"acc:admin") >= 7 then
		local x,y,z = getElementPosition(localPlayer)
		local int = getElementInterior(localPlayer)
		local rotation = getPedRotation(localPlayer)
		local dim = getElementDimension(localPlayer)
		local position = x .. ", " .. y .. ", " .. z
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox("#7cc576[IRG] #ffffffPos:  #7cc576".. position, 255, 255, 255, true)
		outputChatBox("#7cc576[IRG] #ffffffRot:  #7cc576".. rotation, 255, 255, 255,true)
		outputChatBox("#7cc576[IRG] #ffffffInterior:  #7cc576"..int, 255, 255, 255, true)
		outputChatBox("#7cc576[IRG] #ffffffDimension:  #7cc576"..dim, 255, 255, 255, true)
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
	end
end
addCommandHandler("pos",getPos)



function getPos1()
	if getElementData(localPlayer,"acc:admin") >= 7 then
		local x,y,z =  getElementPosition(localPlayer)
		 
		local int = getElementInterior(localPlayer)
		local rotation = getPedRotation(localPlayer)
		local dim = getElementDimension(localPlayer)
		local position = "".. x .. " " .. y .. " " .. z
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox("#7cc576[IRG] #ffffffPos:  #7cc576".. position, 255, 255, 255, true)
		outputChatBox("#7cc576[IRG] #ffffffRot:  #7cc576".. rotation, 255, 255, 255,true)
		outputChatBox("#7cc576[IRG] #ffffffInterior:  #7cc576"..int, 255, 255, 255, true)
		outputChatBox("#7cc576[IRG] #ffffffDimension:  #7cc576"..dim, 255, 255, 255, true)
		outputChatBox(" ")
		outputChatBox(" ")
		outputChatBox(" ")
		setClipboard( "".. x .. " " .. y .. " " .. z )
	end
end
addCommandHandler("getpos",getPos1)

addEventHandler("onClientRender", root, function()
	if shutdownTime then
			if fadeState == "down" then
				if alpha > 0 then
					alpha = alpha - 15
				else
					alpha = 0
					fadeState = "up"
				end
			else
				if alpha < 255 then
					alpha = alpha + 15
				else
					fadeState = "down"
					alpha = 255
				end
			end
			

		
		dxDrawText("Servidor vai reiniciar em: ".. formatDate(shutdownTime), 2, 22, sx, 80, tocolor(0,0,0,alpha),2, font, "center", "center")
		dxDrawText("Servidor vai reiniciar em: ".. formatDate(shutdownTime), 0, 20, sx, 80, tocolor(215,86,86,alpha),2, font, "center", "center")
		alpha = 255
		dxDrawText("Servidor vai reiniciar em: ".. formatDate(shutdownTime), 2, 22, sx, 80, tocolor(0,0,0,alpha),2, font, "center", "center")
		dxDrawText("Servidor vai reiniciar em: ".. formatDate(shutdownTime), 0, 20, sx, 80, tocolor(215,86,86,alpha),2, font, "center", "center")
		if shutdownTime <= 0 then
			killTimer(shutdownTimer)
			killTimer(hirdTimer)
			shutdownTime = nil
			outputChatBox("#D75656[ATENÇÃO]:#FFFFFF O servidor vai #53bfdcreiniciar #FFFFFFem 5 segundos",255,255,255,true)
			setTimer(function()
				triggerServerEvent("serverleall",localPlayer,localPlayer)
			end,5000,1)
		end
	end
end)








local drawDistance = 7
g_StreamedInPlayers = {}

function onClientRender()
  local cx, cy, cz, lx, ly, lz = getCameraMatrix()
  for k, player in pairs(g_StreamedInPlayers) do
    if isElement(player) and isElementStreamedIn(player) then
	
      do
        local vx, vy, vz = getPedBonePosition(player, 4)
        local dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz)
        if dist < drawDistance and isLineOfSightClear(cx, cy, cz, vx, vy, vz, true, false, false) then
          local x, y = getScreenFromWorldPosition(vx, vy, vz + 0.3)
          if x and y then
		  if getElementData(player, "char:adminduty") == 0 then
		  if getElementData(player,"mascara") then return end
		if getElementData(player,"mascara2") then  return end
		if getElementData(player,"mascara3") then  return end

		if getElementData(player,"mascara5") then  return end
		if getElementData(player,"mascara6") then  return end
		--if getElementData(player,"mascara7") then  return end
		if getElementData(player,"mascara8") then  return end
		  if not getElementData(localPlayer, "hud") then
            local ID = getElementData(player, "acc:id") or "N/A"
            local w = dxGetTextWidth(ID, 0.1, "default-bold")
            local h = dxGetFontHeight(1, "default-bold")
            dxDrawText(""..ID.."", x - 1 - w / 1, y - 1 - h - 12, w, h, CorTag, 1.20, "default-bold", "left", "top", false, false, false, false, false)		
            CorTag = tocolor(255, 255, 255)
			
			if getElementData(player, "Cor", true) then
 			CorTag = tocolor(0, 0, 255)
			end
			end

          end
        end
		end
      end
    else
      table.remove(g_StreamedInPlayers, k)
    end
  end

end
addEventHandler("onClientRender", root, onClientRender)


function CorTagid ()
   if getElementData(localPlayer, "Cor", true) then
      setElementData(localPlayer, "Cor", false)
	else
      setElementData(localPlayer, "Cor", true)
   end
end
bindKey ( "z", "both", CorTagid )

function onClientElementStreamIn()
  if getElementType(source) == "player" and source ~= getLocalPlayer() then
    setPlayerNametagShowing(source, false)
    table.insert(g_StreamedInPlayers, source)
  end
end
addEventHandler("onClientElementStreamIn", root, onClientElementStreamIn)

function onClientResourceStart(startedResource)
  visibleTick = getTickCount()
  counter = 0
  local players = getElementsByType("player")
  for k, v in pairs(players) do
    if isElementStreamedIn(v) and v ~= getLocalPlayer() then
      setPlayerNametagShowing(v, false)
      table.insert(g_StreamedInPlayers, v)
    end
  end
end
addEventHandler("onClientResourceStart", resourceRoot, onClientResourceStart)













local controls = { "fire", "next_weapon", "previous_weapon", "forwards", "backwards", "left", "right", "zoom_in", "zoom_out",
 "change_camera", "jump", "sprint", "look_behind", "crouch", "action", "walk", "aim_weapon", "conversation_yes", "conversation_no",
 "group_control_forwards", "group_control_back", "enter_exit", "vehicle_fire", "vehicle_secondary_fire", "vehicle_left", "vehicle_right",
 "steer_forward", "steer_back", "accelerate", "brake_reverse", "radio_next", "radio_previous", "radio_user_track_skip", "horn", "sub_mission",
 "handbrake", "vehicle_look_left", "vehicle_look_right", "vehicle_look_behind", "vehicle_mouse_look", "special_control_left", "special_control_right",
 "special_control_down", "special_control_up" }

local boundControlsKeys = {}
local bindsData = {}


function unbindControlKeys(control)
    -- Ensure the argument has got the appropiate type
    assert(type(control) == "string", "Bad argument @ unbindControlKeys [string expected, got " .. type(control) .. "]")
    -- Check if we have a valid control
    local validControl
    for _, controlComp in ipairs(controls) do
        if control == controlComp then
            validControl = true
            break
        end
    end
    assert(validControl, "Bad argument @ unbindControlKeys [Invalid control name]")
    -- Have we got a bind on this control?
    assert(boundControlsKeys[control], "Bad argument @ unbindControlKeys [There is no bind on such control]")
    -- Unbind each key of the control
    for _, bindData in pairs(bindsData[control]) do
        unbindKey(unpack(bindData))
    end
    -- Remove references
    boundControlsKeys[control] = nil
    bindsData[control] = nil
    return true
end

function bindControlKeys(control, ...)
    -- Ensure the argument has got the appropiate type
    assert(type(control) == "string", "Bad argument 1 @ bindControlKeys [string expected, got " .. type(control) .. "]")
    -- Check if we have a valid control
    local validControl
    for _, controlComp in ipairs(controls) do
        if control == controlComp then -- Is the specified control in the table?
            validControl = true -- If so, it's a valid control
            break
        end
    end
    assert(validControl, "Bad argument 1 @ bindControlKeys [Invalid control name]")
    -- Do we already have this control bound?
    if boundControlsKeys[control] then
        unbindControlKeys(control) -- Delete the first control keys bind
    end
    boundControlsKeys[control] = getBoundKeys(control) -- Store the keys of that control that will be bound
    bindsData[control] = {} -- Store bind data, so we can unbind each key of the control later
    for key in pairs(boundControlsKeys[control]) do
        -- Can we bind the key with the specified arguments?
        assert(bindKey(key, unpack(arg)), "Bad arguments @ bindControlKeys [Could not create key bind]")
        -- If so, register the bind data and continue
        table.insert(bindsData[control], { key, unpack(arg) })
    end
    return true
end

-- The keys bound to a control can be changed in Settings. The next function updates the binds properly in that case.
-- Also note that the next function IS NOT MEANT to be exported or called by the script.
local function keepControlKeyBindsAccurate()
    if next(boundControlsKeys) then -- Have we got any control keys bound?
        for boundControl, boundKeys in pairs(boundControlsKeys) do
            if toJSON(boundKeys) ~= toJSON(getBoundKeys(boundControl)) then -- Have we changed the keys bound to a control?
                -- Update our custom control bind
                for _, bindData in ipairs(bindsData[boundControl]) do
                    unbindKey(unpack(bindData)) -- Unbind every key of that cotnrol that we have bound before
                    -- Bind again the appropiate keys
                    for key in pairs(getBoundKeys(boundControl)) do
                        local bindDataNoKey = bindData -- Copy bindData into another variable
                        table.remove(bindDataNoKey, 1) -- Ignore the key of our bindData
                        bindKey(key, unpack(bindDataNoKey)) -- Bind again the data, but with the updated key
                        bindData[1] = key -- Update the key in the references
                    end
                end
                boundControlsKeys[boundControl] = getBoundKeys(boundControl) -- Update the control bound keys list
            end
        end
    end
end
addEventHandler("onClientRender", root, keepControlKeyBindsAccurate)

local function toggleDriveby()
	local weaponType = getPedWeapon (localPlayer)
		-- If a weapon type was returned then
	if isPedInVehicle(localPlayer) and getPedOccupiedVehicleSeat(localPlayer) ~= 0 then
	else
	if weaponType == 24 or weaponType == 23 then
	
		setPedDoingGangDriveby(localPlayer, not isPedDoingGangDriveby(localPlayer))
		
		
	end
	return end

	
		if ( weaponType == 24 or weaponType == 23 or weaponType == 31 or weaponType == 30) then

  
        setPedDoingGangDriveby(localPlayer, not isPedDoingGangDriveby(localPlayer))
    
	
end
end

bindControlKeys("aim_weapon", "both", toggleDriveby)


function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement )

	if weapon == 24 or weapon == 23 or weapon == 25 or weapon == 27 then 
		if (isPedInVehicle(localPlayer)) then
		--setPedDoingGangDriveby (hitElement, false )
		injekcioTimer = setTimer(function() 
			toggleControl ( "vehicle_fire", true )
			toggleControl ( "vehicle_secondary_fire", true )
		end, 1000, 1)
		toggleControl ( "vehicle_fire", false ) 
		toggleControl ( "vehicle_secondary_fire", false )
	end

    
	end
	
		
	
	
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), onClientPlayerWeaponFireFunc )











cooldown = 0 
cooldownTimer = nil 
localPlayer = getLocalPlayer() 
  
  
--function isPD() 
--  return exports.factions:isPlayerInFaction( localPlayer, 1 ) 
--end 
  
function switchMode() 

    if (getPedWeapon(localPlayer)==23) and (getPedTotalAmmo(localPlayer)>0) then
	  
    	-- has ammo 
        local mode = getElementData(localPlayer, "silencedmode") 
        if mode == 1 then -- tazer mode 
            triggerServerEvent("silencedmode", localPlayer, localPlayer, 2) 
            outputChatBox( "You switched your weapon to radar gun.", 0, 255, 0 ) 
        elseif mode == 0 
    --  and isPD() 
        then -- lethal mode 
            outputChatBox( "You switched your weapon to taser.", 0, 255, 0 ) 
            triggerServerEvent("silencedmode", localPlayer, localPlayer, 1) 
        elseif mode == 2 or mode == 0 then -- radar gun mode 
            outputChatBox( "You switched your weapon mode to lethal.", 0, 255, 0 ) 
            triggerServerEvent("silencedmode", localPlayer, localPlayer, 0) 
        end 
    end 
end 
  
function bindKeys(res) 
if getElementData(localPlayer, "char:dutyfaction") == 1 then
    bindKey("n", "down", switchMode) 
    local mode = getElementData(localPlayer, "silencedmode") 
    if not (mode) then triggerServerEvent("silencedmode", localPlayer, localPlayer, 0) end 
end 
end
addEventHandler("onClientResourceStart", getResourceRootElement(), bindKeys) 
  
function enableCooldown() 
    cooldown = 0 
    cooldownTimer = setTimer(disableCooldown, 2000, 1) 
    toggleControl("fire", false) 
    setElementData(getLocalPlayer(), "silenced:reload", true) 
end 
  
function disableCooldown() 
    cooldown = 1 
    toggleControl("fire", true) 
    setElementData(getLocalPlayer(), "silenced:reload", false) 
  
    if (cooldownTimer~=nil) then 
        killTimer(cooldownTimer) 
        cooldownTimer = nil 
    end 
end 
addEventHandler("onClientPlayerWeaponSwitch", getRootElement(), disableCooldown) 
  
function weaponFire(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement) 
    if (weapon==23) then -- silenced 
        local mode = getElementData(localPlayer, "silencedmode") 
        if (mode==1) then -- tazer mode 
            enableCooldown() 
            local px, py, pz = getElementPosition(localPlayer) 
            local distance = getDistanceBetweenPoints3D(hitX, hitY, hitZ, px, py, pz) 
            
            if (distance<35) then 
                fxAddSparks(hitX, hitY, hitZ, 1, 1, 1, 1, 10, 0, 0, 0, true, 3, 1) 
            end 
			local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
			sound = playSound3D("1.mp3", muzzleX, muzzleY, muzzleZ, false)
        	setSoundMaxDistance(sound, 60)
            playSoundFrontEnd( 38) 
            triggerServerEvent("tazerFired", localPlayer, hitX, hitY, hitZ, hitElement) 
        end 
    end 
end 
addEventHandler("onClientPlayerWeaponFire", localPlayer, weaponFire) 
  
function weaponAim(target) 
    if (target) then 
        if (getElementType(target)=="vehicle") then 
            if (getPedWeapon(localPlayer)==23) then 
                local mode = getElementData(localPlayer, "silencedmode") 
                
                if (mode==2) then 
                    actualspeed = exports.global:getVehicleVelocity(target) 
                    outputChatBox(getVehicleName(target) .. " clocked in at " .. actualspeed .. " km/h.", 255, 194, 14) 
                end 
            end 
        end 
    end 
end 
addEventHandler("onClientPlayerTarget", getRootElement(), weaponAim) 
  
-- code for the target/tazed person 
function cancelTazerDamage(attacker, weapon, bodypart, loss) 
    if (weapon==23) then -- silenced 
        local mode = getElementData(attacker, "silencedmode") 
        if (mode==1 or mode==2) then -- tazer mode / radar gun mode 
            cancelEvent() 
        end 
    end 
end 
addEventHandler("onClientPlayerDamage", localPlayer, cancelTazerDamage) 
  
function showTazerEffect(x, y, z) 
    fxAddSparks(x, y, z, 1, 1, 1, 1, 100, 0, 0, 0, true, 3, 2) 
    playSoundFrontEnd(38) 
end 
addEvent("showTazerEffect", true ) 
addEventHandler("showTazerEffect", getRootElement(), showTazerEffect) 
  
local underfire = false 
local fireelement = nil 
local localPlayer = getLocalPlayer() 
local originalRot = 0 
local shotsfired = 0 
  
function onTargetPDPed(element) 
    if (isElement(element)) then 
        if (getElementType(element)=="ped") and (getElementModel(element)==282 or getElementModel(element)==280 or getElementModel(element)==285) and not (underfire) and (getPedControlState("aim_weapon")) then 
            underfire = true 
            fireelement = element 
            originalRot = getPedRotation(element) 
            addEventHandler("onClientRender", getRootElement(), makeCopFireOnPlayer) 
            addEventHandler("onClientPlayerWasted", getLocalPlayer(), onDeath) 
        end 
    end 
end 
addEventHandler("onClientPlayerTarget", getLocalPlayer(), onTargetPDPed) 
  
function makeCopFireOnPlayer() 
    if (underfire) and (fireelement) then 
        local rot = getPedRotation(localPlayer) 
        local x, y, z = getPedBonePosition(localPlayer, 7) 
        
        setPedRotation(fireelement, rot - 180) 
        
        setPedControlState(fireelement, "aim_weapon", true) 
        setPedAimTarget(fireelement, x, y, z) 
        setPedControlState(fireelement, "fire", true) 
        shotsfired = shotsfired + 1 
        
    --  if (shotsfired>40) then 
    --      triggerServerEvent("killmebyped", getLocalPlayer(), fireelement) 
    --  end 
    end 
end 
  
function onDeath() 
    if (fireelement) and (underfire) then 
        setPedControlState(fireelement, "aim_weapon", false) 
        setPedControlState(fireelement, "fire", false) 
        setPedRotation(fireelement, originalRot) 
        
        fireelement = nil 
        underfire = false 
        removeEventHandler("onClientRender", getRootElement(), makeCopFireOnPlayer) 
        removeEventHandler("onClientPlayerWasted", getLocalPlayer(), onDeath) 
    end 
end 



















--[[function seda ( )

setWorldSoundEnabled(5, 0, true, true)
setWorldSoundEnabled(0, 22, false, true)
setWorldSoundEnabled(0, 30, false, true)
toggleWeaponSounds_f
   local enabled = isWorldSoundEnabled ( 5 ) -- We place this variable here for checking.
    enabled = not enabled -- And here we invert (toggle) the variable, so if it's false, it becomes true, if it's true, it becomes false.
    -- Used for the chat declaration:
    local state   = "enabled"

    if (not enabled ) then
     state = "disabled"
    -- state = "disabled"
    end
    

    setWorldSoundEnabled ( 5, enabled ) -- And here the toggling happens.
   -- outputChatBox ( "Weapon sounds " .. state )
end
addEventHandler("onClientResourceStart", getResourceRootElement(), seda )]]












