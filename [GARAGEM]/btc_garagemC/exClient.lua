local odimension = getElementDimension(localPlayer)
local ointerior = getElementInterior(localPlayer)
local screenSize = {guiGetScreenSize()}
screenSize.x, screenSize.y = screenSize[1], screenSize[2]
local myScreenSource = dxCreateScreenSource(screenSize.x, screenSize.y)


function infoSound(file)
	playSound("files/sounds/"..file..".mp3")
end
function infoBox(text, type)
	if not text then return end
	if not tonumber(type) then type = 4 end
	exports["btc_infobox"]:addNotification(text, type)
end
function isCursorHover(startX, startY, sizeX, sizeY)
	if isCursorShowing() then
		local cursorPosition = {getCursorPosition()}
		cursorPosition.x, cursorPosition.y = cursorPosition[1] * screenSize.x, cursorPosition[2] * screenSize.y
		if cursorPosition.x >= startX and cursorPosition.x <= startX + sizeX and cursorPosition.y >= startY and cursorPosition.y <= startY + sizeY then
			return true
		else
			return false
		end
	else
		return false
	end
end

local dashboardOpened = false
local dutyskinOpened = false
local width, height = 800, 450
local startX, startY = (screenSize.x - width) / 2 , (screenSize.y - height) / 2
local bgColor = tocolor(0, 0, 0, 180)
local slotColor = tocolor(40, 40, 40, 200)
local hoverColor = tocolor(124, 197, 118, 180)
local secondColor = tocolor(124, 197, 118, 180)
local cancelColor = tocolor(243, 85, 85, 180)

local spacer = 2
local spacerBig = 5

local roboto = dxCreateFont("files/fonts/Roboto.ttf", 8, false, "proof")
local robotoBold = dxCreateFont("files/fonts/Roboto.ttf", 10, true, "proof")
local robotoBig = dxCreateFont("files/fonts/Roboto.ttf", 11, false, "proof")
local robotoGui = guiCreateFont("files/fonts/Roboto.ttf", 9)

local menuPoints = {{"Propriedade", "property"}}
local menuPointsWidth = (width - (#menuPoints - 1) * spacerBig) / #menuPoints
local playerInfos = {}

local optionsText = {"Ativado"}
optionsText[0] = "Desligado"
local changeTips = {"Desligar"}
changeTips[0] = "Ligar"
local vehicleTuningDatas = {{"engine", "Motor"}, {"turbo", "turbo"}, {"gearbox", "projeto de lei"}, {"ecu", "Ecu"}, {"pneus", "goma"}, {"brakes", "freio"}}
local vehicleTunings = {"#999999Não", "#acd737Rua", "#ffcc00Profissional", "#ff6600Competição", "#ff1a1aEngrenagem" , "#ff1a1aEngrenagem"}
vehicleTunings[0] = "#999999não"


local optionsCreateColor = ""
local optionsCreateText = "" 
local maxdistance = 0



local groupMembers = {}
local groupVehicles = {}
local meInGroup = {}

local admins = {}
local openedTick = getTickCount() - 2000

--[[
function changeState()
	if not dashboardOpened then
		currentPage = 1
		setElementData(localPlayer, "toggle-->All", true)
		showChat(false)
		showCursor(true)
		dashboardOpened = true
		openedTick = getTickCount()
		getMyVehicles()
		maxVehicleRows = 9
		currentVehicleRow = 1
		lastVehicleRow = 1
		selectedVehicle = 1
	else
	setElementData(localPlayer, "toggle-->All", false)
	showChat(true)
	showCursor(false)
	dashboardOpened = false
	end
end
]]--

parkYerleri =  {}
park = dxCreateTexture("parking.png")
parkYerleri = createMarker(2224.5769042969,-2395.8581542969,13.546875-0.95, "cylinder", 2, 0, 176, 196, 10 )



local myBlip = createBlipAttachedTo ( parkYerleri, 55 )
setElementData(myBlip,"blip >> name", "Garagem - caminhões")

--[[

function parkYeri()

	_3DResim(parkYerleri,park);

end
addEventHandler("onClientRender", getRootElement(), parkYeri)
]]--


addEventHandler( "onClientMarkerHit", parkYerleri,
function ( hitElement, matchingDimension )
   if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
		currentPage = 1
		dashboardOpened = true
		openedTick = getTickCount()
		getMyVehicles()
		maxVehicleRows = 9
		currentVehicleRow = 1
		lastVehicleRow = 1
		selectedVehicle = 1
    end
end
)
addEventHandler( "onClientMarkerLeave", parkYerleri,
function ( hitElement, matchingDimension )
   if getElementType(hitElement) == "player" and (hitElement == localPlayer) then
	dashboardOpened = false
    end
end
)






addEventHandler("onClientDoubleClick", root, function(button)
	if button == "left" and dashboardOpened and currentPage == 1 then
		local selectedVehicleToGps = false
		lastVehicleRow = currentVehicleRow + maxVehicleRows - 1
		for key, value in ipairs(myVehicles) do
			if key >= currentVehicleRow and key <= lastVehicleRow then
				key = key - currentVehicleRow + 1
				local forY = startY + 2 * spacerBig + 30 + spacer + (key - 1) * 22
				if isCursorHover(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20) then
					selectedVehicleToGps = key + currentVehicleRow - 1
				end
			end
		end
		
		if tonumber(selectedVehicleToGps) then				
		--triggerServerEvent("updateINTDIM", localPlayer, getElementData(myVehicles[selectedVehicleToGps], "veh:id"))
			gpsVehicle("gps", getElementData(myVehicles[selectedVehicleToGps], "veh:id"))
		end
	end
end
)


vehicleWeight = {
	-- [VehID] = peso,
	[499] = true,
	[414] = true,
	[456] = true,
	[524] = true,
}

function gpsVehicle(commandName, vehicleId)
	if vehicleId then 
		for index, value in ipairs (getElementsByType("vehicle")) do
			if getElementData(value, "veh:id") == tonumber(vehicleId) then 
				if not getElementData(value, "veh:owner") == getElementData(localPlayer, "char:id") then 
				   outputChatBox("#7cc576[BGO MTA] #ffffffVocê não é o dono do veículo!",0,0,0,true)	
				   return
				end
					if (getElementDimension(value) == 0) then
					outputChatBox("#7cc576[BGO MTA] #ffffffSeu veiculo não pode ser spawnado porque ja está na cidade!!",0,0,0,true)
					return
					end
				
	                if (getElementData(value, "prfAP") == true) then 
					     outputChatBox("#7cc576[BGO MTA] #ffffffSeu veiculo está apreendido na PRF!",0,0,0,true)
						 triggerServerEvent("updateINTDIM22C", localPlayer, vehicleId)
                    else			
					
					if (getElementData(value, "detranAP")) then 
					
					if vehicleWeight[getElementModel(value)] then
						outputChatBox("#7cc576[BGO MTA] #ffffffSeu veiculo está no detran!",0,0,0,true)
						triggerServerEvent("updateINTDIM22C", localPlayer, vehicleId)
					else
					outputChatBox("#7cc576[BGO MTA] #ffffffSeu veiculo tem que ser um caminhão!!",0,0,0,true)
					end
					else
					if vehicleWeight[getElementModel(value)] then
					triggerServerEvent("updateINTDIM2C", localPlayer, vehicleId)
					else
					outputChatBox("#7cc576[BGO MTA] #ffffffSeu veiculo tem que ser um caminhão!!",0,0,0,true)
					end
					end
				 end
			end
		end
	end
end


addEventHandler("onClientKey", root, function(button, pressed)
	if pressed and getElementData(localPlayer, "loggedin") then
		--if button == "F4" then
			--changeState()
			--cancelEvent()
		--end
		if dashboardOpened then
			if currentPage == 1 then
				if isCursorHover(startX + 2 * spacerBig, startY + 2 * spacerBig + 30, width / 2 - 4 * spacerBig, maxVehicleRows * 22 + spacer) then
					if button == "mouse_wheel_down" then
						if currentVehicleRow < #myVehicles - (maxVehicleRows - 1) then
							currentVehicleRow = currentVehicleRow + 1
						end
					elseif button == "mouse_wheel_up" then
						if currentVehicleRow > 1 then
							currentVehicleRow = currentVehicleRow - 1
						end
					elseif button == "mouse1" then
						lastVehicleRow = currentVehicleRow + maxVehicleRows - 1
						for key, value in ipairs(myVehicles) do
							if key >= currentVehicleRow and key <= lastVehicleRow then
								key = key - currentVehicleRow + 1
								local forY = startY + 2 * spacerBig + 30 + spacer + (key - 1) * 22
								if isCursorHover(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20) then
									selectedVehicle = key + currentVehicleRow - 1
								end
							end
						end
					end
				end

			end
		end
	end
end
)

addEventHandler("onClientElementDataChange", root, function(dataName, oldValue)
	if source and getElementType(source) == "player" then
		if source == localPlayer then
			if dataName == "char:vehSlot" then
				getMyVehicles()
		end	
	end
	end
end)

function thousandsStepper(amount)
	local formatted = amount
	while true do  
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1 %2')
		if k == 0 then
			break
		end
	end
	return formatted
end
function getMyVehicles()
	myVehicles = {}
	for key, value in ipairs(getElementsByType("vehicle")) do
		if getElementData(value, "veh:owner") == getElementData(localPlayer, "acc:id") then
			table.insert(myVehicles, value)
		end
	end
	vehicleInfos = {"BGO - Garagem"}
end

addEventHandler("onClientRender", root, function()
	if dashboardOpened then
		--if isChatVisible() then showChat(false) end
		if getElementData(localPlayer, "toggle-->All") then setElementData(localPlayer, "toggle-->All", false) end
		--dxDrawRectangle(startX, startY, width, height, bgColor)

		if currentPage == 1 then
			--- Vehicles
			local sizeX = ((width / 2 - 4 * spacerBig) - 2 * spacerBig) / 3
			local key = 0
			dxDrawText(vehicleInfos[key + 1], startX + 55 * spacerBig + key * (sizeX + spacerBig), startY - 15 * spacerBig, startX + 2 * spacerBig + key * (sizeX + spacerBig) + sizeX, startY + 2 * spacerBig + 30 - spacerBig, tocolor(255, 255, 255), 2, "default", "center", "center")
			dxDrawText("Pressione M", startX + 55 * spacerBig + key * (sizeX + spacerBig), startY + 99 * spacerBig, startX + 2 * spacerBig + key * (sizeX + spacerBig) + sizeX, startY + 2 * spacerBig + 30 - spacerBig, tocolor(255, 255, 255), 2, "default", "center", "center")
			dxDrawText("Clique 2 vezes para spawnar o veiculo selecionado!", startX + 55 * spacerBig + key * (sizeX + spacerBig), startY + 115 * spacerBig, startX + 2 * spacerBig + key * (sizeX + spacerBig) + sizeX, startY + 2 * spacerBig + 30 - spacerBig, tocolor(255, 255, 255), 2, "default", "center", "center")
			dxDrawRectangle(startX + 2 * spacerBig, startY + 2 * spacerBig + 30, width / 2 - 4 * spacerBig, maxVehicleRows * 22 + spacer, bgColor)
			if #myVehicles > 0 then
				for key = 0, maxVehicleRows - 1 do
					local forY = startY + 2 * spacerBig + 30 + spacer + key * 22
					dxDrawRectangle(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20, slotColor)
					if isCursorHover(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20) or key == selectedVehicle - currentVehicleRow then
						dxDrawRectangle(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20, hoverColor)
					end
				end
				lastVehicleRow = currentVehicleRow + maxVehicleRows - 1
				for key, value in ipairs(myVehicles) do
					if key >= currentVehicleRow and key <= lastVehicleRow then
						key = key - currentVehicleRow + 1
						local forY = startY + 2 * spacerBig + 30 + spacer + (key - 1) * 22
						dxDrawText(exports.san_carshop:getVehicleRealName(getElementModel(value)).." (ID: "..getElementData(value, "veh:id")..")", startX + 3 * spacerBig + spacer, forY, startX + 3 * spacerBig + spacer + width / 2 - 4 * spacerBig - 2 * spacer, forY + 20, tocolor(255, 255, 255), 1, roboto, "left", "center")
						dxDrawText("Condição: "..math.floor(getElementHealth(value) / 10 + 0.5).."%", startX + 2 * spacerBig + spacer, forY, startX + 2 * spacerBig + spacer + width / 2 - 5 * spacerBig - 2 * spacer, forY + 20, tocolor(255, 255, 255), 1, roboto, "right", "center")				
						if isCursorHover(startX + 2 * spacerBig + spacer, forY, width / 2 - 4 * spacerBig - 2 * spacer, 20) or key == selectedVehicle - currentVehicleRow + 1 then
							dxDrawText(exports.san_carshop:getVehicleRealName(getElementModel(value)).." (ID: "..getElementData(value, "veh:id")..")", startX + 3 * spacerBig + spacer, forY, startX + 3 * spacerBig + spacer + width / 2 - 4 * spacerBig - 2 * spacer, forY + 20, tocolor(0, 0, 0), 1, roboto, "left", "center")
							dxDrawText("Condição: "..math.floor(getElementHealth(value) / 10 + 0.5).."%", startX + 2 * spacerBig + spacer, forY, startX + 2 * spacerBig + spacer + width / 2 - 5 * spacerBig - 2 * spacer, forY + 20, tocolor(0, 0, 0), 1, roboto, "right", "center")					
						end
					end
				end
			else
				dxDrawText("Nenhum veiculo", startX + 2 * spacerBig + spacerBig, startY + 2 * spacerBig + 30, startX + 2 * spacerBig + spacerBig + width / 2 - 4 * spacerBig, startY + 2 * spacerBig + 30 + maxVehicleRows * 22 + spacer, cancelColor, 1, robotoBig, "center", "center")
			end
			local rightSx = startX + 390 + 4 * spacerBig
		end
	end
end)

function dxDrawButton(text, startX, startY, width, height, color)
	dxDrawRectangle(startX - 1, startY, 1, height, bgColor) --left
	dxDrawRectangle(startX + width, startY, 1, height, bgColor) --right
	dxDrawRectangle(startX - 1, startY - 1, width + 2, 1, bgColor) --top
	dxDrawRectangle(startX - 1, startY + height, width + 2, 1, bgColor) --bottom
	dxDrawRectangle(startX, startY, width, height, color)
	dxDrawText(text, startX, startY, startX + width, startY + height, tocolor(255, 255, 255), 1, roboto, "center", "center", false, false, false, true)
end

function dxDrawEdit(startX, startY, width, height, element)
	dxDrawRectangle(startX - 1, startY, 1, height, bgColor) --left
	dxDrawRectangle(startX + width, startY, 1, height, bgColor) --right
	dxDrawRectangle(startX - 1, startY - 1, width + 2, 1, bgColor) --top
	dxDrawRectangle(startX - 1, startY + height, width + 2, 1, bgColor) --bottom
	dxDrawRectangle(startX, startY, width, height, slotColor)
	dxDrawText(guiGetText(element), startX + 4, startY, startX + width, startY + height, tocolor(255, 255, 255), 1, roboto, "left", "center")
end

--[[
setTimer(function()
	setControlState("walk", true)
end, 500, 0)]]--



function _3DResim(TheElement,Image,distance,height,width,R,G,B,alpha)
        local x, y, z = getElementPosition(TheElement)
        local x2, y2, z2 = getElementPosition(localPlayer)
        local distance = distance or 20
        local height = height or 2
        local width = width or 1
        local checkBuildings = checkBuildings or true
        local checkVehicles = checkVehicles or false
        local checkPeds = checkPeds or false
        local checkObjects = checkObjects or true
        local checkDummies = checkDummies or true
        local seeThroughStuff = seeThroughStuff or false
        local ignoreSomeObjectsForCamera = ignoreSomeObjectsForCamera or false
        local ignoredElement = ignoredElement or nil
        if (isLineOfSightClear(x, y, z, x2, y2, z2, checkBuildings, checkVehicles, checkPeds , checkObjects,checkDummies,seeThroughStuff,ignoreSomeObjectsForCamera,ignoredElement)) then
          local sx, sy = getScreenFromWorldPosition(x, y, z+height)
          if(sx) and (sy) then
            local distanceBetweenPoints = getDistanceBetweenPoints3D(x, y, z, x2, y2, z2)
            if(distanceBetweenPoints < distance) then
              dxDrawMaterialLine3D(x, y, z+1+height-(distanceBetweenPoints/distance), x, y, z+height, Image, width-(distanceBetweenPoints/distance), tocolor(R or 255, G or 255, B or 255, alpha or 255))
            end
          end
      end
  end
  
  function dxDrawOctagon3D(x, y, z, radius, width, color)
  if type(x) ~= "number" or type(y) ~= "number" or type(z) ~= "number" then
    return false
  end

  local radius = radius or 1
  local radius2 = radius/math.sqrt(2)
  local width = width or 1
  local color = color or tocolor(255,255,255,150)

  point = {}

    for i=1,8 do
      point[i] = {}
    end

    point[1].x = x
    point[1].y = y-radius
    point[2].x = x+radius2
    point[2].y = y-radius2
    point[3].x = x+radius
    point[3].y = y
    point[4].x = x+radius2
    point[4].y = y+radius2
    point[5].x = x
    point[5].y = y+radius
    point[6].x = x-radius2
    point[6].y = y+radius2
    point[7].x = x-radius
    point[7].y = y
    point[8].x = x-radius2
    point[8].y = y-radius2

  for i=1,8 do
    if i ~= 8 then
      x, y, z, x2, y2, z2 = point[i].x,point[i].y,z,point[i+1].x,point[i+1].y,z
    else
      x, y, z, x2, y2, z2 = point[i].x,point[i].y,z,point[1].x,point[1].y,z
    end
    dxDrawLine3D(x, y, z, x2, y2, z2, color, width)
  end
  return true
end


