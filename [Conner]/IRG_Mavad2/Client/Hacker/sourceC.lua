--[[
local screenW, screenH   = guiGetScreenSize()
local resW2, resH2       = 1280,720
local x, y               = (screenW/resW2), (screenH/resH2)

menu      = {}
showBind  = {}
showImage = {} 

local font = "default"

addEventHandler("onClientRender", root, 
function ()
	 if showImage[localPlayer] then
	     if (menu[localPlayer] == 1) then
             dxDrawText("Pressione #7cc576'E' #FFFFFFpara fazer o desovamento do #7cc576CORPO", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
	     if (menu[localPlayer] == 2) then
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 exports["sanBlur"]:dxDrawBluredRectangle(x*0, y*300, x*1280, y*720, tocolor(255,255,255))
			 dxDrawText("Desovando o #7cc576CORPO#FFFFFF, Aguarde...", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
	     if (menu[localPlayer] == 3) then
             dxDrawText("#7cc576CORPO #FFFFFFDesovado com sucesso.", screenW * 0.3203, screenH * 0.6546, screenW * 0.7000, screenH * 0.6880, tocolor(255, 255, 255, 255), 2.00, font, "center", "center", false, false, false, true, false)
		 end
    end
end)

bindKey("E", "down", 
	function() 
		if showBind[localPlayer] then
		 menu[localPlayer] = 2
	     startFunction ()
	     showBind[localPlayer] = false
		 setElementFrozen(localPlayer, true)
		 triggerServerEvent("Anim", root, localPlayer)
		 triggerServerEvent("startLoadOrg", root, localPlayer)
     end
end)

addEvent("cancelMissoes", true)
addEventHandler("cancelMissoes", root,
function ()
     if showImage[localPlayer] then
		 menu[localPlayer] = nil
		 showImage[localPlayer] = false
     end	 
end)

function startFunction ()
	 tiemrF = setTimer(function()
		 menu[localPlayer] = nil
		 showImage[localPlayer] = false
	 end,20000,1)
	 setTimer(function()
		 menu[localPlayer] = 3
	 end,15000,1)
	 timerS = setTimer(function()
	     
	 end,5000,1)			
end

addEvent('infoOrg', true)
addEventHandler('infoOrg', root, function(win)
showBind[win] = true
     if showBind[win] then
      showImage[win] = true
      menu[win] = 1
	 end
end)

addEvent('infoOrg-Off', true)
addEventHandler('infoOrg-Off', root, 
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

addEventHandler( "onClientResourceStart", getRootElement( ),
    function ()
	txd_floors = engineLoadTXD ( "model/drill.txd" )
	engineImportTXD ( txd_floors, 1548 )
	dff_floors = engineLoadDFF ( "model/drill.dff" )
	engineReplaceModel ( dff_floors, 1548 )
	engineSetModelLODDistance(1548, 2000)
    end
);



local x,y = guiGetScreenSize()
 function isCursorOnElement(x,y,w,h)
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end]]--