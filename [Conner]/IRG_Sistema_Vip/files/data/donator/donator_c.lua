
function centerWindow (center_window)
local screenW, screenH = guiGetScreenSize()
local windowW, windowH = guiGetSize(center_window, false)
local x, y = (screenW - windowW) /2,(screenH - windowH) /2
guiSetPosition(center_window, x, y, false)
end

---------------------------------|
local rX,rY = guiGetScreenSize()
local sw,sh = 280,380
---------------------------------|

Generate = {
[1] = "A",
[2] = "B",
[3] = "C",
[4] = "D",
[5] = "E",
[6] = "F",
[7] = "G",
[8] = "H",
[9] = "I",
[10] = "J",
[11] = "K",
[12] = "L",
[13] = "M",
[14] = "N",
[15] = "O",
[16] = "P",
[17] = "Q",
[18] = "R",
[19] = "S",
[20] = "T",
[21] = "U",
[22] = "V",
[23] = "W",
[24] = "X",
[25] = "Y",
[26] = "Z",
[27] = "0",
[28] = "1",
[29] = "2",
[30] = "3",
[31] = "4",
[32] = "5",
[33] = "6",
[34] = "7",
[35] = "8",
[36] = "9",
}

---Vip-Admin---
VIPADMIN = {
gridlist = {},
button = {},
staticimage = {},
window = {},
}
VIPADMIN.window[1] = guiCreateWindow(85, 70, 500, 395, "VIP Admin", false)
centerWindow (VIPADMIN.window[1])
guiWindowSetSizable(VIPADMIN.window[1], false)
guiSetVisible(VIPADMIN.window[1], false)
VIPADMIN.gridlist[1] = guiCreateGridList(10, 22, 500, 300, false, VIPADMIN.window[1])
guiGridListSetSortingEnabled(VIPADMIN.gridlist[1], false)
guiGridListAddColumn(VIPADMIN.gridlist[1], "Codigo", 0.35)
guiGridListAddColumn(VIPADMIN.gridlist[1], "Jogador", 0.45)
guiGridListAddColumn(VIPADMIN.gridlist[1], "Status", 0.35)
guiSetFont(VIPADMIN.gridlist[1], "default-bold-small")
VIPADMIN.button[1] = guiCreateButton(10, 330, 150, 25, "Novo Codigo", false, VIPADMIN.window[1])
VIPADMIN.button[2] = guiCreateButton(170, 330, 150, 25, "Editar", false, VIPADMIN.window[1])
VIPADMIN.button[3] = guiCreateButton(170, 360, 150, 25, "Ativar/Desativar", false, VIPADMIN.window[1])
VIPADMIN.button[4] = guiCreateButton(330, 330, 150, 25, "Deletar", false, VIPADMIN.window[1])
VIPADMIN.button[5] = guiCreateButton(10, 360, 150, 25, "Copiar codigo", false, VIPADMIN.window[1])
VIPADMIN.button[6] = guiCreateButton(330, 360, 150, 25, "Fechar", false, VIPADMIN.window[1])
guiSetFont(VIPADMIN.button[1], "default-bold-small")
guiSetFont(VIPADMIN.button[2], "default-bold-small")
guiSetFont(VIPADMIN.button[3], "default-bold-small")
guiSetFont(VIPADMIN.button[4], "default-bold-small")
guiSetFont(VIPADMIN.button[5], "default-bold-small")
guiSetFont(VIPADMIN.button[6], "default-bold-small")
---Vip-Active---
VIPACTIVE = {
button = {},
staticimage = {},
window = {},
label = {},
edit = {},
}

VIPACTIVE.window[1] = guiCreateWindow(156, 83, 300, 370, "Painel de ativação", false)
centerWindow (VIPACTIVE.window[1])
guiWindowSetSizable(VIPACTIVE.window[1], false)
guiSetVisible(VIPACTIVE.window[1], false)
VIPACTIVE.staticimage[1] = guiCreateStaticImage(45, 29, 200, 200, "files/vipregister.png", false, VIPACTIVE.window[1])
VIPACTIVE.label[1] = guiCreateLabel(10, 253, 97, 16, "Ativação:", false, VIPACTIVE.window[1])
guiSetFont(VIPACTIVE.label[1], "default-bold-small")
VIPACTIVE.edit[1] = guiCreateEdit(110, 250, 300, 20, "", false, VIPACTIVE.window[1])
guiSetFont(VIPACTIVE.edit[1], "default-bold-small")
--VIPACTIVE.label[2] = guiCreateLabel(10, 310, 300, 26, "Erro :", false, VIPACTIVE.window[1])
--guiSetFont(VIPACTIVE.label[2], "default-bold-small")
guiLabelSetColor(VIPACTIVE.label[2], 49, 255, 27)
VIPACTIVE.label[3] = guiCreateLabel(10, 330, 300, 30, "                       Veja nossos planos vip \n      em nosso Discord!", false, VIPACTIVE.window[1])
guiSetFont(VIPACTIVE.label[3], "default-bold-small")
guiLabelSetColor(VIPACTIVE.label[3], 255, 255, 0)
VIPACTIVE.button[1] = guiCreateButton(10, 280, 300, 25, "Ativar", false, VIPACTIVE.window[1])
guiSetFont(VIPACTIVE.button[1], "default-bold-small")



VIPADANC = { edit = {}, button = {}, label = {}, window = {}, }

VIPADANC.window[1] = guiCreateWindow(228, 188, 354, 172, "VIP - Painel Admin - adicionar novo codigo", false)
centerWindow (VIPADANC.window[1])
guiWindowSetSizable(VIPADANC.window[1], false)
guiSetVisible(VIPADANC.window[1], false)
VIPADANC.label[1] = guiCreateLabel(10, 35, 98, 15, "Codigo de ativação: ", false, VIPADANC.window[1])
guiSetFont(VIPADANC.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(VIPADANC.label[1], "center", false)
VIPADANC.edit[1] = guiCreateEdit(108, 29, 197, 27, "", false, VIPADANC.window[1])
VIPADANC.button[1] = guiCreateButton(312, 29, 32, 26, "₪", false, VIPADANC.window[1])
VIPADANC.button[2] = guiCreateButton(10, 122, 162, 38, "Criar", false, VIPADANC.window[1])
guiSetFont(VIPADANC.button[2], "default-bold-small")
VIPADANC.button[4] = guiCreateButton(182, 122, 162, 38, "Cancelar", false, VIPADANC.window[1])
guiSetFont(VIPADANC.button[4], "default-bold-small")

VIPADEC = {
edit = {},
button = {},
label = {},
window = {},
}

VIPADEC.window[1] = guiCreateWindow(228, 188, 354, 185, "VIP | Editar Codigo", false)
centerWindow (VIPADEC.window[1])
guiWindowSetSizable(VIPADEC.window[1], false)
guiSetVisible(VIPADEC.window[1], false)
VIPADEC.label[1] = guiCreateLabel(10, 35, 98, 15, "Codigo de ativação: ", false, VIPADEC.window[1])
guiSetFont(VIPADEC.label[1], "default-bold-small")
guiLabelSetHorizontalAlign(VIPADEC.label[1], "center", false)
VIPADEC.edit[1] = guiCreateEdit(108, 29, 197, 27, "", false, VIPADEC.window[1])
VIPADEC.button[1] = guiCreateButton(312, 29, 32, 26, "₪", false, VIPADEC.window[1])
VIPADEC.button[2] = guiCreateButton(10, 120, 354, 25, "Salvar", false, VIPADEC.window[1])
guiSetFont(VIPADEC.button[2], "default-bold-small")
VIPADEC.button[4] = guiCreateButton(10, 150, 354, 25, "Cancelar", false, VIPADEC.window[1])
guiSetFont(VIPADEC.button[4], "default-bold-small")

function showTheVIP ()
if getElementData(localPlayer,"VIP") == false then
if (guiGetVisible (VIPACTIVE.window[1]) == true) then
guiSetVisible (VIPACTIVE.window[1], false)
showCursor (false)
else
guiSetVisible (VIPACTIVE.window[1], true)
showCursor (true)
end
end
end
bindKey (getElementData(getRootElement(),"KeyToOpenWindow"), "up", showTheVIP)




function OpenAdminPanel ()
if (guiGetVisible (VIPADMIN.window[1]) == true) then
guiSetVisible (VIPADMIN.window[1], false)
showCursor (false)
else
triggerServerEvent("RefreshTheAdminWindow",localPlayer,localPlayer)
guiSetVisible (VIPADMIN.window[1], true)
showCursor (true)
guiSetAlpha(VIPADMIN.window[1],0.8)
end
end
addEvent( "PainelVipAdmin", true )
addEventHandler ( "PainelVipAdmin", getRootElement(), OpenAdminPanel)





addEventHandler("onClientGUIClick", root,
function ()
if (source == VIPACTIVE.button[1]) then
local ActiCode = guiGetText(VIPACTIVE.edit[1])
if #ActiCode == 0 then
guiLabelSetColor(VIPACTIVE.label[2],255,0,0)
guiSetText(VIPACTIVE.label[2],"Erro: Por favor escreva o código de ativação")
else
triggerServerEvent("ActiveVIP",localPlayer,localPlayer,ActiCode)
end
elseif (source == VIPADMIN.button[1]) then
guiSetAlpha(VIPADMIN.window[1],0.5)
guiBringToFront(VIPADANC.window[1])
guiSetVisible (VIPADANC.window[1], true)
elseif (source == VIPADANC.button[1]) then
guiSetText(VIPADANC.edit[1],Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,26)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)] .."".. Generate[math.random(1,36)])
elseif (source == VIPADANC.button[4]) then
guiSetAlpha(VIPADMIN.window[1],0.8)
guiSetVisible (VIPADANC.window[1], false)
elseif (source == VIPADANC.button[2]) then
local Code = guiGetText(VIPADANC.edit[1])
if Code == "" then
outputChatBox("#7cc576[4i20 - Vip]:#FF0000Por favor escreva o código de ativação !!",0,255,255, true)
else
triggerServerEvent("CreateCode",localPlayer,localPlayer,Code)
end

elseif (source == VIPADMIN.button[3]) then
local row, col = guiGridListGetSelectedItem (VIPADMIN.gridlist[1])
if ( row and col and row ~= -1 and col ~= -1 ) then
local ActivationCode = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 1 )
local PlayerName = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 2 )
triggerServerEvent("ChangeStatus",localPlayer,localPlayer,ActivationCode,PlayerName)
end
elseif (source == VIPADMIN.button[4]) then
local row, col = guiGridListGetSelectedItem (VIPADMIN.gridlist[1])
if ( row and col and row ~= -1 and col ~= -1 ) then
local ActivationCode = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 1 )
local PlayerName = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 2 )

triggerServerEvent("DeleteCode",localPlayer,localPlayer,ActivationCode,PlayerName)
end
elseif (source == VIPADMIN.button[5]) then
local row, col = guiGridListGetSelectedItem (VIPADMIN.gridlist[1])
if ( row and col and row ~= -1 and col ~= -1 ) then
local ActivationCode = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 1 )
setClipboard( ActivationCode )
outputChatBox("#7cc576[4i20 - Vip]:#00FF00cópia feita #FFFF00[".. ActivationCode .."], #00FF00pressione Ctrl + V para colar !!",0,255,255, true)
end
elseif (source == VIPADMIN.button[6]) then
guiSetVisible (VIPADMIN.window[1], false)
showCursor (false)

elseif (source == VIPADMIN.button[2]) then
local row, col = guiGridListGetSelectedItem (VIPADMIN.gridlist[1])
if ( row and col and row ~= -1 and col ~= -1 ) then
local Code = guiGridListGetItemText ( VIPADMIN.gridlist[1], guiGridListGetSelectedItem ( VIPADMIN.gridlist[1] ), 1 )
guiSetAlpha(VIPADMIN.window[1],0.5)
guiSetVisible (VIPADEC.window[1], true)
guiBringToFront (VIPADEC.window[1] )
guiSetText(VIPADEC.edit[1],Code)
setElementData(localPlayer,"ActiCodeOLD",Code)
end
elseif (source == VIPADEC.button[4]) then
guiSetVisible (VIPADEC.window[1], false)
guiSetAlpha(VIPADMIN.window[1],0.8)
elseif (source == VIPADEC.button[2]) then
local Code = guiGetText(VIPADEC.edit[1])
if Code == "" then
outputChatBox("#7cc576[4i20 - Vip]:#FF0000 Por favor, escreva o código de ativação !!",0,255,255, true)
end
end
end
)

addEvent("RefreshTheAdminWindow",true) 
addEventHandler("RefreshTheAdminWindow",root, 
function (player,Table)
if player == localPlayer then
guiGridListClear ( VIPADMIN.gridlist[1] )
for index, items in ipairs ( Table ) do
local row = guiGridListAddRow ( VIPADMIN.gridlist[1] )
guiGridListSetItemText ( VIPADMIN.gridlist[1], row, 1, tostring ( items[ "ActivationCodes"] ), false, false )
guiGridListSetItemText ( VIPADMIN.gridlist[1], row, 2, tostring ( items[ "PlayerName"] ), false, false )
guiGridListSetItemText ( VIPADMIN.gridlist[1], row, 3, tostring ( items[ "Status"] ), false, false )
if items[ "PlayerName"] == "Nenhum" or items[ "Status"] == 'false' then
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 1, 255, 0, 0 )
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 2, 255, 0, 0 )
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 3, 255, 0, 0 )
else
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 1, 0, 255, 0 )
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 2, 0, 255, 0 )
guiGridListSetItemColor ( VIPADMIN.gridlist[1], row, 3, 0, 255, 0 )
end
end
end
end
)

addEvent("HideCreateNewCodePanel",true) 
addEventHandler("HideCreateNewCodePanel",root, 
function (player)
if player == localPlayer then
guiSetVisible (VIPADMIN.window[1], true)
guiSetVisible (VIPADANC.window[1], false)
end
end
)

addEvent("HideEditCodePanel",true) 
addEventHandler("HideEditCodePanel",root, 
function (player)
if player == localPlayer then
guiSetVisible (VIPADEC.window[1], false)
guiSetAlpha(VIPADMIN.window[1],0.8)
end
end
)

addEvent("WriteInVipPanel",true) 
addEventHandler("WriteInVipPanel",root, 
function (player,text,r,g,b)
if player == localPlayer then
guiLabelSetColor(VIPACTIVE.label[2],r,g,b)
guiSetText(VIPACTIVE.label[2],"Erro : "..text)
end
end
)

addEvent("CloseVipPanel",true) 
addEventHandler("CloseVipPanel",root, 
function (player)
if player == localPlayer then
guiSetVisible (VIPACTIVE.window[1], false)
showCursor (false)
end
end
)



-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------

local screenW2,screenH2  = guiGetScreenSize()
local resW2, resH2       = 1920, 1080
local xS, yS         =  (screenW2/resW2), (screenH2/resH2)

House = false
cor = {}

function dxH ()
        cor[1] = tocolor(48, 248, 48, 85)
     	if isCursorOnElement(xS*35, yS*595, xS*113, yS*28) then cor[1] = tocolor(48, 248, 48, 180) end

        cor[2] = tocolor(255, 40, 40, 88)
     	if isCursorOnElement(xS*163, yS*595, xS*113, yS*28) then cor[2] = tocolor(255, 40, 40, 180) end
		
        dxDrawRectangle(xS*27, yS*508, xS*259, yS*125, tocolor(1, 0, 0, 145), false)
        dxDrawRectangle(xS*27, yS*511, xS*259, yS*36, tocolor(1, 0, 0, 145), false)
        dxDrawText("SisteMa de caSa", xS*27, yS*508, xS*286, yS*544, tocolor(255, 255, 255, 92), xS*1.00, "pricedown", "center", "center", false, false, false, false, false)
        dxDrawText(visit.." \n pediu para entrar em seu apartamento", xS*27, yS*554, xS*286, yS*585, tocolor(255, 255, 255, 255), xS*1.10, "default-bold", "center", "top", false, false, false, false, false)
        dxDrawRectangle(xS*35, yS*595, xS*113, yS*28, cor[1], false)
        dxDrawRectangle(xS*163, yS*595, xS*113, yS*28, cor[2], false)
        dxDrawText("SIM", xS*36, yS*597, xS*148, yS*623, tocolor(255, 255, 255, 255), xS*1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("NÃO", xS*164, yS*595, xS*276, yS*621, tocolor(255, 255, 255, 255), xS*1.00, "default-bold", "center", "center", false, false, false, false, false)
end

function click (button, state)
     if House then 
         if  state == "down"  then 
         if isCursorOnElement(xS*35, yS*595, xS*113, yS*28) then
             triggerServerEvent("accP", localPlayer, localPlayer, 1)
			 removeEventHandler("onClientRender", root, dxH)
		     House = false
		 elseif isCursorOnElement(xS*163, yS*595, xS*113, yS*28) then
		     triggerServerEvent("accP", localPlayer, localPlayer, 2)
			 removeEventHandler("onClientRender", root, dxH)
		     House = false
			 end
         end
     end
end
addEventHandler("onClientClick", getRootElement(), click)

function startDxH (nameAnd)
     if (House == false) then
	     visit = nameAnd
	     addEventHandler("onClientRender", root, dxH)
		 House = true
		 else
	     removeEventHandler("onClientRender", root, dxH)
		 House = false
	 end
end
addEvent("startDxH", true)
addEventHandler("startDxH", root, startDxH)

function isCursorOnElement(achx,achy,width,height)
if not isCursorShowing () then return end
    local cx, cy = getCursorPosition()
    local cx, cy = (cx*screenW2), (cy*screenH2)
    if (cx >= achx and cx <= achx + width) and (cy >= achy and cy <= achy + height) then
    return true
    else
    return false
    end
end