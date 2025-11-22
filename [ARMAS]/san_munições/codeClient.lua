
local sx,sy = guiGetScreenSize()

local jobPed = {}
local roboto = dxCreateFont("files/Roboto.ttf",14)



local job_PedPos = {
	{110, 1369.2927246094, -1280.1383056641, 13.546875, "Munições",10, 92.36060333252,0 , 0},

	{110,2171.44140625,932.77117919922,11.096037864685, "Munições",10, 2.706371307373,0 , 0},

	{110,-2093.462890625,-2470.1955566406,30.62501335144, "Munições",10, 52.824165344238,0 , 0},

	{110, 2550.6303710938,2072.8833007813,11.106837272644, "Munições",10, 5.7543048858643,0 , 0},

	{110, 772.77239990234,1867.9357910156,5.110912322998, "Munições",10, 5.7640147209167,0 , 0},

	{110, 2324.2844238281,57.556415557861,21.573425292969, "Munições",10, 91.535423278809,0 , 0},
	
	{110, 295.856, -40.679, 1001.516, "Munições",10, 6.563, 3, 1},

	{280, 1778.8646240234,823.80560302734,17.264749526978, "Polícia Rodoviária Federal BASE 1",10, 311.35882568359,0 , 0},

	{280, 650.89178466797,284.32348632813,20.855363845825, "Polícia Rodoviária Federal BASE 2",10, 83.269836425781,0 , 0},
	
	{280, -246.18525695801,291.75750732422,13.255365371704, "Polícia Rodoviária Federal BASE 3",10, 207.40281677246,0 , 0},	
	
	{280, -1807.3980712891,-611.72766113281,17.555364608765, "Polícia Rodoviária Federal BASE 4",10, 309.18664550781,0 , 0},

	{280, -1937.4826660156,2386.6372070313,58.686317443848, "Polícia Rodoviária Federal BASE 5",10, 200.22041320801,0 , 0},
	
	
	
	-- {2, 2035.3885498047, -2448.5388183594, 13.611819267273, "PentiX egy köcsög buzi aki kitörölte a városháza mappot...."},
}
local startTick = getTickCount()
local progress = ""
local elements = ""

local jobs_Table = { -- Munak neve, Munak leírása, Kép neve, munka ID 
	{"Pistola", "pistola", 155, 50, 20}, 
	{"SubMetralhadora", "submetralhadora", 308, 50, 50},
	{"Fuzil", "fuzil", 177, 50, 70}, 
	{"Shotgun", "shotgun", 61, 50, 60}, 
	{"Sniper", "sniper", 37, 50, 100}, 
	--{"Minerador", "Minerador", 260, 20},  
}
local maxElem = 6
local nextPage = 0
local show = false

function createPeds() 
	for index,value in ipairs (job_PedPos) do
		if isElement(jobPed[index]) then destroyElement(jobPed[index]) end
		jobPed[index] = createPed(value[1], value[2], value[3], value[4])
		local blip = createBlipAttachedTo ( jobPed[index], 6 )
		setElementData(blip ,"blip >> name", "Munições de armas")
		setElementDimension(jobPed[index], value[9])
		setElementInterior(jobPed[index], value[8])
		setPedRotation(jobPed[index], value[7])
		setElementFrozen(jobPed[index], true)
		jobPed[index]:setData("ped:amunation", true)
		jobPed[index]:setData("Ped:Name",value[5])
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), createPeds)
createPeds()

addEventHandler ( "onClientPedDamage", getRootElement(), 
	function ()
		if getElementData(source,"ped:amunation") then
			cancelEvent ()
		end
	end
)

function createPanel()
	local jX, jY, jZ = getElementPosition(getLocalPlayer())
	local bX, bY, bZ = getElementPosition(elements)
	if (getDistanceBetweenPoints3D(jX, jY, jZ, bX, bY, bZ) > 5 ) then removeEventHandler("onClientRender", root, createPanel) removeEventHandler("onClientKey",root,keyControl) show = false return end
	dxDrawRectangle(sx/2-200,sy/2-250,400,500,tocolor(0,0,0,240))
	dxDrawText("BGO#7cc576MTA #FFFFFF- Munições",sx/2-195,sy/2-233,sx/2-195,sy/2-233,tocolor(255,255,255,255),1,roboto,"left","center",false,false,false,true)
	--outputChatBox(tostring(getElementData(localPlayer,"job")))  -----------------DEBUG
	local elem = 0
	for index, value in ipairs (jobs_Table) do 
		if (index > nextPage and elem < maxElem) then
			elem = elem + 1
			local text = ""
			local r, g, b = 124, 197, 118
				text = "Comprar\nR$:"..jobs_Table[index][5]..""
				r, g, b = 124, 197, 118
			
			
		if isInSlot(sx/2+200-60,sy/2-280,60,20) then
			dxDrawRectangle(sx/2+200-60,sy/2-280,60,20,tocolor(205,92,92,255))
		else
			dxDrawRectangle(sx/2+200-60,sy/2-280,60,20,tocolor(205,92,82,100))
		end
		dxDrawText("Fechar",sx/2+149,sy/2-280,sx,sy,tocolor(0,0,0,255),0.7,roboto,"left")
		
		

			dxDrawText(value[1].." - ( #00ff00Quant: "..jobs_Table[index][4].." #ffffff)", sx/2-190, sy/2.7-100+elem*(60), sx/2, 0, tocolor(255, 255, 255, 255), 0.89, roboto, "left", "top", false, false, false, true)

			if isInSlot(sx/2+70, sy/2.8-95+elem*(60), 120, 40) then
				dxDrawRectangle(sx/2+70, sy/2.8-95+elem*(60), 120, 40, tocolor(r, g, b, 255))
			else
				dxDrawRectangle(sx/2+70, sy/2.8-95+elem*(60), 120, 40, tocolor(r, g, b, 150))
			end
			--dxDrawText(text, sx/2-195, sy/1.7-100+elem*(60), sx/2, 0, tocolor(255, 0, 0, 255), 0.89, roboto, roboto, "left", "top", false, false, false, true)


			dxDrawText(text, sx/2+260, sy/2.8-96+elem*(60), sx/2, 0, tocolor(255, 255, 255, 255), 0.89, roboto, "center", "top", false, false, false, true)
		end
	end
end

local altura = 0
addEventHandler("onClientClick", root, function (button, state, x, y, elementx, elementy, elementz, element)
	if element and element:getData("ped:amunation") and not show then 
		if state == "down" and button == "right" then 
			local x, y, z = getElementPosition(getLocalPlayer())
			if getDistanceBetweenPoints3D(x, y, z, elementx, elementy, elementz) <= 5 then 
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
	elseif state == "down" and button == "left" and show then 
	if isInSlot(sx/2+200-60,sy/2-280,60,20) then
	removeEventHandler("onClientRender", root, createPanel)
	removeEventHandler("onClientKey",root,keyControl)
	show = false
	elements = nil
	end
	
		elem = 0
		for index, value in ipairs (jobs_Table) do 
			if (index > nextPage and elem < maxElem) then
				elem = elem + 1
				--if isInSlot(sx/2+70, sy/2.8-95+elem*(60), 120, 40) then 
				if dobozbaVan(sx/2+70, sy/2.8-95+elem*(60), 120, 40, x, y) then 
					triggerServerEvent("municaoBTC", localPlayer, jobs_Table[index][2], jobs_Table[index][4], jobs_Table[index][5])
						--exports.bgo_infobox:addNotification("Você saiu com sucesso do "..jobs_Table[index][1].."!","success")
					currentjob = jobs_Table[index][2]
				end
			end
		end
		end
		--triggerServerEvent("updateJobToServer", localPlayer, currentjob)
end)

function keyControl(k, s)
	if k == "mouse_wheel_up" then
		if(nextPage>0)then
			nextPage = nextPage - 1
		end
	elseif k == "mouse_wheel_down" then
		nextPage = nextPage + 1
		if(nextPage > #jobs_Table-maxElem)then
			nextPage = #jobs_Table-maxElem
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











addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), 
function (weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
if weapon == 22 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-pistola")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-pistola", 0)
else
	setElementData(localPlayer, "balas-pistola", getElementData(localPlayer, "balas-pistola") - 1)
end


elseif weapon == 23 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-pistola")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-pistola", 0)
else
	setElementData(localPlayer, "balas-pistola", getElementData(localPlayer, "balas-pistola") - 1)
end


elseif weapon == 24 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-pistola")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-pistola", 0)
else
	setElementData(localPlayer, "balas-pistola", getElementData(localPlayer, "balas-pistola") - 1)
end




	elseif weapon == 25 and getElementType(localPlayer)=="player" then 
	local allammo = getElementData(localPlayer, "balas-shotgun")
	if (allammo < 2) then
	outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-shotgun", 0)
	else
	setElementData(localPlayer, "balas-shotgun", getElementData(localPlayer, "balas-shotgun") - 1)
	end



elseif weapon == 26 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-shotgun")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-shotgun", 0)
else
setElementData(localPlayer, "balas-shotgun", getElementData(localPlayer, "balas-shotgun") - 1)
end



elseif weapon == 27 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-shotgun")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-shotgun", 0)
else
setElementData(localPlayer, "balas-shotgun", getElementData(localPlayer, "balas-shotgun") - 1)
end







	elseif weapon == 28 and getElementType(localPlayer)=="player" then 
	local allammo = getElementData(localPlayer, "balas-submetralhadora")
	if (allammo < 2) then
	outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-submetralhadora", 0)
	else
	setElementData(localPlayer, "balas-submetralhadora", getElementData(localPlayer, "balas-submetralhadora") - 1)
	end

elseif weapon == 29 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-submetralhadora")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-submetralhadora", 0)
else
setElementData(localPlayer, "balas-submetralhadora", getElementData(localPlayer, "balas-submetralhadora") - 1)
end


elseif weapon == 32 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-submetralhadora")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-submetralhadora", 0)
else
setElementData(localPlayer, "balas-submetralhadora", getElementData(localPlayer, "balas-submetralhadora") - 1)
end





	elseif weapon == 30 and getElementType(localPlayer)=="player" then 
	local allammo = getElementData(localPlayer, "balas-fuzil")
	if (allammo < 2) then
	outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-fuzil", 0)
	else
	setElementData(localPlayer, "balas-fuzil", getElementData(localPlayer, "balas-fuzil") - 1)
	end

elseif weapon == 31 and getElementType(localPlayer)=="player" then 

local allammo = getElementData(localPlayer, "balas-fuzil")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-fuzil", 0)
else
setElementData(localPlayer, "balas-fuzil", getElementData(localPlayer, "balas-fuzil") - 1)
end


elseif weapon == 33 and getElementType(localPlayer)=="player" then 
local allammo = getElementData(localPlayer, "balas-sniper")
if (allammo < 2) then
outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
setElementData(localPlayer, "char:weaponGettin", false)
triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
setElementData(localPlayer, "balas-sniper", 0)
else
setElementData(localPlayer, "balas-sniper", getElementData(localPlayer, "balas-sniper") - 1)
end


	elseif weapon == 34 and getElementType(localPlayer)=="player" then 
	local allammo = getElementData(localPlayer, "balas-sniper")
	if (allammo < 2) then
	outputChatBox("Sua munição acabou!!",  255, 255, 255, true)
	setElementData(localPlayer, "char:weaponInHand", {-1, -1, -1})
	setElementData(localPlayer, "char:weaponGettin", false)
	triggerServerEvent("toggleGun",localPlayer, localPlayer, wslot, witem)
	setElementData(localPlayer, "balas-sniper", 0)
	else
	setElementData(localPlayer, "balas-sniper", getElementData(localPlayer, "balas-sniper") - 1)
	end
	end
end)


















toggleControl("next_weapon", false)
toggleControl("previous_weapon", false)

setTimer(function()
	if not toggleControl("next_weapon", false) then
		toggleControl("next_weapon", false)
	end
	
	if not toggleControl("previous_weapon", false) then
		toggleControl("previous_weapon", false)
	end
end, 1000, 1)


--[[
function packetLossCheck()
    local packet = getNetworkStats()["packetlossLastSecond"]   
	if (packet > 15) then
		local random = math.random(5, 10)
		packetTimer = setTimer(function() end, 1000*random, 1) --- spam védelem

		toggleAllControls ( false )

	
	else
		

    end
end
setTimer(packetLossCheck, 50, 0)]]--


--[[
function packetLossCheck()
	local loss = getNetworkStats()["packetlossLastSecond"]
	if (loss > 15) then
		--outputChatBox("Perda de pacotes detectada durante a comunicação com o servidor, a jogabilidade pode ser afetada", 255, 0, 0)
		--toggleAllControls (true )
		toggleAllControls ( false )	
	else
		toggleAllControls ( true )
	end
end
setTimer(packetLossCheck, 50, 0)
]]--




toggleControl("next_weapon", false)
toggleControl("previous_weapon", false)

setTimer(function()
	if not toggleControl("next_weapon", false) then
		toggleControl("next_weapon", false)
	end
	
	if not toggleControl("previous_weapon", false) then
		toggleControl("previous_weapon", false)
	end
end, 1000, 0)




frozen = false -- This variable stores whether or not the script is going to freeze them.
-- If they were already frozen then don't unfreeze them when the interruption ends to avoid conflicts with other scripts.
function handleInterrupt( status, ticks )
	if (status == 0) then
		--outputDebugString( "(packets from server) interruption began " .. ticks .. " ticks ago" )
		if (not isElementFrozen(localPlayer)) then
			setElementFrozen(localPlayer, true) -- Freeze them to prevent them abusing the network interruption
			toggleAllControls ( false )
			frozen = true
		end
	elseif (status == 1) then
		--outputDebugString( "(packets from server) interruption began " .. ticks .. " ticks ago and has just ended" )
		if (frozen) then
			setElementFrozen(localPlayer, false) -- If we froze them, unfreeze them now.
			toggleAllControls ( true )
			frozen = false
		end
	end
end
addEventHandler( "onClientPlayerNetworkStatus", root, handleInterrupt)


