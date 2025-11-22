
local blip = createBlip (2681.1643066406, -1953.2185058594, 13.60781288147, 42)
setElementData(blip,"blip >> name", "Trabalho de Eletricista")

escada1 = createMarker (262.57825, -1424.16284, 12.8, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER 
poste1 = createMarker (267.16772, -1432.15808, 25.2, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER     

setElementVisibleTo(escada1, root, false)
setElementVisibleTo(poste1, root, false)


escada2 = createMarker (1289.64075, -1406.13611, 12.4 , "cylinder", 1.0, 0, 255, 111, 170 )--MARKER 
poste2 = createMarker (1289.71936, -1414.51587, 25.7, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER
setElementVisibleTo(escada2, root, false)
setElementVisibleTo(poste2, root, false)


escada3 = createMarker (2025.68176, -1748.35925, 12.5, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER 
poste3 = createMarker (2025.67297, -1743.03003, 21.8, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER
setElementVisibleTo(escada3, root, false)
setElementVisibleTo(poste3, root, false)


escada4 = createMarker (1844.41223, -1929.50122, 12.5 , "cylinder", 1.0, 0, 255, 111, 170 )--MARKER 
poste4 = createMarker (1844.47852, -1922.40723, 20.8, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER
setElementVisibleTo(escada4, root, false)
setElementVisibleTo(poste4, root, false)


escada5 = createMarker (2285.42871, -2235.07080, 12.6, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER 
poste5 = createMarker (2281.56860, -2230.49512, 21.8, "cylinder", 1.0, 0, 255, 111, 170 )--MARKER
setElementVisibleTo(escada5, root, false)
setElementVisibleTo(poste5, root, false)



	  


		
--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==---==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-


--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==Mensagens MARKER--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-
function msgmarker1(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(escada1, source) then
		outputChatBox("#00ff88● #ffffffDigite /escada para por escada no chao para subir no poste", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", escada1, msgmarker1)


function msgmarker2(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(poste1, source) then
		outputChatBox("#00ff88● #ffffffDigite /arrumar para arrumar o poste que esta quebrado", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", poste1, msgmarker2)


function msgmarker3(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(escada2, source) then
		outputChatBox("#00ff88● #ffffffDigite /escada para por escada no chao para subir no poste", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", escada2, msgmarker3)


function msgmarker4(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(poste2, source) then
		outputChatBox("#00ff88● #ffffffDigite /arrumar para arrumar o poste que esta quebrado", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", poste2, msgmarker4)



function msgmarker5(source)
			if getElementData(source, "eletricista") == true and isElementVisibleTo(escada3, source) then
		outputChatBox("#00ff88● #ffffffDigite /escada para por escada no chao para subir no poste", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", escada3, msgmarker5)



function msgmarker6(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(poste3, source) then
		outputChatBox("#00ff88● #ffffffDigite /arrumar para arrumar o poste que esta quebrado", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", poste3, msgmarker6)


function msgmarker7(source)
			if getElementData(source, "eletricista") == true and isElementVisibleTo(escada4, source) then
		outputChatBox("#00ff88● #ffffffDigite /escada para por escada no chao para subir no poste", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", escada4, msgmarker7)



function msgmarker8(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(poste4, source) then
		outputChatBox("#00ff88● #ffffffDigite /arrumar para arrumar o poste que esta quebrado", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", poste4, msgmarker8)


function msgmarker9(source)
			if getElementData(source, "eletricista") == true and isElementVisibleTo(escada5, source) then
		outputChatBox("#00ff88● #ffffffDigite /escada para por escada no chao para subir no poste", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", escada5, msgmarker9)



function msgmarker10(source)
	if getElementData(source, "eletricista") == true and isElementVisibleTo(poste5, source) then
		outputChatBox("#00ff88● #ffffffDigite /arrumar para arrumar o poste que esta quebrado", source, 255, 255, 255, true)
	end
end
addEventHandler("onMarkerHit", poste5, msgmarker10)






escada10 = {} -- Tabela vazia
escada11 = {} -- Tabela vazia ---
escada12 = {} -- Tabela vazia ---
efeito1 = {} -- Tabela vazia ---


escada13 = {} -- Tabela vazia
escada14 = {} -- Tabela vazia ---
escada15 = {} -- Tabela vazia ---
efeito2 = {} -- Tabela vazia ---


escada16 = {} -- Tabela vazia
escada17 = {} -- Tabela vazia ---
efeito3 = {} -- Tabela vazia ---



escada18 = {} -- Tabela vazia
escada19 = {} -- Tabela vazia ---
efeito4 = {} -- Tabela vazia ---


escada20 = {} -- Tabela vazia
escada21 = {} -- Tabela vazia ---
efeito5 = {} -- Tabela vazia ---





 
 ---------------------------------------------------POSTE 1------------------------------------------------------------------
  function escada(source)
        if isElementWithinMarker(source, escada1) and isElementVisibleTo(escada1, source) then	                 	     			
        setElementPosition(source, 262.57825, -1424.16284, 13.75428)	         				             
	    setPedAnimation(source,"bomber", "BOM_Plant_Loop", 1000, true, false, false, false) 
		setElementVisibleTo(blip1, source, false)
		 setElementVisibleTo(escada1, source, false)    
         setElementVisibleTo(poste1, source, true)         
                setTimer( function ()
				        escada10[source] = createObject ( 1437, 266.10000610352,-1430.3000488281, 21.700000762939,336,0,210) 
                        escada11[source] = createObject ( 1437, 264.39999389648, -1427.4000244141, 16.89999961853, 335.99487304688, 0, 209.99816894531)
      		            escada12[source] = createObject ( 1437, 262.89999389648, -1424.8000488281, 12.5, 335.99487304688, 0, 209.99816894531)   
				     
                end, 1000, 1)
				 end
				 end
 addCommandHandler("escada",escada)
 
 
  function poste(source)
        if isElementWithinMarker(source, poste1) and isElementVisibleTo(poste1, source) then		
                    setElementPosition(source,267.16772, -1432.15808, 25.93447)
					 setPedAnimation(source,"COLT45", "sawnoff_reload", 20000, true, false, false, false)  		    
                    efeito1[source] = createObject (2046, 267.5, -1432.6999511719, 26, 274.47143554688, 296.52319335938, 328.59301757813)
			    outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce esta arrumando o poste aguarde #00fa9a 20 segundos #ffffffpara terminar de arrumar!!!", source, 255, 255, 255, true)	
			         setElementVisibleTo(poste1, source, false)   
 setTimer( function ()
 destroyElement(efeito1[source])
end, 20000, 1)
					 
			         setTimer( function ()
				  	 destroyElement(escada10[source])
					 destroyElement(escada11[source])
					 destroyElement(escada12[source])
				
					 outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce arrumou um poste vai para o proximo local", source, 255, 255, 255, true)					 					 

		        
					 setElementVisibleTo(escada2, source, true)   
                     setElementVisibleTo(blip2, source, true)					 
				     end, 50000, 1)
	                         

						 triggerClientEvent(source, "som", source)	
         
				end
			
 end
 addCommandHandler("arrumar",poste)
 
 ---------------------------------------------------POSTE 2------------------------------------------------------------------
 
 function escadall(source)
        if isElementWithinMarker(source, escada2) and isElementVisibleTo(escada2, source) then	                 	     			
        setElementPosition(source, 1289.64075, -1406.13611, 13.14768)	         				             
	    setPedAnimation(source,"bomber", "BOM_Plant_Loop", 1000, true, false, false, false) 
		setElementVisibleTo(blip2, source, false)
		 setElementVisibleTo(escada2, source, false)    
         setElementVisibleTo(poste2, source, true)         
                setTimer( function ()
				        escada13[source] = createObject ( 1437, 1289.5999755859, -1412.5, 22.5, 339.99993896484, 0, 180) 
                        escada14[source] = createObject ( 1437, 1289.5999755859, -1409.5, 17.299999237061, 339.99938964844, 0, 179.99450683594)
      		            escada15[source] = createObject ( 1437, 1289.5999755859, -1406.5999755859, 12.300000190735, 339.99938964844, 0, 179.99450683594)   
				     
                end, 1000, 1)
				 end
				 end
 addCommandHandler("escada",escadall)
 
 
  function postell(source)
        if isElementWithinMarker(source, poste2) and isElementVisibleTo(poste2, source) then		
                    setElementPosition(source,1289.71936, -1414.51587, 27.01842)
					 setPedAnimation(source,"COLT45", "sawnoff_reload", 20000, true, false, false, false)  		    
                    efeito2[source] = createObject (2046, 1289.6999511719, -1415.3000488281, 27.200000762939, 276,180,180)
			         outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce esta arrumando o poste aguarde #00fa9a 20 segundos #ffffffpara terminar de arrumar!!!", source, 255, 255, 255, true)	
			         setElementVisibleTo(poste2, source, false)    
					 
					  setTimer( function ()
 destroyElement(efeito2[source])
end, 20000, 1)
			         setTimer( function ()
				  	 destroyElement(escada13[source])
					 destroyElement(escada14[source])
					 destroyElement(escada15[source])
			
			 outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce arrumou um poste vai para o proximo local", source, 255, 255, 255, true)					 					 

					 setElementVisibleTo(escada3, source, true)
                     setElementVisibleTo(blip3, source, true)					 
				     end, 50000, 1)
	                         
			
						 triggerClientEvent(source, "som", source)	
  
				end
			
 end
 addCommandHandler("arrumar",postell)
 
 
 ---------------------------------------------------POSTE 3-----------------------------------------------------------------------
 
 function escadalll(source)
        if isElementWithinMarker(source, escada3) and isElementVisibleTo(escada3, source) then	                 	     			
        setElementPosition(source, 2025.68176, -1748.35925, 13.38281)	         				             
	    setPedAnimation(source,"bomber", "BOM_Plant_Loop", 1000, true, false, false, false) 
		setElementVisibleTo(blip3, source, false)
		 setElementVisibleTo(escada3, source, false)    
         setElementVisibleTo(poste3, source, true)         
                setTimer( function ()
				        escada16[source] = createObject ( 1437, 2025.6999511719, -1744.9000244141, 18.10000038147, 339.99993896484, 0,0) 
                        escada17[source] = createObject ( 1437, 2025.6999511719, -1747.9000244141, 13, 339.99841308594,0,0)
      		        
                end, 1000, 1)
				 end
				 end
 addCommandHandler("escada",escadalll)
 
 
  function postelll(source)
        if isElementWithinMarker(source, poste3) and isElementVisibleTo(poste3, source) then		
                    setElementPosition(source,2025.67297, -1743.03003, 22.39486)
					 setPedAnimation(source,"COLT45", "sawnoff_reload", 20000, true, false, false, false)  		    
                    efeito3[source] = createObject (2046, 2025.6999511719, -1742.3000488281, 22.60000038147,82,0,0)
			         outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce esta arrumando o poste aguarde #00fa9a 20 segundos #ffffffpara terminar de arrumar!!!", source, 255, 255, 255, true)	
			         setElementVisibleTo(poste3, source, false)  

 setTimer( function ()
 destroyElement(efeito3[source])
end, 20000, 1)					 
			         setTimer( function ()
				  	 destroyElement(escada16[source])
					 destroyElement(escada17[source])
			
				 outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce arrumou um poste vai para o proximo local", source, 255, 255, 255, true)					 					 

                     setElementVisibleTo(escada4, source, true) 
                     setElementVisibleTo(blip4, source, true)					 
				     end, 50000, 1)
	                         
				
						 triggerClientEvent(source, "som", source)	
     
				end
			
 end
 addCommandHandler("arrumar",postelll)
 
 
 
  ---------------------------------------------------POSTE 4-----------------------------------------------------------------------
 
 function escadallll(source)
        if isElementWithinMarker(source, escada4) and isElementVisibleTo(escada4, source) then	                 	     			
        setElementPosition(source, 1844.41223, -1929.50122, 13.38455)	         				             
	    setPedAnimation(source,"bomber", "BOM_Plant_Loop", 1000, true, false, false, false) 
		setElementVisibleTo(blip4, source, false)
		 setElementVisibleTo(escada4, source, false)    
         setElementVisibleTo(poste4, source, true)         
                setTimer( function ()
				        escada18[source] = createObject ( 1437, 1844.4000244141, -1924.4000244141, 17.60000038147, 336, 0,0) 
                        escada19[source] = createObject ( 1437, 1844.4000244141, -1927.6999511719, 12.699999809265, 335.99487304688, 0,0)
      		        
                end, 1000, 1)
				 end
				 end
 addCommandHandler("escada",escadallll)
 
 
  function postellll(source)
        if isElementWithinMarker(source, poste4) and isElementVisibleTo(poste4, source) then		
                    setElementPosition(source,1844.47852, -1922.40723, 21.50410)
					 setPedAnimation(source,"COLT45", "sawnoff_reload", 20000, true, false, false, false)  		    
                    efeito4[source] = createObject (2046, 1844.4000244141, -1921.5, 21.60000038147, 84, 180, 180)
			         outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce esta arrumando o poste aguarde #00fa9a 20 segundos #ffffffpara terminar de arrumar!!!", source, 255, 255, 255, true)	
			         setElementVisibleTo(poste4, source, false)
 setTimer( function ()
 destroyElement(efeito4[source])
end, 20000, 1)
					 
			         setTimer( function ()
				  	 destroyElement(escada18[source])
					 destroyElement(escada19[source])

					  outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce arrumou um poste vai para o proximo local", source, 255, 255, 255, true)					 					 
	
                     setElementVisibleTo(escada5, source, true) 
                     setElementVisibleTo(blip5, source, true) 					 
				     end, 50000, 1)
	                         
				        		  
 	 				   
						 triggerClientEvent(source, "som", source)	
         
				end
			
 end
 addCommandHandler("arrumar",postellll)
 
  ---------------------------------------------------POSTE 5-----------------------------------------------------------------------
 
 function escadalllll(source)
        if isElementWithinMarker(source, escada5) and isElementVisibleTo(escada5, source) then	                 	     			
        setElementPosition(source, 2285.42871, -2235.07080, 13.54688)	         				             
	    setPedAnimation(source,"bomber", "BOM_Plant_Loop", 1000, true, false, false, false) 
		setElementVisibleTo(blip5, source, false)
		 setElementVisibleTo(escada5, source, false)    
         setElementVisibleTo(poste5, source, true) 

		 
                setTimer( function ()
				        escada20[source] = createObject ( 1437, 2282.8000488281, -2232, 18.39999961853, 336, 0,40) 
                        escada21[source] = createObject ( 1437, 2284.8999023438, -2234.5, 13.60000038147, 335.99487304688, 0, 39.995727539063)
      		        
                end, 1000, 1)
				 end
				 end
 addCommandHandler("escada",escadalllll)
 
 
  function postelllll(source)
        if isElementWithinMarker(source, poste5) and isElementVisibleTo(poste5, source) then		
                     setElementPosition(source,2281.56860, -2230.49512, 22.33304)
					 setPedAnimation(source,"COLT45", "sawnoff_reload", 20000, true, false, false, false)  		    
                     efeito5[source] = createObject (2046, 2281, -2229.8000488281, 22.5, 84,180,220)
			         outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce esta arrumando o poste aguarde #00fa9a 20 segundos #ffffffpara terminar de arrumar!!!", source, 255, 255, 255, true)	
			         setElementVisibleTo(poste5, source, false)	
					 setTimer( function ()
					 destroyElement(efeito5[source])
					 end, 20000, 1)					 
			         setTimer( function ()
				  	 destroyElement(escada20[source])
					 destroyElement(escada21[source])
					 local pay = math.random(50,500)
					 local ganho = math.random (20, 135)
					 exports.san_Level:givePlayerExp(source, ganho )
					 setElementData(source,"char:money", getElementData(source,"char:money") + pay)
					 outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce recebeu #00ff00"..pay.." Reais #ffffff ao total e terminou o emprego retorne para a empresa para iniciar o trabalho novamente", source, 255, 255, 255, true)					 					 
					 setElementVisibleTo(escada1, source, true)
                     			 
				     end, 50000, 1)
	    
						 triggerClientEvent(source, "som", source)	
    
				end
			
 end
 addCommandHandler("arrumar",postelllll)


 

eletricista = createMarker(2681.224609375,-1953.1666259766,13.60781288147,"cylinder", 1.2, 0 ,0 ,0, 0) --MARKER INICIAR TRABALHO



blip1 = createBlip (262.57825, -1424.16284, 13.75428, 0, 0, 255, 0, 0, 255,0 , 200 )
setElementVisibleTo(blip1, root, false)
setBlipVisibleDistance(blip1, 999999)



blip2 = createBlip ( 1289.64075, -1406.13611, 13.14768, 0, 0, 255, 0, 0, 255,0 , 200 )
setElementVisibleTo(blip2, root, false)
setBlipVisibleDistance(blip2, 99999)


blip3 = createBlip (2025.68176, -1748.35925, 13.38281, 0, 0, 255, 0, 0, 255,0 , 200 )
setElementVisibleTo(blip3, root, false)
setBlipVisibleDistance(blip3, 99999)



blip4 = createBlip ( 1844.41223, -1929.50122, 13.38455, 0, 0, 255, 0, 0, 255,0 , 200 )
setElementVisibleTo(blip4, root, false)
setBlipVisibleDistance(blip4, 99999)


blip5 = createBlip ( 2285.42871, -2235.07080, 13.54688, 0, 0, 255, 0, 0, 255,0 , 200 )
setElementVisibleTo(blip5, root, false)
setBlipVisibleDistance(blip5, 99999)








local levelnecessario = 0 --- MUDAR AQUI LEVEL PARA EMPREGO
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function eletricistatrabalhar ( source )
if not isElementWithinMarker(source, eletricista) then return end
if (exports.san_employment:getPlayerJob(source,true) == "eletricista") then 
triggerEvent("RemoverBlip",source)
local id = getElementModel ( source ) 
if not isElementWithinMarker(source, eletricista) then return end
if getElementData(source, "eletricista", true) then
outputChatBox("#00FA9A[IRG - Eletricista] Voçe ja esta trabalhando",source,255,255,255,true)
else
local level = getElementData(source,"Level") or 0
if not (level>= 0) then outputChatBox("#ff0000[ERROR] #ff0000Voce precisa do Level " ..levelnecessario.. " para começar esse emprego", Jogador, 255, 255, 255, true) return end
outputChatBox("#00fa9a[IRG - Eletricista] #ffffffVoce começou trabalhar na empresa de compania de luz ",source,255,255,255,true)
outputChatBox("#00fa9a[IRG - Eletricista] #ffffffVá até a Marcação vermelha para começar o trabalho ",source,255,255,255,true)
setElementData(source,"Skin",id)
setElementData(source, "eletricista", true)
setPedSkin(source, 260) 
setElementVisibleTo(escada1, source, true)
setElementVisibleTo(blip1, source, true)

end 
else
outputChatBox("#ff0000[ERROR] #ff0000Você Precisa Ser Encaminhado Da Agencia De Empregos", source, 255, 255, 255, true)
end
end
addCommandHandler("trabalhar", eletricistatrabalhar)

-------------------------------------------------------------------------------------------------------
function Hitareletricista ( source )
if isPedInVehicle(source) then return end
if getElementData(source, "eletricista", true) then
outputChatBox("#00FA9A[IRG - Eletricista] /saireletricista #ffffffPara sair do emprego", source, 255, 255, 255, true)
outputChatBox("#00FA9A[IRG - Eletricista] /emprego #ffffffPara ver os comando do emprego", source, 255, 255, 255, true)
else

outputChatBox("#00FA9A[IRG - Eletricista] /trabalhar #ffffffPara iniciar o emprego de eletricista", source, 255, 255, 255, true)
end
end
addEventHandler("onMarkerHit", eletricista, Hitareletricista)


------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
function Empregoeletricista ( source )
if getElementData(source, "eletricista", true) then
outputChatBox("#00FA9A[IRG - Eletricista] /arrumar #ffffff para concertar os poste de energia quebrado", source, 255, 255, 255, true)
outputChatBox("#00FA9A[IRG - Eletricista] /escada #ffffff para colocar as escada no poste para subir e arrumar", source, 255, 255, 255, true)

else
-- NHE

				 end 
				  end
addCommandHandler("emprego", Empregoeletricista )

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

function Saireletricista ( source )
	if getElementData(source, "eletricista") == true then
		setElementData(source, "eletricista", false)
		setElementData(source, "Encaminhamento", false)
		exports.san_employment:setPlayerJob(source, "Desempregado", "0",true)
		exports.san_infobox:addNotification(source, "Você foi demitido!", "success")
	
local Skin = getElementData(source,"Skin")
setElementModel ( source, Skin )
setElementData(source,"Skin",0)

setElementVisibleTo(poste1, source, false)
setElementVisibleTo(poste2, source, false)
setElementVisibleTo(poste3, source, false)
setElementVisibleTo(poste4, source, false)
setElementVisibleTo(poste5, source, false)

setElementVisibleTo(escada1, source, false)
setElementVisibleTo(escada2, source, false)
setElementVisibleTo(escada3, source, false)
setElementVisibleTo(escada4, source, false)
setElementVisibleTo(escada5, source, false)

setElementVisibleTo(blip1, source, false)
setElementVisibleTo(blip2, source, false)
setElementVisibleTo(blip3, source, false)
setElementVisibleTo(blip4, source, false)
setElementVisibleTo(blip5, source, false)



destroyElement(escada10[source])
destroyElement(escada11[source])
destroyElement(escada12[source])
destroyElement(escada13[source])
destroyElement(escada14[source])
destroyElement(escada15[source])
destroyElement(escada16[source])
destroyElement(escada17[source])
destroyElement(escada18[source])
destroyElement(escada19[source])
destroyElement(escada20[source])
destroyElement(escada21[source])

destroyElement(efeito1[source])
destroyElement(efeito2[source])
destroyElement(efeito3[source])
destroyElement(efeito4[source])
destroyElement(efeito5[source])

                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 		
		outputChatBox("#00FA9A[IRG - Eletricista] #ffffffVoce #ff0000saiu #ffffffdo emprego de eletricista para retornar ao emprego digite #ffff00/trabalhar novamente",source,255,255,255,true)																		

	end 
end
addCommandHandler("saireletricista", Saireletricista)
addEventHandler ( "onPlayerQuit", root, Saireletricista )

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------



--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==Iniciar Mod--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==- 

function pickup () 

objects = {                                  

{2681.224609375,-1953.1666259766,13.60781288147},
} --


for i, pos in ipairs(objects) do
local ob = createObject(1210, unpack(objects[i]))
setObjectScale(ob, 2)
setElementCollisionsEnabled(ob, false)
local x, y, z = getElementPosition(ob)
setTimer(moveObject, 2000, 0, ob, 2000, x, y, z, 0, 0, 360)
end 



collenhador = createColSphere(1696.42053, -1715.28430, -53.04463, 1)
end
addEventHandler("onResourceStart", resourceRoot, pickup)


 









 
 














 
 





