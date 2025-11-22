local sx, sy = guiGetScreenSize()
local offset = sx / 1920
local height = 80 * offset
local imgO = 80 * offset
local width = 600
local left = sx/2-width/2
local top = sy/2 - height/2
local nwidth = 375 * offset
local nheight = 92 * offset
local max = 100
local startLeft = 0
local startTime = 0
local endTime = 0
local randI = 0
local minRand = math.ceil(sx / imgO + 0.5)
local startTime = getTickCount()
local showedPanel = false
--endTime = math.random(8000,25000)
local showImage = false


local saveJSON = {}

function jsonGET(file)
    local fileHandle
    local jsonDATA = {}
    if not fileExists(file) then
        fileHandle = fileCreate(file)
        fileWrite(fileHandle, toJSON({["isEvent"] = false}))
        fileClose(fileHandle)
        fileHandle = fileOpen(file)
    else
        fileHandle = fileOpen(file)
    end
    if fileHandle then
        local buffer
        local allBuffer = ""
        while not fileIsEOF(fileHandle) do
            buffer = fileRead(fileHandle, 500)
            allBuffer = allBuffer..buffer
        end
        jsonDATA = fromJSON(allBuffer)
        fileClose(fileHandle)
    end
    return jsonDATA
end
 
function jsonSAVE(file, data)
    if fileExists(file) then
        fileDelete(file)
    end
    local fileHandle = fileCreate(file)
    fileWrite(fileHandle, toJSON(data))
    fileFlush(fileHandle)
    fileClose(fileHandle)
    return true
end

addEventHandler("onClientResourceStart",getResourceRootElement(getThisResource()),function()
	local data = jsonGET("@event.json")
	saveJSON = data
	setElementData(localPlayer,"btcMTA:Event",saveJSON["isEvent"])
	triggerServerEvent("btcMTA >> eventTime",localPlayer,localPlayer)
end)

addEventHandler("onClientElementDataChange",getRootElement(),function(dataName)
	if getElementType(source) == "player" and dataName == "btcMTA:Event" then
			saveJSON["isEvent"] = getElementData(source,"btcMTA:Event")
			jsonSAVE("@event.json",saveJSON)
	end
end)


local panelW,panelH = 660,200
local panelX,panelY = sx/2 - panelW/2,sy/2 - panelH/2
local itemRotates = {}
local objects = nil


local font = dxCreateFont("files/calibri.ttf",12)

function createEventPanel()
	local added = (sx - minRand*imgO) / 2
	dxDrawRectangle(panelX,panelY,panelW,panelH,tocolor(0,0,0,150))
	
	
	dxDrawRectangle(left+0.5, top, width, height,tocolor(255,255,255,150))
	
	dxDrawRectangle(sx/2-143 - nwidth/2, top - nheight+1, nwidth+286, nheight-60,tocolor(0,0,0,255))
	dxDrawText("#7cc576IRG #ffffffRoleplay - #00AEFFEVENTO CAIXA!!",panelX+200,panelY-25,0,0,tocolor(255,255,255,255),1,font,"left","top",false,false,false,true)
	
	
	if isMouseInPosition(panelX+50,panelY+155,200,30) then
		dxDrawRectangle(panelX+45,panelY+150,210,40,tocolor(0,0,0,150))
		dxDrawRectangle(panelX+50,panelY+155,200,30,tocolor(124,197,118,200))
	else
		dxDrawRectangle(panelX+45,panelY+150,210,40,tocolor(0,0,0,150))
	end	
	if isMouseInPosition(panelX+panelW-250,panelY+150,200,30) then
		dxDrawRectangle(panelX+panelW-255,panelY+150,210,40,tocolor(0,0,0,150))
		dxDrawRectangle(panelX+panelW-250,panelY+155,200,30,tocolor(215,85,85,200))
	else
		dxDrawRectangle(panelX+panelW-255,panelY+150,210,40,tocolor(0,0,0,150))
	end
	
	dxDrawText("  GIRAR",panelX+105,panelY+160,0,0,tocolor(255,255,255,255),1,font,"left","top",false,false,false)
	dxDrawText("FECHAR",panelX+panelW-180,panelY+160,0,0,tocolor(255,255,255,255),1,font,"left","top",false,false,false)

	
	local id = math.ceil((startLeft - imgO/2)/imgO + 0.5) + math.ceil(minRand/2 + 0.5) - 1
	
	if showImage then 
		local data = itemRotates[id]
		if data then
			if(data[1]==1 or data[1]==2)then
				dxDrawText("#00C200SERÁ QUE VOCÊ VAI TER SORTE?\n#ffffffNome do item: #D24D57"..exports["san_items"]:getItemName(data[2], data[3]), sx/2 - nwidth/2, top+80 - nheight - 5-50, sx/2 - nwidth/2 + nwidth, top - nheight - 5 + 90*offset, tocolor(255,255,255,255), 1,font, "center", "center",false,false,false,true)
			end
		end
		for i, v in ipairs(itemRotates) do
			local color = tocolor(255,255,255,100)
			if id == i then
				color = tocolor(255,255,255,255)
			end
			if(data[1]==1 or data[1]==2)then
				local cx = imgO * (i-1) - startLeft
				if cx >= sx/2-320 and cx <= sx/2+280 then
					dxDrawImage(cx, top, imgO, imgO, ":san_items/files/items/"..v[2]..".png", 0, 0, 0, color)
				end
			end
	--		dxDrawImage(imgO * (i-1) - startLeft, top + (height-imgO)/2, imgO, imgO, v[1], 0, 0, 0, color)
		end

		if(id~=lastSzam)then
			lastSzam = id
			--playSound("files/cikk.mp3")
		end
		
		startLeft = interpolateBetween(0,0,0,(#itemRotates - randI)*imgO - added,0,0,(getTickCount()-startTime)/endTime,"OutQuad")

		lastSzam = id
	end
end




addEvent('btcMTA->destroyEvent', true)
addEventHandler('btcMTA->destroyEvent', root, function()
	removeEventHandler("onClientRender", getRootElement(), createEventPanel)
	setElementData(localPlayer,"btcMTA:Event", false)
	if objects then 
		setElementData(objects,"eventBox->Use",false)
	end
	setTimer(function()
		objects = nil
		endTime = 0
		showedPanel = false
		showImage = false
		endTime = 0
		randI = 0
		minRand = math.ceil(sx / imgO + 0.5)
		startTime = getTickCount()
	end,500,1)
end)

addEventHandler('onClientClick', root, function (button, state, _, _, _, _, _, element)
	if button == 'left' and state == 'down' and element and getElementType(element) == 'object' and (getElementData(element, 'eventBox->ID') or 0) > 0 and not showedPanel then 
		if getElementData(element,"eventBox->Use") then outputChatBox("#7cc576[Event]: #ffffffEste baú já está em uso!",124,197,118,true) return end
		if not getElementData(localPlayer,"btcMTA:Event") then
			itemRotates = {}
			for i=0, max do
				table.insert(itemRotates, items[math.random(#items)])
			end
			randI = math.random(minRand, minRand + 4)
			startTime = getTickCount()
			endTime = 0
			timer = setTimer(function() end, 200, 1)
			addEventHandler("onClientRender",getRootElement(),createEventPanel,true,"low-5")
			objects = element
			setElementData(element,"eventBox->Use",true)
			showImage = false
			showedPanel = true
		else
			outputChatBox("#7cc576[Event]: #ffffffVocê só pode abrir uma caixa a cada meia hora!",124,197,118,true)
		end
	end
	if button == "left" and state == "down" and showedPanel then
		if isTimer(timer) then return end
		if(startTime+endTime>getTickCount())then return false end
		if isMouseInPosition(panelX+50,panelY+155,200,30) then
			startTime = getTickCount()
			showImage = true
			endTime = math.random(8000,25000)
			if(isTimer(timer1))then killTimer(timer1) end
			timer1 = setTimer(function()
				local data = itemRotates[lastSzam]
				local text = "Ismeretlen"
				-- if(data[1]==2 or data[1]==4)then
					text = exports["san_items"]:getItemName(data[2])
					triggerServerEvent("btcMTA->#giveItem",localPlayer,localPlayer,data[2],objects, data[3])

					removeEventHandler("onClientRender",getRootElement(),createEventPanel)
					setElementData(localPlayer,"btcMTA:Event",true)
					saveJSON["isEvent"] = true
					jsonSAVE("@event.json",saveJSON)
					setTimer(function()
						objects = nil
						endTime = 0
						showedPanel = false
						showImage = false
						endTime = 0
						randI = 0
						minRand = math.ceil(sx / imgO + 0.5)
						startTime = getTickCount()
					end,500,1)
				-- end
			end,endTime-500,1)
		end
		if isMouseInPosition(panelX+panelW-250,panelY+155,200,30) then 
			removeEventHandler("onClientRender",getRootElement(),createEventPanel)
			setElementData(objects,"eventBox->Use",false)
			setTimer(function()
				objects = nil
				endTime = 0
				showImage = false
				showedPanel = false
			end,500,1)
		end
	end
end)

function isMouseInPosition ( x, y, width, height ) 
    if ( not isCursorShowing ( ) ) then 
        return false 
    end 
  
    local sx, sy = guiGetScreenSize ( ) 
    local cx, cy = getCursorPosition ( ) 
    local cx, cy = ( cx * sx ), ( cy * sy ) 
    if ( cx >= x and cx <= x + width ) and ( cy >= y and cy <= y + height ) then 
        return true 
    else 
        return false 
    end 
end 

local cpString = ""
addCommandHandler("gencp", function()
	if getElementData(localPlayer,"adminlevel") >= 9 then
		outputChatBox("új")
		local x,y,z = getElementPosition(localPlayer)
		cpString = cpString.."\n".."{"..x..","..y..","..z.."},"
		outputChatBox(cpString)
		setClipboard(cpString)
	end
end)


function startEventFunction()
			itemRotates = {}
			for i=0, max do
				table.insert(itemRotates, items[math.random(#items)])
			end
			randI = math.random(minRand, minRand + 4)
			startTime = getTickCount()
			endTime = 0
			timer = setTimer(function() end, 200, 1)
			addEventHandler("onClientRender",getRootElement(),createEventPanel,true,"low-5")
			showImage = false
			showedPanel = true
end
addEvent('btcMTA->iniciarEvent', true)
addEventHandler('btcMTA->iniciarEvent', root, startEventFunction)

