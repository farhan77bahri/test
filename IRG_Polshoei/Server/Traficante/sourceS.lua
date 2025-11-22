--[[
local pedJob = createPed(21, 2355.648, -646.771, 128.055)
setElementRotation(pedJob, 0, 0, 180)
setElementData(pedJob, "JOB:Ped", true)
setElementData(pedJob, "Ped:Name", "Abinóia")
setElementFrozen(pedJob, true)
jobBlip = createBlipAttachedTo ( pedJob, 60 )
setElementData(jobBlip, "blip >> name", "Compra de Drogas")
enterColD = createColSphere (2355.648, -646.771, 128.055, 3)

function enterColC (thePlayer)
	 if source == enterColD then	
		 if (getElementData(thePlayer, "ILEGAIS:Job") ~= 1) then
		         outputChatBox("#7cc576[BTCMTA ERROR] #FFFFFFApenas para traficante de droga.", thePlayer, 255,255,255, true)
		     return
		 end
     	 if (getElementData(thePlayer, "ILEGAIS:Job") == 1) then
	     	 outputChatBox(" ", thePlayer, 255,255,255, true)
	    	 outputChatBox("#7cc576[SHOP ILEGAL] #FFFFFFDigite o comando #7cc576/comprar #FFFFFFquantidade da droga.", thePlayer, 255,255,255, true)
	    	 outputChatBox("#7cc576[EXEMPLO] #7cc576/comprar #FFFFFF2.", thePlayer, 255,255,255, true)
		 end
     end
end
addEventHandler("onColShapeHit", enterColD, enterColC)

function exitColC (thePlayer)
	 if (getElementData(thePlayer, "ILEGAIS:Job") ~= 1) then
	     return
	 end
         if exports['btc_items']:hasItemS(thePlayer, 14) or exports['btc_items']:hasItemS(thePlayer, 15) or exports['btc_items']:hasItemS(thePlayer, 144) then 	
		     triggerClientEvent(thePlayer, "execPed", root)
			 return
		 end
end
addEventHandler("onColShapeLeave", enterColD, exitColC)

idS = {}
myD = {}
numberQ = {}

addEvent('startProgress', true)
addEventHandler('startProgress', root, function(thePlayer, numberT)
     if numberT then
		 triggerClientEvent(thePlayer, "progressService", root, numberT)
     else
		 triggerClientEvent(thePlayer, "progressService", root, 5)
     end	 
end)

function execCommand (thePlayer, commandName, numberDQ)
idS[thePlayer] = math.random(1, 3)
numberQ[thePlayer] = tonumber(numberDQ)
     if numberQ[thePlayer] then
		 myD[thePlayer] =  numberQ[thePlayer] * 200
		 if not isElementWithinColShape (thePlayer, enterColD ) then
		     return
		 end
		 if (getElementData(thePlayer, "ILEGAIS:Job") ~= 1) then
		     return
		 end
		 if not (getElementData(thePlayer, "char:money") >= myD[thePlayer]) then
		        outputChatBox("#7cc576[BTCMTA ERROR] #FFFFFFDinheiro insulficiente para esta ação.", thePlayer, 255,255,255, true)
		     return
		 else
		     setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - tonumber(myD[thePlayer]))
			 if (idS[thePlayer] == 1) then
			     exports['btc_items']:giveItem(thePlayer, 14, 1, numberQ[thePlayer], 1, false)
		    	 outputChatBox("#7cc576[SHOP ILEGAL] #FFFFFFVocê comprou #7cc576"..numberQ[thePlayer].." #FFFFFFCocaina Por #7cc576R$"..myD[thePlayer]..".", thePlayer, 255,255,255, true)
				 idS[thePlayer] = nil
				 myD[thePlayer] = nil
				 numberQ[thePlayer] = nil
				 return
			 end
			 if (idS[thePlayer] == 2) then
			     exports['btc_items']:giveItem(thePlayer, 15, 1, numberQ[thePlayer], 1, false)
		    	 outputChatBox("#7cc576[SHOP ILEGAL] #FFFFFFVocê comprou #7cc576"..numberQ[thePlayer].." #FFFFFFHeroina Por #7cc576R$"..myD[thePlayer]..".", thePlayer, 255,255,255, true)
				 idS[thePlayer] = nil
				 myD[thePlayer] = nil
				 numberQ[thePlayer] = nil
				 return
			 end
			 if (idS[thePlayer] == 3) then
			     exports['btc_items']:giveItem(thePlayer, 144, 1, numberQ[thePlayer], 1, false)
		    	 outputChatBox("#7cc576[SHOP ILEGAL] #FFFFFFVocê comprou #7cc576"..numberQ[thePlayer].." #FFFFFFBaseado Por #7cc576R$"..myD[thePlayer]..".", thePlayer, 255,255,255, true)
				 idS[thePlayer] = nil
				 myD[thePlayer] = nil
				 numberQ[thePlayer] = nil
				 return
			 end
		 end
	 end
end
addCommandHandler("comprar", execCommand)

addEvent('JOB:Traficante', true)
addEventHandler('JOB:Traficante', root, function(thePlayer)
     if not (getElementData(thePlayer, "JOB")) then
		 setElementData(thePlayer, "JOB", true)
		 setElementData(thePlayer, "ILEGAIS:Job", 1)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFVá até a #7cc576Abinóia (Boneco Amarelo) #FFFFFFe compre drogas.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFApós reevenda para os #7cc576NPC #FFFFFFno icone de #7cc576Boneco Verde (Clientes).", thePlayer, 255,255,255, true)
		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", 2355.957, -649.65, 128.055)
		 else
		 outputChatBox("#7cc576[BTC ERROR] #FFFFFFVocê já está em um serviço ilegal #7cc576digite #FFFFFFo comando #7cc576/demitir #FFFFFFpara sair.", thePlayer, 255,255,255, true)
	 end
end)

addEvent('btcMTA->#giveMoneySujo', true)
addEventHandler('btcMTA->#giveMoneySujo', root, function(thePlayer)
    if exports['btc_items']:hasItemS(thePlayer, 14) then 	
	  	 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 14, false)
		 triggerClientEvent('btc-drogaVendida', thePlayer, thePlayer)
		 local moneysujo = math.random(100, 500)
		 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + moneysujo  )
		 outputChatBox("#7cc576[DROGAS] #FFFFFFDroga vendida com sucesso. Você recebeu #7cc576R$"..moneysujo.." #FFFFFFde dinheiro sujo", thePlayer, 255,255,255, true)
		 return
	 end	
	 if exports['btc_items']:hasItemS(thePlayer, 15) then 	
		 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 15, false)
		 triggerClientEvent('btc-drogaVendida', thePlayer, thePlayer)
		 local moneysujo = math.random(300, 400)
		 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + moneysujo  )
		 outputChatBox("#7cc576[DROGAS] #FFFFFFDroga vendida com sucesso. Você recebeu #7cc576R$"..moneysujo.." #FFFFFFde dinheiro sujo", thePlayer, 255,255,255, true)
	 	 return
	 end	
	 if exports['btc_items']:hasItemS(thePlayer, 144) then 	
		 triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, thePlayer, 144, false)
		 local moneysujo = math.random(200, 300)
		 triggerClientEvent('btc-drogaVendida', thePlayer, thePlayer)
		 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + moneysujo  )
		 outputChatBox("#7cc576[DROGAS] #FFFFFFDroga vendida com sucesso. Você recebeu #7cc576R$"..moneysujo.." #FFFFFFde dinheiro sujo", thePlayer, 255,255,255, true)
		 return
	 end
	 triggerClientEvent('btc-drogaVendidaErro', thePlayer, thePlayer)
	 outputChatBox("#7cc576[DROGAS] #FFFFFFSuas drogas acabaram, vá até o local indicado para comprar mais.", thePlayer, 255,255,255, true)
	 exports.Script_futeis:setGPS(thePlayer, "Coordenada", 2355.957, -649.65, 128.055)
end)
--]]