
--[[local zone = createColCuboid(2523.69287, -1301.59436, 1047.28906, 4.85546875, 15.223266601563, 6)

function enterZone( theElement, matchingDimension )
     if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
	     if ( theElement == localPlayer ) then
	         outputChatBox(" ", 255,255,255, true)
	         outputChatBox(" ", 255,255,255, true)
	         outputChatBox(" ", 255,255,255, true)
	         outputChatBox("#7cc576[ILEGAIS] #FFFFFFAguarde. #7cc576Clonando cartões #FFFFFFde créditos.", 255,255,255, true)
		     outputChatBox("#7cc576[ILEGAIS] #FFFFFFAguarde. #7cc57612 Segundos #FFFFFFpara iniciar.", 255,255,255, true)
			 
			 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Clonando cartões de créditos, Aguarde 12 Segundos para iniciar", 15 )
			 
			 
     		 timerExec = setTimer(clonarC, 12000, 0, localPlayer)
		 end
	 end
end
addEventHandler("onClientColShapeHit", zone, enterZone)

function exitT ( theElement, matchingDimension )
     if ( theElement == localPlayer ) then
	     if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
	         deletFunction()
		 end
	 end
end
addEventHandler("onClientColShapeLeave", zone, exitT)

function deletFunction()
     if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
         if isTimer(timerExec) then
		     killTimer(timerExec)
		 end
		 if isTimer(timerCard) then
		     killTimer(timerCard)
			  triggerClientEvent(localPlayer, "cancelDx", root)
			  triggerServerEvent("cDx", root, localPlayer)
		 end
		 if (getElementData(localPlayer, "card:job")) then
		     if (getElementData(localPlayer, "card:job") <= 25) then
	             outputChatBox(" ", 255,255,255, true)
	             outputChatBox(" ", 255,255,255, true)
	             outputChatBox(" ", 255,255,255, true)
	             outputChatBox("#7cc576[BTCMTA ERRO] "..getElementData(localPlayer, "card:job").." Cartões #FFFFFFnão é sulficiente para iniciar o serviço.", 255,255,255, true)		

triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", ""..getElementData(localPlayer, "card:job").." Cartões não é sulficiente para iniciar o serviço.", 15 )
                 else
				 
				 if not isTimer(timerExecE) then	
                     outputChatBox(" ", 255,255,255, true)
	                 outputChatBox("#7cc576[BTCMTA ILEGAIS] #FFFFFFDaqui a #7cc57630 Segundos #FFFFFFvocê vai começar a receber pedidos de clientes.", 255,255,255, true)
					 
					 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Daqui a 30 Segundos você vai começar a receber pedidos de clientes", 15 )
					 
					 
                     timerExecE = setTimer(entregar, 30000, 1, localPlayer)	
					 
					 triggerServerEvent("mochilahackerON", localPlayer, localPlayer)
					 
--[[					 

                     timerMochila = setTimer(MochilaDebug, 1000, 0)	
                     object = createObject(1548, 0, 0, 0)
                     exports["bone_attach"]:attachElementToBone(object,localPlayer,3,0,-0.005,-0.18,0,0,90)		]]--			 
                 end					 
			 end
     	 end
	 end
end


function MochilaDebug ()
     if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
		 if isElement(object) then
	         setElementDimension(object, getElementDimension(localPlayer))
	         setElementInterior(object, getElementInterior(localPlayer))
	     end
	 end
end

function clonarC ()
     if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
	     if not (getElementData(localPlayer, "card:job")) then
	         setElementData(localPlayer, "card:job", 0)
	     end
		 if not (tonumber(getElementData(localPlayer, "card:job") or 0) <= 45 ) then
	             outputChatBox("#7cc576[BTCMTA ERRO] #FFFFFFSeu inventário está cheio.", 255,255,255, true)
				 
				 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Seu inventário está cheio", 15 )
				 
				 
				 deletFunction()
             return
         end
			 triggerServerEvent("startLoad", root, localPlayer, 10)
             timerCard = setTimer(function()
             outputChatBox("#7cc576[ILEGAIS] #7cc576+5 Cartões #FFFFFFclonados adicionado ao inventário.", 255,255,255, true)
			 
			  triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "+5 Cartões clonados adicionado ao inventário", 15 )
			  
			  
		     setElementData(localPlayer, "card:job", (getElementData(localPlayer, "card:job") or 0) + 5  )
         end, 10000, 1, localPlayer)
     end
end

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
     {1309.931, -1368.163, 12.545},
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

function entregar ()
randomL = math.random(#ramdomLocal)
if isElement(zoneC) then return end
	 if (getElementData(localPlayer, "ILEGAIS:Job") == 5) then
		 if (getElementData(localPlayer, "card:job") == 0) then
			 exports.Script_futeis:setGPS(localPlayer, "Coordenada", 1243.253, 216.985, 22.056)
		             outputChatBox("#7cc576[ILEGAIS] #FFFFFFSeus cartões clonados acabaram.", 255,255,255, true)	 
		             outputChatBox("#7cc576[ILEGAIS] #FFFFFFvá até o barraco para clonar mais para continuar.", 255,255,255, true)
					 
					 
					  triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Seus cartões clonados acabaram, vá até o barraco para clonar mais para continuar", 15 )
					  
					  
				triggerServerEvent("mochilahackerOFF", localPlayer, localPlayer)
				-- if isElement(object) then
				--	 destroyElement(object)
				-- end
			 return
		 end
	     if not isElement(entregH) then
	     	 entregH = createMarker(ramdomLocal[randomL][1], ramdomLocal[randomL][2], ramdomLocal[randomL][3], "cylinder", 1.1, 255, 0, 0, 50)
			 triggerServerEvent("setaInfor", root, localPlayer, ramdomLocal[randomL][1], ramdomLocal[randomL][2], ramdomLocal[randomL][3])
	     	 setElementData(entregH, "owner", getElementData(localPlayer, "char:id"))
		     addEventHandler("onClientMarkerHit", entregH, finish)
	         outputChatBox(" ", 255,255,255, true)
		     outputChatBox(" ", 255,255,255, true)
		     outputChatBox("#7cc576[ILEGAIS] #FFFFFFSiga a #7cc576Seta #FFFFFFencima do personagem.", 255,255,255, true)
		     outputChatBox("#7cc576[ILEGAIS] #FFFFFFpara entregar os cartões.", 255,255,255, true)
			 
			--triggerServerEvent("mochilahackerON", localPlayer, localPlayer)
			 
			 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Siga a Seta encima do personagem, para entregar os cartões", 15 )
			 
			 
	     end
	 end
end

cards = {}

function finish (hitPlayer)
     vehicle = getPedOccupiedVehicle (hitPlayer)
     if (getElementData(hitPlayer, "ILEGAIS:Job") == 5) then
	     if (getElementData(source, "owner") == getElementData(hitPlayer, "char:id")) then
		 if (vehicle) then outputChatBox("#7cc576[BTCMTA ERRO] #FFFFFFSaia do veiculo para fazer a entrega.", 255,255,255, true) return end
	         if (getElementData(hitPlayer, "card:job") >= 5) then
				 timerEntrega = setTimer(entregar, 3000, 1, hitPlayer)
				 cards = math.random(getElementData(hitPlayer, "card:job"))
				 cards2 = math.random(300, 900)
			     setElementData(hitPlayer, "card:job", (getElementData(hitPlayer, "card:job") or 0) - cards  )
		    	 outputChatBox("#7cc576[ILEGAIS] #FFFFFFO cliente comprou #7cc576"..cards.." Cartões clonado #FFFFFFTotal: #7cc576D$"..(cards2)..".", 255,255,255, true)
                 setElementFrozen(hitPlayer, true)
				 setTimer(setElementFrozen, 4000, 1, hitPlayer, false)
				 triggerServerEvent("Anim", root, hitPlayer, "GANGS", "Invite_Yes", 4000)
		    	 setElementData(hitPlayer, "char:moneysujo", (getElementData(hitPlayer, "char:moneysujo") or 0) + cards2 )
				 deletM()
				 timerEntrega = setTimer(entregar, 3000, 1, hitPlayer)
		    	 else
				 if (getElementData(hitPlayer, "card:job") > 0) then
				     cards = math.random(getElementData(hitPlayer, "card:job"))
			         setElementData(hitPlayer, "card:job", (getElementData(hitPlayer, "card:job") or 0) - cards  )
		    	     outputChatBox("#7cc576[ILEGAIS] #FFFFFFO cliente comprou #7cc576"..cards.." Cartões clonado #FFFFFFTotal: #7cc576D$"..(cards2)..".", 255,255,255, true)
					 
					 
					 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "O cliente comprou "..cards.." Cartões clonado, Total: D$"..(cards2)..".", 15 )
					 
					 
					 
					 
					 
                     setElementFrozen(hitPlayer, true)
					 setTimer(setElementFrozen, 6000, 1, hitPlayer, false)
					 triggerServerEvent("Anim", root, hitPlayer, "GANGS", "Invite_Yes", 5000)
		    	     setElementData(hitPlayer, "char:moneysujo", (getElementData(hitPlayer, "char:moneysujo") or 0) + cards2)
                     deletM()
				     timerEntrega = setTimer(entregar, 3000, 1, hitPlayer)
		 			 else
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
					 outputChatBox(" ", 255,255,255, true)
		             outputChatBox("#7cc576[ILEGAIS] #FFFFFFSeus cartões clonados acabaram.", 255,255,255, true)
		             outputChatBox("#7cc576[ILEGAIS] #FFFFFFvá até o barraco para clonar mais para continuar.", 255,255,255, true)
					 
					 
					 triggerEvent("JoinQuitGtaV:notifications", localPlayer,"hacker", "Seus cartões clonados acabaram, vá até o barraco para clonar mais para continuar", 15 )
					 
					 
					 triggerServerEvent("setaInfor", hitPlayer, hitPlayer, 1243.253, 216.985, 22.056)
					 triggerServerEvent("mochilahackerOFF", localPlayer, localPlayer)
					 --if isElement(object) then
					  --   destroyElement(object)
					 --end
			     end
			 end
		 end
	 end
end

function deletM()
     if isElement(entregH) then
	     destroyElement(entregH)
	 end
	-- triggerServerEvent("mochilahackerOFF", localPlayer, localPlayer)
    -- if isElement(object) then
	 --    destroyElement(object)
	 --end
end
addCommandHandler("demitir", deletM)
--]]