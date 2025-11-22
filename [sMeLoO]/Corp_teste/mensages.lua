local screenH, screenW = guiGetScreenSize()
local x, y = (screenH/1366), (screenW/768)

local font_Menu = dxCreateFont("font.ttf", 30)

mensages = {}
messagetick = 0

function servermessages(message, type)
	table.insert(mensages, {message, type or "confirm", getTickCount(), dxGetTextWidth(message, fontScale*0.05, font_Menu) + screenH*0.01, 0, 0, 0})
	messagetick = getTickCount()
end
addEvent("pjogador", true)
addEventHandler("pjogador", getRootElement(), servermessages)


function renderMensages()
	local msgd = mensages
	if #msgd ~= 0 then
		local startY = screenW*0.3
		local i = 1
		repeat
			mData = msgd[i]
			local drawThis = true
			if i~= 1 then
				startY = startY + screenW*0.0425
			end
			if mData[5] == 0 and mData[6] == 0 then
				mData[5] = - mData[4] - screenH*0.015
				mData[6] = startY
				mData[7] = startY
			end
			local tick = getTickCount() - mData[3]
			local posX, posY, alpha
			if tick < 1000 then
				local progress = math.min(tick/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, 0, 0, 0, progress, "Linear")
			elseif tick >= 1000  and tick <= 7000 then
				mData[5] = 0
			elseif tick > 7000 then
				local progress = math.min((tick - 7000)/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, - mData[4] - mData[4] - screenH*0.015, 0, 0, progress, "Linear")
				if progress >= 1 then
					table.remove(msgd, i)
					drawThis = false
					messagetick = getTickCount()
				end
			end
			local globalTick = getTickCount() - messagetick
			if drawThis then
				mData[7] = startY
				mData[6] = interpolateBetween(mData[6], 0, 0, mData[7], 0, 0, math.min(globalTick/1000,1), "Linear")
				posX = mData[5]
				posY = mData[6]
				alpha = 255
				dxDrawRectangle(posX, posY, mData[4], screenW*0.04, tocolor(0, 0, 0, alpha*0.75), true)
				local r, g, b = 0, 255, 0
				if mData[2] == "warning" then
					r, g, b = 255, 0, 0
				end
				dxDrawRectangle(posX + mData[4], posY, screenH*0.010, screenW*0.04, tocolor(r, g, b, alpha*0.85), true)
				dxDrawText(mData[1], posX, posY, posX + mData[4], posY + screenW*0.04, tocolor(255, 255, 255, alpha), fontScale*00.13, "normal-sans", "center", "center", false, false, true, false, false)
			end
			i = i + 1
		until i > #msgd
		mensages = msgd
	end
end
addEventHandler("onClientRender", getRootElement(), renderMensages)