
if fileExists("sourceC.lua") then
	fileDelete("sourceC.lua")
end

--Változók--
local sx,sy = guiGetScreenSize()
------------

--[[bindKey("m","down",function()
	showCursor(not isCursorShowing()) --Kurzor előhozás
end)]]

function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(boxBa(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end

function boxBa(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

addEventHandler("onClientResourceStart", getResourceRootElement(),
    function()
        setPedVoice(getLocalPlayer(), "PED_TYPE_DISABLED")
    end
)


function getPos()
	if getElementData(localPlayer,"acc:admin") >= 7 then
		local x,y,z = getElementPosition(localPlayer)
		local int = getElementInterior(localPlayer)
		local dim = getElementDimension(localPlayer)
		local position = x .. ", " .. y .. ", " .. z
		outputChatBox("Posição:".. position)
		outputChatBox("Interior:"..int)
		outputChatBox("Dimension:"..dim)
	end
end
--addCommandHandler("getpos",getPos)

--LABEL--
local time = getRealTime()
date = string.format("%04d/%02d/%02d", time.year + 1900, time.month + 1, time.monthday)

function DrawLabel()
	if getElementData(localPlayer, "loggedin") then
		dxDrawText("IRG-MTA Roleplay v1.0 # AccountID: " .. getElementData(localPlayer, "acc:id") .. " # " .. date .. " # ", 0, 0, sx - 85, sy, tocolor(255,255,255,255/2), 1, "default", "right", "bottom")
		--setControlState("walk", true) --Alapból séta
	end
end
--addEventHandler("onClientRender", root, DrawLabel)
---------