addCommandHandler("teste",
function(thePlayer, cmd)
	if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
		local pX,pY,pZ = getElementPosition(thePlayer)
		for _, veiculo in ipairs(getElementsByType("vehicle")) do
			for _, outroJogador in ipairs(getElementsByType("player")) do
				vX,vY,vZ = getElementPosition(veiculo)
				local distanciaveiculo = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
				local interior = getElementInterior(thePlayer)
				local dimension = getElementDimension(thePlayer)			
				local interior1 = getElementInterior(veiculo)
				local dimension1 = getElementDimension(veiculo)
				
				local cx, cy, cz = getElementPosition ( outroJogador )
    			local px, py, pz = getElementPosition ( thePlayer )
				local dintanciajogador	= getDistanceBetweenPoints3D ( cx, cy, cz, px, py, pz )
				if ( dintanciajogador <= 5 ) and getElementData(outroJogador, "Pinconsciente") == true and distanciaveiculo <= 5 and interior == interior1 and dimension == dimension1 then
					if outroJogador ~= thePlayer then
						outputChatBox("Você está fazendo o serviço", thePlayer, 255,255,255,true)	
						outputChatBox("O Bombeiro está fazendo o serviço", outroJogador, 255,255,255,true)	
						setPedAnimation(thePlayer, "bomber", "BOM_Plant_Loop", -1, true, false, false)
						toggleAllControls(thePlayer, false)
						setElementData(outroJogador, "podemorrer", false)
						setElementData(outroJogador, "Pinconsciente", false)
						setElementHealth(outroJogador, 35)
						
						setTimer(function()
						setPedAnimation(thePlayer)

						setElementData(thePlayer, "bombeiroliberado", true)
						setElementData(thePlayer, "japegou", true)
						setElementData(outroJogador, "bombeiroliberado", true)
						toggleAllControls(thePlayer, true)
						setElementFrozen(thePlayer, false)
						end, 10000, 0)
					end
				end
			end
		end
	end
end)

function pegarJogador(thePlayer, commandName)
	if thePlayer then 
		if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
		local posX1, posY1, posZ1 = getElementPosition(thePlayer)
		for _, outroJogador in ipairs(getElementsByType("player")) do
			local posX2, posY2, posZ2 = getElementPosition(outroJogador)
			local distancia = getDistanceBetweenPoints3D(posX1, posY1, posZ1 , posX2, posY2, posZ2)
			if distancia <= 3.7 then
				if outroJogador ~= thePlayer then
					--if getElementData(thePlayer, "PlayerCaido") == true and getElementData(outroJogador, "PlayerCaido") == true then 
					--if getElementData(outroJogador, "playerFallen") then 
--					if getElementData(thePlayer, "japegou") == true then return end
						removePedFromVehicle(outroJogador, vehicle)
						local anexar = attachElements(outroJogador, thePlayer, 0, 0.36, 1.3)
						if (anexar) then 
							setPedAnimation(thePlayer, "CARRY", "crry_prtial", 0, true, false, true, true)
							setPedAnimation(outroJogador, "crack", "crckidle2", false, false)
							setElementData(thePlayer, "segurandoJogador", outroJogador)
							--setElementHealth(outroJogador, 35)
							
							--setElementData(thePlayer, "japegou", false)
							--setElementData(thePlayer, "bombeiroliberado", false)
							--setElementData(outroJogador, "bombeiroliberado", false)
							--setElementData(outroJogador, "podemorrer", false)
							
							bindKey(thePlayer, "mouse2", "down", soltarJogador)
							outputChatBox("Aperte com o Botão direito para soltar o individuo", thePlayer, 255,255,255,true)
--end
				end
			end
		end
	end
end
end
end
addCommandHandler("boland", pegarJogador)

function soltarJogador(thePlayer)
	if thePlayer then
		if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
		local outroJogador = getElementData(thePlayer, "segurandoJogador")
		if outroJogador then 
			setPedAnimation(outroJogador)
			setPedAnimation(thePlayer)
			setElementHealth(outroJogador, 35)
			unbindKey (thePlayer, "mouse2", "down", soltarJogador)
			detachElements(outroJogador, thePlayer)
			toggleAllControls(outroJogador, true)
			toggleAllControls(thePlayer, true)
			setPedAnimation(thePlayer, false)
			setElementData(thePlayer, "segurandoJogador", nil)
			setElementData(outroJogador, "podemorrer", false)
			end
		end 
	end 
end 




