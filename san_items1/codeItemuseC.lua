local szinez = "#88D373"
local r,g,b = 136,211,115
local showedIndentyCard = false
local showedLicensCard = false
local cigarette = {}

function giveHunger(give)
	if give then
		if getElementData(localPlayer, "char:hunger") + give <= 100 then
			setElementData(localPlayer, "char:hunger", getElementData(localPlayer, "char:hunger") + give)
			return true
		elseif getElementData(localPlayer, "char:hunger") == 100 then 
			outputChatBox("Nem vagy éhes!!", 255, 255, 255, true)
			return false
		elseif getElementData(localPlayer, "char:hunger") + give > 100 then
			setElementData(localPlayer, "char:hunger", 100)
			return true
		end 
	end 
end

function giveThrink(give)
	if give then
		if getElementData(localPlayer, "char:thirst") + give <= 100 then
			setElementData(localPlayer, "char:thirst", getElementData(localPlayer, "char:thirst") + give)
			return true
		elseif getElementData(localPlayer, "char:hunger") == 100 then 
			outputChatBox("Nem vagy Szomjas!!", 255, 255, 255, true)
			return false
		elseif getElementData(localPlayer, "char:thirst") + give > 100 then
			setElementData(localPlayer, "char:thirst", 100)
			return true
		end 
	end 
end

function giveArmor(thePlayer, give)
	if give then
		-- if getPedArmor(thePlayer) + give <= 100 then
			-- triggerServerEvent("giveArmor", localPlayer, getPedArmor(localPlayer) + give)
			-- return true
		-- elseif getPedArmor(thePlayer) + give > 100 then
			-- triggerServerEvent("giveArmor", localPlayer, 100)
			-- return true
		-- end 
		triggerServerEvent("giveArmor", localPlayer, localPlayer, 100)
	end 
end

function giveArmor2(thePlayer, give)
	if give then
		-- if getPedArmor(thePlayer) + give <= 100 then
			-- triggerServerEvent("giveArmor", localPlayer, getPedArmor(localPlayer) + give)
			-- return true
		-- elseif getPedArmor(thePlayer) + give > 100 then
			-- triggerServerEvent("giveArmor", localPlayer, 100)
			-- return true
		-- end 
		triggerServerEvent("giveArmor", localPlayer, localPlayer, math.random(0,1))
	end 
end

local alcoholTimer
local isAlcoholEffectEnabled = false
function giveAlcohol(give)
	local playerAlcoholLevel = tonumber(getElementData(localPlayer, "char:AlcoholLevel")) or 0
	if playerAlcoholLevel == 100 then
		setElementHealth(localPlayer, getElementHealth(localPlayer) - 15)
		return false
	else
		if not isTimer(alcoholTimer) then
			alcoholTimer = setTimer(alcoholCountDown, 5000, 0)
		end
		if playerAlcoholLevel > 30 then
			setElementData(localPlayer, "char:Aphasia", true)
			isAlcoholEffectEnabled = true
			exports.san_death:setAlcoholLevel(true)
			-- effect
		end
		setElementData(localPlayer, "char:AlcoholLevel", playerAlcoholLevel + give)
		return true
	end
end

function alcoholCountDown()
	local playerAlcoholLevel = tonumber(getElementData(localPlayer, "char:AlcoholLevel")) or 0
	if playerAlcoholLevel > 0 then
		local newLevel = playerAlcoholLevel - 1
		setElementData(localPlayer, "char:AlcoholLevel", newLevel)
		if newLevel < 30 and isAlcoholEffectEnabled then
			isAlcoholEffectEnabled = false
			setElementData(localPlayer, "char:Aphasia", false)
			exports.san_death:setAlcoholLevel(false)
			-- effect
		end
	else
		if isTimer(alcoholCountDown) then
			killTimer(alcoholCountDown)
		end
	end
end

function addAlcohol(str, give, itemID, slot, dbid)
	local state = giveAlcohol(give)
	if state then
		me("iszik egy "..str .. "-t.")
		modositItemCountIfWant(itemID, slot)
	end
end

function addItal(str, slot, itemID, dbid)
	me("iszik egy "..str .. "-t.")
	giveThrink(20)
	modositItemCountIfWant(itemID, slot)
end

local shields = { }

function addFood(str,give, slot, dbid)
	local state = giveHunger(give)
	if state then
		me("eszik egy "..str.. "-t.")
		modositItemCountIfWant(slot)
	end
end

local injekcioTimer

function giveHealth(give)
	if isPedDead(localPlayer) then
		outputChatBox("Halottan nem tudod bevenni!", 255, 255, 255, true)
		return false
	elseif isTimer(injekcioTimer) then
		outputChatBox("Ezt csak 5 percenként tudod bevenni!", 255, 255, 255, true)
		return false
	end
	if give then
		if getElementHealth(localPlayer) + give <= 100 then
			setElementHealth(localPlayer, getElementHealth(localPlayer) + give)
			injekcioTimer = setTimer(function() end, 5*60*1000, 1)
			return true
		elseif getElementHealth(localPlayer) == 100 then
			outputChatBox("Jelenleg nincs szükséged erre!", 255, 255, 255, true)
			return false
		elseif getElementHealth(localPlayer) + give > 100 then
			setElementHealth(localPlayer, 100)
			return true
		end 	
	end 
end

function addHealth(str, give, slot, dbid, itemID)
	if giveHealth(give) then
		me(str)
		modositItemCountIfWant(itemID, slot)
	end
end

function me(me)
	triggerServerEvent("wlsMTA->#setPlayerMe", localPlayer, localPlayer, me)
end




function useItem(DBID, itemSlot, itemID, itemValue, itemCount)
	if itemID == 1 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
	elseif itemID == 2 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
	elseif itemID == 16 then
		if exports["mta_phone"]:showPhoneFunction(itemValue) then
		return
	end
	
	elseif itemID == 3 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
	elseif itemID == 4 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
	elseif itemID == 5 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
	elseif itemID == 6 then
		if getElementData(localPlayer,"char:hunger") >= 100 then
			outputChatBox("Nem vagy éhes!", 255, 255, 255, true)
		return
		end
		foodoper(itemSlot,DBID,itemID,itemValue,itemCount,15)
		
	elseif itemID == 76 then
		setElementData(localPlayer, 'wls:pp', (getElementData(localPlayer, 'wls:pp') + 1000))
		modositItemCountIfWant(itemID, itemSlot)
		triggerServerEvent("addpp", localPlayer, localPlayer)
		
	elseif itemID == 77 then
		setElementData(localPlayer, 'wls:pp', (getElementData(localPlayer, 'wls:pp') + 2000))
		modositItemCountIfWant(itemID, itemSlot)
		triggerServerEvent("addpp", localPlayer, localPlayer)
		
	elseif itemID == 72 then
		setElementData(localPlayer, 'wls:pp', (getElementData(localPlayer, 'wls:pp') + 5000))
		modositItemCountIfWant(itemID, itemSlot)
		triggerServerEvent("addpp", localPlayer, localPlayer)
		
	elseif itemID == 272 then
		setElementData(localPlayer, 'wls:pp', (getElementData(localPlayer, 'wls:pp') + 100))
		modositItemCountIfWant(itemID, itemSlot)
		triggerServerEvent("addpp", localPlayer, localPlayer)
		
	elseif itemID == 7 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,30)	
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)		
	elseif itemID == 8 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,30)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)	
	elseif itemID == 12 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,10)
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
	elseif itemID == 9 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,2)	
		if getElementData(localPlayer,"char:hunger") >= 20 then
			setElementData(localPlayer,"char:hunger", getElementData(localPlayer, "char:hunger") - 20)
		else
			setElementData(localPlayer,"char:hunger", 0)
		end
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)	
	elseif itemID == 10 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,2)	
		if getElementData(localPlayer,"char:hunger") >= 20 then
			setElementData(localPlayer,"char:hunger", getElementData(localPlayer, "char:hunger") - 20)
		else
			setElementData(localPlayer,"char:hunger", 0)
		end
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)	
	elseif itemID == 11 then
		dringStart(itemSlot,DBID,itemID,itemValue,itemCount,2)	
		if getElementData(localPlayer,"char:hunger") >= 20 then
			setElementData(localPlayer,"char:hunger", getElementData(localPlayer, "char:hunger") - 20)
		else
			setElementData(localPlayer,"char:hunger", 0)
		end
		triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)	
	elseif itemID == 215 then
		if hasItem(localPlayer, 67) then 
			triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
			modositItemCountIfWant(itemID, itemSlot)
			smokeStart(itemSlot,DBID,itemID,itemValue,itemCount,30)
		else
			outputChatBox("#D24D57[IRG-MTA] #ffffffNincs nálad #F7CA18'öngyújtó'#ffffff.", 255, 255, 255, true)
		end	
	elseif itemID == 144 then
		if hasItem(localPlayer, 67) then 
			triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, itemID, false)
			giveArmor2 (localPlayer, math.random(1,5))
			exports["san_death"]:enableLSD(math.random(1,1))
			modositItemCountIfWant(itemID, itemSlot)
			smokeStart(itemSlot,DBID,itemID,itemValue,itemCount,30)
		else
			outputChatBox("#D24D57[IRG-MTA] #ffffffNincs nálad #F7CA18'öngyújtó'#ffffff.", 255, 255, 255, true)
		end
		
	elseif itemID == 13 then
		modositItemCountIfWant(itemID, itemSlot)
		triggerServerEvent('wlsMTA->#inventoryGiveItem', localPlayer, localPlayer, 215, 1, 20, 0, true)
	elseif itemID == 14 then
		if not getElementData(localPlayer,"char >> isDrugged") or false then
			exports["san_death"]:enableLSD(math.random(2,4))
			me("felszívott egy csík kokaint")
			setElementData(localPlayer,"char >> isDrugged",true)
			setElementData(localPlayer,"char:hunger",math.random(1,10))
			local rand = math.random(1,3)
			setTimer(function()
				exports["san_death"]:disableLSD()
				setElementData(localPlayer,"char >> isDrugged",false)
			end,rand*60*1000,1)
			modositItemCountIfWant(itemID, itemSlot)
		else
			outputChatBox("Egyszerre csak 1 Drogot vehetsz be!",  255, 255, 255, true)
		end		
	elseif itemID == 15 then
		if not getElementData(localPlayer,"char >> isDrugged") or false then
			exports["san_death"]:enableLSD(4)
			me("belőtt magába egy heroin-t")
			setElementData(localPlayer,"char >> isDrugged",true)
			setElementData(localPlayer,"char:hunger",math.random(1,10))
			local rand = math.random(1,3)
			setTimer(function()
				exports["san_death"]:disableLSD()
				setElementData(localPlayer,"char >> isDrugged",false)
			end,rand*60*1000,1)
			modositItemCountIfWant(itemID, itemSlot)
		else
			outputChatBox("Egyszerre csak 1 Drogot vehetsz be!",  255, 255, 255, true)
		end	
	elseif itemID == 17 then
		-- triggerServerEvent("checkCarKey",localPlayer,localPlayer,DBID,itemValue)	
		
	elseif (itemLists[itemID].weaponID) then
		triggerServerEvent("toggleGun", getLocalPlayer(), getLocalPlayer(), itemSlot, itemID,itemValue)
		slots = itemSlot
		itemids = itemID
	elseif itemID == 29 then
		if not showedIndentyCard then
			local values = fromJSON(itemValue)
		--	outputChatBox(values[1])
			exports.wls_szemelyi:showCard(1,values[1],values[2],values[3],values[4])
			showedIndentyCard = true
		else
			showedIndentyCard = false
			exports.wls_szemelyi:destroyCard(1)
		end
	elseif itemID == 152 then
		triggerServerEvent('wlsMTA->#createShield', localPlayer, localPlayer)
		slots = itemSlot
		itemids = itemID
	elseif itemID == 109 then
		setElementData(localPlayer, 'money', (getElementData(localPlayer, 'money') + 20000000))
		modositItemCountIfWant(itemID, itemSlot)
	elseif itemID == 26 then
			local veh = getPedOccupiedVehicle(localPlayer)
			setElementData(veh, "fuel", 100, false)
            modositItemCountIfWant(itemID, itemSlot)
	elseif itemID == 28 then
		if not showedLicensCard then
			local values = fromJSON(itemValue)
		---	outputChatBox(values[1])
			exports.wls_jogsi:showJogsi(2,values[1],values[2],values[3],values[4])
			showedLicensCard = true
		else
			showedLicensCard = false
			exports.wls_jogsi:destroyJogsi(2)
		end
	elseif itemID == 34 then
		if not getElementData(localPlayer, 'char->bage.show') then 
			setElementData(localPlayer, 'char->bage', itemValue)
			setElementData(localPlayer, 'char->bage.show', true)
			me('felhelyezi a jelvényét.')
			setElementData(localPlayer, "char:weaponGettin"..getItemType(itemID)..itemSlot, true)	
		else
			me('leveszi a jelvényét.')
			setElementData(localPlayer, "char:weaponGettin"..getItemType(itemID)..itemSlot, false)
			setElementData(localPlayer, 'char->bage', 0)
			setElementData(localPlayer, 'char->bage.show', false)
		end
	elseif itemID == 84 then
			me('felveszi a golyóálló méllényét.')
			giveArmor (localPlayer, 100 )
			modositItemCountIfWant(itemID, itemSlot)
			
	elseif itemID == 62 then
		if getElementDimension(localPlayer) > 0 then
			triggerServerEvent("item->createSafe",localPlayer,localPlayer) 
			modositItemCountIfWant(itemID, itemSlot)
		else
			outputChatBox("Csak interiorba hozhatsz létre széfet")
		end	
	elseif itemID == 85 then
		outputChatBox("#d24d57[Horgászás]: #ffffffNincs rajta csali!", 255, 255, 255, true)
	elseif itemID == 65 then
		addHealth("bevesz egy gyógyszert",math.random(10,20),itemSlot,DBID, itemID)
	elseif itemID == 78 then
		addHealth("bevesz egy kapszulát",math.random(100,100),itemSlot,DBID, itemID)
	elseif itemID == 70 then
		if not isPedInVehicle(localPlayer) then
			outputChatBox("Nem ülsz járműben!",255,255,255,true)
		else
			local vehicle = getPedOccupiedVehicle(localPlayer);
			local health = getElementHealth(vehicle);
			if health>=950 then
				outputChatBox("Nem elég sérült a járműved!",255,255,255,true)
			else	
				triggerServerEvent("fixCardUse",localPlayer,vehicle)
				modositItemCountIfWant(itemID, itemSlot)
				outputChatBox("Megjavítottad a járműved!",255,255,255,true)
			end
		end
	elseif itemID == 71 then
		--Tankolás kártya
		local vehicle = getPedOccupiedVehicle(localPlayer)
		if vehicle then
			local fuel = tonumber(getElementData(vehicle, "fuel")) or 1
			if fuel>=95 then
				outputChatBox("Még nem kell tankolnod a járműbe!", 255, 30, 30, true)
			else
				setElementData(vehicle, "fuel", 100)
				outputChatBox("Tele tankoltad a járművedet!", 255, 30, 30, true)
				modositItemCountIfWant(itemID, itemSlot)
			end
		else
			outputChatBox("Nem vagy járműben!", 255, 30, 30, true)
		end
	elseif itemID == 158 then
		exports['wls_fishing']:createStick()	
	elseif itemID == 108 then
		exports['wlsEvent']:startEventFunction('items')	
	elseif itemID == 111 then
		exports['wlsLicenses']:showLicenses(itemValue, 1)	
	elseif itemID == 112 then
		exports['wlsLicenses']:showLicenses(itemValue, 2)	
	elseif itemID == 136 then
		exports['wlsLicenses']:showLicenses(itemValue, 3)
	elseif itemID == 216 then
		 if exports['wls_groups']:isPlayerInFaction(localPlayer, 1) then
			exports['wlsTicket']:createTicket()
		end
	elseif itemID == 27 then
			triggerServerEvent("createHifi", localPlayer, localPlayer)
            modositItemCountIfWant(itemID, itemSlot)
	elseif itemID == 217 then
		exports['wlsTicket']:drawTickets(itemValue)	
	elseif itemID == 142 then
		if getElementInterior(localPlayer) > 0 and getElementDimension(localPlayer) > 0 then 
			triggerServerEvent('wlsMTA->#createPlant', localPlayer, localPlayer, 2)
		else
			outputChatBox("#D24D57[IRG-MTA] #ffffffEzt a tárgyat csak interiorba tudod lerakni!", 255, 194, 14, true)
		end
	elseif itemID == 227 then
		 if exports['wls_groups']:isPlayerInFaction(localPlayer, 1) or exports['wls_groups']:isPlayerInFaction(localPlayer, 2) or exports['wls_groups']:isPlayerInFaction(localPlayer, 4) then
			exports['wlsInserSiren']:createSiren()
			modositItemCountIfWant(itemID, itemSlot)
		end
	elseif itemID == 110 then
		exports["wlsLotto"]:showLotto(itemValue)
	elseif itemID == 143 then
		if getElementInterior(localPlayer) > 0 and getElementDimension(localPlayer) > 0 then 
			triggerServerEvent('wlsMTA->#createPlant', localPlayer, localPlayer, 1)
		else
			outputChatBox("#D24D57[IRG-MTA] #ffffffEzt a tárgyat csak interiorba tudod lerakni!", 255, 194, 14, true)
		end
	elseif itemID >= 231 and itemID <= 240 then 
	outputChatBox("#D24D57[IRG-MTA] #ffffffEddig lefut!", 255, 255, 255, true)
		triggerServerEvent('wlsMTA->#insertStat', localPlayer, localPlayer, itemID, itemSlot)
	else
		outputChatBox("#D24D57[IRG-MTA] #ffffffEhhez az itemhez nincs művelet!", 255, 255, 255, true)
	end	
end

local haszItem = ""
local haszItemValue = ""
local haszItemCount = ""
local haszItemSlot = ""
local haszItemDBID = ""
local haszItemFood = ""

function foodoper(itemSlot,DBID,itemID,itemValue,itemCount,foodfuel)
	haszItem = itemID
	haszItemValue = itemValue
	haszItemCount = itemCount
	haszItemSlot = itemSlot
	haszItemDBID = DBID
	haszItemFood = foodfuel
	addEventHandler("onClientRender",getRootElement(),foodRender)
end

function dringStart(itemSlot,DBID,itemID,itemValue,itemCount,foodfuel)
	haszItem = itemID
	haszItemValue = itemValue
	haszItemCount = itemCount
	haszItemSlot = itemSlot
	haszItemDBID = DBID
	haszItemFood = foodfuel
	addEventHandler("onClientRender",getRootElement(),drinkRender)
end

function smokeStart(itemSlot,DBID,itemID,itemValue,itemCount,foodfuel)
	haszItem = itemID
	haszItemValue = itemValue
	haszItemCount = itemCount
	haszItemSlot = itemSlot
	haszItemDBID = DBID
	haszItemFood = foodfuel
	addEventHandler("onClientRender",getRootElement(),smokeRender)
end


local box = {40,40}
local box2 = {64,64}
local box3 = {200,30}
local actionBar = {342,110}
local katt = 0
local lastClick = 0

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

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function checkCursor()
	if not guiGetInputEnabled() and not isMTAWindowActive() and isCursorShowing( ) then
		return true
	else
		return false
	end
end

function foodRender()

	local width,height = itemSize*(actionbarSlot)+margin*(actionbarSlot+1), itemSize+margin*2

	if isInSlot(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2]) then
		dxCreateBorder(monitorSize[1]/2 - width/2+120,actionPosY-height+10-51,box[1],box[2],tocolor(136,211,115,255))
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")

		if getKeyState("mouse1") and lastClick+200 <=getTickCount() then
			lastClick = getTickCount() -- food eat_burger
			if isTimer(timers) then exports.san_info:addNotification("Kérlek várj!","info") return end
			if katt < 9 then
				katt = katt + 1
				setElementFrozen(localPlayer,true)
				-- setPedAnimation(localPlayer, "food", "eat_burger",2000,false,false)
				triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "food", "eat_burger", 2000, true, false)
				timers = setTimer(function()
					setElementFrozen(localPlayer,false)
				end,6000,1)
				
				me("eszik egy ".. getItemName(haszItem) .. '-t')
				giveHunger(10)
				if getElementData(localPlayer,"char:hunger") >= 100 then
					triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
					removeEventHandler("onClientRender",getRootElement(),foodRender)
					modositItemCountIfWant(haszItem, haszItemSlot)
					katt = 0
				end
			else

				removeEventHandler("onClientRender",getRootElement(),foodRender)
				modositItemCountIfWant(haszItem, haszItemSlot)
				katt = 0
				triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
			end
		end	
		if getKeyState("mouse2") and lastClick+200 <=getTickCount() then
			triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
			lastClick = getTickCount()
			triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "carry", "putdwn", 1000, false, false)
			-- setPedAnimation(localPlayer, "carry", "putdwn",2000,false,false)
			modositItemCountIfWant(haszItem, haszItemSlot)
			me("eldob egy tárgyat (".. getItemName(haszItem)..")")
			exports["san_death"]:disableLSD()
			removeEventHandler("onClientRender",getRootElement(),foodRender)
			katt = 0
		end
	else
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")
	end

	dxDrawImage(monitorSize[1]/2 - width/2+40,actionPosY-height-height-20,box2[1],box2[2],"img/1.png")
	dxDrawImage(monitorSize[1]/2 - width/2+180,actionPosY-height-height-20,box2[1],box2[2],"img/2.png")
	dxDrawRectangle(monitorSize[1]/2 - width/2+40,actionPosY-height+10,box3[1],box3[2],tocolor(0,0,0,150))
	dxDrawText("Étkezés",monitorSize[1]/2 - width/2+10,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawText("Eldobás",monitorSize[1]/2 - width/2+235,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawRectangle(monitorSize[1]/2 - width/2+42,actionPosY-height+10+1.6,box3[1]*(katt*10)/100,box3[2]-4,tocolor(136,211,115,150))
	dxDrawText((katt*10).."%",monitorSize[1]/2 - width/2+130,actionPosY-height+10+7,0,0,tocolor(255,255,255,255),1,"default-bold")

end

function drinkRender()

	local width,height = itemSize*(actionbarSlot)+margin*(actionbarSlot+1), itemSize+margin*2

	if isInSlot(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2]) then
		dxCreateBorder(monitorSize[1]/2 - width/2+120,actionPosY-height+10-51,box[1],box[2],tocolor(136,211,115,255))
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")

		if getKeyState("mouse1") and lastClick+200 <=getTickCount() then
			lastClick = getTickCount() -- food eat_burger
			if isTimer(timers) then exports.san_info:addNotification("Kérlek várj!","info") return end
			if katt < 9 then
				katt = katt + 1
				setElementFrozen(localPlayer,true)
				-- setPedAnimation(localPlayer, "vending", "vend_drink2_p",2000,false,false)
				triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "vending", "vend_drink2_p", 2000, true, false)
				timers = setTimer(function()
					setElementFrozen(localPlayer,false)
				end,6000,1)
				
				me("iszik egy ".. getItemName(haszItem).. '-t')
				giveThrink(10)
				if getElementData(localPlayer,"char:thirst") >= 100 then
					triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
					removeEventHandler("onClientRender",getRootElement(),drinkRender)
					modositItemCountIfWant(haszItem, haszItemSlot)
					katt = 0
				end
			else

				removeEventHandler("onClientRender",getRootElement(),drinkRender)
				modositItemCountIfWant(haszItem, haszItemSlot)
				katt = 0
			end
		end	
		if getKeyState("mouse2") and lastClick+200 <=getTickCount() then
			triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
			lastClick = getTickCount()
		--	triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "carry", "putdwn", 1000, false, false)
			modositItemCountIfWant(haszItem, haszItemSlot)
			me("eldob egy tárgyat (".. getItemName(haszItem)..")")
			removeEventHandler("onClientRender",getRootElement(),drinkRender)
			katt = 0
		end
	else
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")
	end

	dxDrawImage(monitorSize[1]/2 - width/2+40,actionPosY-height-height-20,box2[1],box2[2],"img/1.png")
	dxDrawImage(monitorSize[1]/2 - width/2+180,actionPosY-height-height-20,box2[1],box2[2],"img/2.png")
	dxDrawRectangle(monitorSize[1]/2 - width/2+40,actionPosY-height+10,box3[1],box3[2],tocolor(0,0,0,150))
	dxDrawText("Ivás",monitorSize[1]/2 - width/2+10,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawText("Eldobás",monitorSize[1]/2 - width/2+235,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawRectangle(monitorSize[1]/2 - width/2+42,actionPosY-height+10+1.6,box3[1]*(katt*10)/100,box3[2]-4,tocolor(136,211,115,150))
	dxDrawText((katt*10).."%",monitorSize[1]/2 - width/2+130,actionPosY-height+10+7,0,0,tocolor(255,255,255,255),1,"default-bold")

	
end
function smokeRender()

	local width,height = itemSize*(actionbarSlot)+margin*(actionbarSlot+1), itemSize+margin*2

	if isInSlot(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2]) then
		dxCreateBorder(monitorSize[1]/2 - width/2+120,actionPosY-height+10-51,box[1],box[2],tocolor(136,211,115,255))
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")

		if getKeyState("mouse1") and lastClick+200 <=getTickCount() then
			lastClick = getTickCount() -- food eat_burger
			if isTimer(timers) then exports.san_info:addNotification("Kérlek várj!","info") return end
			if katt < 9 then
				katt = katt + 1
				setElementFrozen(localPlayer,true)
				-- setPedAnimation(localPlayer, "GANGS", "smkcig_prtl",2000,false,false)
				triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "GANGS", "smkcig_prtl", 2000, false, false)
				timers = setTimer(function()
					setElementFrozen(localPlayer,false)
				end,6000,1)
				
				me("beleszív a ".. getItemName(haszItem):gsub('Cigaretta', 'cigarettá').. 'ba.')
			else
				if cigarette[localPlayer] then 
					destroyElement(cigarette[localPlayer])
					me("eldobott egy szál cigarettát.")
					triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
					lastClick = getTickCount()
					removeEventHandler("onClientRender",getRootElement(),smokeRender)
					katt = 0
					cigarette[localPlayer] = false
				end 
			end
		end	
		if getKeyState("mouse2") and lastClick+200 <=getTickCount() then
			lastClick = getTickCount()
		--	triggerServerEvent('wlsMTA->#setPlayerAnimation', localPlayer, localPlayer, "carry", "putdwn", 1000, false, false)
			triggerServerEvent('wlsMTA->#createAttachObj', localPlayer, localPlayer, haszItem, false, true)
			me("eldob egy tárgyat (".. getItemName(haszItem)..")")
			exports["san_death"]:disableLSD()
			katt = 0
			if cigarette[localPlayer] then 
				destroyElement(cigarette[localPlayer])
				cigarette[localPlayer] = false
			end 
			removeEventHandler("onClientRender",getRootElement(),smokeRender)
		end
	else
		dxDrawImage(monitorSize[1]/2 - width/2+120,actionPosY-height+10-50,box[1],box[2],"files/items/"..haszItem..".png")
	end

	dxDrawImage(monitorSize[1]/2 - width/2+40,actionPosY-height-height-20,box2[1],box2[2],"img/1.png")
	dxDrawImage(monitorSize[1]/2 - width/2+180,actionPosY-height-height-20,box2[1],box2[2],"img/2.png")
	dxDrawRectangle(monitorSize[1]/2 - width/2+40,actionPosY-height+10,box3[1],box3[2],tocolor(0,0,0,150))
	dxDrawText("Szívás",monitorSize[1]/2 - width/2+10,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawText("Eldobás",monitorSize[1]/2 - width/2+235,actionPosY-height+10-35,0,0,tocolor(255,255,255,255),1,"default-bold")
	dxDrawRectangle(monitorSize[1]/2 - width/2+42,actionPosY-height+10+1.6,box3[1]*(katt*10)/100,box3[2]-4,tocolor(136,211,115,150))
	dxDrawText((katt*10).."%",monitorSize[1]/2 - width/2+130,actionPosY-height+10+7,0,0,tocolor(255,255,255,255),1,"default-bold")

end

function dxCreateBorder(x,y,w,h,color)
	dxDrawRectangle(x,y,w+1,1,color,true) -- Fent
	dxDrawRectangle(x,y+1,1,h,color,true) -- Bal Oldal
	dxDrawRectangle(x+1,y+h,w,1,color,true) -- Lent Oldal
	dxDrawRectangle(x+w,y+1,1,h,color,true) -- Jobb Oldal
end

-- function outputLoss(loss)
    -- if getElementModel(source) == 1631 then 
		-- local newHealth = getElementHealth(source) - 10
		-- setElementHealth(getElementData(source, 'obj >> element'), newHealth)
		-- if newHealth <= 0 then 
			-- triggerServerEvent('wlsMTA->#createShield', getElementData(getElementData(source, 'obj >> element'), 'obj >> player'), getElementData(getElementData(source, 'obj >> element'), 'obj >> player'))
			-- modositItemCountIfWant(itemids, slots)
		-- end
	-- end
-- end
-- addEventHandler("onClientObjectDamage", root, outputLoss)

addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), 
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
	if weapon == 17 and getElementType(localPlayer)=="player" then 
		modositItemCountIfWant(itemids, slots)
	elseif weapon == 23 and getElementType(localPlayer)=="player" then 
		local px, py, pz = getElementPosition(localPlayer)
		local distance = getDistanceBetweenPoints3D(hitX, hitY, hitZ, px, py, pz)
		
		if (distance<10) then
			fxAddSparks(hitX, hitY, hitZ, 1, 1, 1, 1, 10, 0, 0, 0, true, 3, 1)
		end
		playSoundFrontEnd(38)
		-- triggerServerEvent("tazerFired", localPlayer, hitX, hitY, hitZ, hitElement) 
	end
end)

function modositItemCountIfWant(itemID, slot)
	local count = 0
	-- if itemTable[getItemType(itemID)] and itemTable[getItemType(itemID)][slot] then 
		if tonumber(itemTable[getItemType(itemID)][slot]['count'] or 0) > 1 then
			count = tonumber(itemTable[getItemType(itemID)][slot]['count']) - 1
			-- triggerServerEvent("wlsMTA->#setSlotCount", getLocalPlayer(), getLocalPlayer(), getItemType(itemID), slot, itemTable[getItemType(itemID)][slot]['value'] or 0, itemTable[getItemType(itemID)][slot]['count'] or 0, itemTable[getItemType(itemID)][slot]['duty'] or 0, itemTable[getItemType(itemID)][slot]['actionSlot'] or 0, itemID)
			setSlotCount(slot, count, itemID, itemTable[getItemType(itemID)][slot]['duty'] or 0)
		else
			itemTable[getItemType(itemID)][slot] = {-1,-1,-1,-1}
			triggerServerEvent("wlsMTA->#deleteItem", getLocalPlayer(), getLocalPlayer(), getItemType(itemID), slot)
		end
	-- end
end