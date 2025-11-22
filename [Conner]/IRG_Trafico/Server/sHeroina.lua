local Hzone = createColCuboid(-1880.23413, -1621.13843, 21.96406, 2.6251220703125, 12.516845703125, 4.9)
local Hzone2 = createColCuboid(-1895.47363, -1606.16504, 21.96406, 17.222534179688, 2.606201171875, 4.4000267028809)
local HExzone = createColCuboid(-1940.58154, -1763.08813, 20.75000, 84.861328125, 165.87915039063, 20.9)

local ObjID = 231
local Droga = "Heroina não processada"
local Object = 1580
local timeR = 5


HObject = {}
timerH = {}

addEventHandler("onColShapeHit", Hzone,function (thePlayer)
local prTeam = getTeamFromName ( "PR" )
local prCount = countPlayersInTeam ( prTeam )
	-- if prCount >= 6 then
	local count = getPlayerCount()
	if count > 1 then
     exports.san_hud:dm("Campo de "..Droga..".",thePlayer, 255, 255, 255)
	 exports.san_hud:dm("Pressione [E] Para iniciar a fabricação.",thePlayer, 255, 50, 70)
	 bindKey(thePlayer, "e", "down", startTheFunctionHero)
	else
	triggerClientEvent(thePlayer,"JoinQuitGtaV:sendClientMessage", thePlayer,"#FF0000TRAFICO #FFFFFFCANCELADO DEVIDO A POUCO JOGADOR NA CIDADE MINIMO 150 JOGADORES!", 255, 255, 255, pos, 20 )
	end
	-- else
	-- exports.san_hud:dm("Para iniciar o serviço necessita de 6 Policias Rodoviários.",thePlayer, 255, 255, 255)
	-- end
end)

local originalGetPlayerCount = getPlayerCount
function getPlayerCount()
    return originalGetPlayerCount and originalGetPlayerCount() or #getElementsByType("player")
end


addEventHandler("onColShapeHit", Hzone2,function (thePlayer)
local prTeam = getTeamFromName ( "PR" )
local prCount = countPlayersInTeam ( prTeam )
  --   if not prCount >= 6 then
     exports.san_hud:dm("Campo de "..Droga..".",thePlayer, 255, 255, 255)
	 exports.san_hud:dm("Pressione [E] Para iniciar a fabricação.",thePlayer, 255, 50, 70)
	 bindKey(thePlayer, "e", "down", startTheFunctionHero)
	-- else
	-- exports.san_hud:dm("Para iniciar o serviço necessita de 6 Policias Rodoviários.",thePlayer, 255, 255, 255)
	-- end
end)

function removeBindKey (thePlayer)
     unbindKey(thePlayer, "e", "down", startTheFunctionHero)
end
addEventHandler("onColShapeLeave", Hzone2, removeBindKey)
addEventHandler("onColShapeLeave", Hzone, removeBindKey)

function startTheFunctionHero (thePlayer)
  
     local xS,yS,zS = getElementPosition(thePlayer)
	 if (zS) then
	     local zX = math.floor(zS)
		 if (zX ~= 22) then
		     exports.san_hud:dm("Desça da mesa para processar a droga.",thePlayer, 255, 255, 255)
		     return
		 end
	 end

	 if isElement(HObject[thePlayer]) then exports.san_hud:dm("Leve a droga que esta na sua mão para o caminhãoa para pegar outra.",thePlayer, 255, 255, 255) return end

	 unbindKey(thePlayer, "e", "down", startTheFunctionHero)
	 setElementData(thePlayer, "Object:Jobs", true)
	 setElementFrozen(thePlayer, true)
	 setPedAnimation(thePlayer, "casino", "cards_pick_01", -1, false, true, false, true)

	 triggerClientEvent(thePlayer, "progressService", thePlayer, timeR)
	 setTimer(function(thePlayer)
		setPedAnimation(thePlayer)
         local x,y,z = getElementPosition(thePlayer)
         HObject[thePlayer] = createObject(Object, x, y, z + 0.5 )
         setObjectScale(HObject[thePlayer],0.75)
         setElementCollisionsEnabled(HObject[thePlayer],false)
         attachElements(HObject[thePlayer],thePlayer,0,0.45,0.27,1,0,0)
		 setPedAnimation(thePlayer, "CARRY", "crry_prtial", 50, false, true, false, true)
		 timerH[thePlayer] = setTimer(deletObjectHero, 2000, 200, thePlayer)
		 if not exports['san_items']:hasItemS(thePlayer, ObjID) then
		     exports['san_items']:giveItem(thePlayer, ObjID, 1, 1, 0, false)
		 end
		 setElementFrozen(thePlayer, false)
	 end, timeR*1000, 1, thePlayer)
end
function enterTruckHero (player, seat, jacked)
     if exports['san_items']:hasItemS(player, ObjID) then
	     cancelEvent()
		 exports.san_hud:dm("Você não pode embarcar no carro com heroina na mão.",player, 255, 255, 255)
	 end
end
addEventHandler("onVehicleStartEnter", getRootElement(), enterTruckHero)
function exitObjectHero (thePlayer)
     if isElement(HObject[thePlayer]) then
	     if exports['san_items']:hasItemS(thePlayer, ObjID) then
			 exports.san_hud:dm("Sua droga foi removida Motivo: (Saiu da area).",thePlayer, 255, 0, 0)
			 setPedAnimation(thePlayer)
			 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, ObjID, false)
			 destroyElement(HObject[thePlayer])
			 setElementData(thePlayer, "Object:Jobs", false)
    	--	 if isTimer(timerMaconha[thePlayer]) then
         --        killTimer(timerMaconha[thePlayer])	 
	   	 end
     end
end
addEventHandler("onColShapeLeave", HExzone, exitObjectHero)

function deletObjectHero (thePlayer)
     if not thePlayer then return end
     if not exports['san_items']:hasItemS(thePlayer, ObjID) then
		 if isTimer(timerH[thePlayer]) then
			 killTimer(timerH[thePlayer])	
			 setPedAnimation(thePlayer)
			 setElementData(thePlayer, "Object:Jobs", false) 
		 end
		 if isElement(HObject[thePlayer]) then
			 destroyElement(HObject[thePlayer])
		 end			 
	 end
end

addEventHandler("onPlayerQuit", root,
function ()
		 if isTimer(timerH[source]) then
             killTimer(timerH[source])	 
		 end
		 if isElement(HObject[source]) then
			 destroyElement(HObject[source])
			 setElementData(thePlayer, "Object:Jobs", false)
		 end
end)

------------------------------------------- PROCESSADORES HEROINA	

local processHeroina = createColSphere (2458.491, 1914.241, 10.726, 3)
local processOpHeroina = false
local contagemH = {}
local HObejct = {}
local markH = {}
local timerHFC = {}
local loopH = {}
local loopHN = {}
local loopHTC = {}

addEventHandler("onColShapeHit", processHeroina, function (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 231) then
	     exports.san_hud:dm("Pressione [E] Para iniciar o processamento.",thePlayer, 255, 50, 70)
		 bindKey(thePlayer, "e", "down", startTheProcessCoca)
	     else
		 exports.san_hud:dm("Você não possui a droga indicada 'Heroina não processada'.",thePlayer, 255, 0, 0)
	 end
end)

addEventHandler("onColShapeLeave", processHeroina, function (thePlayer)
	 unbindKey(thePlayer, "e", "down", startTheProcessCoca)
end)

function startTheProcessCoca (thePlayer)
     if isElementWithinColShape ( thePlayer, processHeroina) then
	 
     local xS,yS,zS = getElementPosition(thePlayer)
	 if (zS) then
	     local zX = math.floor(zS)
		 if (zX ~= 10) then
		     exports.san_hud:dm("Desça da mesa para processar a droga.",thePlayer, 255, 255, 255)
		     return
		 end
	 end
	 
	     if exports['san_items']:hasItemS(thePlayer, 231) then
		     unbindKey(thePlayer, "e", "down", startTheProcessCoca)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setElementFrozen(thePlayer, true)
		     exports.san_hud:dm("Processamento iniciando em breve, Aguarda.",thePlayer, 255, 255, 255)
			 contagemH[thePlayer] = 0
			 setTimer(execProcessHero, 2000, 1, thePlayer)
			 contagemHDeHeroina (thePlayer)
		 end
	 end
end

function contagemHDeHeroina (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 231) then 
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 231, false)
		 contagemH[thePlayer] = contagemH[thePlayer] + 1
		 outputDebugString("O valor de Contagem daHeroina foi de "..contagemH[thePlayer])
		 contagemHDeHeroina (thePlayer)
         else
         return		 
	 end
end

function execProcessHero (thePlayer)
setElementData(thePlayer, "setHeroina", contagemH[thePlayer])
loopH[thePlayer] = getElementData(thePlayer, "setHeroina") or 0
     loopHN[thePlayer] = tonumber(loopH[thePlayer])
	 outputDebugString("O valor de Heroina não processada foi de "..loopH[thePlayer])
	 exports['san_items']:giveItem(thePlayer, 231, 1, loopHN[thePlayer], 0, false)
     if contagemH[thePlayer] then
		 setTimer(function(thePlayer)
             if not exports['san_items']:hasItemS(thePlayer, 231) then			 
				     setElementData(thePlayer, "Object:Jobs", false)
					 setElementFrozen(thePlayer, false)
				     exports.san_hud:dm("Processamento encerrado... Vá até o outro lado da maquina para pegar a droga refinada.",thePlayer, 255, 255, 255)	
                     return								 
			 end
	         exports.san_hud:dm("Processamento iniciando, Não saia do local.",thePlayer, 255, 255, 255)
			 setElementData(thePlayer, "Object:Jobs", true)
		     triggerClientEvent(thePlayer, "progressService", thePlayer, 5)
		     HObejct[thePlayer] = createObject(1578, 2458.491, 1914.241, 10.726)
			 setElementData(HObejct[thePlayer], "Object:Heroina", true)
	         moveObject(HObejct[thePlayer], 5000, 2458.491, 1910.241, 10.726)
		     if isElement(HObejct[thePlayer]) then
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 231, false)
				 setTimer(destroyElement, 5500, 1, HObejct[thePlayer])
			 end
		 end, 5100, loopHN[thePlayer] + 1, thePlayer)
	 end
end

markH = createMarker(2460.126, 1906.223, 9.865, "cylinder", 1.1, 255, 0, 0, 100)

function takeDrogaHero3 (thePlayer)
     if (getElementData(thePlayer, "setHeroina")) then
	 local loopHTC = getElementData(thePlayer, "setHeroina") or 0
	     if not exports['san_items']:hasItemS(thePlayer, 231) then
             timerHFC[thePlayer] = 0
		     exports.san_hud:dm("Droga refinada com sucesso "..(getElementData(thePlayer, "setHeroina") or 0)..".",thePlayer, 255, 255, 255)
			 exports.san_hud:dm("Você pode perder suas drogas caso a conexão com o servidor seja perdida.",thePlayer, 255, 0, 0)
			 setElementFrozen(thePlayer, true)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setTimer(function(thePlayer)
			     timerHFC[thePlayer] = timerHFC[thePlayer] + 1
			     exports['san_items']:giveItem(thePlayer, 232, 1, 1, 0, false)
				 setElementData(thePlayer, "setHeroina", false)
				 if exports['san_items']:hasItemS(thePlayer, 232) then
                     if (loopHTC == timerHFC[thePlayer]) then
					     exports.san_hud:dm("Finalziado com sucesso pode se retirar.",thePlayer, 255, 255, 255)
					     timerHFC[thePlayer] = 0
						 loopHN[thePlayer] = 0
						 loopH[thePlayer] = 0
			             setElementFrozen(thePlayer, false)
			             setElementData(thePlayer, "Object:Jobs", false)
					 end
				 end
			 end, 1000, loopHTC, thePlayer)
		 end
	 end
end
addEventHandler("onMarkerHit", markH, takeDrogaHero3)






local processHeroina2 = createColSphere (2453.329, 1914.176, 10.726, 3)
local processOpHeroina2 = false
local contagemH2 = {}
local HObejct2 = {}
local markH2 = {}
local timerHFC2 = {}
local loopH2 = {}
local loopHN2 = {}
local loopHTC2 = {}

addEventHandler("onColShapeHit", processHeroina2, function (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 232) then
	     exports.san_hud:dm("Pressione [E] Para iniciar o processamento.",thePlayer, 255, 50, 70)
		 bindKey(thePlayer, "e", "down", startTheProcessCoca2)
	     else
		 exports.san_hud:dm("Você não possui a droga indicada 'Heroina processada'.",thePlayer, 255, 0, 0)
	 end
end)

addEventHandler("onColShapeLeave", processHeroina2, function (thePlayer)
	 unbindKey(thePlayer, "e", "down", startTheProcessCoca2)
end)

function startTheProcessCoca2 (thePlayer)
     if isElementWithinColShape ( thePlayer, processHeroina2) then
	 
     local xS,yS,zS = getElementPosition(thePlayer)
	 if (zS) then
	     local zX = math.floor(zS)
		 if (zX ~= 10) then
		     exports.san_hud:dm("Desça da mesa para processar a droga.",thePlayer, 255, 255, 255)
		     return
		 end
	 end
	 
	     if exports['san_items']:hasItemS(thePlayer, 232) then
		     unbindKey(thePlayer, "e", "down", startTheProcessCoca2)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setElementFrozen(thePlayer, true)
		     exports.san_hud:dm("Processamento iniciando em breve, Aguarda.",thePlayer, 255, 255, 255)
			 contagemH2[thePlayer] = 0
			 setTimer(execProcessHero2, 2000, 1, thePlayer)
			 contagemHDeHeroina2 (thePlayer)
		 end
	 end
end

function contagemHDeHeroina2 (thePlayer)
     if exports['san_items']:hasItemS(thePlayer, 232) then 
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 232, false)
		 contagemH2[thePlayer] = contagemH2[thePlayer] + 1
		 contagemHDeHeroina2 (thePlayer)
         else
         return		 
	 end
end

function execProcessHero2 (thePlayer)
setElementData(thePlayer, "setPaste", contagemH2[thePlayer])
 loopH2[thePlayer] = getElementData(thePlayer, "setPaste") or 0
     loopHN2[thePlayer] = tonumber(loopH2[thePlayer])
	 outputDebugString("O valor de Heroina não processada foi de "..loopH2[thePlayer])
	 exports['san_items']:giveItem(thePlayer, 232, 1, loopHN2[thePlayer], 0, false)
     if contagemH2[thePlayer] then
		 setTimer(function(thePlayer)
             if not exports['san_items']:hasItemS(thePlayer, 232) then			 
				     setElementData(thePlayer, "Object:Jobs", false)
					 setElementFrozen(thePlayer, false)
				     exports.san_hud:dm("Processamento encerrado... Vá até o outro lado da maquina para pegar a droga refinada.",thePlayer, 255, 255, 255)	
                     return								 
			 end
	         exports.san_hud:dm("Processamento iniciando, Não saia do local.",thePlayer, 255, 255, 255)
			 setElementData(thePlayer, "Object:Jobs", true)
		     triggerClientEvent(thePlayer, "progressService", thePlayer, 5)
		     HObejct2[thePlayer] = createObject(1575 ,2453.329, 1914.176, 10.726)
	         moveObject(HObejct2[thePlayer], 5000, 2453.329, 1910.176, 10.726)
		     if isElement(HObejct2[thePlayer]) then
				 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 232, false)
				 setTimer(destroyElement, 5500, 1, HObejct2[thePlayer])
			 end
		 end, 5100, loopHN2[thePlayer] + 1, thePlayer)
	 end
end

markH2 = createMarker(2451.582, 1905.964, 9.865, "cylinder", 1.1, 255, 0, 0, 100)

function takeDroga2 (thePlayer)
     if (getElementData(thePlayer, "setPaste")) then
	  loopHTC2[thePlayer] = getElementData(thePlayer, "setPaste") or 0
	  loopHTC2[thePlayer] = loopHTC2[thePlayer] * 5
	     if not exports['san_items']:hasItemS(thePlayer, 232) then
             timerHFC2[thePlayer] = 0
		     exports.san_hud:dm("Droga refinada com sucesso "..(loopHTC2[thePlayer])..".",thePlayer, 255, 255, 255)
			 exports.san_hud:dm("Você pode perder suas drogas caso a conexão com o servidor seja perdida.",thePlayer, 255, 0, 0)
			 setElementFrozen(thePlayer, true)
			 setElementData(thePlayer, "Object:Jobs", true)
			 setTimer(function(thePlayer)
			     timerHFC2[thePlayer] = timerHFC2[thePlayer] + 1
			     exports['san_items']:giveItem(thePlayer, 15, 1, loopHTC2[thePlayer], 0, false)
				 setElementData(thePlayer, "setPaste", false)
					     exports.san_hud:dm("Finalziado com sucesso pode se retirar.",thePlayer, 255, 255, 255)
					     timerHFC2[thePlayer] = 0
			             setElementFrozen(thePlayer, false)
			             setElementData(thePlayer, "Object:Jobs", false)
			 end, 1000, 1, thePlayer)
		 end
	 end
end
addEventHandler("onMarkerHit", markH2, takeDroga2)