-- © 2018 needGaming
local sx,sy = guiGetScreenSize()
local font = dxCreateFont ("files/font.ttf", 19, false, "cleartype")
local state = true
local right_anim = {}
local left_anim = {}
local info = {}

function getFreeSlot()
	if not info[1] then return 1 end
	if not info[2] then return 2 end
	if not info[3] then return 3 end
	if not info[4] then return 4 end
	if not info[5] then return 5 end
	if not info[6] then return 6 end
	return false
end

function drawInfobox()
	for k, v in ipairs(info) do
		if info[k] then
			local x = 0
			if right_anim[k] then
				if right_anim[k] < 0 then
					right_anim[k] = right_anim[k] + 10
				end
				if v.tickStart + v.timeToShow < getTickCount() then
					left_anim[k] = right_anim[k]
					right_anim[k] = nil
				end
				x = right_anim[k]
			end
			if left_anim[k] then
				if left_anim[k] > -300 then
					left_anim[k] = left_anim[k] - 10
				end
				if left_anim[k] == -300 then
					left_anim[k] = nil
					info[k] = false
				end
				x = left_anim[k]
			end
			local w = dxGetTextWidth(removeHex(v.msg), 0.5, font)   
			dxDrawImage((tonumber(x) or - 400)-750 + tonumber(w), 446 - k * 40, 851, 256, "files/" .. v.type .. ".png", 0, 0, 0, tocolor(255, 255, 255, 250), true)
			dxDrawText(v.msg, (tonumber(x) or - 400) + 35, 300 - k * 40, 850, 35 + 850 - k * 40, tocolor(255,255,255,204), 0.5, font, "left", "center", false, true, true, true)
		end
	end
end
addEventHandler("onClientRender", root, drawInfobox)

function showBox(message, tip, timeToShow)
	if not tip then tip = "info" end
	if not timeToShow then timeS = 8000 else timeS = timeToShow end
	local slot = getFreeSlot()
	if not slot then return end
	info[slot] = {msg = message, type = tip, tickStart = getTickCount(), alpha = 125, timeToShow = timeS}
	right_anim[slot] = - 300
	left_anim[slot] = false
	if tip == "error" then
	playSound("files/error.mp3")
	else
	playSound("files/info.mp3")
	end
end
addEvent("showClientBox", true)
addEventHandler("showClientBox", getRootElement(), showBox)

function removeHex (text)
    return type(text)=="string" and string.gsub(text, "#%x%x%x%x%x%x", "") or text
end