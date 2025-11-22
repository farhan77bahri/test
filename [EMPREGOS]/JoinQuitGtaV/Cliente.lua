local maxMessages = 3;
local DefaultTime = 6;

local sx_, sy_ = guiGetScreenSize ( )
local sx, sy = sx_/1280, sy_/720 
local DefaultPos = false;
local messages_top = { }
local messages_btm = { }

function start_cl_resource()
	start = getTickCount()
end
addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),start_cl_resource)

local panelState = true
function handleMinimize()
    panelState = false 
end
addEventHandler( "onClientMinimize", root, handleMinimize )

function handleRestore( didClearRenderTargets )
    panelState = true 
end
addEventHandler("onClientRestore",root,handleRestore)


function sendClientMessage ( msg, r, g, b, pos, time )
	if ( not msg ) then return false end
	

	if ( pos == nil ) then pos = DefaultPos end
	local r, g, b = r or 255, g or 255, b or 255
	local time = tonumber ( time ) or DefaultTime
	local data = { 
		message = msg,
		r = r,
		g = g,
		b = b,
		locked=true,
		rTick = getTickCount ( ) + (time*1000)
	}
	--> Scripters note: 
		--> The remove and intro fades are handled in the render event
	if ( pos == false or pos == "bottom" ) then
		table.insert ( messages_btm, data )
		return true
	end
	return false
end 
addEvent ( getResourceName ( getThisResource ( ) )..":sendClientMessage", true )
addEventHandler ( getResourceName ( getThisResource ( ) )..":sendClientMessage", root, sendClientMessage )

local sx, sy = guiGetScreenSize()
local xFactor, yFactor = sx/1556, sy/768
local yFactor = xFactor --otherwise the radar looses it's 2:3 ratio.

function dxDrawNotificationBar ( )
	if panelState then
if getElementData (localPlayer, "EsconderHUD") == true then return end
	local doRemove = { top = { }, bottom = { } }	-- This is used so it prevents the next message from flashing

	-- Bottom Message Bar
	for i, v in pairs ( messages_btm ) do
		if ( v.rTick <= getTickCount ( ) ) then
			table.remove ( messages_btm, i )
		end

		dxDrawImage ( 40*xFactor, sy-(205+(i*46))*yFactor, 320*xFactor, 42*yFactor, "fundo.png", 0, 0, 0, tocolor(0, 0, 0, 220))
		dxDrawText ( tostring ( v.message ), 49*xFactor, sy-(193+(i*46))*yFactor, 10, 10*xFactor, tocolor ( v.r, v.g, v.b, 250 ), 1.11*yFactor, "default-bold",  nil, nil, true, true, true, true)	



	end 
	if ( #messages_btm > maxMessages and messages_btm[1].locked ) then
		messages_btm[1].locked = false
	end 

	-- handle message removes
	if ( #doRemove.bottom > 0 ) then
		for i, v in pairs ( doRemove.bottom ) do
			table.remove ( messages_btm, v )
		end
	end
end
end
addEventHandler ( "onClientRender", root, dxDrawNotificationBar )






local screenWidth, screenHeight = guiGetScreenSize( ) 
--local boxX, boxY = 48 * screenWidth / screenWidth, 830 * screenHeight / screenHeight 
local boxX, boxY = 50 * screenWidth / screenWidth, 50 * screenHeight / screenHeight 
 
local tipBox1 = { string = "" } 

local boxPadding = 15 
local lineHeight = dxGetFontHeight(1.11, "default-bold" ) 
local minimumWidth = 350 
local offsetWidth = 25 
  





local notificationQueue = {} 
local drawNotifications 
  
function createNotification(id, message, showTicks ) 
    if notificationQueue[id] then 
        destroyNotification(id) 
    end 
     
    if type(message) ~= "string" then 
        return false 
	end 
	if not showTicks then 
        showTicks = 900
    end 

     
    local newNotification = {} 
	newNotification.message = message  
	newNotification.showTicks = showTicks*900 
	newNotification.lastAlpha = 0 
    newNotification.shownTicks = 0 

    if #notificationQueue == 0 then 
		addEventHandler("onClientRender", root, drawNotifications) 
		showChat(true)--false
	--	setTimer ( destroyNotification, showTicks*1000, 1, notificationQueue[id] )
	local sound = playSound("noti.mp3", false) 
	setSoundVolume(sound, 1.0)

    end 
    notificationQueue[id] = newNotification 
end 
addEvent ( getResourceName ( getThisResource ( ) )..":notifications", true )
addEventHandler ( getResourceName ( getThisResource ( ) )..":notifications", root, createNotification )
  


function destroyNotification(id) 
    if notificationQueue[id] then 
        notificationQueue[id] = nil 
     
        if #notificationQueue == 0 then 
			removeEventHandler("onClientRender", root, drawNotifications)
			showChat(true)
        end 
    end 
end 


--triggerClientEvent(root,"JoinQuitGtaV:notifications", root,"teste", "Nova Regra adicionada na sala avisos, peço que todos principalmente polciais e bandido deem uma olhada!", 30 )
--triggerEvent("JoinQuitGtaV:notifications", localPlayer,"teste", "GALERA QUEM ACHA O SILVA FEIO DIGITA SILVA LINDO", 10 )

function drawNotifications( )
	if panelState then
	local doRemove1 = { top = { }, bottom = { } }	-- This is used so it prevents the next message from flashing

	for id, notification in pairs(notificationQueue) do 

		tipBox1.string = tostring ( notification.message )

		
	 
		if ( tipBox1.string:len( ) > 2000 ) then 
			tipBox1.string = "" 
		end 
	 
	local lines = 0 
	local wordbreak = false 
	local lineWidth = dxGetTextWidth(tipBox1.string, 1, "default-bold" ) 
	 
	while ( lineWidth + offsetWidth > minimumWidth ) do 
		lineWidth = lineWidth - minimumWidth 
		lines = lines + 1 
		wordbreak = true 
	end 
	 
	local boxWidth, boxHeight = minimumWidth + ( boxPadding * 3 ), ( lineHeight * ( lines + 1 ) ) + ( boxPadding * 2 ) 

	 
	local textX, textY = boxX + boxPadding, boxY + boxPadding 
	local textWidth, textHeight = textX + minimumWidth , textY + lineHeight + boxPadding 
	
			 
	--dxDrawRectangle( boxX, boxY, boxWidth, boxHeight, tocolor( 0, 0, 0, 185 ), true ) 
	--dxDrawText( tipBox1.string, textX, textY, textWidth, textHeight, tocolor( 222, 222, 222, 255 ), 1, "default-bold", "left", "top", false, wordbreak, true ) 

	local shownTicks, lastAlpha = notification.shownTicks, notification.lastAlpha 

	if shownTicks == 0 then 
		if lastAlpha < 200 then 
			lastAlpha = lastAlpha + 6 
			if lastAlpha > 200 then 
				lastAlpha = 200 
			end 
		
			notification.lastAlpha = lastAlpha 
		else 
			notification.firstTick = getTickCount() 
			notification.shownTicks = 1 
		end 
	elseif shownTicks >= notification.showTicks then -- Fade out or delete old notifications 
		if lastAlpha > 0 then 
			lastAlpha = lastAlpha - 6 
			if lastAlpha < 0 then 
				lastAlpha = 0 
			end 
			 
			notification.lastAlpha = lastAlpha 
		else 
			destroyNotification(id) 
		end 
	else 
		notification.shownTicks = getTickCount() - notification.firstTick 
	end 


	 
	dxDrawRectangle( boxX, boxY, boxWidth, boxHeight, tocolor( 0, 0, 0, 185 ), true ) 
	dxDrawText( tipBox1.string, textX, textY, textWidth, textHeight, tocolor( 222, 222, 222, 255 ), 1, "default-bold", "left", "top", false, wordbreak, true )
end 
end

end 


