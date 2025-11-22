
local dxfont0_fonte = dxCreateFont("font.ttf", 11) 
local dxfont1_fonte = dxCreateFont("font.ttf", 13) 

local font1 = dxCreateFont("font.ttf", 10)
local font_10 = dxCreateFont("font.ttf", 10)
--[[
atmTxd = engineLoadTXD("models/atm/kmb_atmx.txd")
engineImportTXD(atmTxd, 2942)
bankTxd = engineLoadTXD("models/bank/lanblokd.txd")
engineImportTXD(bankTxd, 4005)

local bankBot = createPed(150, 359.71246, 173.56975, 1008.38281, -90)
local atm1 = createObject(2942, 359.86437, 188.99635, 1008.04281)
local atm2 = createObject(2942, 360.86437, 188.99635, 1008.04281)
local atm3 = createObject(2942, 361.86437, 188.99635, 1008.04281)
local atm4 = createObject(2942, 1928.58215, -1768.56689, 13.14688, 0, 0, 90)
local atm5 = createObject(2942, 1815.18152, -1557.53162, 13.08579, 0, 0, 70)
local atm6 = createObject(2942, 1682.24341, -1272.46252, 14.41477, 0, 0, 0)
local atm7 = createObject(2942, 1051.96143, -1131.20642, 23.42813, 0, 0, 0)
local atm8 = createObject(2942, 537.36407, -1740.75659, 11.87771, 0, 0, 180)

setElementInterior(atm1, 3)
setElementDimension(atm1, 2)
setElementInterior(atm2, 3)
setElementDimension(atm2, 2)
setElementInterior(atm3, 3)
setElementDimension(atm3, 2)
setElementInterior(bankBot, 3)
setElementDimension(bankBot, 2)
setElementFrozen(bankBot, true)


function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end]]--

function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
    if 
        type( sEventName ) == 'string' and 
        isElement( pElementAttachedTo ) and 
        type( func ) == 'function' 
    then
        local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
        if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
            for i, v in ipairs( aAttachedFunctions ) do
                if v == func then
                    return true
                end
            end
        end
    end

    return false
end

function dxDrawLinedRectangle( x, y, width, height, color, _width, postGUI )
    _width = _width or 1
    dxDrawLine ( x, y, x+width, y, color, _width, postGUI ) -- Top
    dxDrawLine ( x, y, x, y+height, color, _width, postGUI ) -- Left
    dxDrawLine ( x, y+height, x+width, y+height, color, _width, postGUI ) -- Bottom
    return dxDrawLine ( x+width, y, x+width, y+height, color, _width, postGUI ) -- Right
end

local szx,szy = guiGetScreenSize()
local tx, ty, tz = 1411.80339, -1699.87390, 13.53949
local sz = tz-2.5
local marker = createMarker (tx, ty, sz, "cylinder", 1, 241, 155, 0, 0)
local screenW, screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)
local l_0_1 = false
local l_0_2, l_0_3 = guiGetScreenSize()
local l_0_4 = dxCreateScreenSource(l_0_2, l_0_3)

--grid = dxGrid:Create(x*497, y*406, x*325, y*139)
--colum = grid:AddColumn("Jogadores", x*200)
--grid:SetVisible(false)

--[[
for i, player in ipairs(getElementsByType("player")) do
    --if not (player == getLocalPlayer()) then
		
		--grid:AddItem(colum, getElementData(player, "char:name"):gsub("_", " "))
        grid:AddItem(colum, getPlayerName(player):gsub("#%x%x%x%x%x%x", ""))
   -- end
end]]--

--[[
addEventHandler("onClientRender", root, function()
  if l_0_1 then
    dxUpdateScreenSource(l_0_4)
    dxDrawImage(0, 0, l_0_2, l_0_3, l_0_4)
  end
end
)


addEventHandler ( "onClientRender", root,
function ( )
         vx, vy, vz = getElementPosition(marker)
         scX, scY = getScreenFromWorldPosition(vx, vy, vz+3.5)
         cx,cy,cz,clx,cly,clz,crz,cfov = getCameraMatrix()
         dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz+3.5)
        if scX then
                 largura, altura = 626, 350
                 Tx = scX-(5000/dist)*szx/626/largura*cfov
                 Ty = scY-(100/dist)*szy/350/altura*cfov
                 Tw = (5000/dist)*szx/400/largura*cfov
                 Th = (5000/dist)*szy/400/altura*cfov 
                 if dist < 80.0 then
                        if (isLineOfSightClear(cx, cy, cz, vx, vy, vz+1.5, true, false, false)) then
                                if not isElementWithinMarker(localPlayer, marker) then
                                    --dxDrawText("$", Tx, Ty, Tw, Th + 40, tocolor(255, 255, 255, math.abs(math.sin(getTickCount()/700))*200), 1, dxfont1_fonte, "left", "top", false, false, true, true, false) 
                                    --dxDrawText("Loja de #f19b00vida #ffffffe #f19b00colete", Tx, Ty + 120, Tw, Th + 40, tocolor(255, 255, 255, math.abs(math.sin(getTickCount()/700))*200), 1, dxfont2_fonte, "left", "top", false, false, true, true, false) 
                                     dxDrawImage ( Tx, Ty, Tw, Th, "gfx/joinIcon.png",0,0,0,tocolor(255,255,255,255))
                                    
                                end
                                
                        end
                end
        end
end)
]]--

--[[
function cancelPedDamage(attacker)
  cancelEvent() 
end
addEventHandler("onClientPedDamage", bankBot, cancelPedDamage)
]]--

function caixaUI()
    local money = getElementData(localPlayer, "char:money")
    local bankMoney = getElementData(localPlayer, "char:bankmoney") 
    --exports["[VZR]Blur2"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg2.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768, isCursorOnElement(x*464, y*366, x*93, y*95) and "gfx/ui/t_button2.png" or "gfx/ui/t_button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768, isCursorOnElement(x*625, y*366, x*93, y*95) and "gfx/ui/d_button2.png" or "gfx/ui/d_button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768, isCursorOnElement(x*778, y*366, x*93, y*95) and "gfx/ui/r_button2.png" or "gfx/ui/r_button.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)



    dxDrawText(getElementData(localPlayer, "char:name"):gsub("_", " "), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)



    --dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", ""), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)
    dxDrawText("$ "..money, x*339, y*189, x*426, y*213, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawText("$ "..bankMoney, x*340, y*216, x*427, y*240, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    if getElementData(localPlayer, "Notification") then
        dxDrawText("[Error] "..getElementData(localPlayer, "Notification"), x*240, y*680, x*706, y*441, tocolor(255, 0, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
    if getElementData(localPlayer, "Notification:S") then
        dxDrawText("[Success] "..getElementData(localPlayer, "Notification:S"), x*240, y*680, x*706, y*441, tocolor(0, 255, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
end


function acessingUI()
    --exports["[VZR]Blur2"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg1.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
end


function depositUI()
    local money = getElementData(localPlayer, "char:money")
    local bankMoney = getElementData(localPlayer, "char:bankmoney")
    --exports["[VZR]Blur2"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bgd.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", ""), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)

    dxDrawText(getElementData(localPlayer, "char:name"):gsub("_", " "), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)



    dxDrawText("$ "..money, x*339, y*189, x*426, y*213, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawText("$ "..bankMoney, x*340, y*216, x*427, y*240, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*402, y*564, x*540, y*56, isCursorOnElement(x*502, y*564, x*320, y*56) and tocolor(144, 238, 144, 255) or tocolor(56,56,56, 255), false)
    createEditBox("2", 0.379, 0.443, 0.22, 0.06, true, "", false, 7, "arial", false, 1, {0, 0, 0, 127 }, true, { 0, 0, 0, 55 }, 1, true, 60, true, "Meghdar Vajh", { 0, 0, 0, 127 }, true, 1, "arial", true, true, {0, 0, 0}, false) 
     dxDrawText("   Cancel", x*619, y*580, x*706, y*441, --[[isCursorOnElement(x*502, y*401, x*320, y*56) and]] tocolor(255, 255, 255, 255)--[[ or tocolor(0, 0, 0, 127)]], 1, dxfont1_fonte, "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*402, y*480, x*540, y*56, isCursorOnElement(x*502, y*480, x*320, y*56) and tocolor(144, 238, 144, 255) or tocolor(56,56,56, 255), false)
    dxDrawText("   Variz", x*619, y*497, x*706, y*441, --[[isCursorOnElement(x*502, y*401, x*320, y*56) and]] tocolor(255, 255, 255, 255)--[[ or tocolor(0, 0, 0, 127)]], 1, dxfont1_fonte, "left", "top", false, false, false, false, false)
    if getElementData(localPlayer, "Notification") then
        dxDrawText("[Error] "..getElementData(localPlayer, "Notification"), x*240, y*680, x*706, y*441, tocolor(255, 0, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
    if getElementData(localPlayer, "Notification:S") then
        dxDrawText("[Success] "..getElementData(localPlayer, "Notification:S"), x*240, y*680, x*706, y*441, tocolor(0, 255, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
end

function sacUI()
    local money = getElementData(localPlayer, "char:money")
    local bankMoney = getElementData(localPlayer, "char:bankmoney")
    --exports["[VZR]Blur2"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bgr.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", ""), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)

    dxDrawText(getElementData(localPlayer, "char:name"):gsub("_", " "), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)




	dxDrawText("$ "..money, x*339, y*189, x*426, y*213, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawText("$ "..bankMoney, x*340, y*216, x*427, y*240, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*402, y*564, x*540, y*56, isCursorOnElement(x*502, y*564, x*320, y*56) and tocolor(144, 238, 144, 255) or tocolor(56,56,56, 255), false)
    createEditBox("3", 0.379, 0.443, 0.22, 0.06, true, "", false, 7, "arial", false, 1, {0, 0, 0, 127 }, true, { 0, 0, 0, 55 }, 1, true, 60, true, "Meghdar Vajh", { 0, 0, 0, 127 }, true, 1, "arial", true, true, {0, 0, 0}, false) 
    dxDrawText("   Cancel", x*619, y*580, x*706, y*441, --[[isCursorOnElement(x*502, y*401, x*320, y*56) and]] tocolor(255, 255, 255, 255)--[[ or tocolor(0, 0, 0, 127)]], 1, dxfont1_fonte, "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*402, y*480, x*540, y*56, isCursorOnElement(x*502, y*480, x*320, y*56) and tocolor(144, 238, 144, 255) or tocolor(56,56,56, 255), false)
    dxDrawText("   Bardasht", x*619, y*497, x*706, y*441, --[[isCursorOnElement(x*502, y*401, x*320, y*56) and]] tocolor(255, 255, 255, 255)--[[ or tocolor(0, 0, 0, 127)]], 1, dxfont1_fonte, "left", "top", false, false, false, false, false)
    if getElementData(localPlayer, "Notification") then
        dxDrawText("[Error] "..getElementData(localPlayer, "Notification"), x*240, y*680, x*706, y*441, tocolor(255, 0, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
    if getElementData(localPlayer, "Notification:S") then
        dxDrawText("[Success] "..getElementData(localPlayer, "Notification:S"), x*240, y*680, x*706, y*441, tocolor(0, 255, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
end

function transUI()
    local money = getElementData(localPlayer, "char:money")
    local bankMoney = getElementData(localPlayer, "char:bankmoney")
    --exports["[VZR]Blur2"]:dxDrawBluredRectangle(0, 0, screenW, screenH, tocolor(255, 255, 255, 255))
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bg.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    dxDrawImage(x*0, y*0, x*1360, y*768,"gfx/ui/bgt.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
    --dxDrawText(getPlayerName(localPlayer):gsub("#%x%x%x%x%x%x", ""), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)

    dxDrawText(getElementData(localPlayer, "char:name"):gsub("_", " "), x*310, y*158, x*406, y*182, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, true, false)



    dxDrawText("$ "..money, x*339, y*189, x*426, y*213, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawText("$ "..bankMoney, x*340, y*216, x*427, y*240, tocolor(0, 0, 0, 127), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    dxDrawRectangle(x*402, y*564, x*540, y*56, isCursorOnElement(x*502, y*564, x*320, y*56) and tocolor(144, 238, 144, 255) or tocolor(56,56,56, 255), false)
    createEditBox("4", 0.379, 0.443, 0.22, 0.06, true, "", false, 7, "arial", false, 1, {0, 0, 0, 127 }, true, { 0, 0, 0, 55 }, 1, true, 60, true, "ID", { 0, 0, 0, 127 }, true, 1, "arial", true, true, {0, 0, 0}, false) 

    createEditBox("1", 0.379, 0.543, 0.22, 0.06, true, "", false, 7, "arial", false, 1, {0, 0, 0, 127 }, true, { 0, 0, 0, 55 }, 1, true, 60, true, "Meghdar Vajh", { 0, 0, 0, 127 }, true, 1, "arial", true, true, {0, 0, 0}, false) 


    dxDrawText("Enteghal Vajh", x*619, y*580, x*706, y*441, --[[isCursorOnElement(x*502, y*401, x*320, y*56) and]] tocolor(255, 255, 255, 255)--[[ or tocolor(0, 0, 0, 127)]], 1, dxfont1_fonte, "left", "top", false, false, false, false, false)
    if getElementData(localPlayer, "Notification") then
        dxDrawText("[Error] "..getElementData(localPlayer, "Notification"), x*240, y*680, x*706, y*441, tocolor(255, 0, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
    if getElementData(localPlayer, "Notification:S") then
        dxDrawText("[Success] "..getElementData(localPlayer, "Notification:S"), x*240, y*680, x*706, y*441, tocolor(0, 255, 0, 255), 1, dxfont0_fonte, "left", "top", false, false, false, false, false)
    end
end


			



function click(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickElement)
	cancelEvent()
	if not isElement(clickElement) then return end
	if state == "up" and button == "left" or button == "right" then
		if getElementData(clickElement, "bankThing") then
			local x, y, z = getElementPosition(localPlayer)
			local ex, ey, ez = getElementPosition(clickElement)
			if getDistanceBetweenPoints3D(x, y, z, ex, ey, ez) <= 3 then
    if not isEventHandlerAdded("onClientRender", root, caixaUI) then
            if not isEventHandlerAdded("onClientRender", root, caixaUI) then
                if not isEventHandlerAdded("onClientRender", root, depositUI) then
                    if not isEventHandlerAdded("onClientRender", root, sacUI) then
                        if not isEventHandlerAdded("onClientRender", root, transUI) then
                        if not isEventHandlerAdded("onClientRender", root, acessingUI) then
                            --if hit then
                                --if elementHit == atm1 then
                                    addEventHandler("onClientRender", root, acessingUI)
                                    setElementFrozen(localPlayer, true)
                                    setTimer(function()
                                        if not isEventHandlerAdded("onClientRender", root, caixaUI) then
                                            addEventHandler("onClientRender", root, caixaUI)
                                        end
                                        removeEventHandler("onClientRender", root, acessingUI)
                                        showCursor(true)
                                        setElementFrozen(localPlayer, false)
                                        setElementData(localPlayer, "Notification", false)
                                        setElementData(localPlayer, "Notification:S", false)
                                        showChat(false)
                                    end, 2500, 1)
                                --end 
                            --end
                        end  
                    end
                    end
                end
            end
        end
end			
end
end
end
	
addEventHandler("onClientClick", getRootElement(), click)

local sw, sh = guiGetScreenSize() 
function jobL()
  for k, v in ipairs(getElementsByType("marker")) do
    local info = getElementData(v, "informacao")
    if info then
      local x, y, z = getElementPosition(localPlayer)
      local mx, my, mz = getElementPosition(v)
      local a, b = 100, 100
      local cx, cy, cz = getCameraMatrix()

	                  local distance = getDistanceBetweenPoints3D (x, y, z, mx, my, mz + 0.5)
                if distance <= 100 then
                    if isLineOfSightClear (cx, cy, cz, mx, my, mz + 0.5, true, false, false, true ) then
                        local scale = 5.9 / distance
                        if scale > 1.9 then 
                            scale = 1.9 
                        end

                        px, py = getScreenFromWorldPosition ( mx, my, mz + 1.5)
                        if px then        
         dxDrawText(info, px - dxGetTextWidth ( info, scale, "default-bold" ) / 2 , py, sw, sh, tocolor(255, 255, 255, 255), scale, "default-bold")
 
end
end
      end
    end
  end
end
--addEventHandler("onClientRender", root, jobL)



function closePanel(_,state)
    if isEventHandlerAdded("onClientRender", root, caixaUI) then  
        if state == "down" then
            if isCursorOnElement(x*1068, y*94, x*36, y*38) then 
		        showCursor(false)
                showChat(true)
                setElementData(localPlayer, "Notification", false)
                setElementData(localPlayer, "Notification:S", false)
                playSound("sfx/hit.mp3", false)
                removeEventHandler("onClientRender", root, caixaUI)
            end
        end
    end
    if isEventHandlerAdded("onClientRender", root, transUI) then  
        if state == "down" then
            if isCursorOnElement(x*1068, y*94, x*36, y*38) then 
                showCursor(false)
                setElementData(localPlayer, "Notification", false)
                setElementData(localPlayer, "Notification:S", false)
                showChat(true)
                playSound("sfx/hit.mp3", false)
                --grid:SetVisible(false)
                removeEventHandler("onClientRender", root, transUI)
                changeVisibility("1", false)
				changeVisibility("4", false)
            end
        end
    end
    if isEventHandlerAdded("onClientRender", root, depositUI) then  
        if state == "down" then
            if isCursorOnElement(x*1068, y*94, x*36, y*38) then 
                showCursor(false)
                showChat(true)
                playSound("sfx/hit.mp3", false)
                setElementData(localPlayer, "Notification", false)
                setElementData(localPlayer, "Notification:S", false)
                changeVisibility("2", false)
                removeEventHandler("onClientRender", root, depositUI)
            end
        end
    end
    if isEventHandlerAdded("onClientRender", root, sacUI) then  
        if state == "down" then
            if isCursorOnElement(x*1068, y*94, x*36, y*38) then 
                showCursor(false)
                setElementData(localPlayer, "Notification", false)
                setElementData(localPlayer, "Notification:S", false)
                showChat(true)
                playSound("sfx/hit.mp3", false)
                removeEventHandler("onClientRender", root, sacUI)
                changeVisibility("3", false)
            end
        end
    end


    if isEventHandlerAdded("onClientRender", root, sacUI) then  
        if state == "down" then
            if isCursorOnElement(x*502, y*564, x*320, y*56) then 
                playSound("sfx/hit.mp3", false)
                removeEventHandler("onClientRender", root, sacUI)
                addEventHandler("onClientRender", root, caixaUI)
                changeVisibility("3", false)
            end
        end
    end
    if isEventHandlerAdded("onClientRender", root, depositUI) then  
        if state == "down" then
            if isCursorOnElement(x*502, y*564, x*320, y*56) then 
                playSound("sfx/hit.mp3", false)
                removeEventHandler("onClientRender", root, depositUI)
                addEventHandler("onClientRender", root, caixaUI)
                changeVisibility("2", false)
            end
        end
    end
end
addEventHandler("onClientClick", root, closePanel)


function uiButtons(_,state)
    if isEventHandlerAdded("onClientRender", root, caixaUI) then   
        if state == "down" then
            if not isEventHandlerAdded("onClientRender", root, transUI) or isEventHandlerAdded("onClientRender", root, depositUI) or isEventHandlerAdded("onClientRender", root, sacUI) then  
                if isCursorOnElement(x*464, y*366, x*93, y*95) then -- trans
                    playSound("sfx/hit.mp3", false)
                    removeEventHandler("onClientRender", root, caixaUI)
                    addEventHandler("onClientRender", root, transUI)
                    --grid:SetVisible(true)
                    changeVisibility("1", true)
					changeVisibility("4", true)
                end
            end
            if not isEventHandlerAdded("onClientRender", root, depositUI) or isEventHandlerAdded("onClientRender", root, sacUI) or isEventHandlerAdded("onClientRender", root, transUI) then  
                if isCursorOnElement(x*625, y*366, x*93, y*95) then -- deposit
                    playSound("sfx/hit.mp3", false)
                    removeEventHandler("onClientRender", root, caixaUI)
                    addEventHandler("onClientRender", root, depositUI)
                    changeVisibility("2", true)
                end
            end
            if not isEventHandlerAdded("onClientRender", root, sacUI) or isEventHandlerAdded("onClientRender", root, depositUI) or isEventHandlerAdded("onClientRender", root, transUI) then  
                if isCursorOnElement(x*778, y*366, x*93, y*95) then -- sac
                    playSound("sfx/hit.mp3", false)
                    removeEventHandler("onClientRender", root, caixaUI)
                    addEventHandler("onClientRender", root, sacUI)
                    changeVisibility("3", true)
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, uiButtons)

function depositButton(_,state)
    if isEventHandlerAdded("onClientRender", root, depositUI) then   
        if state == "down" then
            if isCursorOnElement(x*502, y*480, x*320, y*56) then 
                if getText("2") then					
                    if tonumber(getText("2")) < getElementData(localPlayer, "char:money") or tonumber(getText("2")) == getElementData(localPlayer, "char:money") then
                        playSound("sfx/hit.mp3", false)
                        addEventHandler("onClientRender", root, caixaUI)
                        changeVisibility("2", false)
                        removeEventHandler("onClientRender", root, depositUI)
                        --setElementData(localPlayer, "char:bankmoney", getElementData(localPlayer, "char:bankmoney") + tonumber(getText("2")))
                        setElementData(localPlayer, "Notification", false)
                        triggerServerEvent("onDepositMoney", localPlayer, localPlayer, tonumber(getText("2")))
                        setElementData(localPlayer, "Notification:S", "Depósito de $ "..tonumber(getText("2")).." feito!")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification:S", false)
                    else
                        playSound("sfx/hit.mp3", false)
                        setElementData(localPlayer, "Notification:S", false)
                        setElementData(localPlayer, "Notification", "Você não possui este valor!")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification", false)
                    end
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, depositButton)

function saqueButton(_,state)
    if isEventHandlerAdded("onClientRender", root, sacUI) then   
        if state == "down" then
            if isCursorOnElement(x*502, y*480, x*320, y*56) then 
                if getText("3") then
                    if tonumber(getText("3")) == getElementData(localPlayer, "char:bankmoney") or  tonumber(getText("3")) < getElementData(localPlayer, "char:bankmoney") then
                        playSound("sfx/hit.mp3", false)
                        addEventHandler("onClientRender", root, caixaUI)
                        removeEventHandler("onClientRender", root, sacUI)
                        changeVisibility("3", false)
                        --setElementData(localPlayer, "char:bankmoney", getElementData(localPlayer, "char:bankmoney") - tonumber(getText("3")))
                        setElementData(localPlayer, "Notification", false)
                        triggerServerEvent("saqueBankMoney", localPlayer, localPlayer, tonumber(getText("3")))
                        setElementData(localPlayer, "Notification:S", "Retirada de $ "..tonumber(getText("3")).." feito!")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification:S", false)
                    else
                        playSound("sfx/hit.mp3", false)
                        setElementData(localPlayer, "Notification:S", false)
                        setElementData(localPlayer, "Notification", "Você não possui este valor!")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification", false)
                    end
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, saqueButton)

function transButton(_,state)
    if isEventHandlerAdded("onClientRender", root, transUI) then   
        if state == "down" then
            if isCursorOnElement(x*502, y*564, x*320, y*56) then 
                if getText("1") then
                    if tonumber(getText("1")) == getElementData(localPlayer, "char:bankmoney") or  tonumber(getText("1")) < getElementData(localPlayer, "char:bankmoney") then
                        playSound("sfx/hit.mp3", false)
                       -- local gridItem = grid:GetSelectedItem()
                        local item = tonumber(getText("1")) --grid:GetItemDetails(colum, gridItem)
						local targerplayer = tonumber(getText("4")) 
                        addEventHandler("onClientRender", root, caixaUI)
                        --grid:SetVisible(false)
                        changeVisibility("4", false)
						changeVisibility("1", false)
                        removeEventHandler("onClientRender", root, transUI)
                        --setElementData(localPlayer, "char:bankmoney", getElementData(localPlayer, "char:bankmoney") - item)
                        setElementData(localPlayer, "Notification", false)
                        setElementData(localPlayer, "Notification:S", "Enteghal Vajh  $ "..item..", Be "..targerplayer.." !")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification:S", false)
                        triggerServerEvent("transMoney", localPlayer, item, targerplayer)
                    else
                        playSound("sfx/hit.mp3", false)
                        setElementData(localPlayer, "Notification:S", false)
                        setElementData(localPlayer, "Notification", "Você não possui este valor na sua conta bancária!")
                        setTimer(setElementData, 7000, 1, localPlayer, "Notification", false)
                    end
                end
            end
        end
    end
end
addEventHandler("onClientClick", root, transButton)


function isCursorOnElement( posX, posY, width, height )
  if isCursorShowing( ) then
    local mouseX, mouseY = getCursorPosition( )
    local clientW, clientH = guiGetScreenSize( )
    local mouseX, mouseY = mouseX * clientW, mouseY * clientH
    if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
      return true
    end
  end
  return false
end


