
timerLavagem = {}
timerExec1   = {}
timerExec2   = {}
inicia       = {}
enter = createColCuboid(2539.38989, -1297.29053, 1043.12500, 27.086669921875, 7.301513671875, 20)

enterL = createMarker(-2521.541, 2294.94, 3.984, "cylinder", 1.1, 255, 0, 0, 50)
blipM = createBlipAttachedTo ( enterL, 32 )

function enterLocal (thePlayer)
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then outputChatBox("#7cc576[ILEGAIS] #FFFFFFSaia do veiculo para entrar no local.", thePlayer, 255,255,255, true) return end
	     setElementPosition(thePlayer, 2574.873, -1293.017, 1043.125)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 2)
end
addEventHandler("onMarkerHit", enterL, enterLocal)

exitH = createMarker(2576.564, -1289.819, 1043.125, "cylinder", 1.1, 255, 0, 0, 50)
setElementDimension(exitH, 0)
setElementInterior(exitH, 2)

function exit (thePlayer)
	     setElementPosition(thePlayer, -2526.181, 2291.754, 3.984)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 0)
end
addEventHandler("onMarkerHit", exitH, exit)

function enterZone(thePlayer)
    if getElementDimension(thePlayer) ~= 0 then return end
	if (tonumber(getElementData(thePlayer,"char:moneysujo") or 0) > 100 ) then	
		 outputChatBox(" ", thePlayer, 255,255,255, true)
         outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[INFO]: #FFFFFFAguarde no #7cc576local #FFFFFFpara iniciar a lavagem.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[INFO]: #FFFFFFIniciando em #7cc57612 Segundos.", thePlayer, 255,255,255, true)
		 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"DinheiroSujo", "Aguarde no local para iniciar a lavagem, Iniciando em 12 Segundos.", 15 )
		 setElementData(thePlayer, "lavagenTime", true)
		 timerLavagem[thePlayer] = setTimer(generateLavagem, 12000, 0, thePlayer)
	else
		triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"DinheiroSujo", "Você não tem dinheiro sujo! Vaza daqui!", 15 )
	end
end
addEventHandler("onColShapeHit", enter, enterZone)

function generateLavagem (thePlayer)
	 if not (tonumber(getElementData(thePlayer,"char:moneysujo") or 0) > 100 ) then
	     outputChatBox(" ", thePlayer, 255,255,255, true)
	     setElementData(thePlayer, "char:moneysujo", 0 )
		 outputChatBox("#7cc576[Lavagem Error] #FFFFFFVocê não possui #7cc576Dinheiro Sujo", thePlayer, 255,255,255, true)
		 triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"DinheiroSujo", "Você não possui mais dinheiro sujo, vaza daqui!", 15 )
		 if isTimer(timerLavagem[thePlayer]) then
		     killTimer(timerLavagem[thePlayer])
		 end
		 if isTimer(timerExec1[thePlayer]) then
		     killTimer(timerExec1[thePlayer])
		 end
		 if isTimer(timerExec2[thePlayer]) then
		     killTimer(timerExec2[thePlayer])
		 end
	 else
	 triggerClientEvent(thePlayer, "progressService", thePlayer, 10)
	 timerExec1[thePlayer] = setTimer(function()
		local moneysujo = (getElementData(thePlayer, "char:moneysujo")/2)
		setElementData(thePlayer, "char:moneysujo", getElementData(thePlayer, "char:moneysujo") - (math.floor(moneysujo) ) )
		setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") + (math.floor(moneysujo/2))  )
		outputChatBox(" ", thePlayer, 255,255,255, true)
		outputChatBox("#7cc576[Lavagem] #FFFFFFFoi enviado: #7cc576R$: "..math.floor(moneysujo).."#FFFFFF de dinheiro sujo", thePlayer, 255,255,255, true)
		outputChatBox("#7cc576[Lavagem] #FFFFFFPara a lavagem", thePlayer, 255,255,255, true)
		triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"DinheiroSujo", "Foi enviado: R$: "..math.floor(moneysujo).." de dinheiro Sujo para a lavagem", 15 )
	 end, 5000 ,1, thePlayer)
	 timerExec2[thePlayer] = setTimer(function()
		local moneysujo = (getElementData(thePlayer, "char:moneysujo")/2.5)
		setElementData(thePlayer, "char:moneysujo", getElementData(thePlayer, "char:moneysujo") - (math.floor(moneysujo) ) )
		setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") + (math.floor(moneysujo/2))  )
		outputChatBox(" ", thePlayer, 255,255,255, true)
		outputChatBox("#7cc576[Lavagem] #FFFFFFSeu Dinheiro sujo foi transformado em: #7cc576R$: "..(math.floor(moneysujo/2)) .." #FFFFFFde dinheiro comum", thePlayer, 255,255,255, true)
		triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"DinheiroSujo", "O dinheiro sujo foi transformado em R$: "..(math.floor(moneysujo/2)) .." de dinheiro comum", 15 )
  	     end, 10000 ,1, thePlayer)
     end
end

function exitZone(thePlayer)
		 triggerClientEvent(thePlayer, "cancelDx", root)
		 if isTimer(timerLavagem[thePlayer]) then
		     killTimer(timerLavagem[thePlayer])
			 outputChatBox("#7cc576[INFO]: #FFFFFFVocê saiu da área de lavagem de dinheiro.", thePlayer, 255,255,255, true)
		 end
		 if isTimer(timerExec1[thePlayer]) then
		     killTimer(timerExec1[thePlayer])
		 end
		 if isTimer(timerExec2[thePlayer]) then
		     killTimer(timerExec2[thePlayer])
		 end
end
addEventHandler("onColShapeLeave", enter, exitZone)
