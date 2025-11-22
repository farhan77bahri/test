prizes = {}
addEvent("prizeSystem:sendPrizeToClient", true)
addEventHandler("prizeSystem:sendPrizeToClient", root, function(tablo, count, wek)
    prizes = tablo
    current = count + 1
    weekCount = wek
    addEventHandler("onClientRender", root, renderFunction)
    addEventHandler("onClientClick", root, clickFunction)
end)

function iif(a, b, c)
    if a then return b else return c end
end

sx, sy = guiGetScreenSize()
pw = sx / 2
px = (sx - pw) / 2
mw, mh = (pw - 50) / 4, (pw - 50) / 4
ph = mh * 2 + 30
py = (sy - ph) / 2
imgTick = getTickCount()
currentIMG = 1
local font = dxCreateFont("iran.ttf", 12) 
function renderFunction()
    local now = getTickCount()
    dxDrawRectangle(px, py, pw, ph - 1, tocolor(0, 0, 0, 180), true)
    dxDrawRectangle(px, py, pw, ph, tocolor(0, 0, 0, 220), true)
    for day, t in pairs(prizes) do
        local posX, posY = px + 10 * (iif(day - 3 > 0, day - 3, day)) + mw * (iif(day - 3 > 0, day - 3, day) - 1),
                           py + 10 * (iif(day - 3 > 0, 2, 1)) + mh * (iif(day - 3 > 0, 1, 0))

        local ih = mh
        local posY, mh = iif(day == 7, py + 10, posY), iif(day == 7, mh * 2 + 10, mh)

        local prizeColor = iif(day < current, tocolor(0, 255, 0, 150)) or
                           iif(day == current, tocolor(100, 100, 200, 60)) or tocolor(150, 150, 150, 50)
        dxDrawRectangle(posX, posY, mw, mh, prizeColor, true)

        local titleColor = iif(day == current, tocolor(255, 255, 255, 255), tocolor(255, 255, 255, 200))
        dxDrawText(day .. "", posX, posY, posX + mw, posY + ih / 5, titleColor, 1.5, "clear", "center", "center", nil, nil, true)

        local descriptionColor = tocolor(255, 255, 255, 220)
        dxDrawText((t[2] + t[2] * (weekCount / 2)) .. t[3] .. iif(day == current, "\nبرای دریافت جایزه کلیک کنید", ""), posX, posY + 4 * mh / 5, posX + mw, posY + mh, descriptionColor, 1, font, "center", "center", nil, nil, true)

        if now >= imgTick + 30 then
            currentIMG = iif(currentIMG == 16, 1, currentIMG + 1)
            imgTick = now
        end
        local imgName = iif(t[1] == "Para", "coin", "exp") .. "/" .. iif(day == current or isMouseInPosition(posX, posY, mw, mh), currentIMG, 1) .. ".png"
        dxDrawImage(posX + 0.6 * ih / 2, posY + mh / 2 - (ih / 2.5) / 2, ih / 2.5, ih / 2.5, imgName, 0, 0, 0, nil, true)
    end
end

function isMouseInPosition(x, y, width, height)
    if (not isCursorShowing()) then
        return false
    end
    local sx, sy = guiGetScreenSize()
    local cx, cy = getCursorPosition()
    local cx, cy = (cx * sx), (cy * sy)
    return (cx >= x and cx <= x + width) and (cy >= y and cy <= y + height)
end

function clickFunction(btn, st)
    if btn == "left" and st == "up" then
        local posX = px + 10 * (iif(current - 3 > 0, current - 3, current)) + mw * (iif(current - 3 > 0, current - 3, current) - 1)
        local posY = py + 10 * (iif(current - 3 > 0, 2, 1)) + mh * (iif(current - 3 > 0, 1, 0))
        local mh = iif(current == 7, mh * 2 + 10, mh)
        local posY = iif(current == 7, py + 10, posY)
        if isMouseInPosition(posX, posY, mw, mh) then
            removeEventHandler("onClientRender", root, renderFunction)
            triggerServerEvent("prizeSystem:givePrize", localPlayer, current)
            removeEventHandler("onClientClick", root, clickFunction)
        end
    end
end


-------------------------------F5

local screenWidth, screenHeight = guiGetScreenSize()
local menuWidth, menuHeight = 400, 400
local menuX = (screenWidth - menuWidth) / 2
local menuY = (screenHeight - menuHeight) / 2
local menuOpen = false
local isAdminDuty = false -- وضعیت ادمین دیوتی
local isTeleportMenuOpen = false -- وضعیت کادر تلپورت
local inputPlayerID = "" -- مقدار ورودی برای ID بازیکن

-- تابع باز کردن یا بستن منو
function toggleMenu()
    if getElementData(localPlayer, "acc:admin") >= 1 then
        menuOpen = not menuOpen
        if not menuOpen then
            removeEventHandler("onClientRender", root, renderMenu)
            removeEventHandler("onClientClick", root, clickMenu)
        else
            addEventHandler("onClientRender", root, renderMenu)
            addEventHandler("onClientClick", root, clickMenu)
        end
    end
end

-- تابع رسم منو
function renderMenu()
    dxDrawRectangle(menuX, menuY, menuWidth, menuHeight, tocolor(0, 0, 0, 200), true)
    dxDrawText("منوی ادمین", menuX, menuY, menuX + menuWidth, menuY + 40, tocolor(255, 255, 255, 255), 1.5, "default", "center", "center", false, false, true)
    
    -- دکمه ادمین دیوتی
    local dutyButtonY = menuY + 60
    local dutyButtonColor = isAdminDuty and tocolor(0, 255, 0, 200) or tocolor(255, 0, 0, 200)
    dxDrawRectangle(menuX + 50, dutyButtonY, menuWidth - 100, 40, dutyButtonColor, true)
    dxDrawText(isAdminDuty and "خروج از ادمین دیوتی" or "ورود به ادمین دیوتی", menuX, dutyButtonY, menuX + menuWidth, dutyButtonY + 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, true)

    -- دکمه تلپورت
    local teleportButtonY = dutyButtonY + 50
    dxDrawRectangle(menuX + 50, teleportButtonY, menuWidth - 100, 40, tocolor(0, 100, 255, 200), true)
    dxDrawText("تلپورت به بازیکن", menuX + 50, teleportButtonY, menuX + menuWidth - 50, teleportButtonY + 40, tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, true)



    
    -- رسم کادر تلپورت
    if isTeleportMenuOpen then
        dxDrawRectangle(menuX + 50, menuY + 150, menuWidth - 100, 120, tocolor(0, 0, 0, 200), true)
        dxDrawText("آی‌دی بازیکن را وارد کنید:", menuX + 60, menuY + 160, menuX + menuWidth - 60, menuY + 190, tocolor(255, 255, 255, 255), 1, "default", "center", "top", false, false, true)
        dxDrawRectangle(menuX + 60, menuY + 190, menuWidth - 120, 30, tocolor(255, 255, 255, 255), true)
        dxDrawText(inputPlayerID, menuX + 65, menuY + 195, menuX + menuWidth - 125, menuY + 215, tocolor(0, 0, 0, 255), 1, "default", "left", "center", false, false, true)
        dxDrawRectangle(menuX + 60, menuY + 230, menuWidth - 120, 30, tocolor(0, 100, 255, 200), true)
        dxDrawText("تأیید", menuX + 60, menuY + 230, menuX + menuWidth - 60, menuY + 260, tocolor(255, 255, 255, 255), 1, "default", "center", "center", false, false, true)
    end
end

-- تابع کلیک
function clickMenu(button, state, x, y)
    if button == "left" and state == "up" then
        -- دکمه ادمین دیوتی
        if x >= menuX + 50 and x <= menuX + menuWidth - 50 and y >= menuY + 60 and y <= menuY + 100 then
            isAdminDuty = not isAdminDuty
            triggerServerEvent("adminDuty:toggle1", localPlayer, isAdminDuty)
        end

        -- دکمه تلپورت
        if x >= menuX + 50 and x <= menuX + menuWidth - 50 and y >= menuY + 110 and y <= menuY + 150 then
            isTeleportMenuOpen = not isTeleportMenuOpen
        end

        -- تأیید تلپورت
        if isTeleportMenuOpen and x >= menuX + 60 and x <= menuX + menuWidth - 60 and y >= menuY + 230 and y <= menuY + 260 then
            if tonumber(inputPlayerID) then
                triggerServerEvent("admin:teleportToPlayer", localPlayer, tonumber(inputPlayerID))
                isTeleportMenuOpen = false
                inputPlayerID = ""
            else
                outputChatBox("لطفاً یک عدد معتبر وارد کنید!", 255, 0, 0)
            end
        end
    end
end

-- دریافت ورودی کاربر
addEventHandler("onClientCharacter", root, function(character)
    if isTeleportMenuOpen then
        if character == "\b" then
            inputPlayerID = string.sub(inputPlayerID, 1, -2)
        elseif string.len(inputPlayerID) < 10 and tonumber(character) then
            inputPlayerID = inputPlayerID .. character
        end
    end
end)

-- بایند کردن منو
bindKey("F5", "down", toggleMenu)










