local farmMaconha = createColCuboid(1008.48456, -369.02823, 70.56422, 112.55340576172, 77.538848876953, 38.9)

local start = {
	{1101.0242919922,-315.90603637695,72.9921875},

	--[[
	{1095.742, -326.281, 72.992},
    {1101.605, -326.281, 72.992},
    {1106.065, -326.281, 72.992},
    {1111.661, -326.281, 72.992},
	
    {1095.356, -321.523, 72.992},
    {1101.472, -321.523, 72.992},
    {1106.025, -321.523, 72.992},
    {1111.891, -321.523, 72.992},
	
    {1095.356, -310.281, 72.992},
    {1101.472, -310.281, 72.992},
    {1106.025, -310.281, 72.992},
    {1111.891, -310.281, 72.992},
	
    {1095.356, -306.523, 72.992},
    {1101.472, -306.523, 72.992},
    {1106.025, -306.523, 72.992},
    {1111.891, -306.523, 72.992},
	
    {1095.356, -302.281, 72.992},
    {1101.472, -302.281, 72.992},
    {1106.025, -302.281, 72.992},
	{1111.891, -302.281, 72.992},
	]]--
}

plantsCol = {}
Maconha = {}
VehicleZone = {}
timerMaconha = {}
cont = {}

addEventHandler ( "onResourceStart", getRootElement(),
function ()
	 for _,value in pairs(start) do
	     plants = createObject(3409, value[1], value[2], value[3])
		 plantsCol = createColSphere (value[1], value[2], value[3], 4)
		 addEventHandler("onColShapeHit", plantsCol, addBindKeyMaco)
		 addEventHandler("onColShapeLeave", plantsCol, removeBindKeyMaco)
	 end
end)

function exitObjectMaco (thePlayer)
	 if isElement(Maconha[thePlayer]) then
	     if exports['san_items']:hasItemS(thePlayer, 145) then
             destroyElement(Maconha[thePlayer])
			 exports.san_hud:dm("Sua maconha foi removida Motivo: (Saiu da area).",thePlayer, 255, 0, 0)
			 setElementData(thePlayer, "Object:Jobs", false)
			 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 145, false)
			 verificationMaco (thePlayer)
			 exports.san_anims:setJobAnimation(thePlayer)
    		 if isTimer(timerMaconha[thePlayer]) then
                 killTimer(timerMaconha[thePlayer])	 
	    	 end
		 end
     end
end
addEventHandler("onColShapeLeave", farmMaconha, exitObjectMaco)

function verificationMaco (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 145) then
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 145, false)
		 verificationMaco (thePlayer)
	 else
	     return
	 end
end

function addBindKeyMaco (thePlayer)
	local prTeam = getTeamFromName ( "PR" )
	local prCount = countPlayersInTeam ( prTeam )
  --   if prCount >= 6 then
  	local count = getPlayerCount()
  	if count > 1 then

     bindKey(thePlayer, "e", "down", startTheFunctionMaco)
	 setElementData(thePlayer, "enterZone:Maconha", true)
	-- else
	-- exports.san_hud:dm("Para iniciar o serviço necessita de 6 Policias Rodoviários.",thePlayer, 255, 255, 255)
	-- end
	else
	triggerClientEvent(thePlayer,"JoinQuitGtaV:sendClientMessage", thePlayer,"#FF0000TRAFICO #FFFFFFCANCELADO DEVIDO A POUCO JOGADOR NA CIDADE MINIMO 150 JOGADORES!", 255, 255, 255, pos, 20 )
	end
end

local originalGetPlayerCount = getPlayerCount
function getPlayerCount()
    return originalGetPlayerCount and originalGetPlayerCount() or #getElementsByType("player")
end

function removeBindKeyMaco (thePlayer)
     unbindKey(thePlayer, "e", "down", startTheFunctionMaco)
	 setElementData(thePlayer, "enterZone:Maconha", false)
end

function startTheFunctionMaco (thePlayer)
	 if isElement(Maconha[thePlayer]) then exports.san_hud:dm("Leve a droga que esta na sua mão para o caminhãoa para pegar outra.",thePlayer, 255, 255, 255) return end
     if (getElementData(thePlayer, "enterZone:Maconha")) then
		 unbindKey(thePlayer, "e", "down", startTheFunctionMaco)
		 setElementFrozen(thePlayer, true)
		 setPedAnimation(thePlayer, "bomber", "bom_plant_loop", -1, false, true, false, true)
		 triggerClientEvent(thePlayer, "progressService", thePlayer, 4)
		 setTimer(function(thePlayer)
			setPedAnimation(thePlayer)
			setElementData(thePlayer, "Object:Jobs", true)
			setElementFrozen(thePlayer, false)
		     if (getElementData(thePlayer, "enterZone:Maconha")) then
				setPedAnimation(thePlayer)
	             local x,y,z = getElementPosition(thePlayer)
	             Maconha[thePlayer] = createObject(2901, x, y, z)
	             setObjectScale(Maconha[thePlayer],0.75)
	             setElementCollisionsEnabled(Maconha[thePlayer],false)
				 attachElements(Maconha[thePlayer],thePlayer,0,0.45,0.37,1,0,0)
				 setElementData(thePlayer, "Object:Jobs", true)
				 setElementFrozen(thePlayer, false)
			     setPedAnimation(thePlayer, "CARRY", "crry_prtial", 50, false, true, false, true)
				 if not exports['san_items']:hasItemS(thePlayer, 145) then
				     exports['san_items']:giveItem(thePlayer, 145, 1, 1, 0, false)
				 end

				 exports.san_hud:dm("Leve a maconha não processada até o seu caminhão.",thePlayer, 255, 255, 255)
				 timerMaconha[thePlayer] = setTimer(deletObjectMaco, 2000, 100, thePlayer)
			 end
		 end, 4000, 1, thePlayer)
	 end
end

function deletObjectMaco (thePlayer)
     if not thePlayer then return end
     if not exports['san_items']:hasItemS(thePlayer, 145) then
		 if isTimer(timerMaconha[thePlayer]) then
			 killTimer(timerMaconha[thePlayer])	
			 setPedAnimation(thePlayer)
			 setElementData(thePlayer, "Object:Jobs", false) 
		 end
		 if isElement(Maconha[thePlayer]) then
			 destroyElement(Maconha[thePlayer])			 
	 	end
	end
end

function enterTruckMaco (player, seat, jacked)
     if exports['san_items']:hasItemS(player, 145) then
	     cancelEvent()
		 exports.san_hud:dm("Você não pode embarcar no carro com maconha na mão.",player, 255, 255, 255)
	 end
end
addEventHandler("onVehicleStartEnter", getRootElement(), enterTruckMaco)

addEventHandler("onPlayerQuit", root,
function ()
		 if isTimer(timerMaconha[source]) then
             killTimer(timerMaconha[source])	 
		 end
		 if isElement(Maconha[source]) then
			 destroyElement(Maconha[source])
		 end
end)

------------------------------------

local processMaconha = createColSphere (-1495.376, 1192.236, 7.126, 3)
local processOpMaconha = false
local contagemM = {}
local MObejct = {}
local markM = {}
local timerMFC = {}
local loopM = {}
local loopMN = {}
local loopMTC = {}

addEventHandler("onColShapeHit", processMaconha, function (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 145) then
	     exports.san_hud:dm("Pressione [E] Para iniciar o processamento.",thePlayer, 255, 50, 70)
		 bindKey(thePlayer, "e", "down", startTheProcessMaco)
	     else
		 exports.san_hud:dm("Você não possui a droga indicada 'Heroina não processada'.",thePlayer, 255, 0, 0)
	 end
end)

addEventHandler("onColShapeLeave", processMaconha, function (thePlayer)
	 unbindKey(thePlayer, "e", "down", startTheProcessMaco)
end)

function startTheProcessMaco (thePlayer)
     if isElementWithinColShape ( thePlayer, processMaconha) then
	 
     local xS,yS,zS = getElementPosition(thePlayer)
	 if (zS) then
	     local zX = math.floor(zS)
		 if (zX ~= 7) then
		     exports.san_hud:dm("Desça da mesa para processar a droga.",thePlayer, 255, 255, 255)
		     return
		 end
	 end
	 
	     if exports['san_items']:hasItemS(thePlayer, 145) then
		     unbindKey(thePlayer, "e", "down", startTheProcessMaco)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setElementFrozen(thePlayer, true)
		     exports.san_hud:dm("Processamento iniciando em breve, Aguarda.",thePlayer, 255, 255, 255)
			 contagemM[thePlayer] = 0
			 setTimer(execProcessMaconha, 2000, 1, thePlayer)
			 contagemMDeMaconha (thePlayer)
		 end
	 end
end

function contagemMDeMaconha (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 145) then 
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 145, false)
		 contagemM[thePlayer] = contagemM[thePlayer] + 1
		 outputDebugString("O valor de Contagem daHeroina foi de "..contagemM[thePlayer])
		 contagemMDeMaconha (thePlayer)
         else
         return		 
	 end
end

function execProcessMaconha (thePlayer)
setElementData(thePlayer, "setMaconha", contagemM[thePlayer])
loopM[thePlayer] = getElementData(thePlayer, "setMaconha") or 0
     loopMN[thePlayer] = tonumber(loopM[thePlayer])
	 outputDebugString("O valor de Heroina não processada foi de "..loopM[thePlayer])
	 exports['san_items']:giveItem(thePlayer, 145, 1, loopMN[thePlayer], 0, false)
     if contagemM[thePlayer] then
		 setTimer(function(thePlayer)
             if not exports['san_items']:hasItemS(thePlayer, 145) then			 
				     setElementData(thePlayer, "Object:Jobs", false)
					 setElementFrozen(thePlayer, false)
				     exports.san_hud:dm("Processamento encerrado... Vá até o outro lado da maquina para pegar a droga refinada.",thePlayer, 255, 255, 255)	
                     return								 
			 end
	         exports.san_hud:dm("Processamento iniciando, Não saia do local.",thePlayer, 255, 255, 255)
			 setElementData(thePlayer, "Object:Jobs", true)
		     triggerClientEvent(thePlayer, "progressService", thePlayer, 5)
		     MObejct[thePlayer] = createObject(2901, -1495.376, 1192.236, 7.226)
			 setElementData(MObejct[thePlayer], "Object:Heroina", true)
	         setObjectScale(MObejct[thePlayer],0.75)
	         setElementCollisionsEnabled(MObejct[thePlayer],false)
	         moveObject(MObejct[thePlayer], 5000, -1492.376, 1192.236, 7.226)
		     if isElement(MObejct[thePlayer]) then
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 145, false)
				 setTimer(destroyElement, 5500, 1, MObejct[thePlayer])
			 end
		 end, 5100, loopMN[thePlayer] + 1, thePlayer)
	 end
end

markM = createMarker(-1487.168, 1190.486, 6.185, "cylinder", 1.1, 255, 0, 0, 100)

function takeDrogaMaco3 (thePlayer)
     if (getElementData(thePlayer, "setMaconha")) then
	 local loopMTC = getElementData(thePlayer, "setMaconha") or 0
	     if not exports['san_items']:hasItemS(thePlayer, 145) then
             timerMFC[thePlayer] = 0
		     exports.san_hud:dm("Droga refinada com sucesso "..(getElementData(thePlayer, "setMaconha") or 0)..".",thePlayer, 255, 255, 255)
			 exports.san_hud:dm("Você pode perder suas drogas caso a conexão com o servidor seja perdida.",thePlayer, 255, 0, 0)
			 setElementFrozen(thePlayer, true)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setTimer(function(thePlayer)
			     timerMFC[thePlayer] = timerMFC[thePlayer] + 1
			     exports['san_items']:giveItem(thePlayer, 149, 1, 1, 0, false)
				 setElementData(thePlayer, "setMaconha", false)
				 if exports['san_items']:hasItemS(thePlayer, 149) then
                     if (loopMTC == timerMFC[thePlayer]) then
					     exports.san_hud:dm("Finalziado com sucesso pode se retirar.",thePlayer, 255, 255, 255)
					     timerMFC[thePlayer] = 0
						 loopMN[thePlayer] = 0
						 loopM[thePlayer] = 0
			             setElementFrozen(thePlayer, false)
			             setElementData(thePlayer, "Object:Jobs", false)
					 end
				 end
			 end, 1000, loopMTC, thePlayer)
		 end
	 end
end
addEventHandler("onMarkerHit", markM, takeDrogaMaco3)






local processMaconha2 = createColSphere (-1495.32, 1197.906, 7.126, 3)
local processOpMaconha2 = false
local contagemM2 = {}
local MObejct2 = {}
local markM2 = {}
local timerMFC2 = {}
local loopM2 = {}
local loopMN2 = {}
local loopMTC2 = {}

addEventHandler("onColShapeHit", processMaconha2, function (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 149) then
	     exports.san_hud:dm("Pressione [E] Para iniciar o processamento.",thePlayer, 255, 50, 70)
		 bindKey(thePlayer, "e", "down", startTheProcessMaco2)
	     else
		 exports.san_hud:dm("Você não possui a droga indicada 'Heroina processada'.",thePlayer, 255, 0, 0)
	 end
end)

addEventHandler("onColShapeLeave", processMaconha2, function (thePlayer)
	 unbindKey(thePlayer, "e", "down", startTheProcessMaco2)
end)

function startTheProcessMaco2 (thePlayer)
     if isElementWithinColShape ( thePlayer, processMaconha2) then
	 
     local xS,yS,zS = getElementPosition(thePlayer)
	 if (zS) then
	     local zX = math.floor(zS)
		 if (zX ~= 7) then
		     exports.san_hud:dm("Desça da mesa para processar a droga.",thePlayer, 255, 255, 255)
		     return
		 end
	 end
	 
	     if exports['san_items']:hasItemS(thePlayer, 149) then
		     unbindKey(thePlayer, "e", "down", startTheProcessMaco2)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setElementFrozen(thePlayer, true)
		     exports.san_hud:dm("Processamento iniciando em breve, Aguarda.",thePlayer, 255, 255, 255)
			 contagemM2[thePlayer] = 0
			 setTimer(execProcessMaconha2, 2000, 1, thePlayer)
			 contagemMDeMaconha2 (thePlayer)
		 end
	 end
end

function contagemMDeMaconha2 (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 149) then 
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 149, false)
		 contagemM2[thePlayer] = contagemM2[thePlayer] + 1
		 contagemMDeMaconha2 (thePlayer)
         else
         return		 
	 end
end

function execProcessMaconha2 (thePlayer)
setElementData(thePlayer, "setPaste", contagemM2[thePlayer])
 loopM2[thePlayer] = getElementData(thePlayer, "setPaste") or 0
     loopMN2[thePlayer] = tonumber(loopM2[thePlayer])
	 outputDebugString("O valor de Heroina não processada foi de "..loopM2[thePlayer])
	 exports['san_items']:giveItem(thePlayer, 149, 1, loopMN2[thePlayer], 0, false)
     if contagemM2[thePlayer] then
		 setTimer(function(thePlayer)
             if not exports['san_items']:hasItemS(thePlayer, 149) then			 
				     setElementData(thePlayer, "Object:Jobs", false)
					 setElementFrozen(thePlayer, false)
				     exports.san_hud:dm("Processamento encerrado... Vá até o outro lado da maquina para pegar a droga refinada.",thePlayer, 255, 255, 255)	
                     return								 
			 end
	         exports.san_hud:dm("Processamento iniciando, Não saia do local.",thePlayer, 255, 255, 255)
			 setElementData(thePlayer, "Object:Jobs", true)
		     triggerClientEvent(thePlayer, "progressService", thePlayer, 5)
		     MObejct2[thePlayer] = createObject(1279 ,-1495.32, 1197.906, 7.126)
	         moveObject(MObejct2[thePlayer], 5000, -1490.32, 1197.906, 7.126)
		     if isElement(MObejct2[thePlayer]) then
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 149, false)
				 setTimer(destroyElement, 5500, 1, MObejct2[thePlayer])
			 end
		 end, 5100, loopMN2[thePlayer] + 1, thePlayer)
	 end
end

markM2 = createMarker(-1487.148, 1199.514, 6.188, "cylinder", 1.1, 255, 0, 0, 100)

function takeDroga2 (thePlayer)
     if (getElementData(thePlayer, "setPaste")) then
	  loopMTC2[thePlayer] = getElementData(thePlayer, "setPaste") or 0
	  loopMTC2[thePlayer] =  loopMTC2[thePlayer] * 5
	     if not exports['san_items']:hasItemS(thePlayer, 149) then
             timerMFC2[thePlayer] = 0
		     exports.san_hud:dm("Droga refinada com sucesso "..(loopMTC2[thePlayer])..".",thePlayer, 255, 255, 255)
			 exports.san_hud:dm("Você pode perder suas drogas caso a conexão com o servidor seja perdida.",thePlayer, 255, 0, 0)
			 setElementFrozen(thePlayer, true)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setTimer(function(thePlayer)
			     timerMFC2[thePlayer] = timerMFC2[thePlayer] + 1
			     exports['san_items']:giveItem(thePlayer, 144, 1, loopMTC2[thePlayer], 0, false)
				 setElementData(thePlayer, "setPaste", false)
				 if exports['san_items']:hasItemS(thePlayer, 144) then
					     exports.san_hud:dm("Finalziado com sucesso pode se retirar.",thePlayer, 255, 255, 255)
					     timerMFC2[thePlayer] = 0
			             setElementFrozen(thePlayer, false)
			             setElementData(thePlayer, "Object:Jobs", false)
				 end
			 end, 1000, 1, thePlayer)
		 end
	 end
end
addEventHandler("onMarkerHit", markM2, takeDroga2)
