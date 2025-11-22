

-- Az optika felszerelés / leszerelés, előnézet, kiválasztott elem lüktetése, 



local screenSize = Vector2(guiGetScreenSize())

local screenSizes = {guiGetScreenSize()}


local cameraSettings = {}
local dxFont = DxFont("files/font.ttf", 12)

local dxFontBold = DxFont("files/font.ttf", 12, true)



local dxFontBig = DxFont("files/font.ttf", 12)

local dxFontBigBold = DxFont("files/font.ttf", 12, true)



local panelState = false

local selectedMenu = 1

local enteredVehicle = false

local loopTable = {}

local equippedUpgrade = -1 

local cameraSettings = {}

local savedVehicleColors = {["all"] = false, ["headlight"] = false}

local paintjobs = {}

local plateText = ""

local supportedCharacters = {

	["q"] = true, ["w"] = true, ["x"] = true, ["4"] = true,

	["e"] = true, ["r"] = true, ["c"] = true, ["5"] = true,

	["t"] = true, ["z"] = true, ["v"] = true, ["6"] = true,

	["u"] = true, ["i"] = true, ["b"] = true, ["7"] = true,

	["o"] = true, ["p"] = true, ["n"] = true, ["8"] = true,

	["a"] = true, ["s"] = true, ["m"] = true, ["9"] = true,

	["d"] = true, ["f"] = true, ["0"] = true, ["-"] = true,

	["g"] = true, ["h"] = true, ["1"] = true, [" "] = true,

	["j"] = true, ["k"] = true, ["2"] = true,

	["l"] = true, ["y"] = true, ["3"] = true,

}



function infobox(text, type)

	--exports["san_notifications"]:createNotification(text, type)
	outputChatBox (text, 255, 255, 255, true )
end

--[[
function infoBox(text, type)

	if not text then return end

	if not tonumber(type) then type = 4 end


	--exports["san_infobox"]:addNotification(text, "warning")


end
]]--





addEvent("hitMarker", true)

addEventHandler("hitMarker", root, function(element, key)

	if element == localPlayer then

		markerNumber = key



		panelState = true



		toggleAllControls(false)



		selectedMenu = 1

		selectedSubMenu = 1

		selectedSubMenuKey = 1



		inSubMenu = false



		--Camera.setMatrix(availableTuningMarkers[key][4], availableTuningMarkers[key][5], availableTuningMarkers[key][6], 

			--availableTuningMarkers[key][7], availableTuningMarkers[key][8], availableTuningMarkers[key][9], 7, 0)

		local _, _, vehicleRotation = getElementRotation(enteredVehicle)

		local cameraRotation = vehicleRotation + 60

		cameraSettings = {

			["distance"] = 9,

			["movingSpeed"] = 2,

			["currentX"] = math.rad(cameraRotation),

			["defaultX"] = math.rad(cameraRotation),

			["currentY"] = math.rad(cameraRotation),

			["currentZ"] = math.rad(15),

			["maximumZ"] = math.rad(35),

			["minimumZ"] = math.rad(0),

			["freeModeActive"] = false,

			["zoomTick"] = 0,

			["zoom"] = 60

		}

		

		cameraSettings["moveState"] = "freeMode"

			

		element:getOccupiedVehicle():setPosition(availableTuningMarkers[key][1], availableTuningMarkers[key][2], availableTuningMarkers[key][3])

		element:getOccupiedVehicle():setRotation(0, 0, -40)

		element:getOccupiedVehicle():setFrozen(true)

		setTimer(function()

			element:getOccupiedVehicle():setFrozen(false)

		end, 200, 1)



		element:setData("toggle-->All", false)

		showChat(false)

	end

end)



function renderPlateText()

	if editPlateText then

		dxRect(50, screenSize.y/2 - 347/2, 347, 100, tocolor(0, 0, 0, 200))

		dxRect(50, screenSize.y/2 - 347/2 + 100, 347, 3, tocolor(124, 197, 118, 180))



		dxPrint("Digite a placa de licença (max 7 caracteres)", 75, screenSize.y/2 - 347/2 + 25, 75 + 296, 0, tocolor(255, 255, 255), 1, dxFontBold, "center")

		dxRect(75, screenSize.y/2 - 347/2 + 50, 296, 37, tocolor(255, 255, 255, 30))

	

		dxPrint(plateText, 75, screenSize.y/2 - 347/2 + 50, 75 + 296, screenSize.y/2 - 347/2 + 87, tocolor(255, 255, 255), 1, dxFont, "center", "center")

	end

end

addEventHandler("onClientRender", root, renderPlateText)



local cameraStatusz = 0

local camerWight = 0



function renderTuningPanel()

	enteredVehicle = getPedOccupiedVehicle(localPlayer)

	if panelState then

		-- Fordulás vezérlés

		local state = false

		cameraSettings["freeModeActive"] = false

		local multiplier = 1

			

		if(getKeyState("lshift") or getKeyState("-")) then

			if(getKeyState("lctrl")) then

				multiplier = 5

			end

			if(getKeyState("d")) then

				if(cameraStatusz < 360) then

					cameraStatusz = cameraStatusz + 0.5*multiplier

					

				else

					cameraStatusz = 0

				end

				state = true

				cameraSettings["freeModeActive"] = true

			end

			if(getKeyState("a")) then

				if(cameraStatusz > 0) then

					cameraStatusz = cameraStatusz - 0.5*multiplier				

				else

					cameraStatusz = 360

				end

				state = true

				cameraSettings["freeModeActive"] = true



			end

			if(getKeyState("w")) then

				if(camerWight < 4) then

					camerWight = camerWight + 0.01*multiplier

					

				else

					camerWight = 4

				end

				state = true

			end

			if(getKeyState("s")) then

				if(camerWight > 0) then

					camerWight = camerWight - 0.01*multiplier

				else

					camerWight = 0

				end

				state = true

				cameraSettings["freeModeActive"] = true

			end

		end

		if(state) then

			cameraUpdate(cameraStatusz, camerWight)

		end	

		dxDrawImage(0, 0, screenSize.x, screenSize.y, "files/blur.dds")



		dxRect(0, screenSize.y - 55, screenSize.x, 55, tocolor(0, 0, 0, 240)) -- bottom

		dxPrint("Navegar: #7cc576Setas do teclado  #ffffffComprar: #7cc576Enter  #ffffffRetornar: #7cc576Backspace", 20, screenSize.y - 55, 0, screenSize.y, tocolor(255, 255, 255), 1, dxFontBigBold, "left", "center", false, false, false, true)

		dxPrint("Dinheiro: #7cc576"..localPlayer:getData("char:money").." $ #ffffffDinheiro Vip: #19B5FE"..localPlayer:getData("char:pp").."", 0, screenSize.y - 55, screenSize.x - 20, screenSize.y, tocolor(255, 255, 255), 1, dxFontBig, "right", "center", false, false, false, true)

	

		dxRect(40, 40, screenSize.x - 80, 55, tocolor(0, 0, 0, 200))

		dxRect(40, 95, screenSize.x - 80, 3, tocolor(124, 197, 118, 180))

		--dxDrawImage(screenSize.x - 280, 24.5, 200, 100, "files/logo.png")



		for key, value in ipairs(tuningMenu) do

			local forStartX = 40 + (key - 1) * 205



			if key == selectedMenu then

				dxPrint(value["categoryName"], forStartX, 40, forStartX + 205, 95, tocolor(124, 197, 118), 1, dxFontBigBold, "center", "center")

			else

				dxPrint(value["categoryName"], forStartX, 40, forStartX + 205, 95, tocolor(255, 255, 255), 1, dxFontBig, "center", "center")

			end

		end



		if tuningMenu[selectedMenu]["subMenu"] then

			for key, value in ipairs(tuningMenu[selectedMenu]["subMenu"]) do

				local forStartX = 40 + (selectedMenu - 1) * 205

				local forStartY = 100 + (key - 1) * 28



				if key % 2 == 0 then

					dxRect(forStartX, forStartY, 205, 28, tocolor(0, 0, 0, 140))

				else

					dxRect(forStartX, forStartY, 205, 28, tocolor(0, 0, 0, 200))			

				end



				if key == selectedSubMenu then

					dxPrint(value["categoryName"], forStartX, forStartY, forStartX + 205, forStartY + 25, tocolor(124, 197, 118), 1, dxFontBold, "center", "center")

				else

					dxPrint(value["categoryName"], forStartX, forStartY, forStartX + 205, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "center", "center")

				end

			end



			if inSubMenu and tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"]  then

				loopTable = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"]

			elseif inSubMenu and tuningMenu[selectedMenu]["availableUpgrades"]  then 

				loopTable = tuningMenu[selectedMenu]["availableUpgrades"]

			end

			for key, value in ipairs(loopTable) do

				local forStartX = 40 + selectedMenu * 205

				local forStartY = 100 + (selectedSubMenu - 1) * 28 + (key - 1) * 28

				

				if selectedMenu == 0 or selectedSubMenu == 0 then

					equippedUpgrade = -1

				elseif selectedMenu == 1 then

					if inSubMenu then

						equippedUpgrade = enteredVehicle:getData("veh:performance_"..tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["upgradeData"])

					end

				elseif selectedMenu == 2 then

					if isGTAUpgradeSlot(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["upgradeSlot"]) then

						if value["upgradeID"] == equippedTuning then

							equippedUpgrade = key

						end

					else

						if key == equippedTuning then

							equippedUpgrade = key

						end

					end

				else

					if key == equippedTuning then

						equippedUpgrade = key

					end

				end

				

				if key % 2 == 0 then

					dxRect(forStartX, forStartY, 260, 28, tocolor(0, 0, 0, 140))

				else

					dxRect(forStartX, forStartY, 260, 28, tocolor(0, 0, 0, 200))

				end



				if key == selectedSubMenuKey then

					local color = ""

					local price = ""

					dxPrint(value["categoryName"], forStartX, forStartY, forStartX + 195, forStartY + 25, tocolor(124, 197, 118), 1, dxFont, "left", "center")

					if equippedUpgrade ~= key then

						if value["tuningPrice"] then

							if value["tuningPrice"] == 0 then

								dxPrint("#7cc576 Grátis", forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

							else

								if localPlayer:getData("char:money") > tonumber(value["tuningPrice"]) then 

									color = "#7cc576"

								else

									color = "#dc143c"

								end					

								if value["priceIgMoney"] then 

									price = "#ffffffR$"

								else

									price = "#ffffffPP"

								end

								dxPrint(color..value["tuningPrice"].. price, forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

							end

						end

					else

						dxPrint("Equipado", forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

					end

				else

					local color = ""

					local price = ""

					dxPrint(value["categoryName"], forStartX+4, forStartY, forStartX, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "left", "center")

					if equippedUpgrade ~= key then

						if value["tuningPrice"] then

							if value["tuningPrice"] == 0 then

								dxPrint("livre", forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

							else

								local price = ""

								if value["priceIgMoney"] then 

									price = "#ffffffR$"

								else

									price = "#ffffffPP"

								end

								dxPrint("#7cc576"..value["tuningPrice"]..price, forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

							end

						end

					else

						dxPrint("Equipado", forStartX, forStartY, forStartX + 250, forStartY + 25, tocolor(255, 255, 255), 1, dxFont, "right", "center", false, false, false, true)

					end

				end

			end

		end

	end

end

addEventHandler("onClientRender", root, renderTuningPanel)



function cameraUpdate(stats, weight)

	local r = getPedRotation(localPlayer)

	local rX, rY, rZ = getElementPosition(enteredVehicle)

	local fordulat = math.min(stats, stats)+90

	local urX = rX + ( ( math.cos ( math.rad ( r+fordulat ) ) ) * 5 )

	local urY = rY + ( ( math.sin ( math.rad ( r+fordulat ) ) ) * 5 )

	setCameraMatrix(urX, urY, rZ+weight, rX, rY, rZ)

end



function getVehicleWheelSize(vehicle, side)

	if vehicle and side then

		local flags = getVehicleHandling(vehicle)["handlingFlags"]

		

		for name, flag in pairs(availableWheelSizes[side]) do

			if isFlagSet(flags, flag[1]) then

				return flag[2]

			end

		end

		

		return 3

	end

end



function isFlagSet(val, flag)

	return (bitAnd(val, flag) == flag)

end



function _getCameraPosition(element)

	if element == "component" then

		local componentX, componentY, componentZ = getVehicleComponentPosition(enteredVehicle, cameraSettings["viewingElement"])

		local elementX, elementY, elementZ = getPositionFromElementOffset(enteredVehicle, componentX, componentY, componentZ)

		local elementZ = elementZ + 0.2

		

		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]

		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]

		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]

		

		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ

	elseif element == "vehicle" then

		local elementX, elementY, elementZ = getElementPosition(enteredVehicle)

		local elementZ = elementZ + 0.2

		

		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]

		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]

		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]

		

		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ

	elseif element == "both" then

		if type(cameraSettings["viewingElement"]) == "string" then

			local componentX, componentY, componentZ = getVehicleComponentPosition(enteredVehicle, cameraSettings["viewingElement"])

			

			elementX, elementY, elementZ = getPositionFromElementOffset(enteredVehicle, componentX, componentY, componentZ)

		else

			elementX, elementY, elementZ = getElementPosition(enteredVehicle)

		end

		

		local elementZ = elementZ + 0.2

		

		local cameraX = elementX + math.cos(cameraSettings["currentX"]) * cameraSettings["distance"]

		local cameraY = elementY + math.sin(cameraSettings["currentY"]) * cameraSettings["distance"]

		local cameraZ = elementZ + math.sin(cameraSettings["currentZ"]) * cameraSettings["distance"]

		

		return cameraX, cameraY, cameraZ, elementX, elementY, elementZ

	end

end



local mouseTable = {}

mouseTable["speed"] = {}

mouseTable["last"] = {}

mouseTable["move"] = {}



addEventHandler("onClientPreRender", root, function(timeSlice)

	--> Calculate mouse move speed

	if isCursorShowing() then

		local cursorX, cursorY = getCursorPosition()

		cursorX, cursorY = cursorX * screenSize.x, cursorY * screenSize.y



		mouseTable["last"][1] = cursorX

		mouseTable["last"][2] = cursorY

		

		mouseTable["speed"][1] = math.sqrt(math.pow((mouseTable["last"][1] - cursorX) / timeSlice, 2))

		mouseTable["speed"][2] = math.sqrt(math.pow((mouseTable["last"][2] - cursorY) / timeSlice, 2))

	end

	

	--> Camera

	if panelState and enteredVehicle then

		local _, _, _, _, _, _, roll, fov = getCameraMatrix()

		local cameraZoomProgress = (getTickCount() - cameraSettings["zoomTick"]) / 500

		local cameraZoomAnimation = interpolateBetween(fov, 0, 0, cameraSettings["zoom"], 0, 0, cameraZoomProgress, "Linear")

		

		if cameraSettings["moveState"] == "moveToElement" then

			local currentCameraX, currentCameraY, currentCameraZ, currentCameraRotX, currentCameraRotY, currentCameraRotZ = getCameraMatrix()

			local cameraProgress = (getTickCount() - cameraSettings["moveTick"]) / 1000

			local cameraX, cameraY, cameraZ, componentX, componentY, componentZ = _getCameraPosition("component")

			local newCameraX, newCameraY, newCameraZ = interpolateBetween(currentCameraX, currentCameraY, currentCameraZ, cameraX, cameraY, cameraZ, cameraProgress, "Linear")

			local newCameraRotX, newCameraRotY, newCameraRotZ = interpolateBetween(currentCameraRotX, currentCameraRotY, currentCameraRotZ, componentX, componentY, componentZ, cameraProgress, "Linear")

			local newCameraZoom = interpolateBetween(fov, 0, 0, 60, 0, 0, cameraProgress, "Linear")

			

			setCameraMatrix(newCameraX, newCameraY, newCameraZ, newCameraRotX, newCameraRotY, newCameraRotZ, roll, newCameraZoom)

			

			if cameraProgress > 0.5 then

				cameraSettings["moveState"] = "freeMode"

				cameraSettings["zoom"] = 60

			end

		elseif cameraSettings["moveState"] == "backToVehicle" then

			local currentCameraX, currentCameraY, currentCameraZ, currentCameraRotX, currentCameraRotY, currentCameraRotZ = getCameraMatrix()

			local cameraProgress = (getTickCount() - cameraSettings["moveTick"]) / 1000

			local cameraX, cameraY, cameraZ, vehicleX, vehicleY, vehicleZ = _getCameraPosition("vehicle")

			local newCameraX, newCameraY, newCameraZ = interpolateBetween(currentCameraX, currentCameraY, currentCameraZ, cameraX, cameraY, cameraZ, cameraProgress, "Linear")

			local newCameraRotX, newCameraRotY, newCameraRotZ = interpolateBetween(currentCameraRotX, currentCameraRotY, currentCameraRotZ, vehicleX, vehicleY, vehicleZ, cameraProgress, "Linear")

			local newCameraZoom = interpolateBetween(fov, 0, 0, 60, 0, 0, cameraProgress, "Linear")

			

			setCameraMatrix(newCameraX, newCameraY, newCameraZ, newCameraRotX, newCameraRotY, newCameraRotZ, roll, newCameraZoom)

			

			if cameraProgress > 0.5 then

				cameraSettings["moveState"] = "freeMode"

				cameraSettings["zoom"] = 60

			end

		elseif cameraSettings["moveState"] == "freeMode" then

			local cameraX, cameraY, cameraZ, elementX, elementY, elementZ = _getCameraPosition("both")

			if not  cameraSettings["freeModeActive"] then 

				setCameraMatrix(cameraX, cameraY, cameraZ, elementX, elementY, elementZ, roll, cameraZoomAnimation)

			end

			

			if getKeyState("mouse1") and not pickingColor and not pickingLuminance and isCursorShowing() and not isMTAWindowActive() then

				cameraSettings["freeModeActive"] = true

			else

				cameraSettings["freeModeActive"] = false

			end

		end

	end

end)



function getPositionFromElementOffset(element, offsetX, offsetY, offsetZ)

	local elementMatrix = getElementMatrix(element)

    local elementX = offsetX * elementMatrix[1][1] + offsetY * elementMatrix[2][1] + offsetZ * elementMatrix[3][1] + elementMatrix[4][1]

    local elementY = offsetX * elementMatrix[1][2] + offsetY * elementMatrix[2][2] + offsetZ * elementMatrix[3][2] + elementMatrix[4][2]

    local elementZ = offsetX * elementMatrix[1][3] + offsetY * elementMatrix[2][3] + offsetZ * elementMatrix[3][3] + elementMatrix[4][3]

	

    return elementX, elementY, elementZ

end



function isGTAUpgradeSlot(slot)

	if slot then

		for i = 0, 16 do

			if slot == i then

				return true

			end

		end

	end

	

	return false

end



function showNextOpticalUpgrade()

	if panelState then

		if enteredVehicle then

			addVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[hoveredCategory - 1])

		end

	end

end



function isCursorHover(startX, startY, sizeX, sizeY)

	if isCursorShowing() then

		local cursorPosition = Vector2(getCursorPosition())

		cursorPosition.x, cursorPosition.y = cursorPosition.x * screenSize.x, cursorPosition.y * screenSize.y



		if startX >= cursorPosition.x and startX + sizeX <= cursorPosition.x and startY >= cursorPosition.y and startY + sizeY <= cursorPosition.y then

			return true

		else

			return false

		end

	else

		return false

	end

end



local oneShow = true



function clientKeyPressed(button, press)

	if panelState and press and not editPlateText then

		if button == "enter" then

			tuningMenu[selectedMenu]["availableUpgrades"] = {}

			-- performance and buying

			if not inSubMenu and selectedMenu == 1 then

				setCameraAndComponentVisible()

				inSubMenu = true

				selectedSubMenuKey = 1

			elseif selectedMenu == 1 then

				if tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["priceIgMoney"] then

					if  hasMoney(localPlayer, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]) then

						

						if isTimer(timer) then infobox("Espere 2 segundos antes da sua próxima compra", 2) return end

						local timer = setTimer(function() end, 1500, 1)



						Trigger.Server("Performance->Upgrade", localPlayer, localPlayer:getOccupiedVehicle(), 

							tuningMenu[selectedMenu]["subMenu"][selectedSubMenu], selectedSubMenuKey)

					else

						infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o equipamento.", 2)

					end

				else

					if  hasPremium(localPlayer, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]) then

						Trigger.Server("Performance->Upgrade", localPlayer, localPlayer:getOccupiedVehicle(), 

							tuningMenu[selectedMenu]["subMenu"][selectedSubMenu], selectedSubMenuKey)

					else

						infobox("Desculpe, mas você não tem dinheiro vip suficientes para comprar o equipamento.", 2)

					end

				end



			elseif selectedMenu == 2 and not inSubMenu then 

				if isGTAUpgradeSlot(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["upgradeSlot"]) then

					inSubMenu = true

					cameraSettings["zoom"] = math.max(cameraSettings["zoom"] - 5, 30)

					cameraSettings["zoomTick"] = getTickCount()

					selectedSubMenuKey = 1

					local upgradeSlot = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["upgradeSlot"]

					local compatibleUpgrades = getVehicleCompatibleUpgrades(enteredVehicle, upgradeSlot)

				

					if compatibleUpgrades[1] == nil then

						infobox("O acessório selecionado não é compatível com o seu veículo!", 2)

						inSubMenu = false

						selectedSubMenuKey = 0

						cameraSettings["zoom"] = math.max(cameraSettings["zoom"] + 5, 30)

						--moveCameraToDefaultPosition()

					else					

						compatibleOpticalUpgrades = compatibleUpgrades

						equippedTuning = getVehicleUpgradeOnSlot(enteredVehicle, upgradeSlot)

						

						setCameraAndComponentVisible()

						

						table.insert(tuningMenu[selectedMenu]["availableUpgrades"], {

							["categoryName"] = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["categoryName"],

							["tuningPrice"] = 0,

							["upgradeID"] = 0

						})

						

						for id, upgrade in pairs(compatibleOpticalUpgrades) do

							table.insert(tuningMenu[selectedMenu]["availableUpgrades"], {

								["categoryName"] = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["categoryName"] .. " " .. id,

								["tuningPrice"] = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["tuningPrice"],

								["upgradeID"] = upgrade,

								["priceIgMoney"] = true

							})

						end	

					end

				end

			elseif selectedMenu == 2 and inSubMenu then 

				if tuningMenu[selectedMenu]["availableUpgrades"]["priceIgMoney"] or true then

					if (localPlayer:getData("char:money") < tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["tuningPrice"])) then

						infobox("Desculpe, mas não tenho dinheiro suficiente para comprar o suplemento.", 2)

						resetOpticalUpgrade()

					else

						if equippedUpgrade ~= loopTable[selectedSubMenuKey]["upgradeID"] then 

							if equippedUpgrade ~= selectedSubMenuKey then 

								--if not localPlayer:getData("acc:id") == enteredVehicle:getData("veh:owner") then
                                if getElementData(localPlayer, "char:dutyfaction") == 17  then								

									if getElementData(enteredVehicle, "tuning.airRide") and selectedSubMenu == 9 then

										infobox("ATENÇÃO: Air-Ride está instalado no seu veículo.Por favor, remova antes de instalar o Sistema Hidráulico.", 2)

									else

										if selectedSubMenuKey == 1 then

											triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "remove", equippedTuning, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu])

										

										else

											triggerServerEvent("tuning->OpticalUpgrade", localPlayer, enteredVehicle, "add", loopTable[selectedSubMenuKey]["upgradeID"], tuningMenu[selectedMenu]["subMenu"][selectedSubMenu])

											equippedTuning = loopTable[selectedSubMenuKey]["upgradeID"]

											localPlayer:setData("char:money", localPlayer:getData("char:money") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["tuningPrice"] or 10000))

											infobox("Você comprou com sucesso " .. tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["categoryName"] .. " adicionado em seu veículo.", 1)

										end

										setTimer(function()

											inSubMenu = false

											loopTable = {}

											moveCameraToDefaultPosition()

											tuningMenu[selectedMenu]["availableUpgrades"] = {}

										end, 100, 1 )

									end

								else

									infobox("Me desculpe, mas só o dono deste veículo pode pegar esse acessório.", 2)

									--showDefaultOpticalUpgrade()

									resetOpticalUpgrade()

								end

							else

								infobox("Este acessório já está no seu veículo.", 2)

							end

						end

					end

				end

			elseif selectedMenu == 3 then 

				local componentCompatible = false	

				inSubMenu = true

				selectedSubMenuKey = 1

				if selectedSubMenu == 1 then -- Vehicle color

					if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then

						equippedTuning = -1

						

						setVehicleOverrideLights(enteredVehicle, 2)

						

						savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}

						savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}

						

						triggerServerEvent("tuning->Color", localPlayer, enteredVehicle, savedVehicleColors["all"], savedVehicleColors["headlight"])						

						

						createColorPicker(enteredVehicle, screenSizes[1]-400-10-30, screenSizes[2]/2-200/2-220, 400, 200, "color1")

						showCursor(true)

						

						componentCompatible = true

					end				

				elseif selectedSubMenu == 2 then -- Belső color

					if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then

						equippedTuning = -1

						

						setVehicleOverrideLights(enteredVehicle, 2)

						

						savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}

						savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}

						

						triggerServerEvent("tuning->Color", localPlayer, enteredVehicle, savedVehicleColors["all"], savedVehicleColors["headlight"])

						

						createColorPicker(enteredVehicle, screenSizes[1]-400-10-30, screenSizes[2]/2-200/2-220, 400, 200, "color2")

						showCursor(true)

						

						componentCompatible = true

					end

				elseif selectedSubMenu == 3 then -- Lampa color

					if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike"}) then

						equippedTuning = -1

						

						setVehicleOverrideLights(enteredVehicle, 2)

						

						savedVehicleColors["all"] = {getVehicleColor(enteredVehicle, true)}

						savedVehicleColors["headlight"] = {getVehicleHeadLightColor(enteredVehicle)}

						

						triggerServerEvent("tuning->Color", localPlayer, enteredVehicle, savedVehicleColors["all"], savedVehicleColors["headlight"])

						

						

						createColorPicker(enteredVehicle, screenSizes[1]-400-10-30, screenSizes[2]/2-200/2-220, 400, 200, "headlight")

						showCursor(true)

						

						componentCompatible = true

					end

				end

			elseif selectedMenu == 4 then 

				if selectedSubMenu == 1 or selectedSubMenu == 2 then

					if oneShow then

						if selectedSubMenu == 1 then

							if isComponentCompatible(enteredVehicle, "Automobile") then

								equippedTuning = getVehicleWheelSize(enteredVehicle, "front")

								--triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", tuningMenu[selectedMenu]["subMenu"][1]["tuningData"])

								

								componentCompatible = true

							end

						elseif selectedSubMenu == 2 then

							if isComponentCompatible(enteredVehicle, "Automobile") then

								equippedTuning = getVehicleWheelSize(enteredVehicle, "rear")

								--triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", tuningMenu[selectedMenu]["subMenu"][1]["tuningData"])

								componentCompatible = true

							end

						end

						oneShow = false

					end

					if inSubMenu  then 

						local vehicleSide = (selectedSubMenu == 1 and "front") or (selectedSubMenu == 2 and "rear")

						

						if selectedSubMenuKey == equippedTuning then

							infobox("Este acessório já está no seu veículo.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							if (localPlayer:getData("char:money") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

								triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, vehicleSide, loopTable[selectedSubMenuKey]["tuningData"])

								



								equippedTuning = selectedSubMenuKey

								infobox("Você comprou este acessório com sucesso.", 1)

								localPlayer:setData("char:money", localPlayer:getData("char:money") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

								--equippedTuning = 0

								inSubMenu = false

								selectedSubMenuKey = 0

							else

								infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

								inSubMenu = false

								selectedSubMenuKey = 0

							end

						end

					end

					

				elseif selectedSubMenu == 3 then

					if inSubMenu then

						if selectedSubMenu == equippedTuning then

							infobox("Este acessório já está no seu veículo.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							if (localPlayer:getData("char:pp") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

								setVehicleDoorToLSD(enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

								

								equippedTuning = selectedSubMenuKey

								localPlayer:setData("char:pp", localPlayer:getData("char:pp") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

								infobox("Acessorio adcionado com sucesso.", 1)

								triggerServerEvent("tuning->LSDDoor", localPlayer, enteredVehicle, (getElementData(enteredVehicle, "tuning.lsdDoor") and 2) or 1)

								inSubMenu = false

								selectedSubMenuKey = 0

							else

								infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

								inSubMenu = false

								selectedSubMenuKey = 0

							end

						end

					else

						if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck"}) then

							equippedTuning = (getElementData(enteredVehicle, "tuning.lsdDoor") and 2) or 1

							

							setVehicleDoorOpenRatio(enteredVehicle, 2, 1, 500)

							setVehicleDoorOpenRatio(enteredVehicle, 3, 1, 500)

							

							setVehicleDoorToLSD(enteredVehicle, true)

							

							componentCompatible = true

							inSubMenu = true

							selectedSubMenuKey = 1

						end

					end

			

				elseif selectedSubMenu == 4 then

					if inSubMenu then

						if (localPlayer:getData("char:pp") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

							setElementData(enteredVehicle, "tuning.paintjob", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

							triggerServerEvent("addVehiclePaintJob", localPlayer, enteredVehicle, getElementModel(enteredVehicle), tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"], true)

							equippedTuning = selectedSubMenuKey

							localPlayer:setData("char:pp", localPlayer:getData("char:pp") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

							infobox("Você instalou este acessório com sucesso em seu veículo.", 1)

							triggerServerEvent("tuning->Paintjob", localPlayer, enteredVehicle, getElementData(enteredVehicle, "tuning.paintjob"))

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						end

					else

						if isComponentCompatible(enteredVehicle, "Automobile") then

							paintjobs = exports.exg_paintjob:getVehiclePaintJobs(getElementModel(enteredVehicle))

							if paintjobs > 0 then

								for index = 1, paintjobs do

									table.insert(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"], {

										["categoryName"] =  "Matrica " .. index,

										["tuningPrice"] = 1800,

										["priceIgMoney"] = false,

										["tuningData"] = index

									})

								end

								equippedTuning = (getElementData(enteredVehicle, "tuning.paintjob") or 0)

								componentCompatible = true

							end

						end

					end

				elseif selectedSubMenu == 5 then 

					if isComponentCompatible(enteredVehicle, "Automobile") then

						equippedTuning = (getElementData(enteredVehicle, "tuning.airRide") and 2) or 1

						componentCompatible = true

					end

					if inSubMenu and selectedSubMenu == 5 then

						--if localPlayer:getData("acc:id") == enteredVehicle:getData("veh:owner") then 
						if getElementData(localPlayer, "char:dutyfaction") == 17  then

							if selectedSubMenu == equippedTuning then

								infobox("Este acessório já está no seu veículo.", 2)

								inSubMenu = false

								selectedSubMenuKey = 0

							else

								if (localPlayer:getData("char:money") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

									setElementData(enteredVehicle, "tuning.airRide", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"], true)

									

									if selectedSubMenu == 1 then

										removeAirRide(enteredVehicle)

										triggerServerEvent("tuning->airrideSave", localPlayer, enteredVehicle, (getElementData(enteredVehicle, "tuning.airRide") and 2) or 1)

									end

									

									equippedTuning = selectedSubMenu

									localPlayer:setData("char:money", localPlayer:getData("char:money") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

									infobox("Você comprou o Airride.\nPara usa-lo digite: /airride", 1)

									triggerServerEvent("tuning->airrideSave", localPlayer, enteredVehicle, (getElementData(enteredVehicle, "tuning.airRide") and 2) or 1)

								else

									infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

									inSubMenu = false

									selectedSubMenuKey = 0

								end

							end

						else

							infobox("Me desculpe, mas só o dono do veículo sabe disso.", 2)

						end

					end

				elseif selectedSubMenu == 6 then 

					if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad"}) then

						local driveType = getVehicleHandling(enteredVehicle)["driveType"]

						

						equippedTuning = (driveType == "fwd" and 1) or (driveType == "awd" and 2) or (driveType == "rwd" and 3)

						componentCompatible = true

					end

					if inSubMenu then

						local type = enteredVehicle:getData("veh:driveType") or 1

						if type == 1 then type = "fwd"

							elseif type == 2 then type = "awd"

							elseif type == 3 then type = "rwd"

						end

						

						local driveType = getVehicleHandling(enteredVehicle)["driveType"]

						if type ~= tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"] then 

							if (localPlayer:getData("char:money") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

								

								triggerServerEvent("tuning->driveType", localPlayer, enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])



								localPlayer:setData("char:money", localPlayer:getData("char:money") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

								infobox("Você comprou este acessório com sucesso para o seu veículo.", 1)

							else

								infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

								inSubMenu = false

								selectedSubMenuKey = 0

							end

						else

							infobox("Este acessório já está no seu veículo.", 2)

						end

					end

				elseif selectedSubMenu == 7 then

					if inSubMenu then

						if (localPlayer:getData("char:money") >= tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])) then

							setElementData(enteredVehicle, "tuning.variant", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])



							equippedTuning = selectedSubMenuKey

							localPlayer:setData("char:money", localPlayer:getData("char:money") - tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))

							infobox("Você instalou este acessório com sucesso em seu veículo.", 1)

							triggerServerEvent("tuning->Variant", localPlayer, enteredVehicle, getElementData(enteredVehicle, "tuning.variant"))

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						end

					else

						if isComponentCompatible(enteredVehicle, "Automobile") then

							equippedTuning = (getElementData(enteredVehicle, "tuning.variant") or 255)

							componentCompatible = true

						end

					end

				elseif selectedSubMenu == 8 then

					if inSubMenu then

						if selectedSubMenu == equippedTuning then

							infobox("Este acessório já está no seu veículo.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							if hasMoney(localPlayer, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]) then

								triggerServerEvent("tuning->HandlingUpdate", localPlayer, enteredVehicle, "steeringLock", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

								takeMoney(localPlayer, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])

								equippedTuning = selectedSubMenuKey



								infobox("Você comprou com sucesso o acessório para o seu veículo.", 1)

								triggerServerEvent("tuning->steeringLock", localPlayer, enteredVehicle, 

									tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

							else

								infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

							end

						end

					else

						if isComponentCompatible(enteredVehicle, {"Automobile", "Monster Truck", "Quad", "Bike", "BMX"}) then

							local steeringLock = getVehicleHandling(enteredVehicle)["steeringLock"]

									

							equippedTuning = (steeringLock == 30 and 2) or (steeringLock == 40 and 3) or (steeringLock == 50 and 4) or (steeringLock == 60 and 5) or 1

							componentCompatible = true

						end

					end

				elseif selectedSubMenu == 9 then

					if not inSubMenu then

						editPlateText = true

						equippedTuning = getVehiclePlateText(enteredVehicle)

						setCameraAndComponentVisible()

					end

				elseif selectedSubMenu == 10 then

					if inSubMenu then

						if (hasMoney(localPlayer, tonumber(tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"]))) then

							saveNeon(enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"], true)

									

							equippedTuning = selectedSubMenuKey



							equippedTuning = selectedSubMenuKey

							takeMoney(localPlayer, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningPrice"])

							infobox("Você instalou este acessório com sucesso em seu veículo.", 1)

							triggerServerEvent("tuning->NeonSave", localPlayer, enteredVehicle, getElementData(enteredVehicle, "tuning.neon"))

							inSubMenu = false

							selectedSubMenuKey = 0

						else

							infobox("Me desculpe, mas eu não tenho dinheiro suficiente para comprar o suplemento.", 2)

							inSubMenu = false

							selectedSubMenuKey = 0

						end

					else

						if isComponentCompatible(enteredVehicle, "Automobile") then

							local currentNeon = getElementData(enteredVehicle, "tuning.neon") or false

									

							if currentNeon == "white" then currentNeon = 2

							elseif currentNeon == "blue" then currentNeon = 3

							elseif currentNeon == "green" then currentNeon = 4

							elseif currentNeon == "red" then currentNeon = 5

							elseif currentNeon == "yellow" then currentNeon = 6

							elseif currentNeon == "pink" then currentNeon = 7

							elseif currentNeon == "orange" then currentNeon = 8

							elseif currentNeon == "lightblue" then currentNeon = 9

							elseif currentNeon == "rasta" then currentNeon = 10

							elseif currentNeon == "ice" then currentNeon = 11

							else currentNeon = 1

							end

										

							equippedTuning = currentNeon

							removeNeon(enteredVehicle, true)

										

							componentCompatible = true

						end

					end

				end

			end

				



			if not inSubMenu and selectedMenu == 4 then

				inSubMenu = true

				selectedSubMenuKey = 1

			end

		end



		if button == "arrow_r" then

			if selectedMenu < #tuningMenu and not inSubMenu then

				tuningMenu[selectedMenu]["availableUpgrades"] = {}

				selectedMenu = selectedMenu + 1

				inSubMenu = false

				selectedSubMenu = 1

				selectedSubMenuKey = 1

				loopTable = {}

				setVehicleDoorOpenRatio(enteredVehicle, 2, 0, 500)

				setVehicleDoorOpenRatio(enteredVehicle, 3, 0, 500)

			end

		end



		if button == "arrow_l" then

			if selectedMenu > 1 and not inSubMenu then

				tuningMenu[selectedMenu]["availableUpgrades"] = {}

				selectedMenu = selectedMenu - 1

				inSubMenu = false

				selectedSubMenu = 1

				selectedSubMenuKey = 1

				loopTable = {}

				setVehicleDoorOpenRatio(enteredVehicle, 2, 0, 500)

				setVehicleDoorOpenRatio(enteredVehicle, 3, 0, 500)

			end

		end



		if button == "backspace" then

			if not inSubMenu then

				setCameraAndComponentVisible()

				panelState = false

				toggleAllControls(true)

				localPlayer:setData("toggle-->All", true)

				showChat(true)

				showCursor(false)

				--localPlayer:getOccupiedVehicle():setFrozen(false)

				setCameraTarget(localPlayer)

				tuningMenu[selectedMenu]["availableUpgrades"] = {}

				

				setVehicleDoorOpenRatio(enteredVehicle, 2, 0, 500)

				setVehicleDoorOpenRatio(enteredVehicle, 3, 0, 500)

				if enteredVehicle then

					for component in pairs(getVehicleComponents(enteredVehicle)) do

						setVehicleComponentVisible(enteredVehicle, component, true)

					end

				end



				Trigger.Server("createMarkerById", localPlayer, markerNumber)

				if selectedMenu == 3 then 

					destroyColorPicker()

					setVehicleColorsToDefault()

				elseif selectedMenu == 4 then 

					if selectedSubMenu == 3 then 

						setVehicleDoorToLSD(enteredVehicle, ((equippedTuning == 1 and false) or (equippedTuning == 2 and true)))

					end

				end

			else

				setCameraAndComponentVisible()

				inSubMenu = false

				loopTable = {}

				moveCameraToDefaultPosition()

				if enteredVehicle then

					for component in pairs(getVehicleComponents(enteredVehicle)) do

						setVehicleComponentVisible(enteredVehicle, component, true)

					end

				end

				tuningMenu[selectedMenu]["availableUpgrades"] = {}

				setVehicleDoorOpenRatio(enteredVehicle, 2, 0, 500)

				setVehicleDoorOpenRatio(enteredVehicle, 3, 0, 500)

				if selectedMenu == 2 then 

					resetOpticalUpgrade()

				elseif selectedMenu == 3 then 

					destroyColorPicker()

					setVehicleColorsToDefault()				

				elseif selectedMenu == 4 then 

					if selectedSubMenu == 3 then 

						setVehicleDoorToLSD(enteredVehicle, ((equippedTuning == 1 and false) or (equippedTuning == 2 and true)))

					elseif selectedSubMenu == 1 then

						local defaultWheelSize = (equippedTuning == 1 and "verynarrow") or (equippedTuning == 2 and "narrow") or (equippedTuning == 3 and "default") or (equippedTuning == 4 and "wide") or (equippedTuning == 5 and "verywide")

						triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", defaultWheelSize)

					elseif selectedSubMenu == 2 then

						local defaultWheelSize = (equippedTuning == 1 and "verynarrow") or (equippedTuning == 2 and "narrow") or (equippedTuning == 3 and "default") or (equippedTuning == 4 and "wide") or (equippedTuning == 5 and "verywide")

						triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", defaultWheelSize)

					elseif selectedSubMenu == 4 then

						tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"] = {}

						if getElementData(enteredVehicle, "tuning.paintjob") > 0 then

							exports.exg_paintjob:destroyShaderCache(enteredVehicle)

							exports.exg_paintjob:addVehiclePaintJob(enteredVehicle, getElementModel(enteredVehicle), getElementData(enteredVehicle, "tuning.paintjob"))

						else

							exports.exg_paintjob:destroyShaderCache(enteredVehicle)

						end

					elseif selectedSubMenu == 7 then

						triggerServerEvent("tuning->tempVariant", localPlayer, enteredVehicle, (getElementData(enteredVehicle, "tuning.variant") or 255))

					elseif selectedSubMenu == 9 then

						if editPlateText then

							editPlateText = false

							setVehiclePlateText(enteredVehicle, equippedTuning)

						end

					elseif selectedSubMenu == 10 then

						restoreOldNeon(enteredVehicle)

					end

				end

				equippedTuning = 0

				oneShow = true

			end

		end



		if not inSubMenu then

			if button == "arrow_d" then

				if selectedSubMenu < #tuningMenu[selectedMenu]["subMenu"] then

					selectedSubMenu = selectedSubMenu + 1

				end

			end



			if button == "arrow_u" then

				if selectedSubMenu > 1 then

					selectedSubMenu = selectedSubMenu - 1

				end

			end

		elseif selectedMenu ~= 3 then

			if button == "arrow_d" then

				if selectedMenu ~= 2 then 

					if selectedSubMenuKey < #tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"] then

						selectedSubMenuKey = selectedSubMenuKey + 1

					end

				else

					if selectedSubMenuKey < #tuningMenu[selectedMenu]["availableUpgrades"] then

						selectedSubMenuKey = selectedSubMenuKey + 1

						showNextOpticalUpgrade()

					end

				end

			end



			if button == "arrow_u" then

				if selectedSubMenuKey > 1 then

					selectedSubMenuKey = selectedSubMenuKey - 1

					if selectedMenu == 2 and selectedSubMenuKey > 1 then 

						showNextOpticalUpgrade()

					elseif selectedMenu == 2 and selectedSubMenuKey == 1 then 

						showDefaultOpticalUpgrade()

					end

				end

			end

			if selectedMenu == 4 then 

				if selectedSubMenu == 1 then

					triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "front", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				elseif selectedSubMenu == 2 then

					triggerServerEvent("tuning->WheelWidth", localPlayer, enteredVehicle, "rear", tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				end

			end

			if button == "arrow_d" then

				if selectedMenu == 4 and selectedSubMenu == 4 and inSubMenu then

					exports.exg_paintjob:addVehiclePaintJob(enteredVehicle, getElementModel(enteredVehicle), tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				elseif selectedMenu == 4 and selectedSubMenu == 7 and inSubMenu then

					triggerServerEvent("tuning->tempVariant", localPlayer, enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				elseif selectedMenu == 4 and selectedSubMenu == 10 and inSubMenu then

					if selectedSubMenuKey ~= 1 then

						addNeon(enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

					else

						removeNeon(enteredVehicle, true)

					end

				end

			end

			if button == "arrow_u" then

				if selectedMenu == 4 and selectedSubMenu == 4 and inSubMenu then

					exports.exg_paintjob:addVehiclePaintJob(enteredVehicle, getElementModel(enteredVehicle), tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				elseif selectedMenu == 4 and selectedSubMenu == 7 and inSubMenu then

					triggerServerEvent("tuning->tempVariant", localPlayer, enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

				elseif selectedMenu == 4 and selectedSubMenu == 10 and inSubMenu then

					if selectedSubMenuKey ~= 1 then

						addNeon(enteredVehicle, tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["subMenu"][selectedSubMenuKey]["tuningData"])

					else

						removeNeon(enteredVehicle, true)

					end

				end

			end

		end

	end

	if button == "mouse_wheel_up" then
	if panelState then
		if not isCursorShowing() and not isMTAWindowActive() then

			cameraSettings["zoom"] = math.max(cameraSettings["zoom"] - 5, 30)

			cameraSettings["zoomTick"] = getTickCount()
	end
		end

	elseif button == "mouse_wheel_down" then
	if panelState then
		if not isCursorShowing() and not isMTAWindowActive() then

			cameraSettings["zoom"] = math.min(cameraSettings["zoom"] + 5, 60)

			cameraSettings["zoomTick"] = getTickCount()

		end
	end
	end

end

addEventHandler("onClientKey", root, clientKeyPressed)



addEventHandler("onClientKey", root, function(button, pressed)

	if pressed and editPlateText then

		if button == "backspace" and plateText:len() == 0 then

			editPlateText = false

			setVehiclePlateText(enteredVehicle, equippedTuning)

		end



		if supportedCharacters[button] and #plateText < 8 then

			plateText = plateText .. button

			setVehiclePlateText(enteredVehicle, plateText)

		elseif button == "backspace" then

			--plateText = plateText:len() - 1

			if #plateText - 1 >= 0 then

				plateText = string.sub(plateText, 1, #plateText - 1)

				setVehiclePlateText(enteredVehicle, utf8.upper(plateText))

			end

		elseif button == "enter" and #plateText >= 3 then

			if localPlayer:getData("char:pp") >= 800 then

				if equippedTuning ~= plateText then

					if foundPlate(plateText) then

						infobox("Já existe uma placa de licença no banco de dados.", 2)

					else

						localPlayer:setData("char:pp", localPlayer:getData("char:pp") - tonumber(800))

						infobox("A maçã será estrangulada com sucesso", 1)

						triggerServerEvent("tuning->PlateText", localPlayer, enteredVehicle, utf8.upper(plateText))

						editPlateText = false

					end

				end		

			end

		end

	end

end)



function foundPlate(text)

	local found = false



	for _, vehicle in ipairs(getElementsByType("vehicle")) do

		if vehicle ~= enteredVehicle then 

			if getVehiclePlateText(vehicle) == text then

				found = true

			end

		end

	end



	return found

end



function setVehicleColorsToDefault()

	local vehicleColor = savedVehicleColors["all"]

	local vehicleLightColor = savedVehicleColors["headlight"]

	

	setVehicleColor(enteredVehicle, vehicleColor[1], vehicleColor[2], vehicleColor[3], vehicleColor[4], vehicleColor[5], vehicleColor[6], vehicleColor[7], vehicleColor[8], vehicleColor[9])

	setVehicleHeadLightColor(enteredVehicle, vehicleLightColor[1], vehicleLightColor[2], vehicleLightColor[3])

end



function isComponentCompatible(vehicle, vehicleType)

	if vehicle and vehicleType then

		if type(vehicleType) == "string" then

			if getVehicleType(vehicle) == vehicleType then

				return true

			else

				infobox("Ez a kiegészítő nem kompatibilis a járműveddel!", 2)

			end

		elseif type(vehicleType) == "table" then

			local typeFounded = false

			

			for _, modelType in pairs(vehicleType) do

				if modelType == getVehicleType(vehicle) then

					typeFounded = true

				end

			end

			

			if typeFounded then

				return true

			else

				infobox("Este acessório não é compatível com o seu veículo!", 2)

			end

		end

	end

	

	return false

end



function showDefaultOpticalUpgrade()

	if panelState then

		if enteredVehicle then

			if equippedTuning ~= 0 then

				removeVehicleUpgrade(enteredVehicle, equippedTuning)

			elseif equippedTuning == 0 then

				removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[selectedSubMenuKey])

			end

		end

	end

end



function showNextOpticalUpgrade()

	if panelState then

		if enteredVehicle then

			addVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[selectedSubMenuKey - 1])

		end

	end

end



function resetOpticalUpgrade()

	if panelState then

		if enteredVehicle then

			if equippedTuning ~= 0 then

				addVehicleUpgrade(enteredVehicle, equippedTuning)

			else

				if selectedSubMenuKey - 1 == 0 then

					removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[selectedSubMenuKey])

				else

					removeVehicleUpgrade(enteredVehicle, compatibleOpticalUpgrades[selectedSubMenuKey - 1])

				end

			end

		end

	end

end



function setCameraAndComponentVisible()

	if getVehicleType(enteredVehicle) == "Automobile" then

		if tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["cameraSettings"] then

			local cameraSetting = tuningMenu[selectedMenu]["subMenu"][selectedSubMenu]["cameraSettings"]

		

			if isValidComponent(enteredVehicle, cameraSetting[1]) then

				moveCameraToComponent(cameraSetting[1], cameraSetting[2], cameraSetting[3], cameraSetting[4])

			end

			

			if cameraSetting[5] then

				setVehicleComponentVisible(enteredVehicle, cameraSetting[1], false)

			end

		end

	end

end



function isValidComponent(vehicle, componentName)

	if vehicle and componentName then

		for component in pairs(getVehicleComponents(vehicle)) do

			if componentName == component then

				return true

			end

		end

	end

	

	return false

end

local alpha = 0

function moveCameraToComponent(component, offsetX, offsetZ, zoom)

	if component then

		local _, _, vehicleRotation = getElementRotation(enteredVehicle)

		

		offsetX = offsetX or cameraSettings["defaultX"]

		offsetZ = offsetZ or 15

		zoom = zoom or 9

		

		local cameraRotation = vehicleRotation + offsetX

		

		cameraSettings["moveState"] = "moveToElement"

		cameraSettings["moveTick"] = getTickCount()

		cameraSettings["viewingElement"] = component

		cameraSettings["currentX"] = math.rad(cameraRotation)

		cameraSettings["currentY"] = math.rad(cameraRotation)

		cameraSettings["currentZ"] = math.rad(offsetZ)

		cameraSettings["distance"] = zoom

	end

end



function moveCameraToDefaultPosition()

	cameraSettings["moveState"] = "backToVehicle"

	cameraSettings["moveTick"] = getTickCount()

	cameraSettings["viewingElement"] = enteredVehicle

	

	cameraSettings["currentX"] = cameraSettings["defaultX"]

	cameraSettings["currentY"] = cameraSettings["defaultX"]

	cameraSettings["currentZ"] = math.rad(15)

	cameraSettings["distance"] = 9

end



function closeColorpicker()

	if colorData == 1 then

		local r1, g1, b1, r2, g2, b2 = colorToVehicle:getColor(true)

		Trigger.Server("Color->Upgrade", colorToVehicle, r1, g1, b1, r2, g2, b2)

	elseif colorData == 2 then

		local r, g, b = colorToVehicle:getHeadLightColor()

		Trigger.Server("Headlight->Upgrade", colorToVehicle, r, g, b)

	end



	colorToVehicle = nil

	showCursor(false)

end



function openColorpicker()

	colorToVehicle = localPlayer:getOccupiedVehicle()

	oldr, oldb, oldg = colorToVehicle:getColor(true)



	if colorToVehicle then

		colorPicker.openSelect(colors)

		showCursor(true)

	end

end



function updateColorRender()

	if not colorPicker.isSelectOpen then return end



	local r, g, b = colorPicker.updateTempColors()

	if colorToVehicle and isElement(colorToVehicle) then

		if colorData == 1 then

			local r1, g1, b1, r2, g2, b2 = colorToVehicle:getColor(true)

			

			--if  == 1  then -- Kocsi Szín 1

				r1, g1, b1 = r, g, b

			--else

				r2, g2, b2 = r, g, b

			--end

			colorToVehicle:setColor(r1, g1, b1, r2, g2, b2)

		elseif colorData == 2 then

			setVehicleHeadLightColor(colorToVehicle, r, g, b)

		end

	end

end

addEventHandler("onClientRender", root, updateColorRender)