local kepernyom = {guiGetScreenSize()}
local panelSize = {300, 450}
local panelPosX, panelPosY = kepernyom[1]/2-panelSize[1]/2, kepernyom[2]/2-panelSize[2]/2
local font = dxCreateFont("myriadproregular.ttf",9) --<[ Font ]>--
local font2 = dxCreateFont("myriadproregular.ttf",10) --<[ Font ]>--
local text = "IRG - #00aeefConcessionária de caminhões da cidade"
local camPos = {}
camPos[1] = {} -- Campos[érték] táblázata
camPos[1]["start"] = {2117.1394042969, 1930.3237792969, 12.522399902344, 2117.4519042969, 1929.2436523438, 12.165108680725}
camPos[1]["end"] = {2119.7707519531, 1922.1798095703, 14.212400436401, 2119.9575195313, 1921.6706542969, 13.372242927551}
camPos[1]["speed"] = 10000
camPos[1]["type"] = "Linear"

camPos[2] = {} -- Campos[érték] táblázata
camPos[2]["start"] = {2115.9931640625, 1921.760546875, 12.436599731445, 2116.76171875, 1921.1206054688, 11.972104072571}
camPos[2]["end"] = {2116.98828125, 1910.9344482422, 12.907899856567, 2117.64453125, 1911.5268554688, 12.4404296875}
camPos[2]["speed"] = 10000
camPos[2]["type"] = "Linear"

camPos[3] = {} -- Campos[érték] táblázata
camPos[3]["start"] = {2124.7902832031, 1907.3014404297, 12.116200447083, 2124.4919433594, 1908.0008544922, 11.796879768372}
camPos[3]["end"] = {2123.3288574219, 1911.525390625, 13.788800239563, 2123.1123046875, 1912.1856689453, 13.069684028625}
camPos[3]["speed"] = 10000
camPos[3]["type"] = "Linear"

camPos[4] = {} -- Campos[érték] táblázata
camPos[4]["start"] = {2128.9689941406, 1913.11185791016, 12.037300109863, 2128.03515625, 1914.1320800781, 11.750021934509}
camPos[4]["end"] = {2124.8413085938, 1924.1318359375, 12.609900474548, 2124.29296875, 1923.3881835938, 12.227615356445}
camPos[4]["speed"] = 10000
camPos[4]["type"] = "Linear"

camPos[5] = {} -- Campos[érték] táblázata
camPos[5]["start"] = {2118.3969726563, 1926.10110351563, 15.134300231934, 2118.6647949219, 1925.9877929688, 14.633818626404}
camPos[5]["end"] = {2124.4533691406, 1907.7374267578, 15.519700050354, 2124.2072753906, 1908.5101318359, 14.9345703125}
camPos[5]["speed"] = 10000
camPos[5]["type"] = "Linear"

local carposX, carposY, carposZ = 2121.0258789063, 1917.5940429688, 13.03120803833

local panelType = "CarShop"

local camID = 0
local selectedColor = 0
local lastCamTick = 0
local camFading = 0 -- 1 Fekete, 2 Színezett
local Jelenkocsi = 0

local statisztikaSzazaleka = 0

local statisztikaMaximumok = {
	-- Sebesség, Gyorsulás, Vezérlés, fékek
	32, 21.8, 1, 1 
}


local color = {--Szín ,Összeg
 {255, 255, 255,50},
 {0, 0, 0,50},
 {0,102,255,50},
 {255, 204, 0,50},
 {51, 204, 51,50},
 {255, 0, 0,50},
 {219, 10, 91,50},
}

local element
local ped = {}
local Tick = getTickCount()
local pedPos = {
	{272, 2360.0991210938, -2271.9951171875, 13.555365562439, "Bolsonaro - Loja de caminhões", 98.75784301757},
}
local create = false

function pedLetrehozas() 
	for index,value in ipairs (pedPos) do
		if isElement(ped[index]) then destroyElement(ped[index]) end
		ped[index] = createPed(value[1], value[2], value[3], value[4]) 


		local blip = createBlipAttachedTo(ped[index], 55, 2, 255, 255, 255, 255, 0, 400)
		setElementData(blip,"blip >> name", "Loja de Caminhões")


		ped[index]:setData("carshop-->Ped2", true)
		setElementFrozen(ped[index], true)
		ped[index]:setData("Ped:Name",value[5])
        ped[index]:setData("name:tags", "Loja de veiculos")
		ped[index]:setData("carshop:type", index)
		setElementRotation(ped[index], 0,0, value[6])
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), pedLetrehozas)

function pedKill()
	if getElementData(source, "carshop-->Ped2") then
		cancelEvent()
	end
end
addEventHandler("onClientPedDamage", getRootElement(), pedKill)

function onPedKatt(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if clickedElement and button == "right" and state == "down" and getElementData(clickedElement, "carshop-->Ped2") and getElementType(clickedElement) == "ped" and not create then
		addEventHandler("onClientRender", root, createCarshopPanel)
		create = true	
		showChat(false)
		--setElementData(localPlayer, "toggle-->All", false)
		Tick = getTickCount()
		progress = "Linear" 
		setElementFrozen(localPlayer, true)
		setElementDimension(localPlayer, localPlayer:getData("acc:id"))	
		element = clickedElement
		camID = math.random(1,#camPos)
		setCameraMatrix(camPos[camID]["start"][1],camPos[camID]["start"][2],camPos[camID]["start"][3],camPos[camID]["start"][4],camPos[camID]["start"][5],camPos[camID]["start"][6])
		lastCamTick = getTickCount ()
		createVehicleFunction ()
		addEventHandler ("onClientPreRender",getRootElement(),updateCamPosition)
	elseif clickedElement and button == "right" and state == "down" and getElementData(clickedElement, "carshop-->Ped2") and getElementType(clickedElement) == "ped" and create then
		removeEventHandler("onClientRender", root, createCarshopPanel)
		create = false
		showChat(true)
		--setElementData(localPlayer, "toggle-->All", true)
		setElementFrozen(localPlayer, false)
		removeEventHandler ("onClientPreRender",getRootElement(),updateCamPosition)
	end
	if create and button == "left" and state == "down" and panelType == "CarShop" then 
		for index, value in ipairs (color) do 
			if dobozbaVan(Size2-7+index*35, panelPosY+398, 32, 32, absoluteX, absoluteY) then 
				setVehicleColor(car, value[1], value[2], value[3])
				selectedColor = index
			end
		end
	elseif create and button == "left" and state == "down" and panelType == "Vasarlas" then 
		if dobozbaVan(kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100, 25, absoluteX, absoluteY) then 
			if getVehicleLimits(sellVehicle[Jelenkocsi][1]) >= sellVehicle[Jelenkocsi][5] and sellVehicle[Jelenkocsi][5] > 0 then 
				panelType = "CarShop"
				text = "#D24D57[IRG - Carshop] #ffffffLimite de compras do veiculo batido - Muita gente comprou este veiculo!"
				setTimer(function ()
					text = "san - #00aeefConcessionária de carros da cidade"
				end, 5000, 1) 
			elseif getVehicleLimits(sellVehicle[Jelenkocsi][1]) < sellVehicle[Jelenkocsi][5] or sellVehicle[Jelenkocsi][5] == 0 then 
				local amount = sellVehicle[Jelenkocsi][3] + color[selectedColor][4]
				local number = element:getData("carshop:type")
				triggerServerEvent("buyVehicleSever2", localPlayer, localPlayer, sellVehicle[Jelenkocsi][1], color[selectedColor][1], color[selectedColor][2], color[selectedColor][3], amount, Jelenkocsi, number)
				panelType = "CarShop"
			end
		elseif dobozbaVan(kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100, 25, absoluteX, absoluteY) then
			local pp = sellVehicle[Jelenkocsi][4] + color[selectedColor][4]
			local number = element:getData("carshop:type")
			triggerServerEvent("buyVehiclePPSever2", localPlayer, localPlayer, sellVehicle[Jelenkocsi][1], color[selectedColor][1], color[selectedColor][2], color[selectedColor][3] , pp, Jelenkocsi, number)
			panelType = "CarShop"
		end
	end
end
addEventHandler("onClientClick", getRootElement(), onPedKatt)

addEvent("returnVasarlas2",true)
addEventHandler("returnVasarlas2",root,function(vehID)
	text = "#87D37C[IRG - Carshop] #ffffffVocê comprou o veículo com sucesso. ID: #19B5FE"..vehID
	setTimer(function()
		text = "san - #00aeefConcessionária de carros da cidade"
	end, 3000, 1)
end)

function createVehicleFunction ()
	if isElement(car) then 
		destroyElement(car)
	end
	Jelenkocsi = math.random(1, #sellVehicle)
	car = createVehicle(sellVehicle[Jelenkocsi][1],carposX, carposY, carposZ)
	randomcolor = math.random(1, #color)
	setVehicleColor(car, color[randomcolor][1], color[randomcolor][2], color[randomcolor][3], 0, 0 ,0)
	setElementDimension(car, localPlayer:getData("acc:id"))
	setElementRotation(car, 0, 0, 20)
end

function createCarshopPanel ()
	if panelType == "CarShop" then 
		Time = (getTickCount() - Tick) / 1500
		Size2 = interpolateBetween(0-panelSize[1],0,0,panelPosX-panelPosX+10,0,0,Time,progress)
		dxDrawRectangle(Size2, panelPosY, panelSize[1], panelSize[2], tocolor(0, 0, 0, 180))
		dxDrawRectangle(Size2, panelPosY, panelSize[1], panelSize[2]-425, tocolor(0, 0, 0, 230))
		dxDrawRectangle(Size2, panelPosY+panelSize[2], panelSize[1], panelSize[2]-425, tocolor(0, 0, 0, 230))
		dxDrawText("IRG - #00aeefDados do veículo",Size2+5, panelPosY+5, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255, 255),1, font, "left", "top", false, false, false, true) --<[  Felirat kiírás ]>--
		dxDrawText("Pressione #D24D57'backspace' #ffffffpara fechar ou #87D37C'enter'#ffffff para comprar!.",Size2+15, panelPosY+5+panelSize[2], panelSize[1], panelSize[2]-425, tocolor(255, 255, 255, 255),1, font, "left", "top", false, false, false, true) --<[  Felirat kiírás ]>--
		if Jelenkocsi <= 0 then 
			Jelenkocsi = 1
		end
		if(statisztikaSzazaleka < 1) then
			statisztikaSzazaleka = statisztikaSzazaleka + 0.01
		end
		
		--Sebesség
		dxDrawText("velocidade:", Size2+200/2+20, panelPosY+40, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		local handlingInfo = getVehicleHandling (car)
		local statcsik_csik = handlingInfo["engineAcceleration"]/handlingInfo["dragCoeff"]/statisztikaMaximumok[1]
		statcsik_csik = math.min(statcsik_csik, statisztikaSzazaleka)
		local statcsikCsikSzazalek = statcsik_csik*200
		dxDrawRectangle(Size2+50,panelPosY+60,200,16,tocolor(0, 0, 0,255))
		dxDrawRectangle(Size2+53,panelPosY+63,statcsikCsikSzazalek-5,10,tocolor(0, 174, 235,255/1.3))
		
		-- Gyorsulás
		dxDrawText("aceleração:", Size2+200/2+20, panelPosY+90, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		local statcsik_csik = handlingInfo["engineAcceleration"]/statisztikaMaximumok[2]
		statcsik_csik = math.min(statcsik_csik, statisztikaSzazaleka)
		local statcsikCsikSzazalek = statcsik_csik*200
		dxDrawRectangle(Size2+50,panelPosY+110,200,16,tocolor(0, 0, 0,255))
		dxDrawRectangle(Size2+53,panelPosY+113,statcsikCsikSzazalek-5,10,tocolor(0, 174, 235,255/1.3))
		
		-- Vezérlés
		dxDrawText("controle:", Size2+200/2+20, panelPosY+140, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		local statcsik_csik = ((handlingInfo["tractionLoss"]*handlingInfo["tractionBias"])*(handlingInfo["tractionMultiplier"]))/statisztikaMaximumok[3]
		statcsik_csik = math.min(statcsik_csik, statisztikaSzazaleka)
		local statcsikCsikSzazalek3 = statcsik_csik*150
		dxDrawRectangle(Size2+50,panelPosY+160,200,16,tocolor(0, 0, 0,255))
		dxDrawRectangle(Size2+53,panelPosY+163,statcsikCsikSzazalek-5,10,tocolor(0, 174, 235,255/1.3))	
		
		-- Fékek
		dxDrawText("freios:", Size2+200/2+20, panelPosY+190, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		local statcsik_csik = handlingInfo["brakeDeceleration"]/handlingInfo["brakeBias"]/statisztikaMaximumok[4]
		statcsik_csik = math.min(statcsik_csik, statisztikaSzazaleka)
		local statcsikCsikSzazalek3 = statcsik_csik*150
		dxDrawRectangle(Size2+50,panelPosY+210,200,16,tocolor(0, 0, 0,255))
		dxDrawRectangle(Size2+53,panelPosY+213,statcsikCsikSzazalek-5,10,tocolor(0, 174, 235,255/1.3))
		
		local Wheel = ""
		local Wheels = handlingInfo["driveType"]
		
		if Wheels == "awd" then 
			Wheel = "Quatro rodas"
		elseif Wheels == "rwd" then 
			Wheel = "Roda traseira"
		elseif Wheels == "fwd" then 
			Wheel = "Roda dianteira"
		end
		
		dxDrawText("Veiculo: #00aeef"..sellVehicle[Jelenkocsi][2], Size2+50, panelPosY+240, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("Preço: #00aeefR$: "..penz_darabolas(sellVehicle[Jelenkocsi][3]) .. " #ffffff Dinheiro Vip: #00aeef"..penz_darabolas(sellVehicle[Jelenkocsi][4]).. " PP", Size2+50, panelPosY+270, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("Tração: #00aeef"..Wheel, Size2+50, panelPosY+300, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		--dxDrawText("Üzemanyag: #00aeef"..handlingInfo["engineType"], Size2+50, panelPosY+330, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("projeto de lei: #00aeef"..handlingInfo["numberOfGears"].. " grau", Size2+50, panelPosY+330, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		if sellVehicle[Jelenkocsi][5] > 0 then 
			local color = ""
			if getVehicleLimits(sellVehicle[Jelenkocsi][1]) >= sellVehicle[Jelenkocsi][5] then 
				color = "#D24D57"
			else
				color = "#00aeef"
			end
			dxDrawText("Limite de compras: ".. color .. getVehicleLimits(sellVehicle[Jelenkocsi][1]).. " #ffffff/ #00aeef"..sellVehicle[Jelenkocsi][5], Size2+50, panelPosY+360, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		else
			dxDrawText("Não há #F5D76Elimite #ffffffpara este veículo", Size2+50, panelPosY+360, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		end
		dxDrawText("cores:", Size2+200/2+25, panelPosY+380, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		for index, value in ipairs (color) do 
			if isInSlot(Size2-5+index*35, panelPosY+400, 30, 30) then 
				dxDrawRectangle(Size2-7+index*35, panelPosY+398, 32, 32, tocolor(value[1], value[2], value[3]))
			else
				dxDrawRectangle(Size2-5+index*35, panelPosY+400, 30, 30, tocolor(value[1], value[2], value[3]))
			end
		end
		
		local width = dxGetTextWidth( text, 1, font ) + 20
		Time = (getTickCount() - Tick) / 1500
		Size1 = interpolateBetween(0,0,0,kepernyom[1]/2-width/2,0,0,Time,progress)	
		dxDrawRectangle(Size1, 10, width, 25, tocolor(0, 0, 0, 200))
		dxDrawText(text,Size1+width/2, 10+5, Size1+width/2, 25, tocolor(255, 255, 255, 255),1, font, "center", "top", false, false, false, true) --<[  Felirat kiírás ]>--

		elseif panelType == "Vasarlas" then 
		dxDrawRectangle(kepernyom[1]/2-300/2, kepernyom[2]/2-200/2, 300, 200, tocolor(0, 0, 0, 200))
		dxDrawRectangle(kepernyom[1]/2-300/2, kepernyom[2]/2-200/2, 300, 25, tocolor(0, 0, 0, 230))
		dxDrawText("IRG - #00aeefcompra",kepernyom[1]/2-300/2+5, kepernyom[2]/2-200/2+5, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255, 255),1, font, "left", "top", false, false, false, true) --<[  Felirat kiírás ]>--
		dxDrawText("Veiculo: #00aeef"..sellVehicle[Jelenkocsi][2], kepernyom[1]/2-300/2+5, kepernyom[2]/2-200/2+30, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("Preço: #00aeefR$: "..penz_darabolas(sellVehicle[Jelenkocsi][3]) .. "", kepernyom[1]/2-300/2+5, kepernyom[2]/2-200/2+50, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("Dinheiro Vip: #00aeef"..penz_darabolas(sellVehicle[Jelenkocsi][4]).. " PP", kepernyom[1]/2-300/2+5, kepernyom[2]/2-200/2+70, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawText("cor: #00aeef", kepernyom[1]/2-300/2+5, kepernyom[2]/2-200/2+100, panelSize[1], panelSize[2]-425, tocolor(255, 255, 255,255), 1.0, font2, "left", "top", false, false, false,true) --<[  Felirat kiírás ]>--
		dxDrawRectangle( kepernyom[1]/2-300/2+40, kepernyom[2]/2-200/2+95, 30, 30, tocolor(color[selectedColor][1], color[selectedColor][2], color[selectedColor][3]))
		if isInSlot(kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100, 25) then 
			dxDrawRectangle(kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100, 25, tocolor(0, 174, 235, 200))
			dxDrawText("dinheiro normal", kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100 + kepernyom[1]/2-300/2+15, 25 + kepernyom[2]/2-200/2+160, tocolor(0, 0, 0,255), 1.0, font2, "center", "center", false, false, false,true) --<[  Felirat kiírás ]>--
		else
			dxDrawRectangle(kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100, 25, tocolor(0, 0, 0, 200))
			dxDrawText("dinheiro normal", kepernyom[1]/2-300/2+15, kepernyom[2]/2-200/2+160, 100 + kepernyom[1]/2-300/2+15, 25 + kepernyom[2]/2-200/2+160, tocolor(255, 255, 255,255), 1.0, font2, "center", "center", false, false, false,true) --<[  Felirat kiírás ]>--
		end
		if isInSlot(kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100, 25) then 
			dxDrawRectangle(kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100, 25, tocolor(25, 181, 254, 200))
			dxDrawText("Dinheiro Vip", kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100 + kepernyom[1]/2-300/2+300-115, 25 + kepernyom[2]/2-200/2+160, tocolor(0, 0, 0,255), 1.0, font2, "center", "center", false, false, false,true) --<[  Felirat kiírás ]>--
		else
			dxDrawRectangle(kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100, 25, tocolor(0, 0, 0, 200))
			dxDrawText("Dinheiro Vip", kepernyom[1]/2-300/2+300-115, kepernyom[2]/2-200/2+160, 100 + kepernyom[1]/2-300/2+300-115, 25 + kepernyom[2]/2-200/2+160, tocolor(255, 255, 255,255), 1.0, font2, "center", "center", false, false, false,true) --<[  Felirat kiírás ]>--
		end
	end
end

function getVehicleLimits(vehicleID)
	local ammount = 0
	local breake = false
	for i, v in ipairs (getElementsByType("vehicle")) do
		if getElementModel(v) == vehicleID then 
			ammount = ammount + 1
			if ammount > 1 then 
				breake = true
			end
			if ammount == 1 and breake then 
				break
			end
		end
	end
	ammount = ammount -1
	return ammount
end

function penz_darabolas(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

local stoped = false
local stop = false
addEventHandler("onClientKey", root, function(k,v)
	if not create then return end
	if k == "backspace" and v then	
		if panelType == "CarShop" then 
			if isElement(car) then 
				destroyElement(car)
			end
			removeEventHandler("onClientRender", root, createCarshopPanel)
			create = false
			showChat(true)
			--setElementData(localPlayer, "toggle-->All", true)
			setElementFrozen(localPlayer, false)
			setCameraTarget(localPlayer, true)
			fadeCamera (true,2)
			setElementDimension(localPlayer, 0)	
			removeEventHandler ("onClientPreRender",getRootElement(),updateCamPosition)
			statisztikaSzazaleka = 0
			selectedColor = 0
		else
			panelType = "CarShop"
		end
	if isTimer(timer) then return end
	timer = setTimer(function() end, 300, 1)
	elseif k == "arrow_l" and not stoped and panelType == "CarShop" then 
		if Jelenkocsi > 0 then
			Jelenkocsi = Jelenkocsi - 1
			stoped = true
		else
			Jelenkocsi = 1				
		end	
		setTimer(function()
			setElementModel(car, sellVehicle[Jelenkocsi][1])
			statisztikaSzazaleka = 0
			stoped = false
		end , 300, 1 )
	elseif k == "arrow_r" and not stoped and panelType == "CarShop" then 
		if Jelenkocsi < #sellVehicle then
			Jelenkocsi = Jelenkocsi + 1
			stoped = true
		else
			Jelenkocsi = 1				
		end	
		setTimer(function()
			setElementModel(car, sellVehicle[Jelenkocsi][1])
			statisztikaSzazaleka = 0
			stoped = false
		end , 300, 1 )
	elseif k == "enter" and not stop  then
		if panelType == "CarShop" then 
			if selectedColor > 0 then 
				panelType = "Vasarlas"
			else
				text = "#D24D57[IRG - Carshop] #ffffffEscolha a cor do carro."
				stop = true
				setTimer(function ()
					text = "san - #00aeefConcessionária de carros da cidade"
					stop = false
				end, 3000, 1 )
			end
		end
	end
end)

function updateCamPosition ()
	if camPos[camID] then
		local cTick = getTickCount ()
		local delay = cTick - lastCamTick
		local duration = camPos[camID]["speed"]
		local easing = camPos[camID]["type"]
		if duration and easing then
			local progress = delay/duration
			if progress < 1 then
				local cx,cy,cz = interpolateBetween (
					camPos[camID]["start"][1],camPos[camID]["start"][2],camPos[camID]["start"][3],
					camPos[camID]["end"][1],camPos[camID]["end"][2],camPos[camID]["end"][3],
					progress,easing
				)
				local tx,ty,tz = interpolateBetween (
					camPos[camID]["start"][4],camPos[camID]["start"][5],camPos[camID]["start"][6],
					camPos[camID]["end"][4],camPos[camID]["end"][5],camPos[camID]["end"][6],
					progress,easing
				)
				
				setCameraMatrix (cx,cy,cz,tx,ty,tz)
				
				if camFading == 0 then
					local left = duration-delay
					if left <= 3000 then -- Ez kezd sötétedni
						camFading = 1
						fadeCamera (false,3,0,0,0)
					end
				elseif camFading == 2 then -- színezett
					local left = duration-delay
					if left >= 2000 then
						camFading = 0
					end
				end
			else
				local nextID = false
				
				while nextID == false do
					local id = camID + 1
					if id ~= camID then
						nextID = id
					end
					if id > # camPos then 
						nextID = 1
					end
				end
				
				camFading = 2
				fadeCamera (true,2)
				lastCamTick = getTickCount ()
				camID = nextID
				
				setCameraMatrix (camPos[camID]["start"][1],camPos[camID]["start"][2],camPos[camID]["start"][3],camPos[camID]["start"][4],camPos[camID]["start"][5],camPos[camID]["start"][6])
			end
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