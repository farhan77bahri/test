--Mensagem-- Não mexa!!!!!!!!!-------------------------------------------------
--                                                                           --
    function displayServerMessage(source, message, type)                     --
	  triggerClientEvent(source, "pjogador", getRootElement(), message, type)--
    end                                                                      --
--                                                                           --
--Mensagem-- Não mexa!!!!!!!!!-------------------------------------------------

local VtrPt = 598 --- vtr de patrulhamento

local VtrRocam = 523 --- vtr da rocam

local nomeCorp = "Força Tatica" -- coloquei aqui o nome da corporação!!

local grupo = "Console" -- coloque aqui a ACL

local cmdM = "K" --- o Comando para iniciar o Trabalho

local SkinPt1 = {"165"} --- SKIN PATRULHAMENTO 1

local SkinPt2 = {"167"} --- SKIN PATRULHAMENTO 2

local SkinAc = {"166"} --- SKIN AÇÃO

local SkinsR  = {"162", "21", "78", "101", "40"} -- Skins Apaisana, adicione dentro o numero das skins que vc quer q o player use apaisana!! Lembre-se elas são aleatorias :)!!

local Salario = 1500 -- dinheiro que o player vai ganhar!!

local Tempo = 600000   --[[ o tempo esta em milissegundos!! ||

-                        || 60000 (Sessenta Mil) é igual  a 1 minuto ||

-                        || 600000 (Seiscentos mil) é igual a 10 minutos || 

-                        || 3600000 (três milhões, e seiscentos mil) é igual a 1 hora || 

-                        ]]

--[[

para ajudar, conversor no google --> http://extraconversion.com/pt/tempo/milissegundos/milissegundos-para-minutos.html

Converta milissegundos em minutos ou horas, vai da sua preferencia :)]]

-------------------------------------------------------------------------------------------------
--                                                                                             --
--                                      Marker Painel                                          --
--                                                                                             --
-------------------------------------------------------------------------------------------------


local mPainel = createMarker(1980.8000488281, -1760.2580566406, 13.546875, "cylinder", 1, 0, 255, 0, 0) -- posição da Marker do Painel

--setElementInterior(mPainel, 6) -- Caso queira colocar em um interior a marker do painel

--setElementDimension(mPainel, 0) -- dimensão da marker mPainel

local pos_markerPan = {

    {1980.8000488281, -1760.2580566406, 13.546875}, -- coloque aqui a posição da Marker do Painel tbm!!
    
}

--setElementInterior(pos_markerPan, 6)


---------------------------------------------------------------------------------------------------
--                                                                                               --
--                                      Marker Trabalho                                          --
--                                                                                               --
---------------------------------------------------------------------------------------------------

    
local mTrab = createMarker(1972.6597900391, -1760.2738037109, 13.546875, "cylinder", 1, 255, 0, 0, 0) -- posição da Marker do trabalho

--setElementInterior(mTrab, 6) -- Caso queira colocar em um interior a marker de trabalho

--setElementDimension(mTrab, 0) -- dimensão da marker mTrab

local pos_markerTrab = {

    {1972.6597900391, -1760.2738037109, 13.546875}, -- coloque aqui a posição da marker do trabalho tambem!!!
}

--setElementInterior(pos_markerTrab, 6)

---------------------------------------------------------------------------------------------------
--                                                                                               --
--                                      Marker Destrui VTR                                       --
--                                                                                               --
---------------------------------------------------------------------------------------------------
                                                    
local destruirVTR = createMarker(1757.27, -1890.135, 13.556, "cylinder", 2.5, 255, 0, 0, 0) -- posição da Marker de destruir VTR


local pos_markerVTR = {

    {1757.27, -1890.135, 13.656}, -- coloque aqui a posição da marker de destrui VTR's!!!
}


---------------------------------------------------------------------------------------------------
--                                                                                               --
--                                     Funcões do Script                                         --
--                                                                                               --
---------------------------------------------------------------------------------------------------


function painelArmas (source)
    local acc = getAccountName ( getPlayerAccount ( source ) ) 
    if isObjectInACLGroup ("user."..acc, aclGetGroup ( grupo ) ) then 
        if isPedInVehicle ( source ) then return end -- verifica se o player esta em um carro, se sim ele para a função!!
        triggerClientEvent(source, "PArmas", getRootElement()) ------ abre o painel
    else
        exports.Anexo_Dxmessages:outputDx(source, "Você não pertence á "..nomeCorp, "warning")
    end
end
addEventHandler("onMarkerHit", mPainel, painelArmas) -- Abre o Painel se o Player passar sobre a marker!!

--------------------------------------------------------------------------------------------------------------

function Colete ()
    colete = getPedArmor(source) -- o script ve o colete atual(getPedArmor) do jogador(source) e da um nome(colete)
    if colete == 0 then -- se o colete(colete) for igual(==) a 0 ele(then)
    setPedArmor(source, 100) -- dara(setPedArmor) 100 de colete ao jogador(source)

    displayServerMessage(source, "Você colocou um Colete Balistico!", "confirm") -- mensagem

        elseif colete == 100 then -- mas se o colete for igual a 100 ele
 
        displayServerMessage(source, "Você já esta usando um Colete Balistico!", "warning") -- envia essa mensagem

        elseif  colete < 100 then -- mas se(elseif) o colete(colete) for menor(<) que 100(100) ele(then)
        setPedArmor(source, 100) -- dara(setPedArmor) 100 de colete ao jogador(source)

        displayServerMessage(source, "Você trocou seu Colete", "confirm") --e enviara essa mensagem!!
    end -- end do if
end -- end da function
addEvent("colete", true) -- para colocar no lado client
addEventHandler("colete", root, Colete) --adc evento -- para colocar no lado client


function Vida()
vida = getElementHealth(source) -- ve a vida do jogador
 if vida < 90 then -- se a vida for menor que 90
    setElementHealth(source, 100) -- ele da 100 de vida ao Jogador

    displayServerMessage(source, "Você recebeu tratamento!", "confirm") -- mensagem

 elseif vida == 100 then -- se a vida for igual a 100 ele...

    displayServerMessage(source, "Você não necessita de tratamento!", "warning") -- envia essa mensagem
    
 end -- end do if vida
end -- end da function
addEvent("vida", true) 
addEventHandler("vida", root, Vida) 

------------------------------------------------------------------------------------------------------------

function m4()
   takeWeapon(source, 31, 500) -- impede que o player tenha mais de 500 balas
   giveWeapon(source, 31, 500) -- da a arma M4 e 500 balas
   --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
   displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("M4", true)
addEventHandler("M4", root, m4)


function Stick()
   giveWeapon(source, 3)
   --outputChatBox("Você Pegou um Cassetete", source, 12, 210, 120, true)
   displayServerMessage(source, "Você Pegou um Cassetete", "confirm") -- mensagem
end -- end da function
addEvent("stick", true)
addEventHandler("stick", root, Stick)


------------------------------------------------------------------------------------------------------------

function Shot()
    takeWeapon(source, 25, 500)
    giveWeapon(source, 25, 500)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("shot", true)
addEventHandler("shot", root, Shot)
 
function CbShot()
    takeWeapon(source, 27, 500)
    giveWeapon(source, 27, 500)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("cbshot", true)
addEventHandler("cbshot", root, CbShot)

function Pistol()
    takeWeapon(source, 22, 500)
    giveWeapon(source, 22, 500)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("pistol", true)
addEventHandler("pistol", root, Pistol)

function Taser()
    giveWeapon(source, 23, 100)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("taser", true)
addEventHandler("taser", root, Taser)

------------------------------------------------------------------------------------------------------------

function Sniper()
    takeWeapon(source, 34, 150)
    giveWeapon(source, 34, 150)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("sniper", true)
addEventHandler("sniper", root, Sniper)


function Sub()
    takeWeapon(source, 29, 500)
    giveWeapon(source, 29, 500)
    --outputChatBox("Você Pegou Armamento", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Armamento", "confirm") -- mensagem
end -- end da function
addEvent("sub", true)
addEventHandler("sub", root, Sub)

------------------------------------------------------------------------------------------------------------

function Spray()
    giveWeapon(source, 41, 300)
    --outputChatBox("Você Pegou Spray de Pimenta", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Spray de Pimenta", "confirm") -- mensagem
end -- end da function
addEvent("spray", true)
addEventHandler("spray", root, Spray)

------------------------------------------------------------------------------------------------------------


function Glasses()
    giveWeapon(source, 44)
    --outputChatBox("Você Pegou Oculos de Visão Noturna", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou Oculos de Visão Noturna", "confirm") -- mensagem
end -- end da function
addEvent("glasses", true)
addEventHandler("glasses", root, Glasses)


function Grenade()
    giveWeapon(source, 16, 100)
    --outputChatBox("Você Pegou uma granada HE", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou uma granada HE", "confirm") -- mensagem
end
addEvent("grenade", true)
addEventHandler("grenade", root, Grenade)


function Tear()
    giveWeapon(source, 17, 100)
    --outputChatBox("Você Pegou uma granada de Gâs", source, 12, 210, 120, true)
    displayServerMessage(source, "Você Pegou uma granada de Gâs", "confirm") -- mensagem
end
addEvent("teargas", true)
addEventHandler("teargas", root, Tear)

------------------------------------------------------------------------------------------------------------------------------------------



--[[function VeiculoPt()
    local carro = createVehicle(VtrPt, 1761.603, -1900.093, 13.564, 0, 0, 90)
    warpPedIntoVehicle(source, carro)
    displayServerMessage(source, "Você Pegou uma Viatura de Patrulhamento", "confirm") -- mensagem
end
addEvent("vtrPt", true)
addEventHandler("vtrPt", root, VeiculoPt)


function VeiculoRocam()
    local carro = createVehicle(VtrRocam, 1761.603, -1900.093, 13.564, 0, 0, 90)
    warpPedIntoVehicle(source, carro)
    displayServerMessage(source, "Você Pegou uma Rocam", "confirm") -- mensagem
end
addEvent("vtrRocam", true)
addEventHandler("vtrRocam", root, VeiculoRocam)




function destruirvtr(vtr)
    if (isElement(vtr)) and (getElementType(vtr)=="vehicle") and (getElementModel(vtr)==VtrPt) or (getElementModel(vtr)==VtrRocam) then
        destroyElement (vtr)
    end
end
addEventHandler("onMarkerHit", destruirVTR, destruirvtr)]]


























--[[                                                    ---> ANTES DE MEXER LEIA!!! <---
--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Caso queira mudar as MENSAGENS mude somente o que esta dentro das aspas --> " escreva aqui oq deseja " <--


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Toda vez que o Player Sair ou Cair do seu servidor ele automática finaliza o expediente ou seja. Caso o jogador tenha problemas na net
ele terá que iniciar o Expediente novamente... Senão, não irá mais receber!!

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

Caso vc seja muito Leigo na aréa de script por favor não tenha medo em me perguntar algo!! 
Prefiro que me perguntem do que mexerem sem saber e o script pare de funcionar :)

Dito isso agradeço pela compra :) 
                                 
-                                                                by Eder                                                                  -

--]]


 
function EntrarExp (source)
    exports.Anexo_OnMarkerMsgs:delete(source) -- retira a msg na tela
    unbindKey ( source, cmdM, "down", EntrarExp ) -- retira a bind K
    setElementData ( source, "iniciouJob", true ) -- adc a data de trabalho!!
    exports.Anexo_Dxmessages:outputDx(source, "Você iniciou seu Expediente!!!", "info") -- mensagem
        tempo = setTimer ( function() --(Tempo) é o nome dado ao setTimer. setTimer é o tempo
        givePlayerMoney(source, Salario) -- função que da o dinheiro ao jogador
        exports.Anexo_Dxmessages:outputDx(source, "Você recebeu seu Salario no valor de 500$", "success") -- mensagem
        end, Tempo, 9999999 )
end





function UniformPtClient1()
    setElementModel(source, SkinPt1[ tonumber( #SkinPt1 ) ]) -- da ao player a skin "165" se for mudar lembre-se de mudar no script --> Anexo_continencia <--
    exports.Anexo_Dxmessages:outputDx(source, "Você Vestiu sua Farda de Patrulhamento", "success") -- mensagem
end
addEvent("darPTuni1", true) -- adc um novo evento "darPTuni"
addEventHandler("darPTuni1", root, UniformPtClient1) -- especifica --> a Quem e a Qual função esta ligado o evento "darPTuni" <--




function UniformPtClient2()
    setElementModel(source, SkinPt2[ tonumber( #SkinPt2 ) ]) -- da ao player a skin "165" se for mudar lembre-se de mudar no script --> Anexo_continencia <--
    exports.Anexo_Dxmessages:outputDx(source, "Você Vestiu sua Farda de Patrulhamento", "success") -- mensagem
end
addEvent("darPTuni2", true) -- adc um novo evento "darPTuni"
addEventHandler("darPTuni2", root, UniformPtClient2) -- especifica --> a Quem e a Qual função esta ligado o evento "darPTuni" <--




function UniformAcClient()
    setElementModel(source, SkinAc[ tonumber( #SkinAc ) ]) -- da ao player a skin "166" se for mudar lembre-se de mudar no script --> Anexo_continencia <--
    exports.Anexo_Dxmessages:outputDx(source, "Você Vestiu sua Farda de Ação", "success") -- mensagem
end
addEvent("darACuni", true) -- adc um novo evento "darACuni"
addEventHandler("darACuni", root, UniformAcClient) -- especifica --> a Quem e a Qual função esta ligado o evento "darACuni" <--






function tUniformPtClient()
    setElementModel(source, SkinsR[ math.random( #SkinsR ) ]) -- da uma das skins na tabela 'SkinsR'
    takeAllWeapons(source) -- tira todas as armas do player
end
addEvent("tiraruni", true) -- adc um novo evento "tiraruni"
addEventHandler("tiraruni", root, tUniformPtClient) -- especifica --> a Quem e a Qual função esta ligado o evento "tiraruni" <--






function SairExp (source)
exports.Anexo_OnMarkerMsgs:delete(source) -- retira a msg na tela
unbindKey ( source, cmdM, "down", SairExp ) -- retira a bind K
exports.Anexo_Dxmessages:outputDx(source, "Você Terminou seu Expediente", "error") -- mensagem
if isTimer ( tempo ) then killTimer ( tempo ) end -- verifica se a função nomeada TEMPO esta acontencedo, se estiver para ela!!!
setElementData ( source, "iniciouJob", false ) -- remove a data de trabalho!!
end






function SairExpClient() -- (Anti-Bug) Não permite que o Jogador continue recebendo após ter retirado a Skin de trabalho!!! 
exports.Anexo_Dxmessages:outputDx(source, "Você retirou sua Farda e seu Expediente foi cancelado!!", "error") -- mensagem
if isTimer ( tempo ) then killTimer ( tempo ) end -- verifica se a função nomeada TEMPO esta acontencedo, se estiver para ela!!!
setElementData ( source, "iniciouJob", false ) -- remove a data de trabalho!!
end
addEvent("saiuJob", true) -- adc um novo evento "saiuJob"
addEventHandler("saiuJob", root, SairExpClient) -- especifica --> a Quem e a Qual função esta ligado o evento "saiuJob" <--





function EntMJob (source)
local acc = getAccountName ( getPlayerAccount ( source ) ) 
if isObjectInACLGroup ("user."..acc, aclGetGroup ( grupo ) ) then 
local skin = getElementModel ( source ) -- pega qual a skin do Player!!
    if isPedInVehicle ( source ) then return end -- verifica se o player esta em um carro, se sim ele para a função!!
        if skin == SkinPt1[ tonumber( #SkinPt1 ) ] or SkinAc[ tonumber( #SkinAc ) ] or SkinPt2[ tonumber( #SkinPt2)] then -- verifica a skin
                if getElementData ( source, "iniciouJob", true ) then -- verifica o data de trabalho!!
                exports.Anexo_OnMarkerMsgs:create(source,"Aperte "..cmdM.." Para Sair do seu Expediente") -- msg
                bindKey ( source, cmdM, "down", SairExp ) -- bind na letra K
              else
                exports.Anexo_OnMarkerMsgs:create(source,"Aperte "..cmdM.." Para Iniciar seu Expediente") -- msg
                bindKey ( source, cmdM, "down", EntrarExp ) -- bind na letra K
                end -- end do if getElementData
            else -- else do if skin
                exports.Anexo_Dxmessages:outputDx(source, "Você necessita estar Fardado", "error") -- msg
            end -- end do if skin
else
    exports.Anexo_Dxmessages:outputDx(source, "Você não pertence á "..nomeCorp, "warning") 
end
end	-- end da function
addEventHandler("onMarkerHit", mTrab, EntMJob) -- adc o evento "onPlayerMarkerHit" a function!!






function SairMJob(marker,md)
	if (md) then
		if marker == mTrab then -- verifica a marker
			exports.Anexo_OnMarkerMsgs:delete(source) -- retira a msg na tela		
		end -- end do if marker
	end -- end do if(md)
end -- end da function
addEventHandler("onPlayerMarkerLeave",getRootElement(),SairMJob) -- adc o evento "onPlayerMarkerLeave" a function






function JogSaiu()

    if isTimer ( tempo ) then killTimer ( tempo ) end -- verifica se o tempo esta correndo e da um stop nele!!
    setElementData ( source, "iniciouJob", false ) -- remove a data de trabalho!!
    
end -- end da function
addEventHandler("onPlayerExit", root, JogSaiu) -- adc o evento "onPlayerExit" (se o jogador Sair ou Cair ele para o tempo!!)

























---------------------------------------------------------------------------------------------------------------------------------------------

local MarkersTableTrab = {}

local MarkersTablePan = {}

local MarkersTableVTR = {}


function newMarkerTrab ()
	for _, markers in ipairs( getElementsByType 'marker' ) do
		if getElementData(markers, "novaMarkerTrab") == true then
			for _, players in ipairs( getElementsByType 'player' ) do 
			end	
		end	
	end 
end 

for i, v in ipairs (pos_markerTrab) do
	MarkersTableTrab[i] = createMarker ( v[1], v[2], v[3] -1, "cylinder", 1, 0, 255, 0, 0 )
    setElementData(MarkersTableTrab[i], "novaMarkerTrab", true)
    addEventHandler("onMarkerLeave", MarkersTableTrab[i], newMarkerTrab)
end


function newMarkerPan ()
	for _, markers in ipairs( getElementsByType 'marker' ) do
		if getElementData(markers, "novaMarkerPan") == true then
			for _, players in ipairs( getElementsByType 'player' ) do 
			end	
		end	
	end 
end 

for i, v in ipairs (pos_markerPan) do
	MarkersTablePan[i] = createMarker ( v[1], v[2], v[3] -1, "cylinder", 1, 0, 255, 0, 0 )
    setElementData(MarkersTablePan[i], "novaMarkerPan", true)
    addEventHandler("onMarkerLeave", MarkersTablePan[i], newMarkerPan)
end


function newMarkerVtr ()
	for _, markers in ipairs( getElementsByType 'marker' ) do
		if getElementData(markers, "novaMarkerVTR") == true then
			for _, players in ipairs( getElementsByType 'player' ) do 
			end	
		end	
	end 
end 

for i, v in ipairs (pos_markerVTR) do
	MarkersTableVTR[i] = createMarker ( v[1], v[2], v[3] -1, "cylinder", 1, 0, 255, 0, 0 )
    setElementData(MarkersTableVTR[i], "novaMarkerVTR", true)
    addEventHandler("onMarkerLeave", MarkersTableVTR[i], newMarkerVtr)
end

---------------------------------------------------------------------------------------------------------------------------------------------











---------------------------------------------------------------------------------------------------------------------------------------------


local animEnable = {} -- tabela
local syncPlayers = {} -- tabela


function handleCommand(player,anim)
local skin = getElementModel(player) 
if skin == SkinPt1[ tonumber( #SkinPt1 ) ] or SkinAc[ tonumber( #SkinAc ) ] or SkinPt2[ tonumber( #SkinPt2)] then
    if isElementWithinMarker(player, mTrab) then 

		  triggerClientEvent(syncPlayers, "anim", player, anim, true)
		  if animEnable[player] then animEnable[player] = false end

    end
end
end
--end
--addCommandHandler(cmdM,handleCommand)


addEvent("onClientSync", true )
addEventHandler("onClientSync", resourceRoot,
    function()
        table.insert(syncPlayers, client)
		for player, enable in ipairs(animEnable) do
			if (enable) then
				triggerClientEvent(client, "anim", player, "continencia2", true)
			end
		end
    end
)

addEventHandler("onPlayerQuit", root,
    function()
        for i, player in ipairs(syncPlayers) do
            if source == player then 
                table.remove(syncPlayers, i)
                break
            end 
        end
        if (animEnable[source] == true or animEnable[source] == false) then animEnable[source] = nil end
    end
)




function Res()
    for index, player in ipairs(getElementsByType("player")) do
      bindKey(player, cmdM, "down", handleCommand)
    end
  end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), Res)

function Join()
    bindKey(source, cmdM, "down", handleCommand)
  end
addEventHandler("onPlayerJoin", getRootElement(), Join)

function Clean(player)
    for index, player in ipairs(getElementsByType("player")) do
      unbindKey(player, cmdM, "down", handleCommand)
    end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), Clean)








---------------------------------------------------------------------------------------------------------------------------------------------