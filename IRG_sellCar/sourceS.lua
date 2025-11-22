local con = exports.san_mysql:getConnection()
--local adminlog = "INSERT INTO adminlog SET admin_name=?, adminacc_id=?, tevkod=?, chatlog=?, target_name=?, targetacc_id=?, date=CURDATE(), time=CURTIME()"

function adasVeteli(thePlayer, commandName, targetPlayer, osszeg)
	if isPedInVehicle(thePlayer) then
		local veh = getPedOccupiedVehicle(thePlayer)
		if (veh) then
		
			if not (targetPlayer) or not (osszeg) then
				outputChatBox("#7cc576[IRG]:#ffffff /" .. commandName .." [ID] [Price]", thePlayer, 255, 255, 255, true)
			else
				if getElementData(thePlayer, "av:selling") then outputChatBox("#dc143c[IRG]:#ffffffA sales contract is already in progress.", thePlayer, 255, 255, 255, true) return end
				
				local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)

				local osszeg = tonumber(osszeg)
				if osszeg < 1 then outputChatBox("#dc143c[IRG]:#ffffff That's why a vehicle can't be that cheap.", thePlayer, 255, 255, 255, true) return end
				local x, y, z = getElementPosition(thePlayer)
				local tx, ty, tz = getElementPosition(targetPlayer)
				local int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
				local tint, tdim = getElementInterior(targetPlayer), getElementDimension(targetPlayer)
				local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				if distance <= 5 and int == tint and dim == tdim then
					if thePlayer == targetPlayer then outputChatBox("#dc143c[IRG]:#ffffffYou cannot sell your vehicles.", thePlayer, 255, 255, 255, true) return end
					if getElementData(thePlayer, "acc:id") == getElementData(veh, "veh:owner") or getElementData(thePlayer, "acc:admin") >= 7 then
						sendAjanlat(thePlayer, targetPlayer, osszeg, veh, 1)
					else
						outputChatBox("#dc143c[IRG]:#ffffff You can only sell your own vehicle.", thePlayer, 255, 255, 255,true)
					end
				else
					outputChatBox("#dc143c[IRG]:#ffffff You are too far from the player.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	elseif getElementData(thePlayer, "int:Pickup") then

		if not (targetPlayer) or not (osszeg) then
			outputChatBox("#7cc576Erro:#ffffff /" .. commandName .." [ID] [Preço]", thePlayer, 255, 255, 255, true)
		else
		if getElementData(thePlayer, "av:selling") then outputChatBox("#dc143c[IRG]:#ffffff A sales contract is already in progress.", thePlayer, 255, 255, 255, true) return end
			
	
		local pickup = getElementData(thePlayer, "int:Pickup")
			if isElement(pickup) then
				local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
				local pickupType = tostring(getElementData(pickup, "typePick")) or nil
				local pickupID = tonumber(getElementData(pickup, "id")) or 0
				local interiorType = tonumber(getElementData(pickup, "type")) or 0
				local pickupLocked = tonumber(getElementData(pickup, "locked")) or 0
				local pickupOwner = tonumber(getElementData(pickup, "owner")) or 0
				local osszeg = tonumber(osszeg)
				if osszeg < 1 then outputChatBox("#dc143c[IRG]:#ffffff This is why a cheap property can't be that cheap.", thePlayer, 255, 255, 255, true) return end
				local x, y, z = getElementPosition(thePlayer)
				local tx, ty, tz = getElementPosition(targetPlayer)
				local int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
				local tint, tdim = getElementInterior(targetPlayer), getElementDimension(targetPlayer)
				local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				
				if distance <= 5 and int == tint and dim == tdim then
					if thePlayer == targetPlayer then outputChatBox("#dc143c[IRG]:#ffffff You cannot sell your vehicles again.", thePlayer, 255, 255, 255, true) return end
					if getElementData(thePlayer, "acc:id") == pickupOwner or getElementData(thePlayer, "acc:admin") >= 6 then
						if pickupType == "inSide" then
							sendAjanlat(thePlayer, targetPlayer, osszeg, pickup, 2)
						end
					else
						outputChatBox("#dc143c[IRG]:#ffffff Esta propriedade não é sua.", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox("#dc143c[IRG]:#ffffff Você está muito longe do jogador.", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#dc143c[IRG]:#ffffff Você não está em pickup.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("sellcar", adasVeteli, false, false)

function sendAjanlat(thePlayer, targetPlayer, osszeg, veh, state)
	if isElement(thePlayer) and isElement(targetPlayer) then
	
		if state == 1 then
			local vehname = getElementModel(veh) or "desconhecido"
			outputChatBox("#1E8BC3[Vendas]:#ffffff " .. getPlayerName(thePlayer):gsub("_"," ") .. " ofereceu-lhe para venda este veiculo: #7cc576" .. vehname .. "", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Preço: #0094ff" .. osszeg .. "$", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Para aceitar digite: #7cc576/ac#ffffff.", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Para recusar digite: #dc143c/recusar#ffffff.", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Oferecido para venda #7cc576" .. vehname .. "#ffffff.", thePlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Preço: #0094ff" .. osszeg .. "$", thePlayer, 255, 255, 255, true)
			
			setElementData(targetPlayer, "av:accept", 1)
			setElementData(thePlayer, "av:selling", 1)
			setElementData(targetPlayer, "av:veh", veh)
			setElementData(targetPlayer, "av:osszeg", osszeg)
			setElementData(targetPlayer, "av:tplayer", thePlayer)
		elseif state == 2 then
		
			outputChatBox("#1E8BC3[Vendas]:#ffffff " .. getPlayerName(thePlayer):gsub("_"," ") .. " ele lhe ofereceu a propriedade para venda.", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Preço: #0094ff" .. osszeg .. "$", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Para aceitar digite: #7cc576/aceitar#ffffff.", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Para recusar digite: #dc143c/recusar#ffffff.", targetPlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Você ofereceu sua propriedade para venda.", thePlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Vendas]:#ffffff Preço: #0094ff" .. osszeg .. "$", thePlayer, 255, 255, 255, true)
			
			setElementData(targetPlayer, "av:accept", 2)
			setElementData(thePlayer, "av:selling", 2)
			setElementData(targetPlayer, "av:interior", veh)
			setElementData(targetPlayer, "av:osszeg", osszeg)
			setElementData(targetPlayer, "av:tplayer", thePlayer)
			
		end
	end
end

function elfogad(source, cmd)
		if getElementData(source, "av:accept") == 1 then
			
			local veh = getElementData(source, "av:veh")
			local vehid = getElementData(veh, "veh:id")
			local oldOwner = getElementData(veh, "veh:owner")
			local osszeg = getElementData(source, "av:osszeg")
			local tplayer = getElementData(source, "av:tplayer")
			local newOwner = getElementData(source, "acc:id")
			local count = 0
			local x, y, z = getElementPosition(source)
			local tx, ty, tz = getElementPosition(tplayer)
			local int, dim = getElementInterior(source), getElementDimension(source)
			local tint, tdim = getElementInterior(tplayer), getElementDimension(tplayer)
			local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
			if distance <= 5 and int == tint and dim == tdim then
				
				for k, v in ipairs(getElementsByType("vehicle")) do
					if getElementData(v, "veh:owner") == getElementData(source, "acc:id") then
						count = count+1
					end
				end
				
				if count >= getElementData(source, "char:vehSlot") then 
					outputChatBox("#dc143c[IRG]:#ffffff Você não tem slots suficientes à sua disposição.", source, 255, 255, 255, true) 
					outputChatBox("#dc143c[IRG]:#ffffff " .. getPlayerName(source):gsub("_"," ") .. " o jogador não tem slots suficientes à sua disposição.", tplayer, 255, 255, 255, true) 
					setElementData(source, "av:accept", false)
					setElementData(source, "av:veh", false)
					setElementData(source, "av:osszeg", false)
					setElementData(tplayer, "av:selling", false)
					setElementData(source, "av:tplayer", false)
					return
				end
				
				if getElementData(source, "char:money") >= osszeg then
				
					local sql = dbExec(con, "UPDATE vehicle SET owner='" .. newOwner ..  "' WHERE owner='" .. oldOwner .. "' AND id='" .. vehid .. "'")
					if (sql) then
						setElementData(veh, "veh:owner", newOwner)
						setElementData(veh, "veh:oname", getElementData(source, "char:name"))
						
					
							setElementData(source, "char:money", getElementData(source, "char:money")-osszeg)
						
						outputChatBox("#1E8BC3[Vendas]:#ffffff Você aceitou o contrato de venda. Pegue as chaves do carro do revendedor.", source, 255, 255, 255, true)
						outputChatBox("#1E8BC3[Vendas]:#ffffff Agora você pode encontrar seu veiculo no menu F3 'Propriedade'.", source, 255, 255, 255, true)
						--outputChatBox("#1E8BC3[Vendas]:#ffffff A vételPreço levonásra kerül a készpénzedből.", source, 255, 255, 255, true)
						outputChatBox("#1E8BC3[Vendas]:#ffffff Você vendeu com sucesso o veiculo ao .", getElementData(source, "av:tplayer"), 255, 255, 255, true)
						--dbExec(con, adminlog, getPlayerName(getElementData(source, "av:tplayer")), getElementData(getElementData(source, "av:tplayer"), "acc:id"), "Sell", getPlayerName(getElementData(source, "av:tplayer")) .. " ele vendeu seu veiculo ao " .. getPlayerName(source) .. " " .. getElementModel(veh) .. " (ID: " .. getElementData(veh, "veh:id") .. "). Quantidade: " .. osszeg .. "", getPlayerName(source), getElementData(source, "acc:id"))
							setElementData(tplayer, "char:money", getElementData(tplayer, "char:money")+osszeg)

						
						setElementData(source, "av:accept", false)
						setElementData(source, "av:veh", false)
						setElementData(source, "av:osszeg", false)
						setElementData(getElementData(source, "av:tplayer"), "av:selling", false)
						setElementData(source, "av:tplayer", false)
					
					else
						outputChatBox("szar sql mentés")
					end
				else
					outputChatBox("#dc143c[IRG]:#ffffff Você não tem dinheiro suficiente para comprar um veiculo.", source, 255, 255, 255, true)
					
					setElementData(source, "av:accept", false)
					setElementData(source, "av:veh", false)
					setElementData(source, "av:osszeg", false)
					setElementData(getElementData(source, "av:tplayer"), "av:selling", false)
					outputChatBox("#dc143c[IRG]:#ffffff O cliente não tem dinheiro suficiente para comprar o veiculo.", tplayer, 255, 255, 255, true)
					setElementData(source, "av:tplayer", false)
				end
			else
				outputChatBox("#dc143c[IRG]:#ffffff Você está muito longe do jogador.", source, 255, 255, 255, true)
			end
		
		elseif getElementData(source, "av:accept") == 2 then
			local pickup = getElementData(source, "av:interior")
			local pickupType = tostring(getElementData(pickup, "typePick")) or nil
			local pickupID = tonumber(getElementData(pickup, "id")) or 0
			local interiorType = tonumber(getElementData(pickup, "type")) or 0
			local pickupLocked = tonumber(getElementData(pickup, "locked")) or 0
			local pickupOwner = tonumber(getElementData(pickup, "owner")) or 0
			local osszeg = getElementData(source, "av:osszeg")
			local tplayer = getElementData(source, "av:tplayer")
			local newOwner = getElementData(source, "acc:id")
			local count = 0 
			
				for k, v in ipairs(getElementsByType("marker")) do
					if getElementData(v, "typePick") and getElementData(v, "typePick") == "outside" then
						if getElementData(v, "owner") == getElementData(source, "char:id") then
							count = count + 1
						end
					end
				end
				
				if count >= getElementData(source, "char:houseSlot") then 
					outputChatBox("#dc143c[IRG]:#ffffff Você não tem slots interiores suficientes à sua disposição.", source, 255, 255, 255, true) 
					outputChatBox("#dc143c[IRG]:#ffffff " .. getPlayerName(source):gsub("_"," ") .. " O jogador não tem slots interiores suficientes à sua disposição.", tplayer, 255, 255, 255, true) 
					setElementData(source, "av:accept", false)
					setElementData(source, "av:interior", false)
					setElementData(source, "av:osszeg", false)
					setElementData(tplayer, "av:selling", false)
					setElementData(source, "av:tplayer", false)
					return
				end
					
				if getElementData(source, "char:money") >= osszeg then
					setElementData(source, "char:money", getElementData(source, "char:money") - osszeg)
					setElementData(tplayer, "char:money", getElementData(tplayer, "char:money") + osszeg)
					--triggerServerEvent("updateInteriorOwner", source, pickupID, source, interiorType)
						exports.san_interior:updateOwner(pickupID, source, interiorType)
						
						outputChatBox("#1E8BC3[Vendas]:#ffffff Você aceitou o contrato de venda. Pegue a chave com o revendedor.", source, 255, 255, 255, true)
						outputChatBox("#1E8BC3[Vendas]:#ffffff Agora você pode encontrar os interiores no menu F3 'Propriedade'.", source, 255, 255, 255, true)
						outputChatBox("#1E8BC3[Vendas]:#ffffff Você vendeu sua propriedade com sucesso.", tplayer, 255, 255, 255, true)
					
					--dbExec(con, adminlog, getPlayerName(getElementData(source, "av:tplayer")), getElementData(getElementData(source, "av:tplayer"), "acc:id"), "Sell", getPlayerName(getElementData(source, "av:tplayer")) .. " eladta az interiorját " .. getPlayerName(source) .. " játékosnak. Interior ID: " .. getElementData(pickup, "id") .. ".", getPlayerName(tplayer), getElementData(tplayer, "acc:id"))

						
						setElementData(source, "av:accept", false)
						setElementData(source, "av:interior", false)
						setElementData(source, "av:osszeg", false)
						setElementData(tplayer, "av:selling", false)
						setElementData(source, "av:tplayer", false)
				else
					outputChatBox("#dc143c[IRG]:#ffffff Não há dinheiro suficiente para comprar uma propriedade.", source, 255, 255, 255, true)
					outputChatBox("#dc143c[IRG]:#ffffff O cliente não tem dinheiro suficiente para comprar a propriedade.", tplayer, 255, 255, 255, true)
					setElementData(source, "av:accept", false)
					setElementData(source, "av:interior", false)
					setElementData(source, "av:osszeg", false)
					setElementData(tplayer, "av:selling", false)
					setElementData(source, "av:tplayer", false)
				end
		end
	end
addCommandHandler("ac", elfogad, false, false)

function decline(source, cmd)
	if getElementData(source, "av:accept") == 1 then
		
		setElementData(source, "av:accept", false)
		setElementData(source, "av:veh", false)
		setElementData(source, "av:osszeg", false)
		setElementData(getElementData(source, "av:tplayer"), "av:selling", false)
		outputChatBox("#1e8bc3[Vendas]:#ffffff Você rejeitou o contrato de venda.", source, 255, 255, 255, true)
		outputChatBox("#1e8bc3[Vendas]:#ffffff Seu contrato de venda foi rejeitado.", getElementData(source, "av:tplayer"), 255, 255, 255, true)
		setElementData(source, "av:tplayer", false)
	elseif getElementData(source, "av:accept") == 2 then
		
		setElementData(source, "av:accept", false)
		setElementData(source, "av:interior", false)
		setElementData(source, "av:osszeg", false)
		setElementData(getElementData(source, "av:tplayer"), "av:selling", false)
		outputChatBox("#1e8bc3[Vendas]:#ffffff Você rejeitou o contrato de venda.", source, 255, 255, 255, true)
		outputChatBox("#1e8bc3[Vendas]:#ffffff Seu contrato de venda foi rejeitado.", getElementData(source, "av:tplayer"), 255, 255, 255, true)
		setElementData(source, "av:tplayer", false)
	end
end
addCommandHandler("recusar", decline, false, false)


