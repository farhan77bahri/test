local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366, 768
local x, y =  (screenW/resW), (screenH/resH)

addEventHandler("onClientKey", root, 
	function (button, press)
		if dxReason == true then
			if button == "F1" or button == "F2" or button == "F3" or button == "F4" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" or button == "F12" or button == "t" or button == "p" then
				cancelEvent()
			end
		end
	end
)

status1 = "Lock"
status2 = "Lock"
status3 = "Lock"
status4 = "Lock"
status5 = "Lock"
status6 = "Lock"
status7 = "Lock"
status8 = "Lock"
status9 = "(Close)"
status10 = "(Close)"
status11 = "(Close)"
status12 = "Lock"

function texto ()
   	 if ( getDistanceBetweenPoints3D ( 1880.4525146484 + 0.5, -1654.7144775391, 16.05736160278 + 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1880.4525146484 + 0.5, -1654.7144775391, 16.05736160278 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo2")) then
	   	         dxDrawText(" [E] Ra Bezanid "..status2, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
	     end
	end 
end
addEventHandler("onClientRender",root,texto)

function texto2 ()
   	 if ( getDistanceBetweenPoints3D ( 1877.5559082031, -1645.1364746094 + 0.5, 16.06547927856 + 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition ( 1877.5559082031, -1645.1364746094+0.5, 16.06547927856 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo")) then
	   	         dxDrawText("[E] Ra Bezanid "..status1, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto2)

-----------dar3

function texto3 ()
   	 if ( getDistanceBetweenPoints3D ( 1880.4523925781 + 0.5, -1650.16882324 , 16.057256698608 + 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition ( 1880.4523925781 + 0.5, -1650.16882324 , 16.057256698608 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo3")) then
	   	         dxDrawText("[E] Ra Bezanid "..status3, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto3)


---------dar4


function texto4 ()
   	 if ( getDistanceBetweenPoints3D ( 1880.4530029297 + 0.5, -1648.5120849609, 16.057220458984 + 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1880.4530029297 + 0.5, -1648.5120849609, 16.057220458984 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo4")) then
	   	         dxDrawText("[E] Ra Bezanid "..status4, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto4)


---------dar5


function texto5 ()
   	 if ( getDistanceBetweenPoints3D ( 1876.2141113281, -1658.4460449219 - 0.5, 16.069633483887 + 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1876.2141113281, -1658.4460449219 - 0.5, 16.069633483887 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo5")) then
	   	         dxDrawText("[E] Ra Bezanid "..status5, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto5)



---------dar6


function texto6 ()
   	 if ( getDistanceBetweenPoints3D ( 1877.6430664062, -1658.4466552734 - 0.5, 16.05791854858+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1877.6430664062, -1658.4466552734 - 0.5, 16.05791854858 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo6")) then
	   	         dxDrawText("[E] Ra Bezanid "..status6, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto6)



---------dar7


function texto7 ()
   	 if ( getDistanceBetweenPoints3D ( 1873.4776611328 -0.5, -1663.6452636719, 15.9760580062+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1873.4776611328-0.5, -1663.6452636719, 15.9760580062 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo7")) then
	   	         dxDrawText("[E] Ra Bezanid "..status7, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto7)




---------dar8


function texto8 ()
   	 if ( getDistanceBetweenPoints3D ( 1873.4781494141-0.5, -1665.1072998047, 15.976089477539+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1873.4781494141-0.5, -1665.1072998047, 15.976089477539 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo8")) then
	   	         dxDrawText("[E] Ra Bezanid "..status8, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto8)


---------dar9


function texto9 ()
   	 if ( getDistanceBetweenPoints3D ( 1894.9560546875, -1649.5515136719, 9.9139432907104+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1894.9560546875, -1649.5515136719, 9.9139432907104 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo9")) then
	   	         dxDrawText("[E] Ra Bezanid "..status9, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto9)

---------dar10


function texto10 ()
   	 if ( getDistanceBetweenPoints3D ( 1894.8890380859, -1654.4854736328, 9.9142456054688+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1894.8890380859, -1654.4854736328, 9.9142456054688 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo10")) then
	   	         dxDrawText("[E] Ra Bezanid "..status10, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto10)

---------dar11


function texto11 ()
   	 if ( getDistanceBetweenPoints3D ( 1894.8646240234, -1659.5842285156, 9.9144306182861+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1894.8646240234, -1659.5842285156, 9.9144306182861 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo11")) then
	   	         dxDrawText("[E] Ra Bezanid "..status11, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto11)



--------dar12


function texto12 ()
   	 if ( getDistanceBetweenPoints3D ( 1656.1223144531, -1352.2889404297, 17.590625762939+ 0.5, getElementPosition ( localPlayer ) ) ) < 20 then
   	 local coords = { getScreenFromWorldPosition (1656.1223144531, -1352.2889404297, 17.590625762939 + 0.5 ) }
   	     if coords[1] and coords[2] then
		     if (getElementData(localPlayer, "zoneInfo12")) then
	   	         dxDrawText("[E] Ra Bezanid "..status12, coords[1], coords[2], coords[1], coords[2], tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false,  true, false)
		     end
		end
	end 
end
addEventHandler("onClientRender",root,texto12)

function info (mode, number)
     if number == 1 then
	     status1 = mode 
	 end
     if number == 2 then
	     status2 = mode 
	 end
	 if number == 3 then
	     status3 = mode 
	 end
	 if number == 4 then
	     status4 = mode 
	 end
	  if number == 5 then
	     status5 = mode 
	 end
	  if number == 6 then
	     status6 = mode 
	 end
	 if number == 7 then
	     status7 = mode 
	 end
	 if number == 8 then
	     status8 = mode 
	 end
	 if number == 9 then
	     status9 = mode 
	 end
	 if number == 10 then
	     status10 = mode 
	 end
	 if number == 11 then
	     status11 = mode 
	 end
	 if number == 12 then
	     status12 = mode 
	 end
end
addEvent("gateStatus", true)
addEventHandler("gateStatus", root, info)



--[[

local cela2 = createColCuboid(1573.48291, -1694.99792, 12.58994, 4.896484375, 3.873291015625, 3.4000476837158)
function ColShapeHit2 ( )	
	count = {}
for i,v in pairs(getElementsWithinColShape(cela2,"player")) do
	table.insert(count,v)
end
for theKey,player in ipairs(count) do
	if getElementData(player, "adminjail") == 1 then
	outputChatBox ( getPlayerName(player).." Está na cela numero 2 Preso: SIM", 255,255,255, true)
	end
	if getElementData(player, "adminjail") == 0 then
	outputChatBox ( getPlayerName(player).." Está na cela numero 2 Preso: NÃO", 255,255,255, true)
	end
end
--ID: "..getElementData(player, "char:id").."
end
addCommandHandler("cela2", ColShapeHit2)




local zone = createColCuboid(1578.56604, -1694.82373, 12.58994, 4.164794921875, 4.400634765625, 3.7000440597534)
function ColShapeHit ()	
	count = {}
for i,v in pairs(getElementsWithinColShape(zone,"player")) do
	table.insert(count,v)
end
for theKey,player in ipairs(count) do
	if getElementData(player, "adminjail") == 1 then
	outputChatBox ( getPlayerName(player).." Está na cela numero 1 Preso: SIM", 255,255,255, true)
	end
	if getElementData(player, "adminjail") == 0 then
	outputChatBox ( getPlayerName(player).." Está na cela numero 1 Preso: NÃO", 255,255,255, true)
	end
end
--ID: "..getElementData(player, "char:id").."
end
addCommandHandler("cela1", ColShapeHit)


]]--
local zone = createColCuboid(1877.5635986328, -1645.1346435547, 16.065456390, 8.8319091796875, 4.139404296875, 4.6000074386597)

local sx,sy = guiGetScreenSize()

local jobPed = {}
local roboto = dxCreateFont("Roboto.ttf",14)


--[[
local job_PedPos = {
	{281, 1566.3446044922, -1667.3103027344, 17.589937210083, "Prisão",267.76580810547},
}
local startTick = getTickCount()
local progress = ""
local elements = ""

local maxElem = 6
local nextPage = 0
local show = false

function createPeds() 
	for index,value in ipairs (job_PedPos) do
		if isElement(jobPed[index]) then destroyElement(jobPed[index]) end
		jobPed[index] = createPed(value[1], value[2], value[3], value[4])
		setElementFrozen(jobPed[index], true)

		setPedRotation(jobPed[index], value[6])

		jobPed[index]:setData("ped:job2", true)
		jobPed[index]:setData("Ped:Name",value[5])
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), createPeds)
createPeds()

addEventHandler ( "onClientPedDamage", getRootElement(), 
	function ()
		if getElementData(source,"ped:job2") then
			cancelEvent ()
		end
	end
)

Boxtime = guiCreateEdit(x*595, y*430, 74, 24, "", false)
Boxreason = guiCreateEdit(x*700, y*430, 212, 25, "", false)  
guiSetVisible(Boxtime, false) 
guiSetVisible(Boxreason, false) 

function createPanel()
	local jX, jY, jZ = getElementPosition(getLocalPlayer())
	local bX, bY, bZ = getElementPosition(elements)
	if (getDistanceBetweenPoints3D(jX, jY, jZ, bX, bY, bZ) > 5 ) then removeEventHandler("onClientRender", root, createPanel) 
	removeEventHandler("onClientKey",root,keyControl) 
	show = false 
	return 
end

	dxDrawRectangle(sx/2-200,sy/2-250,400,500,tocolor(0,0,0,240))
	dxDrawText("BGO#7cc576MTA #FFFFFF- Prisão",sx/2-195,sy/2-233,sx/2-195,sy/2-233,tocolor(255,255,255,255),1,roboto,"left","center",false,false,false,true)

	if isInSlot(sx/2+200-60,sy/2-280,60,20) then
		dxDrawRectangle(sx/2+200-60,sy/2-280,60,20,tocolor(205,92,92,255))
	else
		dxDrawRectangle(sx/2+200-60,sy/2-280,60,20,tocolor(205,92,82,100))
	end
	dxDrawText("Fechar",sx/2+149,sy/2-280,sx,sy,tocolor(0,0,0,255),0.7,roboto,"left")

	local elem = 0
	--for index, value in ipairs (jobs_Table) do 

		count = {}
		for i,v in pairs(getElementsWithinColShape(zone,"player")) do
			table.insert(count,v)
		end
		for index, value in ipairs(count) do


		if (index > nextPage and elem < maxElem) then
			elem = elem + 1
			local text = ""
			local r, g, b = 124, 197, 118
				text = "Prender"
			


	
			dxDrawText(getPlayerName(value).."", sx/2-190, sy/2.7-100+elem*(60), sx/2, 0, tocolor(255, 255, 255, 255), 0.89, roboto, "left", "top", false, false, false, true)




			if isInSlot(sx/2+70, sy/2.8-95+elem*(60), 120, 40) then
				dxDrawRectangle(sx/2+70, sy/2.8-95+elem*(60), 120, 40, tocolor(r, g, b, 255))
			else
				dxDrawRectangle(sx/2+70, sy/2.8-95+elem*(60), 120, 40, tocolor(r, g, b, 150))
			end
			dxDrawText(text, sx/2+260, sy/2.7-100+elem*(60), sx/2, 0, tocolor(255, 255, 255, 255), 0.89, roboto, "center", "top", false, false, false, true)
		end
	end
end

local altura = 0
addEventHandler("onClientClick", root, function (button, state, x, y, elementx, elementy, elementz, element)
	if element and element:getData("ped:job2") and not show then 
		if state == "down" and button == "right" then 
			local x, y, z = getElementPosition(getLocalPlayer())
			if getDistanceBetweenPoints3D(x, y, z, elementx, elementy, elementz) <= 5 then 

				if getElementData(localPlayer, "char:adminduty") == 1 or getElementData(localPlayer, "char:dutyfaction") == 17 or getElementData(localPlayer, "char:dutyfaction") == 24 or  getElementData(localPlayer, "char:dutyfaction") == 22 or getElementData(localPlayer, "char:dutyfaction") == 2 or getElementData(localPlayer, "char:dutyfaction") == 16 or getElementData(localPlayer, "char:dutyfaction") == 11 or getElementData(localPlayer, "char:dutyfaction") == 19 or getElementData(localPlayer, "char:dutyfaction") == 6 or getElementData(localPlayer, "char:dutyfaction") == 5 or getElementData(localPlayer, "char:dutyfaction") == 5  or getElementData(localPlayer, "char:dutyfaction") == 21 or getElementData(localPlayer, "char:dutyfaction") == 18 or getElementData(localPlayer, "char:dutyfaction") == 20 then
	

				startTick = getTickCount()
				progress = "OutBack"
				removeEventHandler("onClientRender", root, createPanel)
				addEventHandler("onClientRender", root, createPanel)
				removeEventHandler("onClientKey",root,keyControl)
				addEventHandler("onClientKey",root,keyControl)
				show = true
				elements = element
			end
		end
	end
	elseif state == "down" and button == "left" and show then 
	if isInSlot(sx/2+200-60,sy/2-280,60,20) then
	removeEventHandler("onClientRender", root, createPanel)
	removeEventHandler("onClientKey",root,keyControl)
	show = false
	elements = nil

	end
		elem = 0

		count = {}
		for i,v in pairs(getElementsWithinColShape(zone,"player")) do
			table.insert(count,v)
		end
		for index, value in ipairs(count) do

		--for index, value in ipairs (jobs_Table) do 
			if (index > nextPage and elem < maxElem) then
				elem = elem + 1
				if dobozbaVan(sx/2+70, sy/2.8-95+elem*(60), 120, 40, x, y) then 

					 local tempo = 5
					 local motivo = "teste" 
					 presoPlayer = value
					 guiSetVisible(Boxtime, true) 
                     guiSetVisible(Boxreason, true) 
					 addEventHandler("onClientRender", root, dxReasonn)
					 dxReason = true
					 show = false
					 removeEventHandler("onClientRender", root, createPanel)
				end
			end
		end
		end
		--triggerServerEvent("updateJobToServer", localPlayer, currentjob)
end)

dxReason = false
cor = {} 

function dxReasonn ()
	local jX, jY, jZ = getElementPosition(getLocalPlayer())
	local bX, bY, bZ = getElementPosition(elements)
	if (getDistanceBetweenPoints3D(jX, jY, jZ, bX, bY, bZ) > 5 ) then removeEventHandler("onClientRender", root, createPanel) 
	guiSetText (Boxtime, "")
	guiSetText (Boxreason, "")
	guiSetVisible(Boxtime, false) 
	guiSetVisible(Boxreason, false) 
	removeEventHandler("onClientRender", root, dxReasonn)
	dxReason = false
	return 
end

         cor[1] = tocolor(183, 0, 0, 180)
     	 if isInSlot(screenW * 0.6094, screenH * 0.5102, screenW * 0.0156, screenH * 0.0241) then cor[1] = tocolor(183, 0, 0, 255) end
		 
         cor[2] = tocolor(254, 255, 255, 86)
     	 if isInSlot(screenW * 0.4063, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222) then cor[2] = tocolor(254, 255, 255, 200) end
         cor[3] = tocolor(254, 255, 255, 86)
     	 if isInSlot(screenW * 0.4703, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222) then cor[3] = tocolor(254, 255, 255, 200) end

        dxDrawRectangle(screenW * 0.4016, screenH * 0.5093, screenW * 0.2255, screenH * 0.1306, tocolor(1, 0, 0, 159), false)
        dxDrawRectangle(screenW * 0.4016, screenH * 0.5102, screenW * 0.2234, screenH * 0.0241, tocolor(1, 0, 0, 159), false)
        dxDrawText("PRISÂO TOP CITY - BTC", screenW * 0.4104, screenH * 0.5093, screenW * 0.5594, screenH * 0.5343, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.6094, screenH * 0.5102, screenW * 0.0156, screenH * 0.0241, cor[1], false)
        dxDrawText("X", screenW * 0.6094, screenH * 0.5102, screenW * 0.6245, screenH * 0.5343, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("Preencha os dados abaixo", screenW * 0.4016, screenH * 0.5398, screenW * 0.6250, screenH * 0.5556, tocolor(255, 255, 255, 140), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.4052, screenH * 0.5620, screenW * 0.0682, screenH * 0.0231, tocolor(0, 0, 0, 98), false)
        dxDrawText("TEMPO:", screenW * 0.4099, screenH * 0.5602, screenW * 0.4276, screenH * 0.5852, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.4813, screenH * 0.5620, screenW * 0.1406, screenH * 0.0231, tocolor(0, 0, 0, 98), false)
        dxDrawText("MOTIVO:", screenW * 0.4844, screenH * 0.5602, screenW * 0.5021, screenH * 0.5852, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawRectangle(screenW * 0.4063, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222, cor[2], true)
        dxDrawRectangle(screenW * 0.4703, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222, cor[3], true)
        dxDrawText("CANCELAR", screenW * 0.4057, screenH * 0.6083, screenW * 0.4651, screenH * 0.6306, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("CONCLUIR", screenW * 0.4703, screenH * 0.6083, screenW * 0.5292, screenH * 0.6306, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
end

function setJailed(button, state)
	 if dxReason and button == "left" and state == "down" then
	     if isInSlot(screenW * 0.4703, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222) then
         getTime = guiGetText (Boxtime)
		 getReason = guiGetText (Boxreason)
             if not (getTime ~= "") then
			     outputChatBox("#FFA000*BGO ERROR #FFFFFFAdicione um tempo de prisão para finalizar essa etapa", 255,255,255, true)
			     return
			 end
			     getTime = math.floor(getTime)
			     if not (getTime > 0) then
			         outputChatBox("#FFA000*BGO ERROR #FFFFFFO tempo deve ser igual ou maior doque #FFA0001 Minuto#FFFFFF.", 255,255,255, true)
			         return
			     end
	    			 if not (getReason ~= "") then
		     	          outputChatBox("#FFA000*BGO ERROR #FFFFFFAdicione um motivo para prisão.", 255,255,255, true)
			             return
			         end
		    			 triggerServerEvent("prendendo", localPlayer, localPlayer, presoPlayer, getTime, getReason)
						 exports.btc_hud:dm("Jogador preso com sucesso.", localPlayer, 0,255, 0 )
						 outputChatBox("#FFA000*BTC SUCESS #FFFFFFJogador preso com #FFA000Sucesso#FFFFFF.", 255,255,255, true)
	    				 guiSetText (Boxtime, "")
	    				 guiSetText (Boxreason, "")
	    				 guiSetVisible(Boxtime, false) 
	    				 guiSetVisible(Boxreason, false) 
	    				 removeEventHandler("onClientRender", root, dxReasonn)
		       			 dxReason = false
		    			 removeEventHandler("onClientRender", root, createPanel)
		    			 removeEventHandler("onClientKey",root,keyControl)
		    			 show = false
		    			 elements = nil
	     elseif isInSlot(screenW * 0.4063, screenH * 0.6083, screenW * 0.0589, screenH * 0.0222) then
             removeEventHandler("onClientRender", root, dxReasonn)
			 dxReason = false
			 addEventHandler("onClientRender", root, createPanel)
			 show = true
			 guiSetVisible(Boxtime, false) 
             guiSetVisible(Boxreason, false) 
	     elseif isInSlot(screenW * 0.6094, screenH * 0.5102, screenW * 0.0156, screenH * 0.0241) then
             removeEventHandler("onClientRender", root, dxReasonn)
			 dxReason = false
			 addEventHandler("onClientRender", root, createPanel)
			 show = true
			 guiSetVisible(Boxtime, false) 
             guiSetVisible(Boxreason, false) 
       	 end
     end
end
addEventHandler("onClientClick", root, setJailed)

function keyControl(k, s)
	if k == "mouse_wheel_up" then
		if(nextPage>0)then
			nextPage = nextPage - 1
		end
	elseif k == "mouse_wheel_down" then
		count = {}
		for i,v in pairs(getElementsWithinColShape(zone,"player")) do
			table.insert(count,v)
		end
		for index, value in ipairs(count) do
		nextPage = nextPage + 1
		if(nextPage > index-maxElem)then
			nextPage = index-maxElem
		end

	end
	elseif k == "backspace" then
		removeEventHandler("onClientRender", root, createPanel)
		removeEventHandler("onClientKey",root,keyControl)
		show = false
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

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end
]]