local txtX, txtY, txtSX, txtSY = aToR( 0, 0+SAFEZONE_Y, 1366, 768) -- Texto
local font = dxCreateFont( "font.ttf", 25, false, "cleartype" ) 
local texto2 = ""
function showT1()
dxDrawBorderedText(texto2, txtX, txtY, txtSX, txtSY, tocolor(255,255,255,255), otherText, font, "center", "bottom", false, false, false, false, false)	
 end
addEventHandler("onClientRender", root,showT1)



local vcontrole2 = false
function create2(msg)
	if vcontrole2 == false then
	texto2 = msg
	vcontrole2 = true
	end
	if vcontrole2 == true then
		texto2 = msg
	end
end
addEvent( "Script:OnMarkerMsgs:create2", true )
addEventHandler( "Script:OnMarkerMsgs:create2",localPlayer, create2 )



function delete2()
	if vcontrole2 == true then
		texto2 = ""
		vcontrole2 = false
	end
end
addEvent( "Script:OnMarkerMsgs:delete2", true )
addEventHandler( "Script:OnMarkerMsgs:delete2",localPlayer, delete2 )

