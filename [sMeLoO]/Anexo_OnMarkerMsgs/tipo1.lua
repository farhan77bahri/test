sW, sH = guiGetScreenSize()
rX, rY = 1366, 768 -- Resolucao cujo a funcao foi criada - DO NOT EDIT OR THE DX WILL FUCK UP
dRX, dRY = 1600, 900
textRender = 1

local font = dxCreateFont( "font.ttf", 30, false, "cleartype" )

function dxDrawBorderedText( text, x, y, w, h, color, size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos)
	dxDrawText( text, x-2, y, w-2, h, tocolor(0, 0, 0, 255), size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos) -- X Left Bold
	dxDrawText( text, x+2, y, w+2, h, tocolor(0, 0, 0, 255), size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos) -- X Right Bold
	dxDrawText( text, x, y+2, w, h+2, tocolor(0, 0, 0, 255), size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos) -- Y Up Bold
	dxDrawText( text, x, y-2, w, h-2, tocolor(0, 0, 0, 255), size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos) -- Y Down Bold
	dxDrawText( text, x, y, w, h, color, size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos) -- Core Text
end

if sW >= 1024 and sH >= 768 then
	textRender = 1.5
	otherText = 0.5
else
	textRender = 0.9
	otherText = 0.5
end

SAFEZONE_Y = 0

function aToR( X, Y, sX, sY, rtype)
	local rCX, rCY = rX, rY
	if not rtype then
		rCX = rX
		rCY = rY
	else
		rCX = dRX
		rCY = dRY
	end
	local xd = X/rCX or X
	local yd = Y/rCY or Y
	local xsd = sX/rCX or sX
	local ysd = sY/rCY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

local txtX, txtY, txtSX, txtSY = aToR( 0, 0+SAFEZONE_Y, 1366, 768) -- Texto
 
local texto = ""
function showT1()
 --dxDrawBorderedText( text, x, y, w, h, color, size, font, alignX, alignY, clip, wordBreak, postGUI, colorCoded, pixelPos)
 
 dxDrawBorderedText(texto, txtX, txtY, txtSX, txtSY, tocolor(255,255,255,255), otherText, font, "center", "center", false, false, false, false, false)	
 end
addEventHandler("onClientRender", root,showT1)



local vcontrole = false
function create(msg)
	if vcontrole == false then
	texto = msg
	vcontrole = true
	end
	if vcontrole == true then
		texto = msg
	end
end
addEvent( "Script:OnMarkerMsgs:create", true )
addEventHandler( "Script:OnMarkerMsgs:create",localPlayer, create )



function delete()
	if vcontrole == true then
		texto = ""
		vcontrole = false
	end
end
addEvent( "Script:OnMarkerMsgs:delete", true )
addEventHandler( "Script:OnMarkerMsgs:delete",localPlayer, delete )

