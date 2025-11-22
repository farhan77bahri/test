local screenPos = {guiGetScreenSize()}
local PanelState = false
local recK = {250,300}
local recP = {screenPos[1]/2-recK[1]/2,screenPos[2]/2-recK[2]/2}

local progK = {250,30}
local progP = {screenPos[1]/2-progK[1]/2,screenPos[2]/2-progK[2]/2}

local showedNemATied = 0
local NumeroDoProgresso = 0
local MostrarProgresso = false
local enged = false
local progressMuvelet = ""

function fabricando()
MostrarProgresso = true
triggerServerEvent("setPlantAnim2",getLocalPlayer(),getLocalPlayer())
setElementFrozen(localPlayer,true)
end
addEvent("INICIO:MONTAR", true)
addEventHandler("INICIO:MONTAR", root, fabricando)

local valores = {88,148,90,25,88,88,10,159,10,148,90,176,88,148,90,25,88,88,10,159,10,148,90,88,10,155,88,148,90,25,88,88,10,159,10,148,90,88,148,90,25,88,88,10,159,10,148,90,88,10,155,88,148,90,25,88,88,10,159,10,148,90,175,90,25,159,174,88,88,148,90,25,88,88,10,159,10,148,90,173}

addEventHandler("onClientRender",getRootElement(),function()
	if MostrarProgresso then
		NumeroDoProgresso = NumeroDoProgresso + 0.1
		if NumeroDoProgresso > progK[1]-1 then
			MostrarProgresso = false
			NumeroDoProgresso = 0
			if progressMuvelet == "" then
				showedNemATied = 0
				NumeroDoProgresso = 0
				enged =false
			end
			randomitems = valores[math.random(#valores)]
		    ALEATORIO = 1
			triggerServerEvent('itemrandom1', getLocalPlayer(), getLocalPlayer(), randomitems, ALEATORIO, ALEATORIO)
			outputChatBox("#4169E1[4i20]: #ffffffVocê achou no lixo "..ALEATORIO.." #4169E1" .. exports.san_items:getItemName(randomitems) .. "", 255, 255, 255, true)
			triggerServerEvent("offPlantAnim2",getLocalPlayer(),getLocalPlayer())
		    setElementFrozen(localPlayer,false)
		end
		dxDrawRectangle(progP[1],progP[2],progK[1],progK[2],tocolor(0,0,0,110))
		dxCreateBorder(progP[1],progP[2],progK[1],progK[2],tocolor(0,0,0,255))
		
		dxDrawRectangle(progP[1]+1,progP[2]+1,NumeroDoProgresso,progK[2]-1,tocolor(65, 105, 225,130))
	end
end)


function dxCreateBorder(x,y,w,h,color)
	dxDrawRectangle(x,y,w+1,1,color) -- Fent
	dxDrawRectangle(x,y+1,1,h,color) -- Bal Oldal
	dxDrawRectangle(x+1,y+h,w,1,color) -- Lent Oldal
	dxDrawRectangle(x+w,y+1,1,h,color) -- Jobb Oldal
end

---------------------------------------------------------------------------------------------------------------


function progressofabricar()
        local BarraTempo = interpolateBetween(progP[1]*0, 0, 0, 100, 0, 0, (getTickCount()-tick)/900000, "Linear")
		dxDrawRectangle(progP[1],progP[2],progK[1],progK[2], tocolor(0, 0, 0, 110), false)
		dxDrawRectangle(progP[1],progP[2],progK[1]/100*BarraTempo,progK[2], tocolor(65, 105, 225, 130), false)
		dxCreateBorder(progP[1],progP[2],progK[1],progK[2],tocolor(0,0,0,255))
end
-------

local sx, sy = guiGetScreenSize()
local currentPanel = nil
local OpenSans0 = dxCreateFont("files/font2.ttf", 8)
local OpenSans1 = dxCreateFont("files/font2.ttf", 10)
local OpenSans2 = dxCreateFont("files/font2.ttf", 16)
local OpenSans3 = dxCreateFont("files/font2.ttf", 12)
local OpenSans4 = dxCreateFont("files/font2.ttf", 11)
local OpenSans5 = dxCreateFont("files/font2.ttf", 13)

ScreenW,ScreenH = 640, 480
sW,sH = guiGetScreenSize()
width, height = (sW/ScreenW), (sH/ScreenH)

function cancelDamageEvent2()
	if (#NpcSFabricar) then
		cancelEvent()
	end
end
addEventHandler("onClientPedDamage",  getRootElement(), cancelDamageEvent2)

function VenderFabricar()
	dxDrawImage(sx/2 - 420/2, sy/2 - 755/2, 808, 739, 'files/painel.png')

	if currentPanel == 1 then
		dxDrawRectangle(sx/2 + 412, sy/2 - 135, 2, 28, tocolor(65, 105, 225, 255))
	elseif currentPanel == 2 then
		dxDrawRectangle(sx/2 + 412, sy/2 - 83, 2, 28, tocolor(65, 105, 225, 255))
	elseif currentPanel == 3 then
		dxDrawRectangle(sx/2 + 412, sy/2 - 30, 2, 28, tocolor(65, 105, 225, 255))
	end

	    dxDrawRectangle(sx/2 + 417, sy/2 + 163, 155, 23, tocolor(0, 0, 0, 150))
	if isCursorOnElement(sx/2 + 417, sy/2 + 163, 155, 23) then
		dxDrawRectangle(sx/2 + 417, sy/2 + 163, 155, 23, tocolor(65, 105, 225, 200))
		dxDrawText('FABRICAR', sx/2 + 493, sy/2 + 175, _, _, tocolor(0, 0, 0, 255), 1, OpenSans1, 'center', 'center')
	else
		dxDrawText('FABRICAR', sx/2 + 493, sy/2 + 175, _, _, tocolor(255, 255, 255, 255), 1, OpenSans1, 'center', 'center')
		
	end

		dxDrawRectangle(sx/2 + 417, sy/2 + 190, 155, 23, tocolor(0, 0, 0, 150))
	if isCursorOnElement(sx/2 + 417, sy/2 + 190, 155, 23) then
		dxDrawRectangle(sx/2 + 417, sy/2 + 190, 155, 23, tocolor(255, 51, 51, 200))
		dxDrawText('FECHAR', sx/2 + 493, sy/2 + 202, _, _, tocolor(0, 0, 0, 255), 1, OpenSans1, 'center', 'center')
	else
		dxDrawText('FECHAR', sx/2 + 493, sy/2 + 202, _, _, tocolor(255, 255, 255, 255), 1, OpenSans1, 'center', 'center')
	end
end


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

-- //#FORMATO DOS NUMEROS
function convertNumber ( number )   
    local formatted = number   
    while true do       
        formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')     
        if ( k==0 ) then       
            break   
        end   
    end   
    return formatted 
end