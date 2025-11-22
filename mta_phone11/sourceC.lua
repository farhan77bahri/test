local monitorScreen = {guiGetScreenSize()}
local font69 = dxCreateFont('files/Calibri.ttf', 10)
local font70 = dxCreateFont('files/Calibri.ttf', 20)

--[[EGYÉB]]--
local loadedPhoneInterFace = false
local actualPhoneID = -1
local menu = -1
local createdGuis = {}
local iconSize = {40, 40}
local settingsMenu = {"Háttérkép", "Csengőhang"}
local alsoMenu = {"phone", "news_alt", "contacts2", "sms"}
local batteryState = -1
local sX,sY = guiGetScreenSize()
local showPhone = false
local numberTable = {"1", "2", "3", "4", "5", "6", "7", "8", "9", "P", "0", "#"}
local numberText = {}
setElementData(localPlayer, "char:check", false) 
--local menuNames = {"settings", "angrybirds2", "calander", "calculator", "camera-alt", "chrome2", "clock", "comic", "contacts2", "fbmessenger-alt", "flashlight", "gallery_nokia", "gmail_new2", "market", "music_purple", "news_alt", "phone", "Restaurant", "sms", "youtube2"}
local menuNames = {"settings", "calculator"}
----------------

--[[NÉVJEGYEK]]--
local phoneContacts = {}
local currentContactPos = -3
local addContact = false
local editContact = false
local editContactNumber = -1
local editContactID = -1
local contactsScrolling = 0
local contactsMaxDraw = 7
----------------
--[[SMS]]--
local chats = {}
local messages = {}
local currentChat = -1
local currentChatPos = -3
local currentMessagePos = -3
----------------
--[[HÍVÁS]]--
local callMessages = {}
local callNumber = {}
local currentCallMSG = -3
local numberCall = -1
local inCallMember = nil
----------------
--[[ZENE]]--
local sounds = {}
local currentRing = -1
local musicID = -1
local sound = nil
for i = 1, 10 do
	sounds[#sounds + 1] = {"files/sounds/call/" .. i .. ".mp3"}
end
----------------
--[[HÁTÉRKÉP]]--
local background_Size = {221, 427}
local bgImgSize = {450,680}
local optionWallpaperSize = {50, 70}
local wallpapers = {}
local wallPaperID = -1
local maxImage = 30
for i = 1, 30 do
	wallpapers[#wallpapers + 1] = {"files/wallpapers/" .. i .. ".png"}
end
----------------

function isSoundFinished(theSound)
    if (getSoundPosition(theSound) == getSoundLength(theSound)) then
		return true
	else
		return false
	end
end

--setElementData(localPlayer, "phonebattery",100)

function showPhoneFunction(itemValue)
	if showPhone then
		--exports.global:sendLocalMeMessage(localPlayer,"elrakja a telefonját a zsebébe.")
		showPhone = false
		loadedPhoneInterFace = false
		actualPhoneID = -1
		menu = -1
		currentChat = -1
		musicID = -1
		removeEventHandler("onClientRender", getRootElement(), PlayedSound)
		if isElement(sound) then
			stopSound(sound)
		end	

	else
		--exports.global:sendLocalMeMessage(localPlayer,"előveszi a telefonját a zsebéből.")
		showPhone = true
		inCallMember = nil 
		actualPhoneID = itemValue
		triggerServerEvent("getPhoneDataFromServer", localPlayer, localPlayer, actualPhoneID)
		triggerServerEvent("getPhoneContactFromServer", localPlayer, localPlayer, actualPhoneID)			
		menu = 1
		numberText = {}
		callMessages = {}
		phoneContacts = {}
		currentCallMSG = -3
	end
end

function getPhoneDataToClient(wallpaper, music, battery)
	wallPaperID = wallpaper
	musicID = music
	batteryState = battery
	loadedPhoneInterFace = true
end
addEvent("getPhoneDataToClient", true)
addEventHandler("getPhoneDataToClient", getRootElement(), getPhoneDataToClient)

function getNumber(phoneNumber)
	if tonumber(phoneNumber) then
		for k, v in ipairs(phoneContacts) do
			if (tonumber(v[2]) == tonumber(phoneNumber)) then
				return v[1] .. " - " .. v[2]
			end
		end
		return phoneNumber
	end
end


function renderPhone()
	if not showPhone or not loadedPhoneInterFace then
		return
	end
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	if minutes < 10 then 
		minutes = "0"..minutes
	end
	pX, pY = monitorScreen[1]-450, monitorScreen[2]/2-680/2
	local battery = batteryState
	local akkuR,akkuG,akkuB = convertNumToColor(tonumber(batteryState))
		
	
	if (tonumber(menu) == 1) then
		local BG = getElementData(localPlayer,"PhoneBG")
		local celsius = getElementData(root,"weather.Winter") or "Nincs"
		local x, y, z = getElementPosition (localPlayer)
		local location = getZoneName ( x, y, z )
		local city = getZoneName ( x, y, z, true )
		local time = getRealTime()
		local day = time.monthday
		local week = time.weekday
		local month = time.month
		dxDrawImage(pX+200,pY+110,background_Size[1],background_Size[2], wallpapers[wallPaperID][1], angle, 0, -120, tocolor(255,255,255,255), false)--Háttérkép	
		dxDrawRectangle(pX+200,pY+475,230,50, tocolor(218, 223, 225, 200))
		for k, v in pairs(alsoMenu) do
			dxDrawImage(pX+209+ (k - 1) * (iconSize[1] + 15) ,pY+480,iconSize[1],iconSize[2], "files/icons/"..v.. ".png",0, 0, 0, tocolor(255,255,255,255), false)--alsoMenük
		end		
		local column = 0
		local rows = 0
		for k, v in ipairs(menuNames) do
			dxDrawImage(pX +215 + column * (iconSize[1] + 10),pY+170 + rows * (iconSize[1] + 10),iconSize[1], iconSize[2], "files/icons/" .. v .. ".png", 0, 0, 0, tocolor(255,255,255,255), false)
			column = column + 1
			if (tonumber(column) == 4) then
				column = 0
				rows = rows + 1
			end
		end			
	elseif (tonumber(menu) == 2) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/call.png", angle, 0, -120, tocolor(255,255,255,255), false)--Háttérkép	
		dxDrawImage(pX+380,pY+175,24,24, 'files/delete.png', angle, 0, 90, tocolor(255,255,255,200), true)--Törlés
		dxDrawText(table.concat(numberText),pX-10,pY+180,bgImgSize[1] + pX-75,2,tocolor(0, 0, 0, 255), 1.2, "default-bold", "right", "top", false, false, true, true)								
		
	elseif (tonumber(menu) == 5) then --- sms
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/calling.png", angle, 0, -120, tocolor(255,255,255,255), false)--Háttérkép	
		if tonumber(currentChat) < 0 then	
			local chatCounter = 0
			local currentChatPos = #chats - 3
			for k, v in ipairs(chats) do
				if k >= currentChatPos then
					if k <= (currentChatPos + (6)) and v then
						boxColor = tocolor(100, 100, 100,255)
						chatY = pY + 210 + (chatCounter) * 45 - 15
						dxDrawRectangle(pX+221-15, chatY, 210, 40, tocolor(0,0,0,200), true)
						dxDrawText(getNumber(v[1]),pX +221-15 + 210/2, chatY, pX +221-15 + 210/2, 50, tocolor(255, 255, 255, 255), 1, font69, "center", "top", false, false, true, true)					
						chatCounter = chatCounter + 1			
					end
				end
			end
			local phoneText = guiGetText(createdGuis[1]) 
			if phoneText == "" then
				phoneText = "Telefonszám"
			end
			local messageText = guiGetText(createdGuis[2])
			if messageText == "" then
				messageText = "Üzenet"
			end			
			--dxDrawRectangle(pX+208,pY+453,208,50, tocolor(0,0,0,200), true) -- telo edit
			dxDrawText(sortores(messageText),pX+208+5,pY+458,208,50, tocolor(0, 0, 0, 255), 1, font69, "left", "top", false, false, true, true)					
			
			--dxDrawRectangle(pX+208,pY+433,208,20, tocolor(255,255,255,200), true)	
			dxDrawText(phoneText,pX+208,pY+436,208,20, tocolor(0, 0, 0, 255), 1, font69, "left", "top", false, false, true, true)					
			
			--dxDrawRectangle(pX+205,pY+502,210,20, tocolor(0,0,0,200), true)	
			--dxDrawText("Elküld",pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(0, 0, 0, 255), 1, "sans", "center", "center", false, false, true, true)					
			
		else
			local messageCounter = 0
			if (messages[currentChat]) then
				currentMessagePos = #messages[currentChat] - 3
				--dxDrawRectangle(pX-15, pY + 70, bgImgSize[1], 25, tocolor(0,0,0,100), true)
				--dxDrawText("Telefonszám: " .. currentChat,pX +210 + 210/2, pY + 165, pX +210-15 + 210/2, 50, tocolor(0, 0, 0, 255), 1, font69, "center", "top", false, false, true, true)					

				for k, v in ipairs(messages[currentChat]) do
					if k >= currentMessagePos then
						if k <= (currentMessagePos + (6)) and v then
							if (tonumber(v[1]) == tonumber(actualPhoneID)) then
								boxColor = tocolor(255, 167, 0,255)
							else
								boxColor = tocolor(215, 85, 85, 255)
							end
							chatY = pY + 210 + (messageCounter) * 45 - 15
							dxDrawRectangle(pX+221-15, chatY, 210, 40, boxColor, true)
							dxDrawText(v[4],pX +226-15, chatY, pX +221-15 + 210/2, 50, tocolor(255, 255, 255, 255), 1, "sans", "left", "top", false, false, true, true)					
							
							messageCounter = messageCounter + 1				
						end
					end
				end	
			end
			local messageText = guiGetText(createdGuis[1])
			if messageText == "" then
				messageText = "Üzenet"
			end			
			--dxDrawRectangle(pX+208,pY+453,208,50, tocolor(255,255,255,100), true) -- telo edit
			dxDrawText(sortores(messageText),pX+208+5,pY+458,208,50, tocolor(0, 0, 0, 255), 1, font69, "left", "top", false, false, true, true)								
			
			--dxDrawRectangle(pX+205,pY+502,210,20, tocolor(0,0,0,200), true)	
			dxDrawText("Elküld",pX-15,pY+377.5,bgImgSize[1] + pX-15,22.5 + pY+377.5, tocolor(255, 255, 255, 255), 1, "sans", "center", "center", false, false, true, true)					

		end
	elseif (tonumber(menu) == 3) or (tonumber(menu) == 13) then
		dxDrawText("IRG",pX+210,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawText(hours ..":"..minutes,pX+295,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawImage(pX+396,pY+145,16,16, 'files/battery.png', 90, 0, 0, tocolor(255,255,255,200), true)--AksiTöltése
		dxDrawRectangle(pX+410,pY+150,-(13*(battery/100)),6,tocolor(akkuR,akkuG,akkuB,255), true)--AksiTöltéseCsík
		
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/ad.png", angle, 0, -120, tocolor(255,255,255,255), false)--Háttérkép	
		dxDrawImage(pX+100,pY,450,680, "files/telefon.png", 0, 0, 0, tocolor(255,255,255,255), false) -- Telefonkép
		if not isElement(createdGuis[1]) then
			return
		end
		dxDrawText(sortores(guiGetText(createdGuis[1])),pX+208+5,pY+458,208,50, tocolor(0, 0, 0, 255), 1, font69, "left", "top", false, false, true, true)					
	elseif (tonumber(menu) == 4) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/nevjegyzekek.png", angle, 0, -120, tocolor(255,255,255,255), false)--Háttérkép	
		if addContact or editContact then
			if not isElement(createdGuis[1]) then
				return
			end
			if not isElement(createdGuis[2]) then
				return
			end	
			for i = 1, 2 do		
				if isInSlot(pX-15, pY + 100 + (i) * 70 - 50, bgImgSize[1], 30) then
					if guiEditSetCaretIndex(createdGuis[i], string.len(guiGetText(createdGuis[i]))) then
						guiBringToFront(createdGuis[i])
					end
				end
			end	
			local addContactTable = {"Telefonszám: ", guiGetText(createdGuis[1]), "Név: ", guiGetText(createdGuis[2])}
			for i = 1, 4 do		
				dxDrawRectangle(pX+206, pY + 210 + (i) * 35 - 50, 210, 30, tocolor(0,0,0,200), true)
				dxDrawText(addContactTable[i],pX+206, pY + 210 + (i) * 35 - 50, 210 + pX+206, 30 + pY + 210 + (i) * 35 - 50, tocolor(255, 255, 255, 255), 1, font69, "center", "center", false, false, true, true)					
			end
			if editContact then
				if isInSlot(pX+210,pY+505,210,20) then
					dxDrawText("Szerkeszt", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(0, 0, 0, 255), 1.0, font69, "center", "top", false, false, true, true)							
				else
					dxDrawText("Szerkeszt", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(255, 255, 255, 255), 1.0, font69, "center", "top", false, false, true, true)							
				end				
			else
				if isInSlot(pX+210,pY+505,210,20) then
					dxDrawText("Felvétel", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(0, 0, 0, 255), 1.0, font69, "center", "top", false, false, true, true)							
				else
					dxDrawText("Felvétel", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(255, 255, 255, 255), 1.0, font69, "center", "top", false, false, true, true)							
				end	
			end
		else
			local contactsCounter = 0
			-- currentContactPos = #phoneContacts - 4
			for k, v in ipairs(phoneContacts) do
				if (k > contactsScrolling and contactsCounter < contactsMaxDraw) then
					-- if k <= (currentContactPos + (6)) and v then
						chatY = pY + 210 + (contactsCounter) * 45 - 20
						dxDrawRectangle(pX+221-15, chatY, 210, 40, tocolor(0,0,0,200), true)	
						dxDrawText(v[1] .. " - #" .. v[2],pX+221-10, chatY, bgImgSize[1], 50, tocolor(255, 255, 255, 255), 1, font69, "left", "top", false, false, true, false)					
						dxDrawImage(pX+221 - 5,chatY + 20,16,16,"files/calls.png", 0, 0, 0, tocolor(255,255,255,255), true)
						dxDrawImage(pX+221 + 20,chatY + 20,16,16,"files/send.png", 0, 0, 0, tocolor(255,255,255,255), true)
						dxDrawImage(pX+221 + 45,chatY + 20,16,16,"files/edit.png", 0, 0, 0, tocolor(255,255,255,255), true)	
						dxDrawImage(pX+221 + 70,chatY + 20,16,16,"files/x.png", 0, 0, 0, tocolor(255,255,255,255), true)												
						contactsCounter = contactsCounter + 1
					-- end
				end
			end
			if isInSlot(pX+210,pY+505,210,20) then
				dxDrawText("Felvétel", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(0, 0,0, 255), 1, font69, "center", "top", false, false, true, true)							
			else
				dxDrawText("Felvétel", pX+210+210/2,pY+502,pX+210+210/2,0, tocolor(255, 255, 255, 255), 1, font69, "center", "top", false, false, true, true)							
			end
		end
	elseif (tonumber(menu) == 6) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/bejovo.png", angle, 0, -120, tocolor(255,255,255,255), true)--Háttérkép
		--dxDrawImage(pX+205 + 20,pY+435,50,50, 'files/phonecall.png', 0, 0, 90, tocolor(255,0,0,200), true)--reject	
		--dxDrawImage(pX + 330 + 20,pY+435,50,50, 'files/phonecall.png', 0, 0, 90, tocolor(0,255,0,200),true)--accept	
		dxDrawText("\n" .. getNumber(numberCall),pX+210+210/2,pY+235,pX+210+210/2,1, tocolor(255, 255, 255, 255), 1.0, "sans", "center", "top", false, false, true, true)				
	elseif (tonumber(menu) == 7) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/callyou.png", angle, 0, -120, tocolor(255,255,255,255), true)--Háttérkép
		dxDrawText(getNumber(numberCall) .." hívása...",pX+210+210/2,pY+235,pX+210+210/2, 0, tocolor(0, 0, 0, 255), 1.0, "sans", "center", "top", false, false, true, true)			
	
	elseif (tonumber(menu) == 8) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/calling.png", angle, 0, -120, tocolor(255,255,255,255), true)--Háttérkép
		
		dxDrawText("IRG",pX+210,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawText(hours ..":"..minutes,pX+295,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawImage(pX+396,pY+145,16,16, 'files/battery.png', 90, 0, 0, tocolor(255,255,255,200), true)--AksiTöltése
		dxDrawRectangle(pX+410,pY+150,-(13*(battery/100)),6,tocolor(akkuR,akkuG,akkuB,255), true)--AksiTöltéseCsík
		
		local callMSGCounter = 0
		for k, v in ipairs(callMessages) do
			if k >= currentCallMSG then
				if k <= (currentCallMSG + (4-1)) and v then
					if (tonumber(v[2]) == tonumber(actualPhoneID)) then
						boxColor = tocolor(255, 167, 0,255)
					else
						boxColor = tocolor(215, 85, 85, 255)
					end
					callY = pY + 210 + (callMSGCounter) * 55
					dxDrawRectangle(pX+210, callY, 200, 50, boxColor, true)
					dxDrawText(sortores(v[1]),pX+225 - 13, callY,200, 50, tocolor(255, 255, 255, 255), 1, "sans", "left", "top", false, false, true, true)					
					callMSGCounter = callMSGCounter + 1
				end
			end
		end	
		local callText = guiGetText(createdGuis[1])					
		--dxDrawText("Hívásban: " .. numberCall,pX+255,pY+165,bgImgSize[1] + pX-15,20 + pY+50, tocolor(0, 0, 0, 255), 1, "sans", "left", "top", false, false, true, true)		
		
		dxDrawText(callText, pX+210,pY+460,210,50, tocolor(0, 0, 0, 255), 1, "default-bold", "left", "top", false, false, true, true)			
	elseif (tonumber(menu) == 9) then
		dxDrawImage(pX+100,pY,bgImgSize[1],bgImgSize[2], "files/settings.png", 0, 0, 0, tocolor(255,255,255,255), true)--Háttérkép
		dxDrawText("IRG",pX+210,pY+147,1,1, tocolor(0, 0, 0, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawText(hours ..":"..minutes,pX+295,pY+147,1,1, tocolor(0, 0, 0, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawImage(pX+396,pY+145,16,16, 'files/battery.png', 90, 0, 0, tocolor(255,255,255,200), true)--AksiTöltése
		dxDrawRectangle(pX+410,pY+150,-(13*(battery/100)),6,tocolor(akkuR,akkuG,akkuB,255), true)--AksiTöltéseCsík
		
		for k, v in ipairs(settingsMenu) do
			if isInSlot(pX-15, pY+80 + ((k-1)*(30 + 10)), 180, 30) then
			else
				--dxDrawRectangle(pX+205, pY+198 + ((k-1)*(25 + 2)), 215, 25, tocolor(0,0,0,200), true)
			end
		end
	elseif (tonumber(menu) == 10) then
		dxDrawImage(pX+200,pY+110,background_Size[1],background_Size[2], wallpapers[currentChooser][1], 0, 0, 0, tocolor(255,255,255,255), false)
		
		if isInSlot(pX+210,pY+20 + bgImgSize[2]/2-40,30,30) then
			dxDrawText("<",pX+210,pY+20 + bgImgSize[2]/2-40,30 + pX+210,30 + pY+20 + bgImgSize[2]/2-40 , tocolor(215, 85, 85, 255), 1, font70, "center", "center", false, false, true, true)					
		
		else
			dxDrawText("<",pX+210,pY+21 + bgImgSize[2]/2-39,30 + pX+210,30 + pY+20 + bgImgSize[2]/2-40 , tocolor(0, 0, 0, 255), 1, font70, "center", "center", false, false, true, true)							
			dxDrawText("<",pX+210,pY+20 + bgImgSize[2]/2-40,30 + pX+210,30 + pY+20 + bgImgSize[2]/2-40 , tocolor(255, 255, 255, 255), 1, font70, "center", "center", false, false, true, true)							
		end
		
		if isInSlot(pX+380,pY+20 + bgImgSize[2]/2-42,30,30) then	
			dxDrawText(">",pX+380,pY+20 + bgImgSize[2]/2-42,30 + pX+380,30 + pY+20 + bgImgSize[2]/2-42, tocolor(124, 197, 118, 255), 1, font70, "center", "center", false, false, true, true)								
		else
			dxDrawText(">",pX+380,pY+21 + bgImgSize[2]/2-41,30 + pX+380,30 + pY+20 + bgImgSize[2]/2-42, tocolor(0, 0, 0, 255), 1, font70, "center", "center", false, false, true, true)							
			dxDrawText(">",pX+380,pY+20 + bgImgSize[2]/2-42,30 + pX+380,30 + pY+20 + bgImgSize[2]/2-42, tocolor(255, 255, 255, 255), 1, font70, "center", "center", false, false, true, true)							
		end
		
		dxDrawRectangle(pX+205,pY+495,213,30, tocolor(0,0,0, 170), true) -- szerkeszt		
		if isInSlot(pX+205,pY+495,213,30) then
			dxDrawText("Beállítás",pX+205 + 50,pY+495,213 - 100 + pX+205 + 50,30 + pY+495, tocolor(2124, 197, 118, 255), 1, "default-bold", "center", "center", false, false, true, true)								
		else
			dxDrawText("Beállítás",pX+205 + 50,pY+495,213 - 100 + pX+205 + 50,30 + pY+495, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center", false, false, true, true)							
		end
	elseif (tonumber(menu) == 11) then
		dxDrawImage(pX+200,pY+110,background_Size[1],background_Size[2], wallpapers[wallPaperID][1], 0, 0, 0, tocolor(255,255,255,255), false)
		for i = 1, 10 do
			if currentRing == i then
				dxDrawRectangle(pX+206,pY+150 + i * 30,210,26, tocolor(0, 0, 0, 170), true) -- alsó	
				dxDrawRectangle(pX+239,pY+153 + i * 30,174,20, tocolor(124, 197, 118, 170), true) -- alsó	
				dxDrawImage(pX+210,pY+153 + i * 30,20,20, "files/music.png", 0, 0, 0, tocolor(255,255,255,255), true)
				dxDrawText("Csengőhang " .. i,pX+205,pY+150 + i * 30,210 + pX+205,26 + pY+150 + i * 30, tocolor(255, 255, 255, 255), 1, font69, "center", "center", false, false, true, true)											
			
			else
				dxDrawRectangle(pX+206,pY+150 + i * 30,210,26, tocolor(0,0,0, 170), true) -- alsó	
				dxDrawImage(pX+210,pY+153 + i * 30,20,20, "files/music.png", 0, 0, 0, tocolor(255,255,255,255), true)
				dxDrawText("Csengőhang " .. i,pX+205,pY+150 + i * 30,210 + pX+205,26 + pY+150 + i * 30, tocolor(255, 255, 255, 255), 1, font69, "center", "center", false, false, true, true)											
			end			
		end
		if currentRing > 0 then
			if isInSlot(pX+204,pY+490, 30,214,35) then
				dxDrawRectangle(pX+204,pY+490, 30,214,35, tocolor(0, 0, 0, 170), true) -- alsó	
				dxDrawText("Beállítás",pX+204,pY+500,214 + pX+204,0, tocolor(124, 197, 118, 255), 1, "sans", "center", "center", false, false, true, true)														
			else
				dxDrawRectangle(pX+204,pY+490,214,35, tocolor(0, 0, 0, 170), true) -- alsó	
				dxDrawText("Beállítás",pX+204,pY+500,214 + pX+204,0, tocolor(255, 255, 255, 255), 1, "sans", "center", "top", false, false, true, true)											
			
			end
		end
	end 
	if tonumber(menu) ~= 8 and tonumber(menu) ~= 10 and tonumber(menu) ~= 9 then
		dxDrawText("IRG",pX+210,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawText(hours ..":"..minutes,pX+295,pY+147,1,1, tocolor(255, 255, 255, 255), 0.9, "default-bold", "left", "top", false, false, true, true)
		dxDrawImage(pX+396,pY+145,16,16, 'files/battery.png', 90, 0, 0, tocolor(255,255,255,200), true)--AksiTöltése
		dxDrawRectangle(pX+410,pY+150,-(13*(battery/100)),6,tocolor(akkuR,akkuG,akkuB,255), true)--AksiTöltéseCsík
	end
	dxDrawImage(pX+100,pY,450,680, "files/telefon.png", 0, 0, 0, tocolor(255,255,255,255), false) -- Telefonkép
end
addEventHandler("onClientRender", getRootElement(), renderPhone)

function showMenu(number, menuid, playerSource, actualPhoneID)
	if menuid and number then
		triggerServerEvent("getPhoneDataFromServer", localPlayer, localPlayer, actualPhoneID)
		numberCall = number
		menu = menuid
		setElementData(playerSource, "inCall", true)
		showPhone = true
		inCallMember = playerSource
		
	end
end
addEvent("showMenu", true)
addEventHandler("showMenu", getRootElement(), showMenu)

addEventHandler("onClientKey", root, function(k,s)
	if not s then return end
	if (k == "mouse_wheel_up") and tonumber(menu) == 8 and showPhone then
		if #callMessages > 4 then
			if currentCallMSG > 1 then
				currentCallMSG = currentCallMSG - 1		
			end 
		end
	elseif (k == "mouse_wheel_down") and tonumber(menu) == 8 and showPhone then
		if #callMessages > 4 then
			if currentCallMSG < #callMessages - 6 then
				currentCallMSG = currentCallMSG + 1		
			end 	
		end
	end
	if (k == "mouse_wheel_up") and tonumber(menu) == 5 and showPhone then
		if #chats > 4 then
			if currentChatPos > 1 then
				currentChatPos = currentChatPos - 1		
			end 
		end
	elseif (k == "mouse_wheel_down") and tonumber(menu) == 5 and showPhone then
		if #chats > 4 then
			if currentChatPos < #chats - 6 then
				currentChatPos = currentChatPos + 1		
			end 	
		end
	end	
	if (k == "mouse_wheel_up") and tonumber(menu) == 4 and showPhone then
		if #phoneContacts > 7 then
			if contactsScrolling > 1 then
				contactsScrolling = contactsScrolling - 1
			end
		end
	elseif (k == "mouse_wheel_down") and tonumber(menu) == 4 and showPhone then
		if contactsScrolling < #phoneContacts - 7 then
			contactsScrolling = contactsScrolling + 1	
		end 
	end		
end)

function createGuis(name)
	pX, pY = monitorScreen[1]-550, monitorScreen[2]/2-680/2
	if name then
		if tostring(name) == "destroy" then
			for i = 1, 2 do
				if isElement(createdGuis[i]) then
					destroyElement(createdGuis[i])
				end
			end
		elseif tostring(name) == "call" then
			createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 27)
		elseif tostring(name) == "sms" then
			createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 10)	
			createdGuis[2] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 30)	
		elseif tostring(name) == "sms1" then
			createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 30)	
		elseif tostring(name) == "addContact" then
			createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 10)	
			createdGuis[2] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 20)			
		elseif tostring(name) == "ad" then
			createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
			guiEditSetMaxLength(createdGuis[1], 80)	
		end
	end
end

-- createGuis("call")

function showSound()
	setTimer(function()
	local musicID = getElementData(localPlayer, "musicID") or musicID
		if musicID > 0 then
			if isElement(sound) then
				stopSound(sound)
			end	
			sound = playSound("files/sounds/call/" .. musicID .. ".mp3")
			removeEventHandler("onClientRender", getRootElement(), PlayedSound)
			addEventHandler("onClientRender", getRootElement(), PlayedSound)
		end	
	end, 50, 1)
end
addEvent("showSound", true)
addEventHandler("showSound", getRootElement(), showSound)

function PlayedSound()
	if isSoundFinished(sound) then
		sound = playSound("files/sounds/call/" .. musicID .. ".mp3")					
	end
end


function answerPhone(type)
	if (tonumber(type) == 1) then -- reject
		inCallMember = nil
		numberCall = nil
		menu = 1
		setElementData(localPlayer, "inCall", false)
		callMessages = {}
		createGuis("destroy")
		removeEventHandler("onClientRender", getRootElement(), PlayedSound)
		if isElement(sound) then
			stopSound(sound)
		end	
		callMessages = {}
		currentCallMSG = -3
	elseif (tonumber(type) == 2) then -- accept
		menu = 8
		callMessages = {}
		createGuis("call")
		removeEventHandler("onClientRender", getRootElement(), PlayedSound)
		if isElement(sound) then
			stopSound(sound)
		end	
	end
end
addEvent("answerPhone", true)
addEventHandler("answerPhone", getRootElement(), answerPhone)

function onPhoneClick(button, state)
	if (button == "left") and (state == "down") and (showPhone) and loadedPhoneInterFace then
		if isInSlot(pX+290,pY+533,40,40) and not editContact then
			if menu == 1 then 
				showPhone = false
				loadedPhoneInterFace = false
				actualPhoneID = -1
				menu = -1
				currentChat = -1
				musicID = -1
				removeEventHandler("onClientRender", getRootElement(), PlayedSound)
				if isElement(sound) then
					stopSound(sound)
				end	
			end
			menu = 1
			currentChat = -1
			chats = {}
			editContactNumber = -1		
			addContact = false 
			editContactID = -1
			removeEventHandler("onClientRender", getRootElement(), PlayedSound)
			if isElement(sound) then
				stopSound(sound)
			end	
			callMessages = {}
			currentCallMSG = -3
			createGuis("destroy")
			triggerServerEvent("answerPhoneS", localPlayer, localPlayer, inCallMember, 1)	
		end
		if (tonumber(menu) == 1) then
			for k, v in pairs(alsoMenu) do
				if isInSlot(pX+209+ (k - 1) * (iconSize[1] + 15) ,pY+480,iconSize[1],iconSize[2]) then
					menu = tonumber(k) + 1
					if (tonumber(menu) == 5) then 
					
						triggerServerEvent("loadMessages", localPlayer, localPlayer, actualPhoneID)							
						triggerServerEvent("getChatFromServer", localPlayer, localPlayer, actualPhoneID)
						createGuis("sms")	
					end
				end
			end	
			local column = 0
			local rows = 0
			if menu == 1 then 
				for k, v in ipairs(menuNames) do
					if isInSlot(pX +215 + column * (iconSize[1] + 10),pY+170 + rows * (iconSize[1] + 10),iconSize[1], iconSize[2]) then
						if tonumber(k) == 1 then
							menu = 9
						elseif tonumber(k) == 2 then
							menu = 13
						end
					end
					column = column + 1
					if (tonumber(column) == 4) then
						column = 0
						rows = rows + 1
					end
				end	
			end
		elseif (tonumber(menu) == 2) then
			local elem = 1
			local sor = 0	
			for k, v in ipairs(numberTable) do
				if isInSlot(pX+162 + (elem*(50+12)),pY+211 + (sor*(50+8)),50,50) then
					if #numberText + 1 <= 16 then
						table.insert(numberText, v)
					end
				end
				elem = elem + 1
				if (tonumber(elem) == 4) then
					sor = sor + 1
					elem = 1
				end		
			end
			if isInSlot(pX+380,pY+175,24,24) then
				numberText[#numberText] = nil
			end
			
			if isInSlot(pX + 215,pY+440,192,45) then
				callMemberClient(table.concat(numberText))
			end	
		elseif (tonumber(menu) == 3) then
			if isInSlot(pX+208,pY+448,208,50) then
				createGuis("ad")
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end
			elseif isInSlot(pX+205,pY+502,210,20) then
				if tonumber(#guiGetText ( createdGuis[1] )) >= 4 then 
					if klikkTimer then outputChatBox("#c0c0c0[Hírdetés]:#ffffff Percenként csak egy hirdetést adhatsz fel!", 255, 255, 255, true) return end
					triggerServerEvent("onClientCallForAdData", localPlayer, localPlayer,tostring(guiGetText(createdGuis[1])),(tonumber(#guiGetText ( createdGuis[1] ))*100), actualPhoneID)
					if isTimer(klikkTimerRun) then return end
						klikkTimer = true
						klikkTimerRun = setTimer(function()
						klikkTimer = false
					end,1000*60*1,1)
				else
					outputChatBox("#c0c0c0[Hírdetés]:#ffffff Minimum 4 karaktert meg kell adnod a hirdetésben!", 255, 255, 255, true)
				end
			end		
		elseif (tonumber(menu) == 13) then
			if isInSlot(pX+208,pY+448,208,50) then
				createGuis("ad")
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end
			elseif isInSlot(pX+205,pY+502,210,20) then
				if tonumber(#guiGetText ( createdGuis[1] )) >= 4 then 
					if klikkTimer then outputChatBox("#c0c0c0[Hírdetés]:#ffffff Percenként csak egy hirdetést adhatsz fel!", 255, 255, 255, true) return end
					triggerServerEvent("onClientIllegalCallForAdData", localPlayer, localPlayer,tostring(guiGetText(createdGuis[1])),(tonumber(#guiGetText ( createdGuis[1] ))*130), actualPhoneID)
					if isTimer(klikkTimerRun) then return end
						klikkTimer = true
						klikkTimerRun = setTimer(function()
						klikkTimer = false
					end,1000*60*1,1)
				else
					outputChatBox("#c0c0c0[Hírdetés]:#ffffff Minimum 4 karaktert meg kell adnod a hirdetésben!", 255, 255, 255, true)
				end
			end
		elseif (tonumber(menu) == 5) then
			if tonumber(currentChat) < 0 then 
			    setElementData(localPlayer, "type", true) 
				local chatCounter = 0
				local currentChatPos = #chats - 3
				for k, v in ipairs(chats) do
					if k >= currentChatPos then
						if k <= (currentChatPos + (6)) and v then
							chatY = pY + 210 + (chatCounter) * 45 - 15
							if isInSlot(pX+221-15, chatY, 210, 40) then
								currentChat = v[1]
								createGuis("destroy")
								createGuis("sms1")
								
							end					
							chatCounter = chatCounter + 1				
						end
					end
				end	
				if isInSlot(pX+208,pY+453,208,50) then
					if guiEditSetCaretIndex(createdGuis[2], string.len(guiGetText(createdGuis[2]))) then
						guiBringToFront(createdGuis[2])
					end
				end
				if isInSlot(pX+208,pY+433,208,20) then
					if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
						guiBringToFront(createdGuis[1])
					end
				end		
				if isInSlot(pX+205,pY+502,210,20) then
					if string.len(guiGetText(createdGuis[1])) > 2 then
						if string.len(guiGetText(createdGuis[2])) > 5 then
							triggerServerEvent("sendMessagesInServer", localPlayer, localPlayer, actualPhoneID, guiGetText(createdGuis[1]), guiGetText(createdGuis[2]), getTime(), getDate())
							createGuis("destroy")
							createGuis("sms")
							setElementData(localPlayer, "char:money", getElementData(localPlayer, "char:money") - 750) 
							setElementData(localPlayer, "type", false) 
						end
					end
				end
			else
				if isInSlot(pX+208,pY+453,208,50) then
					if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
						guiBringToFront(createdGuis[1])
					end
				end	
				if isInSlot(pX+205,pY+502,210,20) then
					if tonumber(currentChat) > 0 then
						if string.len(guiGetText(createdGuis[1])) > 2 then
							triggerServerEvent("sendMessagesInServer", localPlayer, localPlayer, actualPhoneID, currentChat, guiGetText(createdGuis[1]), getTime(), getDate())
							createGuis("destroy")
							createGuis("sms")
							setElementData(localPlayer, "char:money", getElementData(localPlayer, "char:money") - 750)
						end
					end
				end				
			end
		elseif (tonumber(menu) == 4) then
			if addContact or editContact then
				for i = 1, 2 do		
					if isInSlot(pX+206, pY + 210 + (i) * 70 - 50, 210, 30) then-- Ez kell még
						if guiEditSetCaretIndex(createdGuis[i], string.len(guiGetText(createdGuis[i]))) then
							guiBringToFront(createdGuis[i])
						end
					end
				end			
				if isInSlot(pX+210,pY+505,210,20) then
					if not (string.len(guiGetText(createdGuis[1])) > 1) then
						return
					end
					if not (string.len(guiGetText(createdGuis[2])) > 1) then
						return
					end
					
					if editContact then
						triggerServerEvent("editContactS", localPlayer, localPlayer, guiGetText(createdGuis[1]), guiGetText(createdGuis[2]), actualPhoneID, editContactNumber, editContactID)		
					else
						triggerServerEvent("addContactMemberS", localPlayer, localPlayer, guiGetText(createdGuis[1]), guiGetText(createdGuis[2]), actualPhoneID)
					end
				end
			else
				if isInSlot(pX+210,pY+505,210,20) then
					addContact = true
					createGuis("destroy")
					createGuis("addContact")
				end
				local contactsCounter = 0
				-- currentContactPos = #phoneContacts - 4
				for k, v in ipairs(phoneContacts) do
					if (k > contactsScrolling and contactsCounter < contactsMaxDraw) then
						-- if k <= (currentContactPos + (6)) and v then
							chatY = pY + 210 + (contactsCounter) * 45 - 20
							if isInSlot(pX+221 - 5,chatY + 20,16,16) then
								callMemberClient(v[2])
							end
							if isInSlot(pX+221 + 20,chatY + 20,16,16) then
								menu = 5
								createGuis("sms")
								guiSetText(createdGuis[1], v[2])
								triggerServerEvent("getChatFromServer", localPlayer, localPlayer, actualPhoneID)
								triggerServerEvent("loadMessages", localPlayer, localPlayer, actualPhoneID)								
							end
							if isInSlot(pX+221 + 45,chatY + 20,16,16) then
								editContact = true
								createGuis("addContact")
								editContactNumber = k
								editContactID = v[3]
								guiSetText(createdGuis[1], v[2])
								guiSetText(createdGuis[2], v[1])
							end
							if isInSlot(pX+221 + 70,chatY + 20,16,16) then
								triggerServerEvent("removeFromContactS", localPlayer, localPlayer, k, v[3])
							end	
							contactsCounter = contactsCounter + 1
						-- end
					end	
				end
			end
			for i = 1, 2 do		
				if isInSlot(pX+206, pY + 210 + (i) * 70 - 50, 210, 30) then
					if guiEditSetCaretIndex(createdGuis[i], string.len(guiGetText(createdGuis[i]))) then
						guiBringToFront(createdGuis[i])
					end
				end
			end
		elseif (tonumber(menu) == 5) then
		elseif (tonumber(menu) == 6) then
			if isInSlot(pX + 330 + 20,pY+435,50,50,50) then
				triggerServerEvent("answerPhoneS", localPlayer, localPlayer, inCallMember, 2)
				if isElement(sound) then
					stopSound(sound)
				end			
				musicID = 0				
			end
			if isInSlot(pX+205 + 20,pY+435,50,50,50) then
				if isElement(sound) then
					stopSound(sound)
				end	
				musicID = 0
				triggerServerEvent("answerPhoneS", localPlayer, localPlayer, inCallMember, 1)
			end
		elseif (tonumber(menu) == 7) then			
			if isInSlot(pX+265 + 20,pY+435,50,50) then
				triggerServerEvent("answerPhoneS", localPlayer, localPlayer, inCallMember, 1)
				if isElement(sound) then
					stopSound(sound)
				end	
				musicID = 0
			end				
		elseif (tonumber(menu) == 8) then
			if isInSlot(pX+205,pY+455,210,50) then
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end
			end
			if isInSlot(pX+205,pY+505,210,15) then
				sendCallMessages(inCallMember, guiGetText(createdGuis[1]), actualPhoneID, getDate(), getTime(), numberCall)	
				triggerServerEvent("chatToServer", localPlayer, localPlayer, guiGetText(createdGuis[1]))

				createGuis("destroy")				
				createGuis("call")				
			end
		elseif (tonumber(menu) == 9) then
			for k, v in ipairs(settingsMenu) do
				if isInSlot(pX+205, pY+198 + ((k-1)*(25 + 2)), 215, 25) then
					menu = (k + 9)
					if menu == 10 then
						currentChooser = wallPaperID
					end
				end
			end
		elseif (tonumber(menu) == 10) then
			if isInSlot(pX+210,pY+20 + bgImgSize[2]/2-40,30,30) then
				currentChooser = currentChooser - 1
				if currentChooser == 0 then
					currentChooser = 31
				end				
			end
			if isInSlot(pX+380,pY+20 + bgImgSize[2]/2-42,30,30) then
				currentChooser = currentChooser + 1
				if currentChooser == maxImage then
					currentChooser = 1
				end
			end
			if isInSlot(pX+205,pY+495,213,30) then
				wallPaperID = currentChooser
				triggerServerEvent("editWallpaperInServer", localPlayer, localPlayer, actualPhoneID, wallPaperID)
			--	outputChatBox("Sikeresen beállítottad háttérképnek.", 255, 255, 255, true)
			end
		elseif (tonumber(menu) == 11) then
			for i = 1, 10 do
				if isInSlot(pX+206,pY+150 + i * 30,210,26) then
					currentRing = i
					if isElement(sound) then
						stopSound(sound)
					end
					sound = playSound("files/sounds/call/" .. i .. ".mp3")
				end
			end
			if isInSlot(pX+204,pY+490,214,35) then
				musicID = currentRing
				triggerServerEvent("editRingInServer", localPlayer, localPlayer, actualPhoneID, currentRing)
				--outputChatBox("Sikeresen beállítottad a csengőhangodat.", 255, 255, 255, true)
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), onPhoneClick)

function sendCallMessages(targetPlayer, message, ownerPhone, date, time)
	if message and ownerPhone and date and time then	
		triggerServerEvent("sendCallMessages", localPlayer, localPlayer, targetPlayer, message, ownerPhone, date, time)	
	end
end

function editContactC(name, number, row, id)
	if (name) and (number) and (row) and (id) then
		if phoneContacts[row] then
			phoneContacts[row] = {name, number, id}
		end
		editContact = false
		createGuis("destroy")
		menu = 4
	end
end
addEvent("editContactC", true)
addEventHandler("editContactC", getRootElement(), editContactC)

function removeFromContactC(row)
	if phoneContacts[row] then
		table.remove(phoneContacts, row)
		currentContactPos = currentContactPos - 1
	end
end
addEvent("removeFromContactC", true)
addEventHandler("removeFromContactC", getRootElement(), removeFromContactC)

function getPhoneContactToClient(table)
	if (table) then
		phoneContacts = {}
		phoneContacts = table
		currentContactPos = #phoneContacts
	end
end
addEvent("getPhoneContactToClient", true)
addEventHandler("getPhoneContactToClient", getRootElement(), getPhoneContactToClient)	

function callMemberClient(number)
	if tonumber(number) then
		if tonumber(number) > 0 then
			triggerServerEvent("callTargetInServer", localPlayer, localPlayer, number, actualPhoneID)
		end
	end
end

function addContactMemberC(name, number, id)
	if (name) and tonumber(number) and tonumber(id) then
		phoneContacts[#phoneContacts + 1] = {name, number, id}
		currentContactPos = #phoneContacts + 1
	end
end
addEvent("addContactMemberC", true)
addEventHandler("addContactMemberC", getRootElement(), addContactMemberC)

function insertMessages(msg, type, number)
	if msg then
		if (tonumber(type) == 1) then
			callMessages[#callMessages + 1] = {msg, number}
			currentCallMSG = currentCallMSG + 1
		end
	end
end
addEvent("insertMessages", true)
addEventHandler("insertMessages", getRootElement(), insertMessages)

function getChatToClient(table)
	chats = {}
	currentChatPos = -3
	if table then
		for k, v in ipairs(table) do
			chats[#chats + 1] = {tonumber(v[1])}
			currentChatPos = currentChatPos + 1
		end
	end
end
addEvent("getChatToClient", true)
addEventHandler("getChatToClient", getRootElement(), getChatToClient)

function convertNumToColor(num)
	if num >= 70 then
		return 38, 194, 129
	elseif num < 70 and num >= 40 then
		return 255,112,66
	elseif num < 40 then
		return 255,57,57
	end
end

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(dobozbaVan(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end

function sendMessagesInClient(from, to, number, msg, when, date, group, phoneID)
	if (from) and (to) and (number) and (msg) and (when) and (date) and (group) and (phoneID)  then
		if (tonumber(phoneID) == tonumber(actualPhoneID)) then
			if (tonumber(menu) == 5) then
				if not messages[tonumber(group)] then
					messages[tonumber(group)] = {}
				end
				messages[tonumber(group)][tonumber(#messages[tonumber(group)]) + 1] = {from, to, number, msg, when, date}
 			end
		end
	end
end
addEvent("sendMessagesInClient", true)
addEventHandler("sendMessagesInClient", getRootElement(), sendMessagesInClient)

function insertClientChat(id)
	if id then
		chats[#chats + 1] = {tonumber(id)}
	end
end
addEvent("insertClientChat", true)
addEventHandler("insertClientChat", getRootElement(), insertClientChat)

function loadMessagesInClient(table)
	if (table) then	
		messages = {}
		messages = table
	end
end
addEvent("loadMessagesInClient", true)
addEventHandler("loadMessagesInClient", getRootElement(), loadMessagesInClient)



function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function wasMessageSentToday(date)
	if date then
		local time = getRealTime()
		if time.month + 1 < 10 then
			time.month = "0"..time.month + 1
		end 
		if time.monthday < 10 then
			time.monthday = "0"..time.monthday
		end
	    local year = "20"..string.gsub(tostring(time.year+1900), "20", "")
		local currTime = year.." "..time.month.." "..time.monthday
		if tostring(currTime) == tostring(date) then
			return true
		else
			return false
		end
	end
end

function getDate()
	local time = getRealTime()
	if time.month + 1 < 10 then
		time.month = "0"..time.month + 1
	end
	if time.monthday < 10 then
		time.monthday = "0"..time.monthday
	end
	local year = "20"..string.gsub(tostring(time.year+1900), "20", "")
	local currTime = year.." "..time.month.." "..time.monthday
	return currTime
end

function getTime()
	local time = getRealTime()

	local hour = time.hour
	local min = time.minute

	if hour < 10 then
		hour = "0"..hour
	end 

	if min < 10 then
		min = "0"..min
	end 

	return hour..":"..min
end

function stringInsertEdit(value, insert, place)
	local isLen = string.len(value)
	if isLen > place then
		return string.sub(value, 1,place-1) .. tostring(insert) .. string.sub(value, place, string.len(value))
	else
		return value
	end
end

local callBlip = {}
local callMarker = {}

function acceptCallInClient(pX, pY, pZ)
	callBlip[#callBlip + 1] = createBlip(pX, pY, pZ,66)
	setElementData(callBlip[#callBlip], "callBlip:id", #callBlip)
	setElementData(callBlip[#callBlip],"blip:maxVisible",true)
	callMarker[#callMarker + 1] = createMarker(pX, pY, pZ)
	setElementData(callMarker[#callMarker], "callMarker:id", #callMarker)	
end
addEvent("acceptCallInClient", true)
addEventHandler("acceptCallInClient", getRootElement(), acceptCallInClient)

function onMarkerHit(playerSource)
	if callMarker[getElementData(source, "callMarker:id")] then
		if isElement(callBlip[getElementData(source, "callMarker:id")]) then
			destroyElement(callBlip[getElementData(source, "callMarker:id")])
		end
		if isElement(callMarker[getElementData(source, "callMarker:id")]) then
			destroyElement(callMarker[getElementData(source, "callMarker:id")])
		end
	--	outputChatBox("#F89406[Riasztás] #ffffffSikeresen megérkeztél a helyszínre!",255,255,255,true)
	end
end
addEventHandler("onClientMarkerHit", getRootElement(), onMarkerHit)

function sortores(t)
	local array = {}
	for i=0, utfLen(t)-1 do
		array[#array+1] = utfSub( t, i+1, i+1 )
	end
	local tag = 40
	local kiteres = 15
	local ki = ""
	local szamlalo = 0
	for i,v in ipairs(array) do
		if(szamlalo==tag)then
			szamlalo=0
			v = "\n"..v
		elseif(szamlalo>tag-kiteres and szamlalo<tag and v==" ")then
			szamlalo=0
			v = "\n"	
		end
		szamlalo=szamlalo+1
		ki = ki..v
	end
	return ki
end
