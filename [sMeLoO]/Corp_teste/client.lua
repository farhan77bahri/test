local NmDoResource = getResourceName(getThisResource())


local screenW,screenH = guiGetScreenSize()
local resW, resH = 1360,768
local x, y = (screenW/resW), (screenH/resH)


local pPrin = false 

local pPatru = false
local pPcolete = false
local pParmas = false
local pUniform = false

local pAcao = false
local pAcColete = false
local pAcArmas = false
local pAcGran = false

cor = {}

function painelPrincipal()

   cor[1] = tocolor(215, 0, 0, 255) -- coloque aqui a cor q deseja!! cor no formato de rgb numeros!!

   dxDrawRectangle(x*43, y*167, x*235, y*25, cor[1], false)
   dxDrawRectangle(x*43, y*191, x*235, y*314, tocolor(0, 0, 0, 194), false)
   dxDrawText("EQUIPAMENTOS", x*106, 169, x*243, y*191, tocolor(255, 255, 255, 255), 1.00, "sans", "left", "top", false, false, false, false, false)

   dxDrawRectangle(x*53, y*216, x*100, y*25, tocolor(0, 0, 0, 217), false)
   dxDrawText("Patrulhamento", x*63, y*220, x*132, y*237, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)

   dxDrawRectangle(x*168, y*216, x*100, y*25, tocolor(0, 0, 0, 217), false)
   dxDrawText("Ação", x*203, y*220, x*278, y*241, tocolor(255, 255, 255, 255), 1.00, "default-bold", "left", "top", false, false, false, false, false)
   
   dxDrawRectangle(x*252, y*167, x*26, y*25, tocolor(0, 0, 0, 217), false)
   dxDrawText("X", x*262, y*170, x*269, y*192, tocolor(255, 255, 255, 255), 1.00, "default", "left", "top", false, false, false, false, false)

end

function painelPatrulhamento() -- Painel Patru

   dxDrawImage(x*69, y*267, x*63, y*59, ":"..NmDoResource.."/imgs/coleteLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*184, y*267, x*62, y*58, ":"..NmDoResource.."/imgs/ia2Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   --dxDrawImage(x*74, y*363, x*58, y*56, ":"..NmDoResource.."/imgs/jobLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*74, y*363, x*48, y*47, ":"..NmDoResource.."/imgs/uniformLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   --dxDrawImage(x*191, y*361, x*47, y*47, ":"..NmDoResource.."/imgs/carLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end

function painelPtColete() -- Patru Colete

   dxDrawRectangle(x*288, y*167, x*145, y*25, cor[1], false)
   dxDrawRectangle(x*288, y*192, x*145, y*59, tocolor(0, 0, 0, 187), false)

   dxDrawImage(x*298, y*199, x*54, y*52, ":"..NmDoResource.."/imgs/coleteLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*375, y*202, x*48, y*46, ":"..NmDoResource.."/imgs/vidaLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end

function painelPtArmas() -- Patru Armas

   dxDrawRectangle(x*288, y*167, x*192, y*25, cor[1], false)
   dxDrawRectangle(x*288, y*192, x*192, y*215, tocolor(0, 0, 0, 187), false)

   dxDrawImage(x*298, y*202, x*62, y*58, ":"..NmDoResource.."/imgs/ia2Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- ptarma1
   dxDrawImage(x*398, y*201, x*68, y*65, ":"..NmDoResource.."/imgs/taserLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- ptarma2
   dxDrawImage(x*304, y*281, x*50, y*48, ":"..NmDoResource.."/imgs/shotLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- ptarma3
   dxDrawImage(x*406, y*281, x*50, y*49, ":"..NmDoResource.."/imgs/sprayLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- ptarma4
   dxDrawImage(x*304, y*345, x*53, y*52, ":"..NmDoResource.."/imgs/caceteteLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- ptarma5

end

function painelUniform()

   dxDrawRectangle(x*288, y*167, x*143, y*25, cor[1], false)
   dxDrawRectangle(288, y*192, x*143, y*122, tocolor(0, 0, 0, 187), false)
   dxDrawImage(x*298, y*200, x*48, y*47, ":"..NmDoResource.."/imgs/uniformLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*370, y*201, x*47, y*47, ":"..NmDoResource.."/imgs/apaiLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*299, y*261, x*50, y*48, ":"..NmDoResource.."/imgs/uniformLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end



function painelAcao()

   dxDrawImage(x*68, y*273, x*64, y*62, ":"..NmDoResource.."/imgs/coleteLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*188, y*271, x*57, y*57, ":"..NmDoResource.."/imgs/ia2Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*78, y*381, x*46, y*45, ":"..NmDoResource.."/imgs/uniformLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   --dxDrawImage(x*192, y*380, x*47, y*47, ":"..NmDoResource.."/imgs/carLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end



function painelAcColete() -- Ação Colete

   dxDrawRectangle(x*288, y*167, x*145, y*25, cor[1], false)
   dxDrawRectangle(x*288, y*192, x*145, y*59, tocolor(0, 0, 0, 187), false)

   dxDrawImage(x*298, y*199, x*54, y*52, ":"..NmDoResource.."/imgs/coleteLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
   dxDrawImage(x*375, y*202, x*48, y*46, ":"..NmDoResource.."/imgs/vidaLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)

end



function painelAcArmas()
   dxDrawRectangle(x*292, y*167, x*235, y*25, cor[1], false)
   dxDrawRectangle(x*292, y*191, x*235, y*179, tocolor(0, 0, 0, 217), false)

   dxDrawImage(x*309, y*202, x*54, y*53, ":"..NmDoResource.."/imgs/ia2Logo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma1
   dxDrawImage(x*387, y*204, x*52, y*51, ":"..NmDoResource.."/imgs/subLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma2
   dxDrawImage(x*469, y*205, x*51, y*50, ":"..NmDoResource.."/imgs/pistolLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma3
   dxDrawImage(x*309, y*288, x*53, y*52, ":"..NmDoResource.."/imgs/sniperLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma4
   dxDrawImage(x*372, y*292, x*87, y*44, ":"..NmDoResource.."/imgs/cbshotgunLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma5
   dxDrawImage(x*474, y*292, x*44, y*45, ":"..NmDoResource.."/imgs/teargasLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- Acarma6

end



function painelAcGranada()

   dxDrawRectangle(x*541, y*167, x*157, y*25, cor[1], false)
   dxDrawRectangle(x*541, y*192, x*157, y*138, tocolor(0, 0, 0, 217), false)
   dxDrawImage(x*551, y*206, x*47, y*46, ":"..NmDoResource.."/imgs/teargasLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- AcGr1
   dxDrawImage(x*616, y*200, x*87, y*58, ":"..NmDoResource.."/imgs/grenadeLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- AcGr2
   dxDrawImage(x*589, y*268, x*62, y*47, ":"..NmDoResource.."/imgs/glassesLogo.png", 0, 0, 0, tocolor(255, 255, 255, 255), false) -- AcGr3

end


----- Abrir-Fechar Painel Principal ----------


function abrir (_,state)
if pPrin == false then 
showCursor(true)
addEventHandler("onClientRender", root, painelPrincipal)
pPrin = true
if not fontScale then fontScale = screenW/225 end
tick1 = getTickCount()
else
showCursor(false)
removeEventHandler("onClientRender", root, painelPrincipal)
pPrin = false
end
end
addEvent("PArmas", true)
addEventHandler("PArmas", root , abrir)


function fechar (_,state)
if pPrin == true then
if  state == "down"  then
  if  isCursorOnElement(x*252, y*167, x*26, y*25 ) then
   showCursor(false)
   removeEventHandler("onClientRender", root, painelPrincipal)
   removeEventHandler("onClientRender", root, painelAcao) -- Painel Ação
   removeEventHandler("onClientRender", root, painelPatrulhamento) -- Painel Patru
   removeEventHandler("onClientRender", root, painelPtColete) -- Patru Colete
   removeEventHandler("onClientRender", root, painelPtArmas) -- Patru Armas
   removeEventHandler("onClientRender", root, painelUniform) -- Patru Job

   removeEventHandler("onClientRender", root, painelAcColete) -- Ação Colete
   removeEventHandler("onClientRender", root, painelAcArmas) -- Ação Armas
   removeEventHandler("onClientRender", root, painelAcGranada) -- Ação Granadas(TearGas)

   pPrin = false
   pAcao = false
   pPatru = false
   pPcolete = false
   pParmas = false
   pUniform = false

   pAcColete = false
   pAcArmas = false
   pAcGran = false
  end
end
end
end
addEventHandler ("onClientClick", root, fechar)


function AbrirPatru(_,state)
if pPrin == true then
if pPatru == false then
   if state == "down" then
   if isCursorOnElement(x*53, y*216, x*100, y*25 ) then
      playSound("Click.wav")
      addEventHandler("onClientRender", root, painelPatrulhamento) -- Painel Patru
      removeEventHandler("onClientRender", root, painelAcao) -- Painel Ação
      removeEventHandler("onClientRender", root, painelAcColete) -- Ação Colete
      removeEventHandler("onClientRender", root, painelAcArmas) -- Ação Armas
      removeEventHandler("onClientRender", root, painelAcGranada) -- Ação Granadas(TearGas)
      pPatru = true
      pAcao = false

      pAcColete = false
      pAcArmas = false
      pAcGran = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbrirPatru)


function AbPtColete(_,state)
if pPatru == true then
if pPcolete == false then
   if state == "down" then
   if isCursorOnElement(x*69, y*267, x*63, y*59 ) then
      playSound("Click.wav")
      addEventHandler("onClientRender", root, painelPtColete) -- Patru Colete
      removeEventHandler("onClientRender", root, painelPtArmas) -- Patru Armas
      removeEventHandler("onClientRender", root, painelUniform) -- Patru Job
      pPcolete = true
      pParmas = false
      pUniform = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbPtColete)

function PgPtColete(_,state)
if pPcolete == true then
   if state == "down" then
   if isCursorOnElement(x*298, y*199, x*54, y*52 ) then
      triggerServerEvent("colete", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, PgPtColete)


function PgPtVida(_,state)
if pPcolete == true then
   if state == "down" then
   if isCursorOnElement(x*375, y*202, x*48, y*46 ) then
      triggerServerEvent("vida", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, PgPtVida)

------------------------------------------------------------------------------------------------------------


function AbPtArmas(_,state)
if pPatru == true then
if pParmas == false then
   if state == "down" then
   if isCursorOnElement(x*184, y*267, x*62, y*58 ) then
      playSound("Click.wav")
         addEventHandler("onClientRender", root, painelPtArmas) -- Patru Armas
         removeEventHandler("onClientRender", root, painelPtColete) -- Patru Colete
         removeEventHandler("onClientRender", root, painelUniform) -- Patru Job
         pParmas = true
         pPcolete = false
         pUniform = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbPtArmas)

function PgPtArma1(_,state) -- ptarma1
   if pParmas == true then
      if state == "down" then
      if isCursorOnElement(x*298, y*202, x*62, y*58 ) then
         triggerServerEvent("M4", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgPtArma1)

function PgPtArma2(_,state) -- ptarma2
   if pParmas == true then
      if state == "down" then
      if isCursorOnElement(x*398, y*201, x*68, y*65 ) then
         triggerServerEvent("taser", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgPtArma2)

function PgPtArma3(_,state) -- ptarma3
   if pParmas == true then
      if state == "down" then
      if isCursorOnElement(x*304, y*281, x*50, y*48 ) then
         triggerServerEvent("shot", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgPtArma3)

function PgPtArma4(_,state) -- ptarma4
   if pParmas == true then
      if state == "down" then
      if isCursorOnElement(x*406, y*281, x*50, y*49 ) then
         triggerServerEvent("spray", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgPtArma4)

function PgPtArma5(_,state) -- ptarma5
   if pParmas == true then
      if state == "down" then
      if isCursorOnElement(x*304, y*345, x*53, y*52 ) then
         triggerServerEvent("stick", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgPtArma5)

------------------------------------------------------------------------------------------------------------

function AbUniform(_,state)
if pPatru == true then
if pUniform == false then
   if state == "down" then
   if isCursorOnElement(x*74, y*363, x*48, y*47 ) then
      playSound("Click.wav")
      addEventHandler("onClientRender", root, painelUniform) -- Patru Job
      removeEventHandler("onClientRender", root, painelPtColete) -- Patru Colete
      removeEventHandler("onClientRender", root, painelPtArmas) -- Patru Armas
         pUniform = true
         pPcolete = false
         pParmas = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbUniform)



function DarUniform1(_,state) 
   if pUniform == true then
      if state == "down" then
      if isCursorOnElement(x*298, y*200, x*48, y*47 ) then
         triggerServerEvent("darPTuni1", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, DarUniform1)



function DarUniform2(_,state) 
   if pUniform == true then
      if state == "down" then
      if isCursorOnElement(x*299, y*261, x*50, y*48 ) then
         triggerServerEvent("darPTuni2", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, DarUniform2)



function TirarUniform(_,state)
 if pUniform == true then
   if state == "down" then
   if isCursorOnElement(x*370, y*201, x*47, y*47 ) then
      --aleatorio = math.random(0, 10)
      --setElementModel(source, SkinsR[ math.random( #SkinsR ) ])
      triggerServerEvent("saiuJob", localPlayer)
      triggerServerEvent("tiraruni", localPlayer)
      playSound("Click.wav")
   end
   end
 end
end
addEventHandler ("onClientClick", root, TirarUniform)

--SkinsR  = {"162", "21", "78", "101"}






function AbrirAcao(_,state)
if pPrin == true then
if pAcao == false then
   if state == "down" then
   if isCursorOnElement(x*168, y*216, x*100, y*25 ) then
      playSound("Click.wav")
      addEventHandler("onClientRender", root, painelAcao) -- Painel Ação
      removeEventHandler("onClientRender", root, painelPatrulhamento) -- Painel Patru
      removeEventHandler("onClientRender", root, painelPtColete) -- Patru Colete
      removeEventHandler("onClientRender", root, painelPtArmas) -- Patru Armas
      removeEventHandler("onClientRender", root, painelUniform) -- Patru Job
      pAcao = true
      pPatru = false
      pPcolete = false
      pParmas = false
      pUniform = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbrirAcao)



function AbAcColete(_,state)
if pAcao == true then
if pAcColete == false then
   if state == "down" then
   if isCursorOnElement(x*68, y*273, x*64, y*62 ) then
      playSound("Click.wav")
      addEventHandler("onClientRender", root, painelAcColete) -- Ação Colete
      removeEventHandler("onClientRender", root, painelAcArmas) -- Ação Armas
      removeEventHandler("onClientRender", root, painelAcGranada) -- Ação Granadas(TearGas)

      pAcColete = true
      pAcArmas = false
      pAcGran = false

   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbAcColete)


function PgAcColete(_,state)
if pAcColete == true then
   if state == "down" then
   if isCursorOnElement(x*298, y*199, x*54, y*52) then
      triggerServerEvent("colete", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, PgAcColete)


function PgAcVida(_,state)
if pAcColete == true then
   if state == "down" then
   if isCursorOnElement(x*375, y*202, x*48, y*46 ) then
      triggerServerEvent("vida", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, PgAcVida)




function AbAcArmas(_,state)
if pAcao == true then
if pAcArmas == false then
   if state == "down" then
   if isCursorOnElement(x*188, y*271, x*57, y*57 ) then
      playSound("Click.wav")
         addEventHandler("onClientRender", root, painelAcArmas) -- Ação Armas
         removeEventHandler("onClientRender", root, painelAcColete) -- Ação Colete

         pAcArmas = true
         pAcColete = false
   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbAcArmas)

function PgAcArma1(_,state) -- Acarma1
   if pAcArmas == true then
      if state == "down" then
      if isCursorOnElement(x*309, y*202, x*54, y*53) then
         triggerServerEvent("M4", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcArma1)

function PgAcArma2(_,state) -- Acarma2
   if pAcArmas == true then
      if state == "down" then
      if isCursorOnElement(x*387, y*204, x*52, y*51 ) then
         triggerServerEvent("sub", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcArma2)

function PgAcArma3(_,state) -- Acarma3
   if pAcArmas == true then
      if state == "down" then
      if isCursorOnElement(x*469, y*205, x*51, y*50) then
         triggerServerEvent("pistol", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcArma3)

function PgAcArma4(_,state) -- Acarma4
   if pAcArmas == true then
      if state == "down" then
      if isCursorOnElement(x*309, y*288, x*53, y*52 ) then
         triggerServerEvent("sniper", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcArma4)

function PgAcArma5(_,state) -- Acarma5
   if pAcArmas == true then
      if state == "down" then
      if isCursorOnElement(x*372, y*292, x*87, y*44 ) then
         triggerServerEvent("cbshot", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcArma5)


function AbAcArmas(_,state)
if pAcArmas == true then
if pAcGran == false then
   if state == "down" then
   if isCursorOnElement(x*474, y*292, x*44, y*45 ) then
      playSound("Click.wav")
         addEventHandler("onClientRender", root, painelAcGranada) -- Ação Granadas(TearGas)

         pAcGran = true

   end
   end
end
end
end
addEventHandler ("onClientClick", root, AbAcArmas)


function PgAcGr1(_,state) -- AcGr1
   if pAcGran == true then
      if state == "down" then
      if isCursorOnElement(x*551, y*206, x*47, y*46) then
         triggerServerEvent("teargas", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcGr1)

function PgAcGr2(_,state) -- AcGr2
   if pAcGran == true then
      if state == "down" then
      if isCursorOnElement(x*616, y*200, x*87, y*58 ) then
         triggerServerEvent("grenade", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcGr2)

function PgAcGr3(_,state) -- AcGr3
   if pAcGran == true then
      if state == "down" then
      if isCursorOnElement(x*589, y*268, x*62, y*47) then
         triggerServerEvent("glasses", localPlayer)
         playSound("Click.wav")
      end
      end
   end
end
addEventHandler ("onClientClick", root, PgAcGr3)

-----------------------------------------------------------------------------------------------------


function DarAcUniform(_,state) 
   if pAcao == true then
      if state == "down" then
      if isCursorOnElement(x*78, y*381, x*46, y*45 ) then
         playSound("Click.wav")
         triggerServerEvent("darACuni", localPlayer)
      end
      end
   end
end
addEventHandler ("onClientClick", root, DarAcUniform)


-----------------------------------------------------------------------------------------------------

--[[function VtrPt(_,state)
if pPatru == true then
   if state == "down" then
   if isCursorOnElement(x*191, y*361, x*47, y*47 ) then
      triggerServerEvent("vtrPt", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, VtrPt)]]


--[[function VtrRocam(_,state)
if pAcao == true then
   if state == "down" then
   if isCursorOnElement(x*191, y*361, x*47, y*47 ) then
      triggerServerEvent("vtrRocam", localPlayer)
      playSound("Click.wav")
   end
   end
end
end
addEventHandler ("onClientClick", root, VtrRocam)]]





















--------------------------------------------------- NÃO MEXA AQUI!!! --------------------------------------------------
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
--------------------------------------------------- NÃO MEXA AQUI!!! -------------------------------------------------- 











--------------------------------------------------- NÃO MEXA AQUI!!! --------------------------------------------------
local MarcadorTrab = dxCreateTexture("imgs/Marcador.png")

local MarcadorPan = dxCreateTexture("imgs/Marcador.png")

local MarcadorVTR = dxCreateTexture("imgs/Marcador.png")



function Img_MarkersTrab ()
    local Op1, Op2  = interpolateBetween(0.4, 1.4, 0, 0.7, 1.1, 0, 5000, "SineCurve")
	local Op3, Op4, Op5  = interpolateBetween(0.75, 0.78, 1.50, 1.22, 1.3, 2.6, 5000, "SineCurve")
	local px, py, pz, l1, l2, l3, dist
	local px, py, pz = getCameraMatrix( )
	for _, h in ipairs( getElementsByType 'marker' ) do
		if getElementData(h, "novaMarkerTrab", true) then 
			local l1, l2, l3 = getElementPosition( h )
			local dist = math.sqrt( ( px + l1 ) ^ 0 + ( py + l2 ) ^ 0 + ( pz + l3 ) ^ 0 )
			if dist < 20 then
				if isLineOfSightClear( px, py, pz, l1, l2, l3, false, false, true, true, false, false, false,localPlayer ) then
					local x,y = getScreenFromWorldPosition( l1, l2, l3 )
					if x then 							
						dxDrawMaterialLine3D (l1,  l2 - Op3,  l3 + 0.03,   l1, l2 + Op4,   l3+0.03, MarcadorTrab, Op5, tocolor(255,255,255,255),0,0,-1730900)							 
					end
				end
			end
		end
	end
end
addEventHandler( "onClientRender",root, Img_MarkersTrab)



function Img_MarkersPan ()
    local Op1, Op2  = interpolateBetween(0.4, 1.4, 0, 0.7, 1.1, 0, 5000, "SineCurve")
	local Op3, Op4, Op5  = interpolateBetween(0.75, 0.78, 1.50, 1.22, 1.3, 2.6, 5000, "SineCurve")
	local px, py, pz, l1, l2, l3, dist
	local px, py, pz = getCameraMatrix( )
	for _, h in ipairs( getElementsByType 'marker' ) do
		if getElementData(h, "novaMarkerPan", true) then 
			local l1, l2, l3 = getElementPosition( h )
			local dist = math.sqrt( ( px + l1 ) ^ 0 + ( py + l2 ) ^ 0 + ( pz + l3 ) ^ 0 )
			if dist < 20 then
				if isLineOfSightClear( px, py, pz, l1, l2, l3, false, false, true, true, false, false, false,localPlayer ) then
					local x,y = getScreenFromWorldPosition( l1, l2, l3 )
					if x then 							
						dxDrawMaterialLine3D (l1,  l2 - Op3,  l3 + 0.03,   l1, l2 + Op4,   l3+0.03, MarcadorPan, Op5, tocolor(255,255,255,255),0,0,-1730900)							 
					end
				end
			end
		end
	end
end
addEventHandler( "onClientRender",root, Img_MarkersPan)



function Img_MarkersVTR ()
    local Op1, Op2  = interpolateBetween(0.4, 1.4, 0, 0.7, 1.1, 0, 5000, "SineCurve")
   local Op3, Op4, Op5  = interpolateBetween(1.45, 1.48, 2.90, 2.72, 1.3, 2.6, 5000, "SineCurve")
   local px, py, pz, l1, l2, l3, dist
	local px, py, pz = getCameraMatrix( )
	for _, h in ipairs( getElementsByType 'marker' ) do
		if getElementData(h, "novaMarkerVTR", true) then 
			local l1, l2, l3 = getElementPosition( h )
			local dist = math.sqrt( ( px + l1 ) ^ 0 + ( py + l2 ) ^ 0 + ( pz + l3 ) ^ 0 )
			if dist < 20 then
				if isLineOfSightClear( px, py, pz, l1, l2, l3, false, false, true, true, false, false, false,localPlayer ) then
					local x,y = getScreenFromWorldPosition( l1, l2, l3 )
					if x then 							
						dxDrawMaterialLine3D (l1,  l2 - Op3,  l3 + 0.03,   l1, l2 + Op4,   l3+0.03, MarcadorVTR, Op5, tocolor(255,0,0,170),0,0,-1730900)							 
					end
				end
			end
		end
	end
end
addEventHandler( "onClientRender",root, Img_MarkersVTR)
--------------------------------------------------- NÃO MEXA AQUI!!! -------------------------------------------------- 











--------------------------------------------------- NÃO MEXA AQUI!!! -------------------------------------------------- 
local ifp = engineLoadIFP( "anim.ifp", "newAnimBlock" )

addEvent( "anim", true )
addEventHandler( "anim", root,
	function(anim,enable)
		if (enable) then
			setPedAnimation(source, "newAnimBlock", "continencia", -1, false, true, false, false)
			if (anim == "continencia2") then
				setTimer(setPedAnimationProgress, 50, 1, source, "continencia", 0.5)
				setTimer(setPedAnimationSpeed, 50, 1, source, "continencia", 0.000001)
			end
		else
			setPedAnimation(source)
		end
	end
)

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync", resourceRoot)
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifp then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "run_wuzi") then -- wtf bug
					setPedAnimation(player)
				end
			end
			destroyElement(ifp)
		end
	end
)
--------------------------------------------------- NÃO MEXA AQUI!!! -------------------------------------------------- 