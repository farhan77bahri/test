--[[
local screenW, screenH   = guiGetScreenSize()
local resW2, resH2       = 1920,1080
local x, y               = (screenW/resW2), (screenH/resH2)

timerReset = false
jobIlegal = false

function timeCount ()
     if (segundos) then
	     segundos = segundos - 1
	 end
	 if (segundos == 0) then
	     segundos = 59
	     zero = ""
	     minutos = minutos - 1
	 end
     if (segundos < 10) then
	     zero = 0
	 end
end

local atendente = createPed(293, -2186.016, 2417.385, 5.188)
setElementData(atendente, "JOB:Ped", true)
setElementData(atendente, "Ped:Name", "Serviços Ilegais")
setElementData(atendente, "BTC:ilegais", true)
setElementRotation(atendente, -0, 0, 174.688)
setElementFrozen(atendente, true)

addEventHandler ( "onClientPedDamage", atendente,
     function () 
       cancelEvent()
end)

function Select ( button, state, _, _, _, _, _, click)
     if button == "left" and state == "down" then
	     if ( click ) then
		     if ( getElementType ( click ) == "ped" ) then
	      	 local cx, cy, cz = getElementPosition ( click )
	     	 local px, py, pz = getElementPosition ( localPlayer )
	     	 local distance	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
          	     if ( distance <= 10 ) then
				     if (getElementData(click, "BTC:ilegais") == true) then
					     if not jobIlegal then
			                 addEventHandler("onClientRender", root, startDxPanel)
							 jobIlegal = true
						 end
					 end
	  	         end
	         end
         end
     end
end
addEventHandler ( "onClientClick", root, Select)

cor  = {}
text = {}
desc = {}

local tabelaName = {
     {1, "Nesse trabalho é necessário que você vá até \n o ponto de coleta de cocaina, maconha ou metanfetamina. \n Ao coletar vá até os pontos de processo e após é so vender."},
     {4, "Nesse serviço você recebrá\n ao longo do dia serviços para realizar \n de donos empresas até chefe de facções deverá matar!\n (Necessita de arma de fogo para esse serviço)."},
     {2, "Mate determinadas pessoas e leve para retirar seus orgãos. \n Para vender no mercado negro."},
     {5, "Serviço Disponivel na proxima atualização."},
     {3, "Clone o máximo de cartões e saia distribuindo \n no mercado negro."},
  --   {4, "Roube veiculos de luxo espalhados\n na cidade e leve para o desmanche."},
  --   {5, "Clone vários cartões e venda para seus clientes determinados."},
}

function startDxPanel ()
if isCursorShowing () then
	 desc = 0
        dxDrawImage(x*20, y*285, x*468, y*514, "model/backgroundC.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
        dxDrawText("TRABALHO ILEGAL - BGO", x*51, y*298, x*383, y*347, tocolor(1, 0, 0, 172), x*1.50, "default-bold", "left", "center", false, false, false, false, false)
        dxDrawText("NOME DO EMPREGO", x*51, y*347, x*175, y*366, tocolor(255, 254, 254, 103), x*1.00, "default-bold", "left", "bottom", false, false, false, false, false)
        dxDrawText("LEVEL", x*337, y*349, x*461, y*368, tocolor(255, 254, 254, 103), x*1.00, "default-bold", "right", "bottom", false, false, false, false, false)
		
        cor[1]  = tocolor(1, 1, 0, 92)
		text[1] = tocolor(255, 255, 255, 102)
		if isCursorOnElement(x*29, y*378, x*449, y*34) then cor[1] = tocolor(255, 160, 0, 215) text[1] = tocolor(0, 0, 0, 94) desc = 1 end

        cor[2] = tocolor(1, 1, 0, 92)
		text[2] = tocolor(255, 255, 255, 102)
     	if isCursorOnElement(x*29, y*412, x*449, y*34) then cor[2] = tocolor(255, 160, 0, 215) text[2] = tocolor(0, 0, 0, 94) desc = 2 end
		
        cor[3] = tocolor(1, 1, 0, 92)
		text[3] = tocolor(255, 255, 255, 102)
     	if isCursorOnElement(x*30, y*446, x*449, y*34) then cor[3] = tocolor(255, 160, 0, 215) text[3] = tocolor(0, 0, 0, 94) desc = 3 end
		
        cor[4] = tocolor(1, 1, 0, 92)
		text[4] = tocolor(255, 255, 255, 102)
     	if isCursorOnElement(x*30, y*480, x*449, y*34) then cor[4] = tocolor(255, 160, 0, 215) text[4] = tocolor(0, 0, 0, 94) desc = 4 end
		
        cor[5] = tocolor(1, 1, 0, 92)
		text[5] = tocolor(255, 255, 255, 102)
     	if isCursorOnElement(x*30, y*514, x*449, y*34) then cor[5] = tocolor(255, 160, 0, 215) text[5] = tocolor(0, 0, 0, 94) desc = 5 end
		
        dxDrawRectangle(x*29, y*378, x*449, y*34, cor[1], false)
        dxDrawRectangle(x*29, y*412, x*449, y*34, cor[2], false)
        dxDrawRectangle(x*30, y*446, x*449, y*34, cor[3], false)
        dxDrawRectangle(x*30, y*480, x*449, y*34, cor[4], false)
        dxDrawRectangle(x*30, y*514, x*449, y*34, cor[5], false)
		
        dxDrawText("v1.5", x*401, y*765, x*469, y*784, tocolor(255, 160, 0, 255), x*1.00, "default-bold", "right", "bottom", false, false, false, false, false)
        dxDrawText("PRESSIONE #FFA000'X' #FFFFFFPARA FECHAR O PAINEL E #FFA000CLIQUE #FFFFFFPARA INICIAR", x*43, y*765, x*401, y*784, tocolor(255, 255, 255, 255), x*1.00, "default-bold", "left", "bottom", false, false, false, true, false)
		
        dxDrawRectangle(x*30, y*557, x*449, y*198, tocolor(1, 1, 0, 67), false)
        dxDrawRectangle(x*30, y*557, x*448, y*23, tocolor(1, 1, 0, 100), false)
		
        dxDrawText("DESCRIÇÃO DO SERVIÇO", x*27, y*558, x*478, y*580, tocolor(255, 160, 0, 129), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
		
        dxDrawText("TRAFICANTE DE DROGAS", x*44, y*378, x*322, y*412, text[1], x*1.20, "default-bold", "left", "center", false, false, true, false, false)
        dxDrawText("TRAFICANTE DE ORGÃOS", x*44, y*412, x*322, y*446, text[2], x*1.20, "default-bold", "left", "center", false, false, true, false, false)
        dxDrawText("TRABALHO DE HACKER", x*44, y*446, x*322, y*480, text[3], x*1.20, "default-bold", "left", "center", false, false, true, false, false)
        dxDrawText("MATADOR DE ALUGUEL (OFFLINE)", x*44, y*480, x*322, y*514, text[4], x*1.20, "default-bold", "left", "center", false, false, true, false, false)
        dxDrawText("LADRÃO DE CARRO (EM BREVE)", x*44, y*514, x*322, y*548, text[5], x*1.20, "default-bold", "left", "center", false, false, true, false, false)
		
        dxDrawText("LV 02", x*407, y*379, x*461, y*412, text[1], x*1.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("LV 05", x*407, y*412, x*461, y*445, text[2], x*1.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("LV 08", x*407, y*445, x*461, y*478, text[3], x*1.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("LV 12", x*407, y*481, x*461, y*514, text[4], x*1.00, "default-bold", "center", "center", false, false, false, true, false)
        dxDrawText("LV NA", x*407, y*514, x*461, y*547, text[5], x*1.00, "default-bold", "center", "center", false, false, false, true, false)
		
		 for k,v in pairs(tabelaName) do
		     if (desc == v[1]) then
		   	     dxDrawText(v[2], x*43, y*582, x*463, y*755, tocolor(255, 255, 255, 255), x*1.20, "default-bold", "center", "center", false, false, false, false, false)
		     end
		 end
     else
     deletPainel ()
     end
end




function close () 
     if jobIlegal then
         removeEventHandler("onClientRender", root, startDxPanel)
		 jobIlegal = false
		 showCursor(false)
	 end
end
bindKey("X", "down", close)

function deletPainel ()
     if jobIlegal then
	     removeEventHandler("onClientRender", root, startDxPanel)
		 jobIlegal = false
	 end
end


addEventHandler("onClientClick", root,
function (_,state)
     if jobIlegal then
         if state == "down" then
		 			 local lv = getElementData( localPlayer, "Sys:Level" ) or 0
	         if isCursorOnElement(x*29, y*378, x*449, y*34, screenH * 0.0287) then
			 if tonumber(lv) >= 2 then
	             triggerServerEvent("JOB:Traficante", root, localPlayer)
				 else
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  

				  
				  
				 				outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Você não tem level o suficiente para entrar nesse trabalho ilegal" , 200, 0, 0, true)
				 outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Precisa ser Level 2" , 200, 0, 0, true)
				end
             end
	         if isCursorOnElement(x*29, y*412, x*449, y*34) then
			   if tonumber(lv) >= 4 then
	
	             triggerServerEvent("JOB:Org", root, localPlayer)
				 else
				 								  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				 			   outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Você não tem level o suficiente para entrar nesse trabalho ilegal" , 200, 0, 0, true)
			    outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Precisa ser Level 4" , 200, 0, 0, true)
				 end
             end
	         if isCursorOnElement(x*30, y*446, x*449, y*34) then
			  if tonumber(lv) >= 8 then
	             triggerServerEvent("JOB:Hacker", root, localPlayer)
				 else
				 								  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				  outputChatBox ( " " , 200, 0, 0, true)
				 				 				outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Você não tem level o suficiente para entrar nesse trabalho ilegal" , 200, 0, 0, true)
				 outputChatBox ( "#7cc576[ILEGAIS] #FFFFFF*Precisa ser Level 8" , 200, 0, 0, true)
				 end
             end
         end
     end
end)

--[[
downloading = false
local start = {}
function dxDrawLoading ()
    local now = getTickCount()
    seconds = second or timer
	local color = color or tocolor(0,0,0,170)
	local color2 = color2 or tocolor(255,255,0,170)
	local size = size or x*1.00
    local with = interpolateBetween(0,0,0,0.2531,0,0, (now - start) / ((start + seconds) - start), "Linear")
    local text = interpolateBetween(0,0,0,100,0,0,(now - start) / ((start + seconds) - start),"Linear")
        dxDrawRectangle(screenW * 0.3792, screenH * 0.6907, screenW * 0.2635, screenH * 0.0407, tocolor(0, 0, 0, 193), false)
        dxDrawRectangle(screenW * 0.3844, screenH * 0.7000, screenW * with, screenH * 0.0222, tocolor(118, 190, 87, 211), false)
        dxDrawText(math.floor(text).."%", screenW * 0.3792, screenH * 0.6907, screenW * 0.6427, screenH * 0.7315, tocolor(255, 255, 255, 254), x*1.00, "default-bold", "center", "center", false, false, false, false, false)
 end

function progressServiceBar (timeP)
     if not (downloading == false) then
         removeEventHandler("onClientRender", root, dxDrawLoading)		
    	 downloading = false 
	 end
	     if timeP then
	         timer = timeP*1000
	         setTimer(progressServiceBar, timer, 1)
             addEventHandler("onClientRender", root, dxDrawLoading)
		     downloading = true
		     start = getTickCount()
             else
             removeEventHandler("onClientRender", root, dxDrawLoading)		
    		 downloading = false 
     end
end
addEvent("progressService", true)
addEventHandler("progressService", root, progressServiceBar)

addEvent("cancelDx", true)
addEventHandler("cancelDx", root,
function ()
     if (downloading == true) then
         timer = nil
         removeEventHandler("onClientRender", root, dxDrawLoading)		
    	 downloading = false 
     end		 
end)

addEvent("cancelMissoes", true)
addEventHandler("cancelMissoes", root,
function ()
     if (downloading == true) then
         removeEventHandler("onClientRender", root, dxDrawLoading)	
     end		 
end)
--]]

addEventHandler ( "onClientPedDamage", getRootElement(),
     function ()
	     if getElementData(source, "JOB:Ped") then
	         cancelEvent()
		 end
	 end
)

local x,y = guiGetScreenSize()
 function isCursorOnElement(x,y,w,h)
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end
--]]