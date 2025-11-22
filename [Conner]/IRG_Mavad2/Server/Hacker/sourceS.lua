enter = createMarker(1243.253, 216.985, 22.056, "cylinder", 1.1, 255, 0, 0, 50)
blipM = createBlipAttachedTo ( enter, 59 )

timerCard  = {}
timerExec  = {}
randomL    = {}
blipH      = {}
timerExecE = {}

function enterJob (thePlayer)
     if not (getElementData(thePlayer, "JOB")) then
		 setElementData(thePlayer, "JOB", true)
		 setElementData(thePlayer, "ILEGAIS:Job", 5)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", 1243.253, 216.985, 22.056)
		 outputChatBox("#7cc576[BV - Ilegais] #FFFFFFVá até a #7cc576Marcação de Boneco Roxo #FFFFFFno mapa.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[BV - Ilegais] #FFFFFFPara iniciar seu serviço.", thePlayer, 255,255,255, true)
		 createPedOrgao(thePlayer)
		 else
		 outputChatBox("#7cc576[BV ERROR] #FFFFFFVocê já está em um serviço ilegal #7cc576digite #FFFFFFo comando #7cc576/demitir #FFFFFFpara sair.", thePlayer, 255,255,255, true)
	 end
end
addEvent("JOB:Hacker", true)
addEventHandler("JOB:Hacker", root, enterJob)

function enterHouse (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     setElementPosition(thePlayer, 2524.016, -1280.919, 1048.289)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 2)
	 end
end
addEventHandler("onMarkerHit", enter, enterHouse)

exitHA = createMarker(2529.677, -1282.108, 1047.289, "cylinder", 1.1, 255, 0, 0, 50)
setElementDimension(exitHA, 0)
setElementInterior(exitHA, 2)

function exit (thePlayer)
	     setElementPosition(thePlayer, 1234.722, 216.539, 19.555)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 0)
end
addEventHandler("onMarkerHit", exitHA, exit)

--2526.51953125, -1289.9096679688, 1049.0935058594

local zone = createMarker(2526.51953125, -1289.9096679688, 1048.0935058594, 'cylinder', 5.0, 255, 0, 0, 0)
setElementDimension(zone, 0)
setElementInterior(zone, 2)

function enterZone(thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     outputChatBox(" ", thePlayer, 255,255,255, true)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
	     outputChatBox("#7cc576[BV - Ilegais] #FFFFFFAguarde. #7cc576Clonando cartões #FFFFFFde créditos, Se liga nos pula.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[BV - Ilegais] #FFFFFFAguarde. #7cc57612 Segundos #FFFFFFpara iniciar.", thePlayer, 255,255,255, true)
		 
		 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Clonando cartões de créditos Aguarde 12 Segundos para iniciar.", 15 )

		 timerExec[thePlayer] = setTimer(clonarC, 12000, 0, thePlayer)
	 end
end
addEventHandler("onMarkerHit", zone, enterZone)

timerMochila = {}

function deletFunction(thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
         if isTimer(timerExec[thePlayer]) then
		     killTimer(timerExec[thePlayer])
		 end
		 if isTimer(timerCard[thePlayer]) then
		     killTimer(timerCard[thePlayer])
			 triggerClientEvent(thePlayer, "cancelDx", root)
		 end
		 if (getElementData(thePlayer, "card:job")) then
		     if (getElementData(thePlayer, "card:job") <= 25) then
	             outputChatBox(" ", thePlayer, 255,255,255, true)
	             outputChatBox(" ", thePlayer, 255,255,255, true)
	             outputChatBox(" ", thePlayer, 255,255,255, true)
	             outputChatBox("#7cc576[BV ERRO] "..getElementData(thePlayer, "card:job").." Cartões #FFFFFFnão é sulficiente para iniciar o serviço.", thePlayer, 255,255,255, true)		
				 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Você não tem cartões suficientes para iniciar o serviço volte o local!", 15 )

                 else
				 if not isTimer(timerExecE[thePlayer]) then	
                     outputChatBox(" ", thePlayer, 255,255,255, true)
	                 outputChatBox("#7cc576[BV - Ilegais] #FFFFFFDaqui a #7cc57630 Segundos #FFFFFFvocê vai começar a receber pedidos de clientes.", thePlayer, 255,255,255, true)
					 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Daqui a 30 Segundos você vai começar a receber pedidos de clientes.", 15 )					 
                     timerExecE[thePlayer] = setTimer(entregar, 30000, 1, thePlayer)	
--                     timerMochila[thePlayer] = setTimer(MochilaDebug, 10000, 1, thePlayer)	 
--					 giveMochila (thePlayer)
                 end					 
			 end
     	 end
	 end
end
addEventHandler("onMarkerLeave", zone, deletFunction)

object = {}--
function giveMochila (thePlayer)
	 if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
         object[thePlayer] = createObject(1548, 0, 0, 0)
         exports["bone_attach"]:attachElementToBone(object[thePlayer],thePlayer,3,0,-0.005,-0.18,0,0,90)
		 timer[thePlayer] = setTimer(function()
			setElementDimension(object[thePlayer], getElementDimension(thePlayer) )
			setElementInterior(object[thePlayer], getElementInterior(thePlayer) )
	end, 100, 0)
end
end

function MochilaDebug (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
		 if isElement(object[thePlayer]) then
	         setElementDimension(object[thePlayer], getElementDimension(thePlayer))
	         setElementInterior(object[thePlayer], getElementInterior(thePlayer))
	     end
	 end
end

function clonarC (thePlayer)
    -- if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     if not (getElementData(thePlayer, "card:job")) then
	         setElementData(thePlayer, "card:job", 0)
	     end
		 if not (tonumber(getElementData(thePlayer, "card:job") or 0) <= 45 ) then
	             outputChatBox("#7cc576[BV ERRO] #FFFFFFSeu inventário está cheio.", thePlayer, 255,255,255, true)
			
triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Seu inventário está cheio de cartões clonado.", 15 )					
				 
				 deletFunction(thePlayer)
             return
         end
             triggerClientEvent(thePlayer, "progressService", root, 10)
             timerCard[thePlayer] = setTimer(function(thePlayer)
             outputChatBox("#7cc576[BV - Ilegais] #7cc576+5 Cartões #FFFFFFclonados adicionado ao inventário.", thePlayer, 255,255,255, true)
			 
			 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "+5 Cartões clonados adicionado ao inventário.", 15 )
			 
			 
		     setElementData(thePlayer, "card:job", (getElementData(thePlayer, "card:job") or 0) + 5  )
         end, 10000, 1, thePlayer)
     end
--end

---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

entregH = {}
timerEntrega = {}

local ramdomLocal = {
     {1445.108, -1283.094, 12.547},
     {1445.333, -1353.482, 12.547},
     {1475.412, -1360.757, 10.883},
     {1556.408, -1421.062, 10.883},
     {518.231, -1758.774, 13.239},
     {662.303, -1788.466, 11.475},
     {713.182, -1802.206, 11.469},
     {771.118, -1810.36, 12.023},
     {879.584, -1820.929, 11.146},
     {344.073, -71.19, 1.431},
     {1289.101, -1271.682, 13.542},
     {1365.348, -1438.438, 12.547},
     {1726.971, -1636.365, 19.217},
     {1766.359, -1646.027, 13.415},
     {1720.225, -1740.778, 12.547},
     {1877.992, -1737.471, 12.346},
     {1993.537, -1760.834, 12.547},
     {2495.254, -1690.479, 13.766},
     {2523.987, -1658.689, 14.494},
     {2515.102, -1681.009, 12.432},
     {1586.75, -1449.847, 12.539},
     {1666.881, -1510.009, 12.547},
     {1649.054, -1578.602, 12.53},
     {1733.029, -1583.219, 13.161},	 
     {254.499, -158.343, 0.57},
     {254.683, -54.725, 0.57},
     {1025.801, -1771.016, 12.547},
     {969.542, -1811.853, 12.9},
     {866.582, -1798.239, 12.812}, 
     {763.007, -1792.401, 12.023},
     {685.635, -1774.183, 12.633},
     {1470.714, -1177.479, 22.922},
}

function entregar (thePlayer)
	if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
		randomL[thePlayer] = math.random(#ramdomLocal)
		if (getElementData(thePlayer, "card:job") >= 1) and not isElement(entregH[thePlayer]) then
		     execFunction (thePlayer)
	     	 entregH[thePlayer] = createMarker(ramdomLocal[randomL[thePlayer]][1], ramdomLocal[randomL[thePlayer]][2], ramdomLocal[randomL[thePlayer]][3], "cylinder", 1.1, 255, 0, 0, 50)
			 exports.Script_futeis:setGPS(thePlayer, "Coordenada", ramdomLocal[randomL[thePlayer]][1], ramdomLocal[randomL[thePlayer]][2], ramdomLocal[randomL[thePlayer]][3])
	     	 setElementData(entregH[thePlayer], "owner", getElementData(thePlayer, "char:id"))
		     addEventHandler("onMarkerHit", entregH[thePlayer], finish)
	         outputChatBox(" ", thePlayer, 255,255,255, true)
		     outputChatBox(" ", thePlayer, 255,255,255, true)
		     outputChatBox("#7cc576[BV - Ilegais] #FFFFFFSiga a #7cc576Seta #FFFFFFem cima do personagem.", thePlayer, 255,255,255, true)	 
			 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Siga a Seta encima do personagem para entregar os cartões", 15 )
		     outputChatBox("#7cc576[BV - Ilegais] #FFFFFFpara entregar os cartões.", thePlayer, 255,255,255, true)
			 
				else if (getElementData(thePlayer, "card:job") == 0) then
			
					exports.Script_futeis:setGPS(thePlayer, "Coordenada", 1243.253, 216.985, 22.056)
					outputChatBox("#7cc576[BV - Ilegais] #FFFFFFSeus cartões clonados acabaram.", thePlayer, 255,255,255, true) 
					triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Seus cartões clonados acabaram, vá até o barraco para clonar mais para continuar", 15 )			 
					outputChatBox("#7cc576[BV - Ilegais] #FFFFFFvá até o barraco para clonar mais para continuar.", thePlayer, 255,255,255, true)
					if isElement(object[thePlayer]) then
					destroyElement(object[thePlayer])
				end
			end
		end
	end
end
--addCommandHandler("aa", entregar)

cards = {}

function finish (thePlayer)
     vehicle = getPedOccupiedVehicle (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     if (getElementData(source, "owner") == getElementData(thePlayer, "char:id")) then
		 if (vehicle) then outputChatBox("#7cc576[BV ERRO] #FFFFFFSaia do veiculo para fazer a entrega.", thePlayer, 255,255,255, true) return end
	         if (getElementData(thePlayer, "card:job") >= 5) then
		         timerEntrega[thePlayer] = setTimer(entregar, 3000, 1, thePlayer)
			     cards[thePlayer] = math.random(0, 3)
			     setElementData(thePlayer, "card:job", (getElementData(thePlayer, "card:job") or 0) - cards[thePlayer]  )
		    	 outputChatBox("#7cc576[BV - Ilegais] #FFFFFFO cliente comprou #7cc576"..cards[thePlayer].." Cartões clonado #FFFFFFTotal: #7cc576D$"..(cards[thePlayer] * 400)..".", thePlayer, 255,255,255, true)

triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "O cliente comprou "..cards[thePlayer].." Cartões clonado Total: D$"..(cards[thePlayer] * 400).." ", 15 )


		    	 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + cards[thePlayer] * 400)
				 deletM(thePlayer)
				 timerEntrega[thePlayer] = setTimer(entregar, 3000, 1, thePlayer)
		    	 else
				 if (getElementData(thePlayer, "card:job") > 0) then
				     cards[thePlayer] = math.random(getElementData(thePlayer, "card:job"))
			         setElementData(thePlayer, "card:job", (getElementData(thePlayer, "card:job") or 0) - cards[thePlayer]  )
		    	     outputChatBox("#7cc576[BV - Ilegais] #FFFFFFO cliente comprou #7cc576"..cards[thePlayer].." Cartões clonado #FFFFFFTotal: #7cc576D$"..(cards[thePlayer] * 400)..".", thePlayer, 255,255,255, true)

triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "O cliente comprou "..cards[thePlayer].." Cartões clonado Total: D$"..(cards[thePlayer] * 400)..".", 15 )


		    	     setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + cards[thePlayer]*400)
                     deletM(thePlayer)
				     timerEntrega[thePlayer] = setTimer(entregar, 3000, 1, thePlayer)
		 			 else
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
					 outputChatBox(" ", thePlayer, 255,255,255, true)
		             outputChatBox("#7cc576[BV - Ilegais] #FFFFFFSeus cartões clonados acabaram.", thePlayer, 255,255,255, true)
		             outputChatBox("#7cc576[BV - Ilegais] #FFFFFFvá até o barraco para clonar mais para continuar.", thePlayer, 255,255,255, true)
					 
					 
					 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"hacker", "Seus cartões clonados acabaram vá até o barraco para clonar mais para continuar", 15 )



					 exports.Script_futeis:setGPS(thePlayer, "Coordenada", 1243.253, 216.985, 22.056)
					 if isElement(object[thePlayer]) then
					     destroyElement(object[thePlayer])
					 end
			     end
			 end
		 end
	 end
end

function deletM(thePlayer)
     if isElement(entregH[thePlayer]) then
	     destroyElement(entregH[thePlayer])
	 end
end

--------------------------------------------------------------------------
--[[
timerEXE = {}

function execFunction (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     if not isTimer(timerEXE[thePlayer]) then
	     timerEXE[thePlayer] = math.random(10, 20)
		 setTimer(startFunc, timerEXE[thePlayer]*60000, 1, thePlayer)
		 		 setTimer(startFunc, 30000, 1, thePlayer)
		 end
	 end
end
local ramdomCaixa = {
    {1662.925, -1171.921, 23.578},
    {1971.295, -1776.579, 13.147},
    {2404.369, -1239.312, 23.413},
    {559.675, -1571.05, 15.68},
}

randomC = {}]]--
--[[
zoneC   = {}

function startFunc (thePlayer)
randomC[thePlayer] = math.random(#ramdomCaixa)
if isElement(zoneC[thePlayer]) then return end
  if isTimer(timerEntrega[thePlayer]) then setTimer(startFunc, 10000, 1, thePlayer) killTimer(timerEntrega[thePlayer]) return end
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     deletM(thePlayer)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 if isTimer(timerEntrega[thePlayer])then killTimer(timerEntrega[thePlayer]) end
         outputChatBox("#7cc576[ILEGAIS] #FFFFFFUma empresa de valores clandestina contratou seu serviço.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFpara que você bug o sistema para lucrar com assistencia.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[MISSÂO] #FFFFFFVá até o caixa selecionado para começar.", thePlayer, 255,255,255, true)
		if isElement(zoneC[thePlayer]) then
		     destroyElement(zoneC[thePlayer])
		 end
		setElementData(zoneC[thePlayer], "zoneC", getElementData(thePlayer, "char:id"))
		 addEventHandler("onColShapeHit", zoneC[thePlayer], enterZoneC)
		 addEventHandler("onColShapeLeave", zoneC[thePlayer], exitZoneC)
	 end
end

function enterZoneC (thePlayer)
     if (getElementData(source, "zoneC") == getElementData(thePlayer, "char:id")) then 
	     setElementData(thePlayer, "zoneWith", true)
	 end
end


function exitZoneC (thePlayer)
     if (getElementData(source, "zoneC") == getElementData(thePlayer, "char:id")) then 
	 --execFunction (thePlayer)
	     if not (getElementData(thePlayer, "zoneWith")) then if isElement(zoneC[thePlayer]) then setTimer(destroyElement, 1500, 1, zoneC[thePlayer]) end timerEntrega[thePlayer] = setTimer(entregar, 5000, 1, thePlayer) else
		     if isElement(zoneC[thePlayer]) then
	  		     outputChatBox(" ", thePlayer, 255,255,255, true)
	  		     outputChatBox("#7cc576[sanMTA ERRO] #FFFFFFSaqueamento cancelado: #7cc576(MOTIVO: #FFFFFFSaiu do local#7cc576).", thePlayer, 255,255,255, true)
				 setElementData(thePlayer, "zoneWith", false)
				 setElementData(thePlayer, "zoneWith", nil)
				 timerEntrega[thePlayer] = setTimer(entregar, 5000, 1, thePlayer)
				 setTimer(destroyElement, 1500, 1, zoneC[thePlayer])
			 end
		 end
	 end
end


addEventHandler("onPlayerQuit", root,
function ()
     if (zoneC[source]) then
	     destroyElement(zoneC[source])
	 end
     if (entregH[source]) then
	     destroyElement(entregH[source])
	 end
	 if isElement(object[source]) then
		 destroyElement(object[source])
	 end
end)

]]--