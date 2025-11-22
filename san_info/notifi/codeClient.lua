local sx,sy = guiGetScreenSize ()
local font = dxCreateFont ("notifi/files/myriadproregular.ttf",14)
local headerSize = 1
local notificationTextSize = 0.7
local notificationWidth,notificationHeight = 256,128
local notificationHeaderX,notificationHeaderX2,notificationHeaderY,notificationHeaderY2 = 20,236,9,37
local notificationTextX,notificationTextX2,notificationTextY,notificationTextY2 = 20,236,41,118
local notificationIconSize = 32
local notificationIconX = notificationHeaderX2 - notificationIconSize
local notificationIconY = notificationHeaderY
local notificationX = sx-notificationWidth-50
local notificationStartY,notificationCenterY = sy - notificationHeight,sy/2
local notificationsOffset = 10
local notificationsList = {}
local notificationsShowingTime = 1500
local notificationsRenderTime = 8000
local notificationsHidingTime = 1000
local priorityText = {}
priorityText[1] = "Information"
priorityText[2] = "Warning"
priorityText[3] = "Warning"
local notificationsToDelete = {}

function createDebugNotification (text,priority)
	if text and priority then
		local cTick = getTickCount ()
		if notificationsList[1] then
			if notificationsList[1]["startTick"]+notificationsShowingTime > cTick then -- still showing
				cTick = notificationsList[1]["startTick"]+notificationsShowingTime
			end
		end
		local tab = {}
		tab["text"] = text
		tab["priority"] = priority
		tab["startTick"] = cTick
		table.insert (notificationsList,1,tab)
		outputConsole ("[NOTIFICATION][p" .. priority .. "]: " .. text)
	end
end

addEvent ("onNewNotificationCreate",true)
addEventHandler ("onNewNotificationCreate",getRootElement(),
	function (text,priority)
		createDebugNotification (text,priority)
	end
)

function meghiv()
createDebugNotification("Teszt",1)

end
addCommandHandler("notifi", meghiv)

function renderNotifications ()
	for k,v in ipairs(notificationsToDelete) do
		table.remove (notificationsList,v-k+1)
	end
	notificationsToDelete = {}
	if #notificationsList > 0 then
		local lowestY = 0
		local n = 0
		local cTick = getTickCount ()
		local renderingY = nil
		for k,v in ipairs(notificationsList) do
			if cTick >= v["startTick"] then
				if n == 0 then
					local delay = cTick-v["startTick"]
					if delay <= notificationsShowingTime then -- pokazuje
						local progress = delay/notificationsShowingTime
						local alpha = interpolateBetween (
							0,0,0,
							255,0,0,
							progress*2,"Linear"
						)
						local currentY = interpolateBetween (
							notificationStartY,0,0,
							notificationCenterY,0,0,
							progress,"InOutQuad"
						)
						local renderY = currentY-notificationHeight/2
						
						dxDrawImage (notificationX,renderY,notificationWidth,notificationHeight,"notifi/files/notification.png",0,0,0,tocolor(255,255,255,alpha),true)
						--dxDrawImage (notificationX+notificationIconX,renderY+notificationIconY,notificationIconSize,notificationIconSize,"notifi/files/" .. v["priority"] .. ".png",0,0,0,tocolor(255,255,255,alpha),true)
			
						dxDrawText (priorityText[v["priority"]], notificationX+notificationHeaderX, renderY+notificationHeaderY, notificationX+notificationHeaderX2, renderY+notificationHeaderY2, tocolor(124,197,118,alpha),headerSize,font,"center","center",false,false,true)
						
						dxDrawText (v["text"],notificationX+notificationTextX, renderY+notificationTextY, notificationX+notificationTextX2, renderY+notificationTextY2,tocolor(255,255,255,alpha),notificationTextSize,font,"left","top",true,true,true)
						
						local criticalY = currentY-notificationsOffset-notificationHeight
						if criticalY <= notificationCenterY then
							renderingY = currentY
						end
						
					else
						renderingY = false
						local delay = delay-notificationsShowingTime
						local alpha = 255
						if delay > notificationsRenderTime then
							local progress = (delay-notificationsRenderTime)/notificationsHidingTime
							alpha = interpolateBetween (
								255,0,0,
								0,0,0,
								progress,"Linear"
							)
							if progress >= 1 then
								table.insert (notificationsToDelete,k)
							end
						end
						local currentY = notificationCenterY
						renderY = currentY-notificationHeight/2
						
						dxDrawImage (notificationX,renderY,notificationWidth,notificationHeight,"notifi/files/notification.png",0,0,0,tocolor(255,255,255,alpha),true)
						--dxDrawImage (notificationX+notificationIconX,renderY+notificationIconY,notificationIconSize,notificationIconSize,"notifi/files/" .. v["priority"] .. ".png",0,0,0,tocolor(255,255,255,alpha),true)
				
						dxDrawText (priorityText[v["priority"]], notificationX+notificationHeaderX, renderY+notificationHeaderY, notificationX+notificationHeaderX2, renderY+notificationHeaderY2, tocolor(124,197,118,alpha),headerSize,font,"center","center",false,false,true)
							
						dxDrawText (v["text"],notificationX+notificationTextX, renderY+notificationTextY, notificationX+notificationTextX2, renderY+notificationTextY2,tocolor(255,255,255,alpha),notificationTextSize,font,"left","top",true,true,true)
					end
				else
					local delay = cTick-v["startTick"]-notificationsShowingTime
					local alpha = 255
					if delay > notificationsRenderTime then
						local progress = (delay-notificationsRenderTime)/notificationsHidingTime
						alpha = interpolateBetween (
							255,0,0,
							0,0,0,
							progress,"Linear"
						)
						if progress >= 1 then
							table.insert (notificationsToDelete,k)
						end
					end
					local currentY = notificationCenterY
					if renderingY then
						currentY = renderingY - (notificationsOffset + notificationHeight)*n
					elseif renderingY == false then
						currentY = notificationCenterY - (notificationsOffset + notificationHeight)*n
					elseif renderingY == nil then
						currentY = notificationCenterY - (notificationsOffset + notificationHeight)*(n-1)
					end
					renderY = currentY-notificationHeight/2
						
					dxDrawImage (notificationX,renderY,notificationWidth,notificationHeight,"notifi/files/notification.png",0,0,0,tocolor(255,255,255,alpha),true)
				--	dxDrawImage (notificationX+notificationIconX,renderY+notificationIconY,notificationIconSize,notificationIconSize,"notifi/files/" .. v["priority"] .. ".png",0,0,0,tocolor(255,255,255,alpha),true)
			
					dxDrawText (priorityText[v["priority"]], notificationX+notificationHeaderX, renderY+notificationHeaderY, notificationX+notificationHeaderX2, renderY+notificationHeaderY2, tocolor(124,197,118,alpha),headerSize,font,"center","center",false,false,true)
						
					dxDrawText (v["text"],notificationX+notificationTextX, renderY+notificationTextY, notificationX+notificationTextX2, renderY+notificationTextY2,tocolor(255,255,255,alpha),notificationTextSize,font,"left","top",true,true,true)
					
				end
				n = n+1
			end
		end
	end
end
addEventHandler ("onClientRender",getRootElement(),renderNotifications)