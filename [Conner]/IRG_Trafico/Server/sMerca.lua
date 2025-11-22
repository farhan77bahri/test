db = dbConnect("sqlite", "database.db") or 0

local trigo = createBlip(-374.889, -1442.811, 25.727, 37)
setElementData(trigo ,"blip >> name", "Campo de Trigo")

local laranja = createBlip(-2069.132, -2533.326, 36.427, 37)
setElementData(laranja ,"blip >> name", "Campo de Laranja")

local madeira = createBlip(-2042.498, -2383.607, 38.427, 37)
setElementData(madeira ,"blip >> name", "Campo de Madeira")

local D1zone = createColCuboid(2307.53467, 2775.40674, 8.62660, 9.524658203125, 7.590576171875, 9.9)
local D2zone = createColCuboid(2307.54932, 2755.75439, 9.12662, 9.77587890625, 10.417236328125, 9.9)
local D3zone = createColCuboid(2307.89014, 2738.33667, 8.82667, 9.233642578125, 11.0830078125, 10.500014686584)

local Value = {}
local Merca = {}
local rotLZ = {}
local rotLS = {}
local timLR = {}
local timerContL = {}
local contagemLV = {}
local barTimeL = {}
local barTimeT = {}
local barTimeM = {}
local contagemTimer = {}








function removeBindKeyMaco (thePlayer)
     unbindKey(thePlayer, "e", "down", startTheFunctionMaco)
	 setElementData(thePlayer, "enterZone:Maconha", false)
end



function enterDZL (thePlayer)
if not thePlayer then return end
     if getElementType(thePlayer) == "player" then 
    local theVehicle = getPedOccupiedVehicle ( thePlayer )
	 if theVehicle then
		if getElementType (theVehicle) == "vehicle" then

			--local driver = getVehicleController ( theVehicle )
			controller = getVehicleController ( theVehicle ) 
			if controller == thePlayer then 


		 local prTeam = getTeamFromName ( "PR" )
         local prCount = countPlayersInTeam ( prTeam )
         --    if prCount >= 6 then
		--	     exports.san_hud:dm("Este serviço só pode ser executado com 6 Policias Rodoviário.",thePlayer, 255, 255, 255)
		 --    return
		-- end

		local count = getPlayerCount()
		if count <= 1 then
		triggerClientEvent(thePlayer,"JoinQuitGtaV:sendClientMessage", thePlayer,"#FF0000TRAFICO #FFFFFFCANCELADO DEVIDO A POUCO JOGADOR NA CIDADE MINIMO 1 JOGADORES!", 255, 255, 255, pos, 20 )
		return
		end



	 if not exports['san_items']:hasItemS(theVehicle, 235) then
	     exports.san_hud:dm("Esta vaga é reservada apenas para Laranja.",thePlayer, 255, 255, 255)
	     return
	 end
	 rotLZ[thePlayer] = getElementRotation(theVehicle)
	     if (rotLZ[thePlayer]) then
		     rotLS[thePlayer] = math.floor(rotLZ[thePlayer])
			-- if (rotLS[thePlayer] == 359 or rotLS[thePlayer] == 358 or rotLS[thePlayer]== 360 or rotLS[thePlayer] == 357 or rotLS[thePlayer] == 351) then
			 --    exports.san_hud:dm("O veiculo precisa estar estacionado de ré",thePlayer, 255, 255, 255)
			--	 return
			-- else
			         if exports['san_items']:hasItemS(theVehicle, 235) then
					     setElementData(thePlayer, "venderDrogas", true)
				         exports.san_hud:dm("Descarregamento iniciando, Aguarda um momento.",thePlayer, 255, 255, 255)
						 setElementFrozen(theVehicle, true)
						 contagemLV[thePlayer] = 0
						 setElementData(theVehicle, "vehFrozen", true)
						 setElementData(thePlayer, "infoContagem", true)
						 contagemDL (thePlayer, theVehicle)
				     else
					 end
				 end
				end
			 end
		 end
	 end
end
addEventHandler("onColShapeHit", D1zone, enterDZL)

function exitTruckHero (player, seat, jacked)
     if (getElementData(player, "venderDrogas") == true) then
	     cancelEvent()
		 exports.san_hud:dm("Aguarde a venda acabar para se retirar.",player, 255, 255, 255)
	 end
end
addEventHandler("onVehicleStartExit", getRootElement(), exitTruckHero)

function contagemDL (thePlayer, theTruck)
if not thePlayer then return end
     if exports['san_items']:hasItemS(theTruck, 235) then 
	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 235, false)
		 contagemLV[thePlayer] = contagemLV[thePlayer] + 1
		 contagemTimer[thePlayer] = setTimer(contagemDL, 1000, 1,thePlayer, theTruck)
         else
		 setElementData(thePlayer, "infoContagem", false)
         setTimer(contagemVehicleL, 2000, 1, thePlayer, theTruck)
		 barTimeL[thePlayer] = contagemLV[thePlayer] * 1
		 if barTimeL[thePlayer] > 1 then
		 setTimer(triggerClientEvent, 2000, 1, thePlayer, "progressService", thePlayer, barTimeL[thePlayer] - 2)
		 else
		 setTimer(triggerClientEvent, 2000, 1, thePlayer, "progressService", thePlayer, barTimeL[thePlayer])
		 end
		 setTimer( outputDebugString, 2000, 1, "O valor de Carga é de "..contagemLV[thePlayer])
		 setTimer(finishServiceL, contagemLV[thePlayer] * 1000, 1, thePlayer, theTruck) 
		 if isTimer(contagemTimer[thePlayer]) then
		     killTimer(contagemTimer[thePlayer])
		 end
	 end
end

function contagemVehicleL (thePlayer, theTruck)
if not thePlayer then return end
     if exports['san_items']:hasItemS(theTruck, 235) then 
	 exports['san_items']:giveItem(theTruck, 235, 1, contagemLV[thePlayer], 0, false)
         timerContL[thePlayer] = setTimer(function (thePlayer, theTruck)
		 setElementFrozen(theTruck, true)
         triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 235, false)
		 contagemLV[thePlayer] = contagemLV[thePlayer] + 1
		 end, contagemLV[thePlayer]*1000, 1, thePlayer)
	 end
end


function finishServiceL (thePlayer, theTruck)
if not thePlayer then return end
if not getElementData(thePlayer, "loggedin") then return end
 	 if not exports['san_items']:hasItemS(theTruck, 235) then 
	     if getElementType (theTruck) == "vehicle" then
    		 exports.san_hud:dm("Descarregamento finalizado com sucesso.",thePlayer, 255, 255, 255)
    		 exports.san_hud:dm("Valor descarregado "..contagemLV[thePlayer]..".",thePlayer, 255, 255, 255)
     		 setElementFrozen(theTruck, false)
			 if isTimer(timerContL[thePlayer]) then
    		     killTimer(timerContL[thePlayer])
			 end
    		 Merca[thePlayer] = "LARANJA"
    		 buyCarga (thePlayer, theTruck)
    		 setElementData(thePlayer, "venderDrogas", false)
			 setElementData(thePlayer, "infoContagem", false)
		 end
	 end
end

local rotMZ = {}
local rotMS = {}
local timMR = {}
local timerContM = {}
local contagemMV = {}

function enterDZM (thePlayer)
if not thePlayer then return end
     if getElementType(thePlayer) == "player" then 
     local theVehicle = getPedOccupiedVehicle ( thePlayer )
	     if theVehicle then
		 if getElementType(theVehicle) == "vehicle" then 

			controller = getVehicleController ( theVehicle ) 
			if controller == thePlayer then 

			local driver = getVehicleOccupant ( theVehicle ) -- get the player sitting in seat 0
			if not driver == 0 then 
				exports.san_hud:dm("Só quem ta no volante pode vender a mercadoria!",thePlayer, 255, 255, 255)
			return 
			end
			
		 local prTeam = getTeamFromName ( "PR" )
         local prCount = countPlayersInTeam ( prTeam )
     --        if prCount >= 6 then
		--	     exports.san_hud:dm("Este serviço só pode ser executado com 6 Policias Rodoviário.",thePlayer, 255, 255, 255)
		--     return
	--	 end
	local count = getPlayerCount()
	if count <= 1 then
	triggerClientEvent(thePlayer,"JoinQuitGtaV:sendClientMessage", thePlayer,"#FF0000TRAFICO #FFFFFFCANCELADO DEVIDO A POUCO JOGADOR NA CIDADE MINIMO 50 JOGADORES!", 255, 255, 255, pos, 20 )
	return
	end


	     rotMZ[thePlayer] = getElementRotation(theVehicle)
	     if not exports['san_items']:hasItemS(theVehicle, 236) then
	         exports.san_hud:dm("Esta vaga é reservada apenas para Madeiras.",thePlayer, 255, 255, 255)
	         return
	     end
	     if (rotMZ[thePlayer]) then
		     rotMS[thePlayer] = math.floor(rotMZ[thePlayer])
			         if exports['san_items']:hasItemS(theVehicle, 236) then
					     setElementData(thePlayer, "venderDrogas", true)
				         exports.san_hud:dm("Descarregamento iniciando, Aguarda um momento.",thePlayer, 255, 255, 255)
						 setElementFrozen(theVehicle, true)
						 contagemMV[thePlayer] = 0
						 setElementData(theVehicle, "vehFrozen", true)
						 contagemDM (thePlayer, theVehicle)
						 setElementData(thePlayer, "infoContagem", true)
				     else
					 end
				 end
				end
			 end
		 end
	 end
end
addEventHandler("onColShapeHit", D2zone, enterDZM)

function contagemDM (thePlayer, theTruck)
if not thePlayer then return end
     if getElementType(theTruck) == "vehicle" then 
         if exports['san_items']:hasItemS(theTruck, 236) then 
     	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 236, false)
    		 contagemMV[thePlayer] = contagemMV[thePlayer] + 1
    		 contagemTimer[thePlayer] = setTimer(contagemDM, 1000, 1,thePlayer, theTruck)
             else
			 setElementData(thePlayer, "infoContagem", false)
             setTimer(contagemVehicleM, 2000, 1, thePlayer, theTruck)
			 barTimeM[thePlayer] = contagemMV[thePlayer] * 1
			 if barTimeM[thePlayer] > 1 then
			 setTimer(triggerClientEvent, 2000, 1, thePlayer, "progressService", thePlayer, barTimeM[thePlayer]-2)
			 end
			 setTimer( outputDebugString, 2000, 1, "O valor de Carga é de "..contagemMV[thePlayer])
			 setTimer(finishServiceM, contagemMV[thePlayer] * 1000, 1, thePlayer, theTruck)		
             if isTimer(contagemTimer[thePlayer]) then
			     killTimer(contagemTimer[thePlayer])
             end			 
		 end
	 end
end

function contagemVehicleM (thePlayer, theTruck)
if not thePlayer then return end
     if getElementType(theTruck) == "vehicle" then 
         if exports['san_items']:hasItemS(theTruck, 236) then 
     	     exports['san_items']:giveItem(theTruck, 236, 1, contagemMV[thePlayer], 0, false)
             timerContM[thePlayer] = setTimer(function (thePlayer, theTruck)
    		 setElementFrozen(theTruck, true)
             triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 236, false)
    		 contagemMV[thePlayer] = contagemMV[thePlayer] + 1
    		 end, contagemMV[thePlayer]*1000, 1, thePlayer)
		 end
	 end
end

function finishServiceM (thePlayer, theTruck)
if not thePlayer then return end
if not getElementData(thePlayer, "loggedin") then return end
     if getElementType(theTruck) == "vehicle" then 
 	     if not exports['san_items']:hasItemS(theTruck, 236) then 
     		 exports.san_hud:dm("Descarregamento finalizado com sucesso.",thePlayer, 255, 255, 255)
      		 exports.san_hud:dm("Valor descarregado "..contagemMV[thePlayer]..".",thePlayer, 255, 255, 255)
     		 setElementFrozen(theTruck, false)
    		 Merca[thePlayer] = "MADEIRA"
    		 buyCarga (thePlayer, theTruck)
     		 setElementData(thePlayer, "venderDrogas", false)
			 setElementData(thePlayer, "infoContagem", false)
   		 end
	 end
end

local rotTZ = {}
local rotTS = {}
local timTR = {}
local timerContT = {}
local contagemTV = {}

function enterDZT (thePlayer)
if not thePlayer then return end
     if getElementType(thePlayer) == "player" then 
     local theVehicle = getPedOccupiedVehicle ( thePlayer )
	 if theVehicle then
	 if getElementType(theVehicle) == "vehicle" then 
		controller = getVehicleController ( theVehicle ) 
		if controller == thePlayer then 

		 local prTeam = getTeamFromName ( "PR" )
         local prCount = countPlayersInTeam ( prTeam )
    --         if prCount >= 6 then
	--		     exports.san_hud:dm("Este serviço só pode ser executado com 6 Policias Rodoviário.",thePlayer, 255, 255, 255)
	--	     return
	--	 end
	local count = getPlayerCount()
	if count <= 1 then
	triggerClientEvent(thePlayer,"JoinQuitGtaV:sendClientMessage", thePlayer,"#FF0000TRAFICO #FFFFFFCANCELADO DEVIDO A POUCO JOGADOR NA CIDADE MINIMO 1 JOGADORES!", 255, 255, 255, pos, 20 )
	return
	end


	 if not exports['san_items']:hasItemS(theVehicle, 237) then
	     exports.san_hud:dm("Esta vaga é reservada apenas para Trigo.",thePlayer, 255, 255, 255)
	     return
	 end

			         if exports['san_items']:hasItemS(theVehicle, 237) then
				         exports.san_hud:dm("Descarregamento iniciando, Aguarda um momento.",thePlayer, 255, 255, 255)
						 setElementFrozen(theVehicle, true)
						 contagemTV[thePlayer] = 0
						 setElementData(theVehicle, "vehFrozen", true)
						 contagemTC (thePlayer, theVehicle)
						 setElementData(thePlayer, "infoContagem", true)
						 setElementData(thePlayer, "venderDrogas", true)
				     else
					end
				 end
			 end
		 end
	 end
end
addEventHandler("onColShapeHit", D3zone, enterDZT)

function contagemTC (thePlayer, theTruck)
if not thePlayer then return end
     if getElementType(theTruck) == "vehicle" then 
         if exports['san_items']:hasItemS(theTruck, 237) then 
     	     triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 237, false)
			  contagemTV[thePlayer] = contagemTV[thePlayer] + 1
			  contagemTimer[thePlayer] = setTimer(contagemTC, 1000, 1, thePlayer, theTruck)
     		 --contagemTC (thePlayer, theTruck)
             else
             barTimeT[thePlayer] = contagemTV[thePlayer] * 1
			 if barTimeT[thePlayer] > 1 then
			 setTimer(triggerClientEvent, 2000, 1, thePlayer, "progressService", thePlayer, barTimeT[thePlayer] - 2)
			 end
			 setElementData(thePlayer, "infoContagem", false)
			 setTimer( outputDebugString, 2000, 1, "O valor de Carga é de "..contagemTV[thePlayer])
			 setTimer(finishServiceT, contagemTV[thePlayer] * 1000, 1, thePlayer, theTruck)
             setTimer(contagemVehicleT, 2000, 1, thePlayer, theTruck)	
             if isTimer(contagemTimer[thePlayer]) then
			     killTimer(contagemTimer[thePlayer])
             end			 
		 end
	 end
end

function contagemVehicleT (thePlayer, theTruck)
if not thePlayer then return end
     if getElementType(theTruck) == "vehicle" then 
         if exports['san_items']:hasItemS(theTruck, 237) then 
         	 exports['san_items']:giveItem(theTruck, 237, 1, contagemTV[thePlayer], 0, false)
             timerContT[thePlayer] = setTimer(function (thePlayer, theTruck)
    		 setElementFrozen(theTruck, true)
             triggerEvent('btcMTA->#takePlayerItemToID', thePlayer, theTruck, 237, false)
    		 contagemTV[thePlayer] = contagemTV[thePlayer] + 1
    		 end, contagemTV[thePlayer]*1000, 1, thePlayer)
		 end
	 end
end

function finishServiceT (thePlayer, theTruck) 
if not thePlayer then return end
if not getElementData(thePlayer, "loggedin") then return end
     if getElementType(theTruck) == "vehicle" then 
     	 if not exports['san_items']:hasItemS(theTruck, 237) then 
    		 exports.san_hud:dm("Descarregamento finalizado com sucesso.",thePlayer, 255, 255, 255)
    		 exports.san_hud:dm("Valor descarregado "..contagemTV[thePlayer]..".",thePlayer, 255, 255, 255)
     		 setElementFrozen(theTruck, false)
     		 Merca[thePlayer] = "TRIGO"
    		 buyCarga (thePlayer, theTruck)
     		 setElementData(thePlayer, "venderDrogas", false)
			 setElementData(thePlayer, "infoContagem", false)
		 end
	 end
end

function buyCarga (thePlayer, theTruck)
if not thePlayer then return end
     if (Merca[thePlayer] == "MADEIRA") then
	 
         local MHcoc = dbQuery(db, "SELECT * FROM CBOLSA WHERE CARGA_NAME=?", "MADEIRA")
         local BresultM = dbPoll(MHcoc, -1)  

         local hoc = dbQuery(db, "SELECT * FROM UND WHERE NDROGA=?", "MADEIRA")
         local resultM = dbPoll(hoc, -1)  
         if #resultM ~= 0 then
		 
			     if (resultM[1]["UNIDADE"] > resultM[1]["MAX"]) then
				     if (BresultM[1]["VALOR"] > 400) then
					 else
					 end
				 end		 
		     if (resultM[1]["UNIDADE"] < resultM[1]["MAX"]) then
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultM[1]["NDROGA"]).." é de: "..(resultM[1]["UNIDADE"])..".")
				 else
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultM[1]["NDROGA"]).." foi zerado com sucesso.")
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultM[1]["NDROGA"]).." é de: "..(resultM[1]["UNIDADE"])..".")
			 end
		     	 Value[thePlayer] = BresultM[1]["VALOR"] * contagemMV[thePlayer]
				 if not getElementData(thePlayer, "loggedin") then return end
		    	 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + Value[thePlayer])
         end		 
	 end
     if (Merca[thePlayer] == "LARANJA") then
	 
         local BHcoc = dbQuery(db, "SELECT * FROM CBOLSA WHERE CARGA_NAME=?", "LARANJA")
         local BresultH = dbPoll(BHcoc, -1)  

         local hoc = dbQuery(db, "SELECT * FROM UND WHERE NDROGA=?", "LARANJA")
         local resultH = dbPoll(hoc, -1)  
         if #resultH ~= 0 then
		 
			     if (resultH[1]["UNIDADE"] > resultH[1]["MAX"]) then
				     if (BresultH[1]["VALOR"] > 400) then
					 else
					 end
				 end		 
		     if (resultH[1]["UNIDADE"] < resultH[1]["MAX"]) then
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultH[1]["NDROGA"]).." é de: "..(resultH[1]["UNIDADE"])..".")
				 else
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultH[1]["NDROGA"]).." foi zerado com sucesso.")
				 outputDebugString("*[CBOLSA TRAFICO] Load: Unidade da "..(resultH[1]["NDROGA"]).." é de: "..(resultH[1]["UNIDADE"])..".")
			 end
		     	 Value[thePlayer] = BresultH[1]["VALOR"] * contagemLV[thePlayer]
				 if not getElementData(thePlayer, "loggedin") then return end
		    	 setElementData(thePlayer, "char:money", (getElementData(thePlayer, "char:money") or 0) + Value[thePlayer])
         end		 
	 end
     if (Merca[thePlayer] == "TRIGO") then
	 
         local Bcoc = dbQuery(db, "SELECT * FROM CBOLSA WHERE CARGA_NAME=?", "TRIGO")
         local BresultC = dbPoll(Bcoc, -1)  
		     	 Value[thePlayer] = BresultC[1]["VALOR"] * contagemTV[thePlayer]
				 if not getElementData(thePlayer, "loggedin") then return end
		    	     setElementData(thePlayer, "char:money", (getElementData(thePlayer, "char:money") or 0) + Value[thePlayer])	 
	 end
end