local screenW, screenH = guiGetScreenSize()
local x,y = (screenW/1280), (screenH/720)

panelState = false
local Fonte = dxCreateFont("Fonte.ttf", 12.8)
function isMouseInPosition ( x, y, width, height )
	if ( not isCursorShowing( ) ) then
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

function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius

    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)

        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end

-- # example 


function dx( ) 
if panelState then
local hover = isMouseInPosition ( screenW * 0.4500, screenH * 0.3264, screenW * 0.16, screenH * 0.05) ; 
--dxDrawRoundedRectangle(screenW * 0.4500, screenH * 0.3264, screenW * 0.16, screenH * 0.05, hover and tocolor(200,200,200,200) or tocolor(124, 197, 118,200), 10) 124, 197, 118
dxDrawRectangle(screenW * 0.4450, screenH * 0.2800, screenW * 0.17, screenH * 0.28, tocolor(0, 0, 0,200) or tocolor(0, 0, 0,200), true)
dxDrawRectangle(screenW * 0.4450, screenH * 0.2800, screenW * 0.17, screenH * 0.04, tocolor(0, 0, 0,200) or tocolor(0, 0, 0,255), true)
dxDrawText("IRG - MTA",screenW * 0.3900, screenH * 0.2400, screenW * 0.6711, screenH * 0.3653,tocolor(255,255,255,200) or tocolor(255,255,255,200),1,"pricedown",'center','center', false, false, true, false, false)

dxDrawRectangle(screenW * 0.4500, screenH * 0.3264, screenW * 0.16, screenH * 0.05, hover and tocolor(255,255,255,200) or tocolor(124, 197, 118,200), true)
dxDrawText("R$:15 - Ab Porteghal x1",screenW * 0.3975, screenH * 0.3364, screenW * 0.6711, screenH * 0.3653,hover and tocolor(0,0,0,200) or tocolor(255,255,255,200),1,"default-bold-small",'center','center', false, false, true, false, false)

local hover2 = isMouseInPosition ( screenW * 0.4500, screenH * 0.3814, screenW * 0.16, screenH * 0.05) ; 
--dxDrawRoundedRectangle(screenW * 0.4500, screenH * 0.3814, screenW * 0.16, screenH * 0.05, hover2 and tocolor(200,200,200,200) or tocolor(124, 197, 118,200), 10)
dxDrawRectangle(screenW * 0.4500, screenH * 0.3814, screenW * 0.16, screenH * 0.05, hover2 and tocolor(255,255,255,200) or tocolor(124, 197, 118,200), true)
dxDrawText("R$: 25 - Noshabe x1",screenW * 0.3900, screenH * 0.4430, screenW * 0.6711, screenH * 0.3653,hover2 and tocolor(0,0,0,200) or tocolor(255,255,255,200),1,"Fonte",'center','center', false, false, true, false, false)

local hover3 = isMouseInPosition ( screenW * 0.4500, screenH * 0.4360, screenW * 0.16, screenH * 0.05) ; 
--dxDrawRoundedRectangle(screenW * 0.4500, screenH * 0.4360, screenW * 0.16, screenH * 0.05, hover3 and tocolor(200,200,200,200) or tocolor(124, 197, 118,200), 10)
dxDrawRectangle(screenW * 0.4500, screenH * 0.4360, screenW * 0.16, screenH * 0.05, hover3 and tocolor(255,255,255,200) or tocolor(124, 197, 118,200), true)
dxDrawText("R$:12 - Hamberger x1",screenW * 0.3900, screenH * 0.5500, screenW * 0.6711, screenH * 0.3653,hover3 and tocolor(0,0,0,200) or tocolor(255,255,255,200),1,"Fonte",'center','center', false, false, true, false, false)


local hover3 = isMouseInPosition ( screenW * 0.4500, screenH * 0.4920, screenW * 0.16, screenH * 0.05) ; 
dxDrawRectangle(screenW * 0.4500, screenH * 0.4920, screenW * 0.16, screenH * 0.05, hover3 and tocolor(255,255,255,200) or tocolor(124, 197, 118,200), true)
dxDrawText("R$:1500 - Phone x1",screenW * 0.3900, screenH * 0.6650, screenW * 0.6711, screenH * 0.3653,hover3 and tocolor(0,0,0,200) or tocolor(255,255,255,200),1,"Fonte",'center','center', false, false, true, false, false)

dxDrawImage(screenW * 0.4510, screenH * 0.3295, 34, 34, ":san_items/files/items/7.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)-- SUCO DE LARANJA
--dxDrawImage(screenW - 129 - 10, 188, 128, 24, "Imagens/Fundo_Money.png", 0, 0, 0, tocolor(15, 15, 15, 170), false)
dxDrawImage(screenW * 0.4510, screenH * 0.3840, 34, 34, ":san_items/files/items/12.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)-- COCA
dxDrawImage(screenW * 0.4510, screenH * 0.4390, 34, 34, ":san_items/files/items/1.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)-- HAMBURGUER
dxDrawImage(screenW * 0.4510, screenH * 0.4945, 34, 34, ":san_items/files/items/16.png", 0, 0, 0, tocolor(255, 255, 255, 255), true)-- CELULAR

end 
end
addEventHandler("onClientPreRender", getRootElement(), dx)

function onClick(button, state, cursorx, cursory) 
    if panelState then
        if button == "left" and state == "down" then
    if isMouseInPosition ( screenW * 0.4500, screenH * 0.3264, screenW * 0.16, screenH * 0.05) then 
     -- outputChatBox("Suco de laranja x1") 
      triggerServerEvent("Suco1",localPlayer, localPlayer)
    elseif isMouseInPosition ( screenW * 0.4500, screenH * 0.3814, screenW * 0.16, screenH * 0.05) then
        triggerServerEvent("Coca1",localPlayer, localPlayer)
    elseif isMouseInPosition ( screenW * 0.4500, screenH * 0.4360, screenW * 0.16, screenH * 0.05) then
        --outputChatBox("Hamburguer x1") 
        triggerServerEvent("Hamburguer1",localPlayer, localPlayer)

    elseif isMouseInPosition ( screenW * 0.4500, screenH * 0.4920, screenW * 0.16, screenH * 0.05) then
        --outputChatBox("Hamburguer x1") 
		
        triggerServerEvent("Celular1",localPlayer, 1)


    end 
  end 
end
end



addEvent("LOJAMIDAON1",true)
addEventHandler("LOJAMIDAON1",localPlayer,
function()
    panelState = true    
    addEventHandler("onClientClick",getRootElement(),onClick)     
end)


addEvent("LOJAMIDAOFF1",true)
addEventHandler("LOJAMIDAOFF1",localPlayer,
function()
    panelState = false 
    removeEventHandler("onClientClick",getRootElement(),onClick)       
end)




function handleMinimize()
    panelState = false 
end
addEventHandler( "onClientMinimize", root, handleMinimize )


