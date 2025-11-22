local screenW,screenH = guiGetScreenSize()
local resW, resH = 1366, 768
local x, y =  (screenW/resW), (screenH/resH)

local dxfont0_tinoko = dxCreateFont("tinoko.ttf", 20)

function convertTime(ms) 
    local min = math.floor ( ms/30000 ) 
    local sec = math.floor( (ms/1000)%60 ) 
    return min, sec 
end

rote = 0
function sistemaencoma()
	local timer = interpolateBetween(30000, 0, 0, 0, 0, 0, (getTickCount()-tick)/30000, "Linear")	
    local minutes, seconds = convertTime(timer)
    dxDrawText("Você está se recuperando do coma:", screenW * 0.3779, screenH * 0.8177, screenW * 0.5706, screenH * 0.8672, tocolor(255, 255, 255, 255), 1.00, dxfont0_tinoko, "center", "bottom", false, false, false, false, false)		
    dxDrawText(seconds.. " segundos restante", screenW * 0.3779, screenH * 0.8177, screenW * 0.5706, screenH * 0.9172, tocolor(255, 255, 255, 255), 1.00, dxfont0_tinoko, "center", "bottom", false, false, false, false, false)		
end


function OpenRevistarSus ()
tick = getTickCount()
addEventHandler("onClientRender", root, sistemaencoma)
end
addEvent("MorreuDX", true)
addEventHandler("MorreuDX", getRootElement(), OpenRevistarSus)
 
function CloseRevistarSus ()
tick = getTickCount()
removeEventHandler("onClientRender", root, sistemaencoma)
end
addEvent("CuradoDX", true)
addEventHandler("CuradoDX", getRootElement(), CloseRevistarSus)
