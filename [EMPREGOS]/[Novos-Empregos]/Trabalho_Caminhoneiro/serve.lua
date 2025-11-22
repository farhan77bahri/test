
--------- MARKERS ENTREGA RECEBER-----------------------------------------------------------
entrega1 = createMarker (2590.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL DE INICIO
rcb1 = createMarker (777.8193359375, 836.30529785156, 5.8642292022705, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega2 = createMarker (2585.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL DE INICIO
rcb2 = createMarker (2758.6257324219, -2453.6025390625, 13.525020599365, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO

entrega3 = createMarker (2580.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb3 = createMarker (-84.476013183594, -1196.548828125, 2.1913576126099, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega4 = createMarker (2575.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICCIO
rcb4 = createMarker (248.7202911377, 1395.9936523438, 10.5859375, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO

entrega5 = createMarker (2570.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb5 = createMarker (-1739.3160400391, -68.916030883789, 3.5546875, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega6 = createMarker (2565.1-5, 2799.8537597656, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb6 = createMarker (1425.2703857422, 985.18493652344, 10.8203125, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega7 = createMarker (2560.1-5, 2799.8537597656, 0, 10.8-0.8, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb7 = createMarker (-1275.76001, 2705.19287, 50.0625, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega8 = createMarker (2555.1-5, 2799.8537597656, 0, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb8 = createMarker (-2174.25195, -209.34126, 35.32031, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega9 = createMarker (2550.1-5, 2799.8537597656, 0, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb9 = createMarker (-2263.43066, 2285.03760, 4.82021, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


entrega10 = createMarker (2545.1-5, 2799.8537597656, 0, "cylinder", 1.0, 0, 255, 111, 170 )--LOCAL INICIO
rcb10 = createMarker (-313.25903, 2671.11353, 62.66576, "checkpoint", 2.0, 0, 255, 111, 255 )-- LOCAL DE DESCARREGAMENTO


                                                        	            
setElementVisibleTo(entrega1, root, false)                                                      	            
setElementVisibleTo(rcb1, root, false)    
                                            
											
setElementVisibleTo(entrega2, root, false)    
setElementVisibleTo(rcb2, root, false)  
				
setElementVisibleTo(entrega3, root, false)    
setElementVisibleTo(rcb3, root, false) 

setElementVisibleTo(entrega4, root, false)    
setElementVisibleTo(rcb4, root, false)   
  
setElementVisibleTo(entrega5, root, false)    
setElementVisibleTo(rcb5, root, false) 

setElementVisibleTo(entrega6, root, false)    
setElementVisibleTo(rcb6, root, false)   
    
  setElementVisibleTo(entrega7, root, false)    
setElementVisibleTo(rcb7, root, false)   
    
    setElementVisibleTo(entrega8, root, false)    
setElementVisibleTo(rcb8, root, false) 

  setElementVisibleTo(entrega9, root, false)    
setElementVisibleTo(rcb9, root, false) 

  setElementVisibleTo(entrega10, root, false)    
setElementVisibleTo(rcb10, root, false) 

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==Mensagens MARKER--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-
function msgmarker1(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega1, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega1 para iniciar a transportaçao dessa carga Valor: #00FF00R$ 650,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00San Fierro (Pedreira)", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega1, msgmarker1)


function msgmarker2(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb1, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb1, msgmarker2)



function msgmarker3(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega2, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega2 para fazer a entrega da carga Valor: #00FF00R$ 3000,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00Los Santos (Docas)", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega2, msgmarker3)


function msgmarker4(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb2, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb2, msgmarker4)



function msgmarker5(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega3, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega3 para fazer a entrega da carga Valor: #00FF00R$ 3500,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00Los Santos (Posto de Gasolina perto da praia)", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega3, msgmarker5)



function msgmarker6(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb3, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb3, msgmarker6)


function msgmarker7(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega4, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega4 para fazer a entrega da carga Valor: #00FF00R$ 600,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00Las Venturas (Petrolheiro)", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega4, msgmarker7)



function msgmarker8(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb4, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb4, msgmarker8)


function msgmarker9(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega5, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega5 para fazer a entrega da carga Valor: #00FF00R$ 1500,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00San Fierro", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega5, msgmarker9)



function msgmarker10(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb5, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb5, msgmarker10)


function msgmarker11(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega6, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega6 para fazer a entrega da carga Valor: #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox("#00fa9a● #ffffffLocal da Entrega: #00FF00Las Venturas", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega6, msgmarker11)



function msgmarker12(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb6, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb6, msgmarker12)


function msgmarker13(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega7, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega7 para fazer a entrega da carga Valor: #00FF00R$ 450,00", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega7, msgmarker13)



function msgmarker14(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb7, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb7, msgmarker14)


function msgmarker15(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega8, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega8 para fazer a entrega da carga Valor: #00FF00R$ 450,00", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega8, msgmarker15)



function msgmarker16(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb8, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb8, msgmarker16)


function msgmarker17(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega9, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega9 para fazer a entrega da carga Valor: #00FF00R$ 450,00", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega9, msgmarker17)



function msgmarker18(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb9, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb9, msgmarker18)


function msgmarker19(source)
			if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(entrega10, source) then
		outputChatBox("#00fa9a● #ffffffDigite /entrega10 para fazer a entrega da carga Valor: #00FF00R$ 450,00", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", entrega10, msgmarker19)



function msgmarker20(source)
	if getElementData(source, "Caminhoneiro") == true and isElementVisibleTo(rcb10, source) then
		outputChatBox("#00fa9a● #ffffffDigite /descarregar para descarregar a carga e receber", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", rcb10, msgmarker20)







-----------------------------------------------------------------------------------------------------
  function en1(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega1) and isElementVisibleTo(entrega1, source) then
		local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
		if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega1, source, false) 
		exports.Script_futeis:setGPS(source, "Coordenada", 777.8193359375, 836.30529785156, 5.8642292022705)
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip1, source, true)
		
		setElementVisibleTo(rcb1, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   

end	
end 	
end
addCommandHandler("entrega1",en1)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc1(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb1) and isElementVisibleTo(rcb1, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		setElementVisibleTo(entrega1, source, false)
	
	    local pay = math.random(200,500)
		setElementData(source,"char:money", getElementData(source,"char:money") + 650)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb1, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip1, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 650,00", source, 255, 255, 255, true)
        outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
end		
end 
end
addCommandHandler("descarregar",rc1)

---------------------------------------------------------------------------------------------------------------------------

  function en2(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega2) and isElementVisibleTo(entrega2, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega2, source, false) 		
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", 2758.6257324219, -2453.6025390625, 13.525020599365)
	    setElementVisibleTo(blip2, source, true)
		
		setElementVisibleTo(rcb2, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
		end 

end		
end
addCommandHandler("entrega2",en2)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc2(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb2) and isElementVisibleTo(rcb2, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega1, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 3000)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb2, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip2, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 3000,00", source, 255, 255, 255, true)
        outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
end		
end 
end
addCommandHandler("descarregar",rc2)

--------------------------------------------------------------------------------------------------------------------------
  function en3(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega3) and isElementVisibleTo(entrega3, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega3, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -84.476013183594, -1196.548828125, 2.1913576126099)
	    setElementVisibleTo(blip3, source, true)
		
		setElementVisibleTo(rcb3, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega3",en3)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc3(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb3) and isElementVisibleTo(rcb3, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega3, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 3500)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb3, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip3, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 3500,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc3)

---------------------------------------------------------------------------------------------------------------------------------
  function en4(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega4) and isElementVisibleTo(entrega4, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega4, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", 248.7202911377, 1395.9936523438, 10.5859375)
	    setElementVisibleTo(blip4, source, true)
		
		setElementVisibleTo(rcb4, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega4",en4)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc4(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb4) and isElementVisibleTo(rcb4, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega4, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb4, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip4, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc4)




---------------------------------------------------------------------------------------------------------------------------------
  function en5(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega5) and isElementVisibleTo(entrega5, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega5, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -1739.3160400391, -68.916030883789, 3.5546875)
	    setElementVisibleTo(blip5, source, true)
		
		setElementVisibleTo(rcb5, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega5",en5)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc5(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb5) and isElementVisibleTo(rcb5, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega5, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 1500)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb5, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip5, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 1500,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc5)

---------------------------------------------------------------------------------------------------------------------------------
  function en6(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega6) and isElementVisibleTo(entrega6, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega6, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", 1425.2703857422, 985.18493652344, 10.8203125)
	    setElementVisibleTo(blip6, source, true)
		
		setElementVisibleTo(rcb6, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
		end 

end		
end
addCommandHandler("entrega6",en6)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc6(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb6) and isElementVisibleTo(rcb6, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega6, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb6, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip6, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc6)


---------------------------------------------------------------------------------------------------------------------------------
  function en7(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega7) and isElementVisibleTo(entrega7, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega7, source, false)		
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -1275.76001, 2705.19287, 50.0625)
	    setElementVisibleTo(blip7, source, true)
		
		setElementVisibleTo(rcb7, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
		end 

end		
end
addCommandHandler("entrega7",en7)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc7(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb7) and isElementVisibleTo(rcb7, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega6, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb7, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip7, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc7)


---------------------------------------------------------------------------------------------------------------------------------
  function en8(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega8) and isElementVisibleTo(entrega8, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega8, source, false) 
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -2174.25195, -209.34126, 35.32031)
	    setElementVisibleTo(blip8, source, true)
		
		setElementVisibleTo(rcb8, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega8",en8)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc8(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb8) and isElementVisibleTo(rcb8, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega8, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb8, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip8, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc8)

---------------------------------------------------------------------------------------------------------------------------------
  function en9(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega9) and isElementVisibleTo(entrega9, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega9, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -2263.43066, 2285.03760, 4.82021)
	    setElementVisibleTo(blip9, source, true)
		
		setElementVisibleTo(rcb9, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega9",en9)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc9(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, rcb9) and isElementVisibleTo(rcb9, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega9, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb9, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip9, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc9)


------------------------------------------------
  function en10(source)
	if getElementData(source, "Caminhoneiro", true) then
        if isElementWithinMarker(source, entrega10) and isElementVisibleTo(entrega10, source) then
		
				local level = getElementData(source,"Level") or 0
		local levelnecessario = 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para entregar essa carga", source, 255, 255, 255, true) return end

		setElementVisibleTo(entrega10, source, false)
	-------LOCAL ENTREGA----------------------------------------
		exports.Script_futeis:setGPS(source, "Coordenada", -313.25903, 2671.11353, 62.66576)
	    setElementVisibleTo(blip10, source, true)
		
		setElementVisibleTo(rcb10, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVocê iniciou o transporte, pegue o caminhão e faça a entrega na marcação #FF0000Vermelha #ffffffno mapa", source, 255, 255, 255, true)
   
		end 
end		
end
addCommandHandler("entrega10",en10)
 
 -------------------------------------------------------------------------------------------------------------------
  function rc10(source)
	if getElementData(source, "Caminhoneiro", true) then	

        if isElementWithinMarker(source, rcb10) and isElementVisibleTo(rcb10, source) and getElementModel(getPedOccupiedVehicle(source)) == 515 then

		
		setElementVisibleTo(entrega10, source, false)
	
	    setElementData(source,"char:money", getElementData(source,"char:money") + 450)
		local ganho = math.random (20, 135)
		exports.san_Level:givePlayerExp(source, ganho )
        setElementVisibleTo(rcb10, source, false)		
	-------LOCAL ENTREGA----------------------------------------
	    setElementVisibleTo(blip10, source, false)
	    setElementVisibleTo(hq, source, true)
	    outputChatBox(" #00FA9A[Caminhoneiro] #ffffffVoce descarregou a carga e recebeu #00FF00R$ 450,00", source, 255, 255, 255, true)
		outputChatBox(" #00FA9A[Caminhoneiro] #ffffffRetorne para a empresa guardar o caminhao", source, 255, 255, 255, true)
		end 
end		
end
addCommandHandler("descarregar",rc10)








Caminhoneiro = createMarker(2594.9274902344, 2790.7163085938, 10.8203125,"cylinder", 1.2, 0 ,0 ,0, 0) --MARKER INICIAR TRABALHO


hq = createBlip ( 2594.9274902344, 2790.7163085938, 10.8203125, 0, 0, 255, 255, 255, 255,0 , 200 )---HQ EMPRESA CAMINHOEIRO---
setElementVisibleTo(hq, root, false)
setBlipVisibleDistance(hq, 100)


blip1 = createBlip ( 777.8193359375, 836.30529785156, 5.8642292022705, 0, 0, 255, 0, 0, 255,0 , 200 )---LOCAL ENTREGA 1
setElementVisibleTo(blip1, root, false)
setBlipVisibleDistance(blip1, 100)


blip2 = createBlip ( 2758.6257324219, -2453.6025390625, 13.525020599365, 0, 0, 255, 0, 0, 255,0 , 200 )-- LOCAL ENTREGA 2 
setElementVisibleTo(blip2, root, false)
setBlipVisibleDistance(blip2, 100)


blip3 = createBlip ( -84.476013183594, -1196.548828125, 2.1913576126099, 0, 0, 255, 0, 0, 255,0 , 200 )--- LOCAL ENTREGA 3
setElementVisibleTo(blip3, root, false)
setBlipVisibleDistance(blip3, 100)



blip4 = createBlip ( 248.7202911377, 1395.9936523438, 10.5859375, 0, 0, 255, 0, 0, 255,0 , 200 )---LOCAL ENTREGA 4
setElementVisibleTo(blip4, root, false)
setBlipVisibleDistance(blip4, 100)


blip5 = createBlip (-1739.3160400391, -68.916030883789, 3.5546875, 0, 0, 255, 0, 0, 255,0 , 200 )--LCOAL ENTREGA 5
setElementVisibleTo(blip5, root, false)
setBlipVisibleDistance(blip5, 100)


blip6 = createBlip ( 1425.2703857422, 985.18493652344, 10.8203125, 0, 0, 255, 0, 0, 255,0 , 200 )--LOCAL ENTREGA 6 
setElementVisibleTo(blip6, root, false)
setBlipVisibleDistance(blip6, 100)


blip7 = createBlip ( -1275.76001, 2705.19287, 50.06250, 0, 0, 255, 0, 0, 255,0 , 200 )--LOCAL 7 ENTREGA
setElementVisibleTo(blip7, root, false)
setBlipVisibleDistance(blip7, 100)


blip8 = createBlip ( -2174.25195, -209.34126, 35.32031, 0, 0, 255, 0, 0, 255,0 , 200 )--LOCAL 8 ENTREGA
setElementVisibleTo(blip8, root, false)
setBlipVisibleDistance(blip8, 100)


blip9 = createBlip ( -2263.43066, 2285.03760, 4.82021, 0, 0, 255, 0, 0, 255,0 , 200 )--LOCAL 9 ENTREGA
setElementVisibleTo(blip9, root, false)
setBlipVisibleDistance(blip9, 100)


blip10 = createBlip ( -313.25903, 2671.11353, 62.66576, 0, 0, 255, 0, 0, 255,0 , 200 )--LOCAL 10 ENTREGA
setElementVisibleTo(blip10, root, false)
setBlipVisibleDistance(blip10, 100)


local levelnecessario = 0
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Caminhoneirotrabalhar ( source, cmd )
triggerEvent("RemoverBlip",source)
--if getElementData(source, "Caminhoneiro", true) then return end
if not isElementWithinMarker(source, Caminhoneiro) then return end
if (exports.san_employment:getPlayerJob(source,true) == "caminhoneiro") then--(exports.san_employment:getPlayerJob(source,true) == "caminhoneiro")   ||   getElementData(source, "acc:admin") >= 1
local level = getElementData(source,"Level") or 0
 --- MUDAR AQUI LEVEL PARA EMPREGO
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Nivel " ..levelnecessario.. " para começar esse emprego", Jogador, 255, 255, 255, true) return end
------MUDAR AQUI 0)---
setElementData(source, "Caminhoneiro", true)
setElementVisibleTo(entrega1, source, true)	
setElementVisibleTo(entrega2, source, true)	
setElementVisibleTo(entrega3, source, true)	
setElementVisibleTo(entrega4, source, true)	
setElementVisibleTo(entrega5, source, true)	
setElementVisibleTo(entrega6, source, true)	
setElementVisibleTo(entrega7, source, true)	
setElementVisibleTo(entrega8, source, true)	
setElementVisibleTo(entrega9, source, true)	
setElementVisibleTo(entrega10, source, true)	
outputChatBox("#00fa9a[Caminhoneiro] #ffffffVocê começou trabalhar de vá para a Marcação verde para escolher uma rota.",source,255,255,255,true)	
else
	outputChatBox("#ff0000[ERROR] #ff0000Você não é um caminhoneiro.", source, 255, 255, 255, true)
end
end
addCommandHandler("trabalhar", Caminhoneirotrabalhar)

-------------------------------------------------------------------------------------------------------
function HitarCaminhoneiro ( source )
if isPedInVehicle(source) then return end
if getElementData(source, "Caminhoneiro", true) then
outputChatBox("#00FA9A[Caminhoneiro] #ffffff/trabalhar #ffffffPara iniciar o emprego de Caminhoneiro de cargas", source, 255, 255, 255, true)
outputChatBox("#00FA9A[Caminhoneiro] #ffffff/saircaminhao #ffffffPara sair do emprego", source, 255, 255, 255, true)
outputChatBox("#00FA9A[Caminhoneiro] #ffffff/emprego #ffffffPara ver os comando do emprego", source, 255, 255, 255, true)
else


outputChatBox("#00FA9A[Caminhoneiro] #ffffff/trabalhar #ffffffPara iniciar o emprego de Caminhoneiro de cargas", source, 255, 255, 255, true)
end
end
addEventHandler("onMarkerHit", Caminhoneiro, HitarCaminhoneiro)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function EmpregoCaminhoneiro ( source )
if getElementData(source, "Caminhoneiro", true) then
outputChatBox("#00FA9A[Caminhoneiro] #ffffff/descarregar #ffffffpara descarregar a carga do caminhao", source, 255, 255, 255, true)
outputChatBox("#00FA9A[Caminhoneiro] #ffffff/entrega1 ate /entrega10 #ffffffpara iniciar transportaçao de carga ", source, 255, 255, 255, true)



				 end 
				  end
addCommandHandler("emprego", EmpregoCaminhoneiro )

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function SairCaminhoneiro ( source )
	if getElementData(source, "Caminhoneiro") == true then
	setElementData(source, "Caminhoneiro", false)

exports.san_employment:setPlayerJob(source, "Desempregado", "0",true)
exports.san_infobox:addNotification(source, "Você foi demitido!", "success")
 
setElementVisibleTo(hq, source, false)  
setElementVisibleTo(entrega1, source, false)   
setElementVisibleTo(blip1, source, false)  
setElementVisibleTo(entrega2, source, false)   
setElementVisibleTo(blip2, source, false) 
setElementVisibleTo(entrega3, source, false)   
setElementVisibleTo(blip3, source, false)   
 setElementVisibleTo(entrega4, source, false)   
setElementVisibleTo(blip4, source, false) 
 setElementVisibleTo(entrega5, source, false)   
setElementVisibleTo(blip5, source, false)  
 setElementVisibleTo(entrega6, source, false)   
setElementVisibleTo(blip6, source, false) 
 setElementVisibleTo(entrega7, source, false)   
setElementVisibleTo(blip7, source, false) 
 setElementVisibleTo(entrega8, source, false)   
setElementVisibleTo(blip8, source, false)     
 setElementVisibleTo(entrega9, source, false)   
setElementVisibleTo(blip9, source, false)  
 setElementVisibleTo(entrega10, source, false)   
setElementVisibleTo(blip10, source, false)  

setElementVisibleTo(rcb1, source, false)   
setElementVisibleTo(rcb2, source, false)   
setElementVisibleTo(rcb3, source, false)   
setElementVisibleTo(rcb4, source, false)   
setElementVisibleTo(rcb5, source, false)   
setElementVisibleTo(rcb6, source, false)   
setElementVisibleTo(rcb7, source, false)   
setElementVisibleTo(rcb8, source, false)   
setElementVisibleTo(rcb9, source, false)   
setElementVisibleTo(rcb10, source, false)   

    
                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             		
outputChatBox("#00FA9A[Caminhoneiro] #ffffffVoce saiu do emprego e finalizou por hoje",source,255,255,255,true)

																		

	end 
end
addCommandHandler("saircaminhao", SairCaminhoneiro)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==Iniciar Mod--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==- 

function pickup () 

objects = {                                  

{2594.9274902344, 2790.7163085938, 10.8203125},
} --


for i, pos in ipairs(objects) do
local ob = createObject(1210, unpack(objects[i]))
setObjectScale(ob, 2)
setElementCollisionsEnabled(ob, false)
local x, y, z = getElementPosition(ob)
setTimer(moveObject, 2000, 0, ob, 2000, x, y, z, 0, 0, 360)
end 



collenhador = createColSphere(2780.85425, -2455.86255, 13.63536, 1)
end
addEventHandler("onResourceStart", resourceRoot, pickup)


 









 
 





