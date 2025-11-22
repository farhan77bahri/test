local monitorSize = {guiGetScreenSize()}
local lineColor = {0, 0, 0}
local clickElement = {false, false, false, false}
local playerX, playerY, playerZ = 0, 0 ,0 
local playersX, playersY, playersZ = 0, 0 ,0 
local lineX, lineY, lineZ = 0, 0, 0
local linesX,linesY,linesZ = 0, 0, 0
local externalPlayer = localPlayer
local VehicleID = 0
local gallon = 0
local fuel = 0
local element 
local effect = {} 
local VehicleElement
local vehicle_Table = {
	[400] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[401] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[418] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[404] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[421] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[491] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[436] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[480] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[482] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[494] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[496] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[499] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[500] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[495] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[483] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[423] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[429] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[477] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[478] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[526] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[527] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[456] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[458] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[516] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[445] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[539] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[551] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[540] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[541] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[542] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[546] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[547] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[585] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[561] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[564] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[575] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[576] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[578] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[579] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[587] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[602] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[604] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[580] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[589] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[599] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[562] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[533] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[555] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[565] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[566] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[559] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[470] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[451] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[507] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[439] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[426] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	[405] = {"wheel_rb_dummy"}, -- Jobb Hátsó kerék
	
	[411] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[402] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[508] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[600] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[603] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[601] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[409] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[605] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[586] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[588] = {"wheel_lb_dummy"}, --Bal Hátsó kerék

	[596] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[598] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[597] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[582] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[552] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[554] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[549] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[567] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[550] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[492] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[563] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[560] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[517] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[543] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[544] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[545] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[518] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[534] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[535] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[536] = {"wheel_lb_dummy"}, --Bal Hátsó kerék



	[522] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[461] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[468] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[521] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[581] = {"wheel_lb_dummy"}, --Bal Hátsó kerék



	[528] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[523] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[525] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[410] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[502] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[503] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[504] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[505] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[506] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[412] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[498] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[479] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[489] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[490] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[413] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[471] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[474] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[475] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[415] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[414] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[431] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[459] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[460] = {"wheel_lb_dummy"}, --Bal Hátsó kerék

	[462] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[466] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[467] = {"wheel_lb_dummy"}, --Bal Hátsó kerék

	[455] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[433] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[434] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[416] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[419] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[440] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[442] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[443] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[420] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[437] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[438] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[422] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[423] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[427] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
	[428] = {"wheel_lb_dummy"}, --Bal Hátsó kerék
}

local font = dxCreateFont("files/Nexa-Light.otf", 12)
local font2 = dxCreateFont("files/Nexa-Light.otf", 10)

local effect = {}
local start 

local ped_info = {
	--SkinID X, Y, Z , ROTX, ROTY, ROTZ, Name, INT, DIM
	{180, 1918.5770263672, -1776.3154296875, 13.387500762939, 269, 0, 0, "Andrade - Pagamento Gasolina", 0, 0},
	{180, 1002.3306274414, -912.23645019531, 42.184375762939, 187, 0, 0, "Wesley - Pagamento Gasolina", 0, 0}, -- Déli 

	--{180, -78.590637207031, -1170.0426025391, 2.1387095451355, 75, 0, 0, "Mateus - Pagamento Gasolina", 0, 0}, 


--[[	{180, 1599.4362792969,2221.5900878906,11.0625, 229.54992675781, 0, 0, "LasVenturas - Pagamento Gasolina!", 0, 0}, 

	{180, 315.0334777832, 1904.9229736328, 17.640625, 3.60169506073, 0, 0, "Exercito - Pagamento Gasolina!", 0, 0}, 


	{180, 2637.4768066406,1129.6706542969,11.1796875, 177.74662780762, 0, 0, "LasVenturas - Pagamento Gasolina!", 0, 0}, 

	{180, 2188.205078125,2469.73046875,11.2421875, 271.57238769531, 0, 0, "LasVenturas - Pagamento Gasolina!", 0, 0}, 

	{180, 2150.7797851563,2734.0939941406,11.176349639893, 2.7133061885834, 0, 0, "LasVenturas - Pagamento Gasolina!", 0, 0}, 

	{180, -1685.5743408203,422.60372924805,7.1796875, 235.1695098877, 0, 0, "San Fierro - Pagamento Gasolina!", 0, 0}, 
	
	{180, -1623.390625,-2693.326171875,48.742660522461, 149.94148254395, 0, 0, "Whetstone - Pagamento Gasolina!", 0, 0}, 
	
	{180, -2231.4428710938,-2558.2062988281,31.921875, 102.62776184082, 0, 0, "Angel Pine - Pagamento Gasolina!", 0, 0}, 
	
	{180, -2032.9561767578,154.98893737793,29.046106338501, 299.98287963867, 0, 0, "Doherty, San Fierro - Pagamento Gasolina!", 0, 0}, 	
	
	{180, -1320.2440185547,2698.5012207031,50.26628112793, 222.2765045166, 0, 0, "Tierra Robada - Pagamento Gasolina!", 0, 0}, 	
	
	{180, 638.73327636719,1682.9542236328,7.1875, 51.171882629395, 0, 0, "Bone County - Pagamento Gasolina!", 0, 0},	
	
	{180, 1383.0220947266,465.67669677734,20.191724777222, 166.47991943359, 0, 0, "Red County - Pagamento Gasolina!", 0, 0},	
	
	{180, -80.29663848877,-1173.7885742188,2.1095380783081, 89.062850952148, 0, 0, "Conner - Pagamento Gasolina!", 0, 0},


	
	{177, -80.992218017578, -1173.0458984375, 2.1474828720093, 60, 0, 0, "Jason", 0, 0}, -- Déli 
	{176, -27.169277191162, -91.623626708984, 1003.546875, 0, 0, 0, "Geroge", 18, 80}, -- Déli 
	{177, -2032.9752197266, 156.27908325195, 29.046106338501, -90, 0, 0, "Mark", 0, 0}, -- Déli 
	{175, -2234.5119628906, -2563.548828125, 31.921875, 50, 0, 0, "Smith", 0, 0}, -- Déli 
	{174, 380.65927124023, -187.05889892578, 1000.6328125, 80, 0, 0, "Ron", 17, 20}, -- Déli 
	{173, 663.25671386719, -567.05090332031, 16.3359375, 180, 0, 0, "Andrey", 0, 0}, -- Déli 
	{172, 1580.8150634766, -1634.4886474609, 13.561435699463, 0, 0, 0, "Frank", 0, 0}, -- Police 
	{171, 294.4833984375, -1505.064453125, 24.928907394409, -120, 0, 0, "Smith", 0, 0}, -- Hotel 
	{28, 58.390911102295, 1224.8790283203, 18.876941680908, -120, 0, 0, "Smith", 0, 0}, -- Hotel 
	{170, -28.838224411011, -186.82159423828, 1003.546875, 0, 0, 0, "Gabort", 17, 1694}, -- Hotel 
	{169, -29.146396636963, -186.81665039063, 1003.546875, 0, 0, 0, "William", 17, 1695}, -- Hotel 
	{200, -29.146396636963, -186.81665039063, 1003.546875, 0, 0, 0, "Georgo", 17, 1696}, -- Hotel 
	{201, -29.146396636963, -186.81665039063, 1003.546875, 0, 0, 0, "Leopold", 17, 1697}, -- Hotel 
	{202, -29.171194076538, -186.81587219238, 1003.546875, 0, 0, 0, "Loth", 17, 1766}, -- Hotel 
	{203, 2.3046481609344, -30.701335906982, 1003.5494384766, 0, 0, 0, "Johns", 10, 1767}, -- Hotel 
	{204, -27.725740432739, -91.626098632813, 1003.546875, 0, 0, 0, "Albert", 18, 1780}, -- Hotel 
]]--

}

local fuelprice = 4
local fuelPed = {}

addEventHandler("onClientResourceStart", resourceRoot, function ()
	for index, value in ipairs (ped_info) do 
		fuelPed[index] = createPed(value[1], value[2], value[3], value[4], value[5], value[6], value[7])
		setElementData(fuelPed[index], "fuelPed:ID", index)
		setElementData(fuelPed[index], "Ped:Name", value[8])
		setElementInterior(fuelPed[index], value[9])
		setElementDimension(fuelPed[index], value[10])
		setElementData(fuelPed[index], "name:tags", "NPC")
		setElementFrozen(fuelPed[index], true)
	end
	
	setElementData(localPlayer, "fuel_gun", false)
	for k, v in ipairs(getElementsByType("vehicle")) do
		setElementData(v, "veh_fueling", false)
	end
	
	if fileExists("files/fuelgun.txd") then
		txd = engineLoadTXD("files/fuelgun.txd", 14463 )
		engineImportTXD(txd, 14463)
	end	
	
	if fileExists("files/fuelgun.dff") then
	  dff = engineLoadDFF("files/fuelgun.dff", 14463 )
	  engineReplaceModel(dff, 14463)
	end	
end)

function boltosPedLoves()
	if(getElementData(source, "fuelPed:ID") or 0 > 0) then
		cancelEvent() -- Boltosok nem kapják a lövést stb.
	end
end
addEventHandler("onClientPedDamage",  getRootElement(), boltosPedLoves)

function abortAllStealthKills(targetPlayer)
	if getElementType ( targetPlayer ) == "ped" and (getElementData(targetPlayer, "fuelPed:ID") > 0) then
		cancelEvent()
	end
end
addEventHandler("onClientPlayerStealthKill", getLocalPlayer(), abortAllStealthKills)

			
			

addEventHandler("onClientRender", root, function ()
--[[
	for index, value in ipairs (getElementsByType("object")) do 
		if getElementData(value, "isRefill") and getElementData(value, "dbid") > 0 then 
			local objX, objY, objZ = getElementPosition(value)
			local playergX, playergY, playergZ = getPedBonePosition(externalPlayer, 25)
			if getDistanceBetweenPoints3D( objX, objY, objZ, playergX, playergY, playergZ) < 2 then 
				--dxDrawRectangle(monitorSize[1]/2-300/2, monitorSize[2]-50-65, 300, 50, tocolor(0, 0, 0, 180))
				--dxDrawRectangle(monitorSize[1]/2-300/2, monitorSize[2]-50-65+50, 300, 1, tocolor(124, 197, 118, 180))
				local litros = getElementData(localPlayer, "ListrosGalao")
				dxDrawText("Quantidade de litros do posto "..litros.." litros " ,monitorSize[1]/2-300/2+300/2, monitorSize[2]-50-65+50/2,monitorSize[1]/2-300/2+300/2, monitorSize[2]-50-65+50/2, tocolor(255, 255, 255, 255), 2, "default", "center", "center", false, false, false, true)
			end
		end
	end]]--

	if  clickElement[1]  then 
		playerX, playerY, playerZ = getPedBonePosition(externalPlayer, 25)
		if getDistanceBetweenPoints3D(playerX, playerY, playerZ, lineX, lineY, lineZ) < 5 then 
			dxDrawLine3D (lineX,lineY,lineZ, playerX, playerY, playerZ, tocolor ( 0,0,0,255 ), 1.5)
		else
			outputChatBox("#F7CA18[Gasolina] ==> #ffffffVocê não pode ir tão longe com a mangueira na mão.", 255, 255, 255, true)
			clickElement[1]  = false
			triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer, true)
			--triggerServerEvent("syncPlayereffect", localPlayer, localPlayer, true)
			exports.san_chat:sendLocalMeMessage(localPlayer, "Colocou a mangueira de volta no suporte.")
			setElementData(localPlayer, "fuel_gun", false)
				toggleControl("fire", true)
		end
		if getElementData(localPlayer, "fuel_gun") or false then 
			for k, v in ipairs(getElementsByType("vehicle")) do
				local x, y, z = getElementPosition(localPlayer)
				local vehicleX, vehicleY, vehicleZ = getElementPosition(v)
				if getDistanceBetweenPoints3D(x, y, z, vehicleX, vehicleY, vehicleZ) <= 2 then
				if getElementDimension(v) == 0 then
					VehicleID = getElementData(v, "veh:id")
					VehicleElement = v
					
					--[[
					local x,y,z = getVehicleComponentPosition (v,"wheel_lb_dummy","world")
					local x2,y2,z2 = getVehicleComponentPosition (v,"wheel_rb_dummy","world")
					local x3,y3,z3 = getElementPosition(v)
					local px, py, pz = getElementPosition(localPlayer)
					if getDistanceBetweenPoints3D(x3,y3,z3, px, py, pz) < 1 and getDistanceBetweenPoints3D(x,y,z, px, py, pz) < 1 or getDistanceBetweenPoints3D(x2,y2,z2, px, py, pz) < 1 then 
					]]--

					local px, py, pz = getElementPosition(localPlayer)
					if (getVehicleType(v) == "Automobile") then 
					local x,y,z = getVehicleComponentPosition (v,"door_lf_dummy","world")
					end
					if (getVehicleType(v) == "Bike") then 
					local x,y,z = getElementPosition(v)
					end

					
					--local x2,y2,z2 = getVehicleComponentPosition (v,"wheel_lb_dummy","world")
	
					


					if getDistanceBetweenPoints3D(x,y,z, px, py, pz) < 1 then 


						if clickElement[3] then 
         					dxDrawImage(monitorSize[1]-128-10,monitorSize[2]/2-128, 128, 128, "files/pistol.png", 0, 0, 0, tocolor(124, 197, 118, getTickCount() / -5))
						else
							dxDrawImage(monitorSize[1]-128-10,monitorSize[2]/2-128, 128, 128, "files/pistol.png", 0, 0, 0, tocolor(124, 197, 118, 255))
						end
						
						--if  not getElementData(VehicleElement, "veh_fueling") then 
							clickElement[2]  = true
						--end
						if getVehicleEngineState(VehicleElement) then
							dxDrawImage(monitorSize[1]-128-10,monitorSize[2]/2-128, 128, 128, "files/pistol.png", 0, 0, 0, tocolor(210, 77, 87, 255))
							dxDrawRectangle(monitorSize[1]-250-10,monitorSize[2]/2-128+135, 250, 50, tocolor(0, 0, 0, 180))
							dxDrawRectangle(monitorSize[1]-250-10,monitorSize[2]/2-128+135+50, 250, 2, tocolor(210, 77, 87, 180))
							dxDrawText("Me desculpe, mas o motor do veículo ta ligado \nentão você não pode reabastecer." ,monitorSize[1]-250-10+250/2,monitorSize[2]/2-128+135+50/2, monitorSize[1]-250-10+250/2 , monitorSize[2]/2-128+135+50/2,  tocolor(255, 255, 255, 255), 1, font2, "center", "center", false, false, false, true)
						end
						dxDrawText(""..math.floor(gallon).." L" ,monitorSize[1]-128-10/2+102 ,monitorSize[2]/2-128+200+1,monitorSize[1]-128-10/2+102, 0, tocolor(0, 0, 0, 255), 1, font, "right", "top", false, false, false, true)
						dxDrawText(math.floor(gallon).." L" ,monitorSize[1]-128-10/2+102+1 ,monitorSize[2]/2-128+200,monitorSize[1]-128-10/2+102+1, 0, tocolor(255, 255, 255, 255), 1, font, "right", "top")
						dxDrawText("R$: "..math.floor(fuel) ,monitorSize[1]-128-10/2+102 ,monitorSize[2]/2-128+250, monitorSize[1]-128-10/2+100, 0, tocolor(0, 0, 0, 255), 1, font, "right", "top", false, false, false, true)
						dxDrawText("R$: "..math.floor(fuel) ,monitorSize[1]-128-10/2+102 ,monitorSize[2]/2-128+250.5+1, monitorSize[1]-128-10/2+100+1, 0, tocolor(255, 255, 255, 255), 1, font, "right", "top")
					else
						dxDrawImage(monitorSize[1]-128-10,monitorSize[2]/2-128, 128, 128, "files/pistol.png", 0, 0, 0, tocolor(255, 255, 255, 255))
						clickElement[2]  = false
					end
				end
				end
			end
			if VehicleElement and not getVehicleEngineState(VehicleElement) then 
				if clickElement[2] and getKeyState("mouse1") then 
					if not clickElement[3] then 
						triggerServerEvent("playerAnimationToServer", localPlayer, localPlayer, "SWORD", "sword_IDLE")
						--triggerServerEvent("syncPlayereffect", localPlayer, localPlayer, false)
						if isElement(start) then 
							stopSound(start)
						end
						start = playSound("files/fuelling.mp3", true)
					end
					clickElement[3] = true 
					setElementData(VehicleElement, "veh_fueling", true)
					gallon = gallon + 0.05
					fuel = math.floor(gallon) * fuelprice
					if getElementData(localPlayer, "char:money") >= math.floor(fuel) then
					else
						outputChatBox("#F7CA18[Gasolina] ==> #ffffffDesculpe, mas você não tem dinheiro suficiente para abastecer.", 255, 255, 255, true)
						if clickElement[3] then 
							triggerServerEvent("playerAnimationToServer", localPlayer, localPlayer, nil, nil)
							if isElement(start) then 
								stopSound(start)
							end
						end
						setElementData(VehicleElement, "veh_fueling", false)
						clickElement[1]  = false
						clickElement[2] = false 
						clickElement[3] = false 
						triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer, true)
						setElementData(localPlayer, "fuel_gun", false)
							toggleControl("fire", true)
						exports.san_chat:sendLocalMeMessage(localPlayer, "Colocou a mangueira de volta no suporte.")
						if isElement(start) then 
							stopSound(start)
						end
					end
					if math.floor(getElementData(VehicleElement, "veh:fuel")) >= 100 then 
						outputChatBox("#F7CA18[Fuel] ==> #ffffffO tanque de combustível do veículo está cheio, então você não pode reabastecer .", 255, 255, 255, true)
						if clickElement[3] then 
							triggerServerEvent("playerAnimationToServer", localPlayer, localPlayer, nil, nil)
							--triggerServerEvent("syncPlayereffect", localPlayer, localPlayer, false)
						end
						setElementData(VehicleElement, "veh_fueling", false)
						clickElement[1]  = false
						clickElement[2] = false 
						clickElement[3] = false 
						triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer, true)
						setElementData(localPlayer, "fuel_gun", false)
						exports.san_chat:sendLocalMeMessage(localPlayer, "Colocou a mangueira de volta no suporte.")
										toggleControl("fire", true)
						if isElement(start) then 
							stopSound(start)
						end
					else
						if gallon >= (100 - getElementData(VehicleElement, "veh:fuel")) then 
							outputChatBox("#F7CA18[Gasolina] ==> #ffffffO tanque de combustível do veículo está cheio vai na loja e paga no caixa e depois você pode seguir seu caminho.", 255, 255, 255, true)
							if clickElement[3] then 
								triggerServerEvent("playerAnimationToServer", localPlayer, localPlayer, nil, nil)
								--triggerServerEvent("syncPlayereffect", localPlayer, localPlayer, false)
							end
							--setElementData(VehicleElement, "veh_fueling", false)
							clickElement[1]  = false
							clickElement[2] = false 
							clickElement[3] = false 
							triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer, true)
							setElementData(localPlayer, "fuel_gun", false)
							toggleControl("fire", true)
							exports.san_chat:sendLocalMeMessage(localPlayer, "Colocou a mangueira de volta no suporte.")
							if isElement(start) then 
								stopSound(start)
							end
						end
					end
				else
					if clickElement[3] then 
						triggerServerEvent("playerAnimationToServer", localPlayer, localPlayer, nil, nil)
						--triggerServerEvent("syncPlayereffect", localPlayer, localPlayer, false)
						--setElementData(VehicleElement, "veh_fueling", false)
						if isElement(start) then 
							stopSound(start)
						end
					end
					clickElement[3] = false 
				end
			
			end
		end
	elseif clickElement[4] then 
		dxDrawImage(monitorSize[1]/2-300/2 ,monitorSize[2]/2-500/2, 300, 500, "files/paper.png", 0, 0, 0, tocolor(255, 255, 255, 255))
		dxDrawText(math.floor(gallon) ,monitorSize[1]/2-300/2+230 ,monitorSize[2]/2-500/2+195.5, 0, 0, tocolor(0, 0, 0, 255), 1, "default-bold", "left", "top")
		dxDrawText(math.floor(fuel) ,monitorSize[1]/2-300/2+300/2+102 ,monitorSize[2]/2-500/2+239.5, monitorSize[1]/2-300/2+300/2+100, 0, tocolor(0, 0, 0, 255), 1, "default-bold", "right", "top")
		
		dxDrawRectangle(monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+330, 180, 40, tocolor(0, 0, 0, 200))
		dxDrawRectangle(monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+390, 180, 40, tocolor(0, 0, 0, 200))

		if isInSlot (monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+330, 180, 40) then 
			dxDrawRectangle(monitorSize[1]/2-300/2+300/2-90+3 ,monitorSize[2]/2-500/2+330+3, 180-6, 40-6, tocolor(124, 197, 118, 200))
			dxDrawText("OK" ,monitorSize[1]/2-300/2+300/2-90+180/2 ,monitorSize[2]/2-500/2+330+40/2, monitorSize[1]/2-300/2+300/2-90+180/2, monitorSize[2]/2-500/2+330+40/2, tocolor(0, 0, 0, 255), 1, "default-bold", "center", "center")
		else
			dxDrawText("OK" ,monitorSize[1]/2-300/2+300/2-90+180/2 ,monitorSize[2]/2-500/2+330+40/2, monitorSize[1]/2-300/2+300/2-90+180/2, monitorSize[2]/2-500/2+330+40/2, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center")
		end
		
		if isInSlot (monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+390, 180, 40) then 
			dxDrawRectangle(monitorSize[1]/2-300/2+300/2-90+3 ,monitorSize[2]/2-500/2+390+3, 180-6, 40-6, tocolor(210, 77, 87, 200))
			dxDrawText("Cancel" ,monitorSize[1]/2-300/2+300/2-90+180/2 ,monitorSize[2]/2-500/2+390+40/2, monitorSize[1]/2-300/2+300/2-90+180/2, monitorSize[2]/2-500/2+390+40/2, tocolor(0, 0, 0, 255), 1, "default-bold", "center", "center")
		else
			dxDrawText("Cancel" ,monitorSize[1]/2-300/2+300/2-90+180/2 ,monitorSize[2]/2-500/2+390+40/2, monitorSize[1]/2-300/2+300/2-90+180/2, monitorSize[2]/2-500/2+390+40/2, tocolor(255, 255, 255, 255), 1, "default-bold", "center", "center")
		end

	end
end
)





function createEffects(player, _, element )
	--if isElement(effect[player]) then 
	--	destroyElement(effect[player])
	--else
		--local rotx, roty, rotz = getElementRotation(player)
		--effect[player] = createEffect("petrolcan", playerX, playerY, playerZ, 0, roty, rotz)
		--exports.bone_attach:attachElementToBone(effect[player], player , 12, -0.25,-0.05, 0.23, rotx, roty, rotz)
	--end
end
addEvent("createEffectstoClient", true)
addEventHandler("createEffectstoClient", root, createEffects)

addEventHandler("onClientClick", root, function (button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
	if button == "right" and state == "down" and not isPedInVehicle(localPlayer) then 
		if clickedElement and getElementType(clickedElement) == "object" and getElementData(clickedElement, "isRefill") and getElementData(clickedElement, "dbid") or 0 > 0 then
			element = clickedElement 

			--setElementData(id, "ListrosGalao", 100)

			--element = clickedElement
			if getElementData(localPlayer, "fuel_gun") or false then
				clickElement[1]  = false
				triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer, true)
				setElementData(localPlayer, "fuel_gun", false)
				toggleControl("fire", true)
				exports.san_chat:sendLocalMeMessage(localPlayer, "Colocou a mangueira de volta no suporte.")
			else
				clickElement[1] = true
				lineX,lineY,lineZ = getElementPosition(clickedElement)
				toggleControl("fire", false)
				triggerServerEvent("syncPlayertoFuelGun", localPlayer, localPlayer)
				setElementData(localPlayer, "fuel_element", clickedElement)
				setElementData(localPlayer, "fuel_gun", true)
				exports.san_chat:sendLocalMeMessage(localPlayer, "Pegou a mangueira para abastecer seu veiculo")
			end





		elseif clickedElement and getElementData(clickedElement, "fuelPed:ID") or 0 > 0 and not clickElement[4] then 
			clickElement[4] = true 
		end
	elseif button == "left" and state == "down" then 
		if clickElement[4] then 
			if dobozbaVan(monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+330, 180, 40, absoluteX, absoluteY) then 
				if VehicleElement and gallon > 0 and getElementData(localPlayer, "char:money") >= math.floor(fuel) then
					if getElementData(VehicleElement, "veh:fuel") < 101 and (getElementData(VehicleElement, "veh:fuel") + gallon) < 101  then 
						setElementData(localPlayer, "char:money", getElementData(localPlayer, "char:money") - math.floor(fuel))
						setElementData(VehicleElement, "veh:fuel", getElementData(VehicleElement, "veh:fuel") + math.floor(gallon))


	

						fuel = 0
						gallon = 0
						clickElement[4] = false
						clickElement[3] = false
						clickElement[2] = false
						clickElement[1] = false
						setElementData(VehicleElement, "veh_fueling", false)
						VehicleElement = false
					else
						fuel = 0
						gallon = 0
						clickElement[4] = false
						clickElement[3] = false
						clickElement[2] = false
						clickElement[1] = false
						setElementData(VehicleElement, "veh_fueling", false)
						VehicleElement = false
					end
				end
			elseif dobozbaVan(monitorSize[1]/2-300/2+300/2-90 ,monitorSize[2]/2-500/2+390, 180, 40, absoluteX, absoluteY) then 
				clickElement[4] = false
				clickElement[3] = false
				clickElement[2] = false
				clickElement[1] = false
				setElementData(VehicleElement, "veh_fueling", false)
			end
		end
	end
end)


for k,v in ipairs(getElementsByType("object")) do
	if getElementData(v, "dbid") == 1 then
		setObjectBreakable(v, false)
	end
end

--[[
addEventHandler( "onClientElementStreamIn", getRootElement( ),
function ( )
	 if getElementType( source ) == "player" then
		if getElementData(source, "fuel_gun") or false then 
			linesX,linesY,linesZ = getElementPosition(getElementData(source, "fuel_element"))
			--fuelGun = createObject(14463,0,0,0)
			--exports.bone_attach:attachElementToBone(fuelGun,source,12,0,0,0.06,-180,0,0)
			--triggerServerEvent("syncPlayereffect", source, source, false)
		end
	 end
end)]]--

addEventHandler("onClientRender", root, function ()
	for i, v in ipairs (getElementsByType("player")) do 
		if v and getElementData(v, "fuel_gun") or false and getElementData(v, "fuel_element") and v ~= localPlayer then 
			linesX,linesY,linesZ = getElementPosition(getElementData(v, "fuel_element"))
			playersX, playersY, playersZ = getPedBonePosition(v, 25)
			dxDrawLine3D (linesX,linesY,linesZ, playersX, playersY, playersZ, tocolor ( 0,0,0,255 ), 1.5)
		end
	end
end)

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


function dxDrawSpeedo ()
		local car = getPedOccupiedVehicle ( localPlayer )
			if ( isElement ( car ) ) then
				fuel = getElementData ( car, "veh:fuel" )				

				if not fuel then
					setElementData ( car, "veh:fuel", 75 )
				end
				local fuel2 = math.floor ( fuel )
				if ( tonumber(fuel2) <= 0 and getVehicleEngineState ( car ) ) then
					setVehicleEngineState ( car, false )
					exports.san_hud:dm("Seu veiculo esta sem gasolina!", 255, 125, 0)
			end
		end
end
addEventHandler ( "onClientPreRender", root, dxDrawSpeedo )


addCommandHandler ( "gvc",
    function ( )
        local theVehicle = getPedOccupiedVehicle ( localPlayer )
        if ( theVehicle ) then
            for k in pairs ( getVehicleComponents ( theVehicle ) ) do
                outputChatBox ( k )
            end
        end
    end
)
