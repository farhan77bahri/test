--[[
local screenW,screenH = guiGetScreenSize()
local resW, resH = 1280,720
local achx, achy =  (screenW/resW), (screenH/resH)
local menu      = {}
local showBind  = {}
local showImage = {} 

local font = "default"--dxCreateFont("files/calibri.ttf",12)

addEventHandler("onClientRender", root, 
function ()
	 if showImage[localPlayer] then
	     if (menu[localPlayer] == 1) then
             dxDrawText("Pressione #7cc576'E' #FFFFFFpara oferecer sua droga ao #7cc576NPC", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
	     if (menu[localPlayer] == 2) then
             dxDrawText("Convencendo o #7cc576NPC #FFFFFFa comprar.", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
		 if (menu[localPlayer] == 3) then
             dxDrawText("#7cc576[NPC] #FFFFFFRecusou sua Oferta", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
	     if (menu[localPlayer] == 4) then
             dxDrawText("#7cc576[NPC] #FFFFFFComprou sua droga.", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
		 if (menu[localPlayer] == 5) then
			dxDrawText("#7cc576[NPC] #FFFFFFVocê não tem drogas.", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		end
    end
end)

bindKey("E", "down", 
	function() 
		if showBind[localPlayer] then
		 menu[localPlayer] = 2
	     startRamdom ()
	     showBind[localPlayer] = false
		 setElementFrozen(localPlayer, true)
		 triggerServerEvent("startProgress", root, localPlayer, 5)
     end
end)

function startRamdom ()
	 tiemrF = setTimer(function()
		 menu[localPlayer] = nil
		 showImage[localPlayer] = false
	 end,15000,1)
	 timerS = setTimer(function()
	 local convencendo = math.random(1, 2)
		 if convencendo == 1 then
		 triggerEvent('btcMTA->#setPedDrogaPosition', localPlayer, localPlayer, menu[localPlayer])
		 triggerServerEvent('btcMTA->#giveMoneySujo', root, localPlayer)
		 setElementFrozen(localPlayer, false)
		 elseif convencendo == 2 then
		 menu[localPlayer] = 3
		 triggerEvent('btcMTA->#setPedDrogaPosition', localPlayer, localPlayer, menu[localPlayer])
		 triggerEvent('BTC:Chat', root, localPlayer)
		 setElementFrozen(localPlayer, false)
		 end
	 end,5000,1)			
end

addEvent('btc-drogaON', true)
addEventHandler('btc-drogaON', root, function(win)
showBind[win] = true
     if showBind[win] then
         showImage[win] = true
         menu[win] = 1
	 end
end)

addEvent('btc-drogaOFF', true)
addEventHandler('btc-drogaOFF', root, 
function(win)
     if isTimer (timerS) then
         killTimer(timerS)
	 end
	 if not isTimer(tiemrF) then
         showImage[win] = false
         showBind[win] = false
         menu[win] = nil
	 end
end)



addEvent('btc-drogaVendida', true)
addEventHandler('btc-drogaVendida', root, function(win)
	if source == localPlayer then
		menu[localPlayer] = 4
		tiemrF = setTimer(function()
			menu[localPlayer] = nil
			showImage[localPlayer] = false
		end,15000,1)
	end
end)

addEvent('btc-drogaVendidaErro', true)
addEventHandler('btc-drogaVendidaErro', root, function(win)
	if source == localPlayer then
		menu[localPlayer] = 5
		tiemrF = setTimer(function()
			menu[localPlayer] = nil
			showImage[localPlayer] = false
		end,15000,1)
	end
	end)

--===========================================================================================--

 local pedPosition = {
	{2467.387, -1742.941, 12.547},
	{2370.643, -1479.3, 22.99}, 
	{2233.424, -1240.359, 24.365}, 
	{2021.77, -1308.693, 19.907}, 
	{1986.605, -1308.675, 19.887}, 
	{1923.724, -1416.517, 12.57}, 
	{1570.825, -1399.525, 13.015}, 
	{1135.938, -1495.565, 21.769}, 
	{1353.857, -1775.141, 12.448},
	{2014.685, -1786.4, 12.554}, 
	{208.73, -1240.79, 77.365}, 
	{2109.192, -1000.013, 59.508}, 
	{2436.044, -1056.425, 53.344}, 
	{2798.138, -1096.675, 29.719}, 
}

local chatMenssageNo = {
     {"Hoje não parceiro... Os cana está por perto."},
     {"Ta caro demais rapais, Tu ta é doido"},
     {"Deixa pra próxima meu parceiro."},
     {"Se me vender fiado eu pego rs."},
     {"Hoje não parceiro deixa pra proxima."},
}

 local pedskin = {
     {280},
	 {282},
	 {281},
	 {284},
	 {283},
	 {285},
	 {286},
	 {288},
	 {290},
}

function exitColC ()
     if (getElementData(localPlayer, "ILEGAIS:Job") ~= 1) then
	     return
     end
   	 if (getElementData(localPlayer, "ILEGAIS:Job") == 1) then
		 setTimer(criarPedDroga, 3000, 1)
	     outputChatBox("#7cc576[TRAFICO] #FFFFFFProcurando Clientes.", 255,255,255, true)
	 end
end
addEvent('execPed', true)
addEventHandler('execPed', root, exitColC)

function criarPedDroga()
	 id = math.random(#pedPosition)
	     if isElement(pedTable) then
		     destroyElement(pedTable)
			 destroyElement(myBlip)
		 end
	     pedTable = createPed(math.random(300, 312), pedPosition[id][1], pedPosition[id][2], pedPosition[id][3]+1)
		 setElementData(pedTable, "Ped:Name", "COMPRADOR DE DROGAS")
		 triggerServerEvent("setaInfor", root, localPlayer, pedPosition[id][1], pedPosition[id][2], pedPosition[id][3])
 		 setElementData(pedTable, "JOB:Ped", true)
         myBlip = createBlipAttachedTo ( pedTable, 62 )
	     if isElement(ColTable) then
	         destroyElement(ColTable)
         end
	     ColTable = createColSphere (pedPosition[id][1], pedPosition[id][2], pedPosition[id][3], 2)
	     setElementData(ColTable, "col:pedroga", true)
	     setElementFrozen(pedTable, true)
end

function enterCol (theElement, matchingDimension)
	 if source == ColTable then	
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then outputChatBox("#7cc576[ILEGAIS] #FFFFFFSaia do veiculo para completar essa missão.", thePlayer, 255,255,255, true) return end
     	 if (getElementData(localPlayer, "ILEGAIS:Job") == 1) then
		     if ( theElement == localPlayer ) then
	             setElementData(localPlayer, 'PedDroga->Use', true)
	             triggerEvent('btc-drogaON', localPlayer, localPlayer)
			 end
		 end
     end
end
addEventHandler("onClientColShapeHit", root, enterCol)


function exitCol (theElement, matchingDimension)
	 if source == ColTable then
	     if ( theElement == localPlayer ) then
	         setElementData(localPlayer, 'PedDroga->Use', false)
	         triggerEvent('btc-drogaOFF', localPlayer, localPlayer)
		 end
     end
end
addEventHandler("onClientColShapeLeave", root , exitCol)	

addEvent('btcMTA->#setPedDrogaPosition', true)
addEventHandler('btcMTA->#setPedDrogaPosition', root, function(localPlayer, Menu)
	   criarPedDroga()
end)

addEvent('BTC:Chat', true)
addEventHandler('BTC:Chat', root, function()
	 local chatRandom = math.random(#chatMenssageNo)
	 outputChatBox("#7cc576[NPC] #FFFFFF"..chatMenssageNo[chatRandom][1], 255,255,255, true)
end)

function destroyE ()
     if isElement(ColTable) then
	     destroyElement(ColTable)
	 end
     if isElement(pedTable) then
	     destroyElement(pedTable)
	 end
end
addCommandHandler("demitir", destroyE)
--]]