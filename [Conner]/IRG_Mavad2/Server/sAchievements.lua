
function exirService(thePlayer) 
     if not getElementData(thePlayer, "ILEGAIS:Job") then return end
	     if (getElementData(thePlayer, "ILEGAIS:Job") == 1) then
		     removeElementData(thePlayer, "ILEGAIS:Job")
			 removeElementData(thePlayer, "JOB")
			 local x,y,z = getElementPosition(thePlayer)
			 exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
			 outputChatBox(" ", thePlayer, 255,255,255, true)
			 outputChatBox(" ", thePlayer, 255,255,255, true)
			 outputChatBox(" ", thePlayer, 255,255,255, true)
			 outputChatBox("#7cc576[Info - Sucesso] #FFFFFFTa liberado dos corre fih, Ate mais  #7cc576CRIA.", thePlayer, 255,255,255, true)
			 outputChatBox("#7cc576[Trampo]: #FFFFFFTraficante de Drogas.", thePlayer, 255,255,255, true)
		 end
	        if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
     		     removeElementData(thePlayer, "ILEGAIS:Job")
			     removeElementData(thePlayer, "JOB")
		    	 local x,y,z = getElementPosition(thePlayer)
	     		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
    			 outputChatBox(" ", thePlayer, 255,255,255, true)
	    		 outputChatBox(" ", thePlayer, 255,255,255, true)
	    		 outputChatBox(" ", thePlayer, 255,255,255, true)
	    		 outputChatBox("#7cc576[Info - Sucesso] #FFFFFFTa liberado dos corre fih, Ate mais #7cc576CRIA.", thePlayer, 255,255,255, true)
    			 outputChatBox("#7cc576[Trampo]: #FFFFFFHackerman.", thePlayer, 255,255,255, true)
				 
				 triggerEvent("mochilahackerOFF", thePlayer, thePlayer)
		     end
	     if (getElementData(thePlayer, "ILEGAIS:Job") == 2) then
		     removeElementData(thePlayer, "ILEGAIS:Job")
			 removeElementData(thePlayer, "JOB")

			local x,y,z = getElementPosition(thePlayer)
			exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
			 if (getElementData(thePlayer, "idAction")) then 
				 else
			         outputChatBox("#7cc576[Info - Sucesso] #FFFFFFTa liberado dos corre fih, Ate mais #7cc576CRIA.", thePlayer, 255,255,255, true)
			         outputChatBox("#7cc576[Trampo]: #FFFFFFMatador de Aluguel.", thePlayer, 255,255,255, true)
					 local x,y,z = getElementPosition(thePlayer)
					 deletAllService(thePlayer)
			         exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
			     end
		     end
	         if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
		         removeElementData(thePlayer, "ILEGAIS:Job")
			     removeElementData(thePlayer, "JOB")

			     local x,y,z = getElementPosition(thePlayer)
		         exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
		         outputChatBox("#7cc576[Info - Sucesso] #FFFFFFTa liberado dos corre fih, Ate mais #7cc576CRIA.", thePlayer, 255,255,255, true)
		         outputChatBox("#7cc576[Trampo]: #FFFFFFTraficante de Orgãos.", thePlayer, 255,255,255, true)
				 local x,y,z = getElementPosition(thePlayer)
			     exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
				 setElementFrozen(thePlayer, false)
				 deletAllService(thePlayer)
				 setPedAnimation(thePlayer)
			     triggerClientEvent(thePlayer, "cancelMissoes", root)
		    	 if isTimer(timerMoch[thePlayer]) then
			         killTimer(timerMoch[thePlayer])
			     end
			     if isElement(markO[thePlayer]) then
				     destroyElement(markO[thePlayer])
             end				 
	 end
end
addCommandHandler("demitir", exirService)

function deletAllService(thePlayer)
         if (isElement(newPed[thePlayer])) then
	         destroyElement(newPed[thePlayer])
	     end
	     if isElement(col[thePlayer])  then
	         destroyElement(col[thePlayer])
	     end
		 if isElement(object[thePlayer]) then
		     destroyElement(object[thePlayer])
		 end
			 if isTimer(timerMoch[thePlayer]) then
			     killTimer(timerMoch[thePlayer])
			 end		 
	     if isElement (object1[thePlayer]) then  
	         destroyElement(object1[thePlayer])
	      	 destroyElement(object2[thePlayer])
	       	 destroyElement(object3[thePlayer])
	         destroyElement(object4[thePlayer])
	     end	
         if isElement(entreg[thePlayer]) then
             destroyElement(entreg[thePlayer])
        	 destroyElement(blipE[thePlayer])
	 end
end

addEventHandler("onPlayerQuit", root,
function ()
	 deletAllService(source)
	 
         if (isElement(newPed[source])) then
	         destroyElement(newPed[source])
	     end
	     if isElement(col[source])  then
	         destroyElement(col[source])
	     end
		 if isElement(object[source]) then
		     destroyElement(object[source])
		 end
	     if isElement (object1[source]) then  
	         destroyElement(object1[source])
	      	 destroyElement(object2[source])
	       	 destroyElement(object3[source])
	         destroyElement(object4[source])
	     end	
         if isElement(entreg[source]) then
             destroyElement(entreg[source])
        	 destroyElement(blipE[source])
	 end


end)

addEventHandler("onPlayerWasted", getRootElement( ),
function ()
	 deletAllService(source)
	 
         if (isElement(newPed[source])) then
	         destroyElement(newPed[source])
	     end
	     if isElement(col[source])  then
	         destroyElement(col[source])
	     end
		 if isElement(object[source]) then
		     destroyElement(object[source])
		 end
	     if isElement (object1[source]) then  
	         destroyElement(object1[source])
	      	 destroyElement(object2[source])
	       	 destroyElement(object3[source])
	         destroyElement(object4[source])
	     end	
         if isElement(entreg[source]) then
             destroyElement(entreg[source])
        	 destroyElement(blipE[source])
	 end


end)