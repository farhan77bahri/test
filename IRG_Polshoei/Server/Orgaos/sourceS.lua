--[[
enter = createMarker(-2493.877, 2272.682, 3.958, "cylinder", 1.1, 255, 0, 0, 50)
blipM = createBlipAttachedTo ( enter, 21 )
setElementVisibleTo (blipM, root, false )

function enterJob (thePlayer)
     if not (getElementData(thePlayer, "JOB")) then
		 setElementData(thePlayer, "JOB", true)
		 setElementData(thePlayer, "ILEGAIS:Job", 3)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", -2493.7917480469,2270.8901367188,4.984375)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFVá até a #7cc576Marcação de Coração #FFFFFFno mapa.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFPara iniciar seu serviço.", thePlayer, 255,255,255, true)
		 setElementVisibleTo (blipM, thePlayer, true)
		 createPedOrgao(thePlayer)
		 else
	 outputChatBox("#7cc576[BTC ERROR] #FFFFFFVocê já está em um serviço ilegal #7cc576digite #FFFFFFo comando #7cc576/demitir #FFFFFFpara sair.", thePlayer, 255,255,255, true)
	 end
end
addEvent("JOB:Org", true)
addEventHandler("JOB:Org", root, enterJob)
--addCommandHandler("dd", enterJob)

function SenterJob (thePlayer)
	 outputChatBox(" ", thePlayer, 255,255,255, true)
	 outputChatBox(" ", thePlayer, 255,255,255, true)

	 
	exports.Script_futeis:setGPS(thePlayer, "Coordenada", -2493.7917480469,2270.8901367188,4.984375)


	 outputChatBox("#7cc576[ILEGAIS] #FFFFFFVá até a #7cc576Marcação de Coração #FFFFFFno mapa.", thePlayer, 255,255,255, true)
	 outputChatBox("#7cc576[ILEGAIS] #FFFFFFPara iniciar seu serviço.", thePlayer, 255,255,255, true)
	 setElementVisibleTo (blipM, thePlayer, true)
	 createPedOrgao(thePlayer)
end

function enterHouse (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then return end
   	     setElementPosition(thePlayer, 318.562, 1116.773, 1083.883)
   		 setElementDimension(thePlayer, 2)
   		 setElementInterior(thePlayer, 5)
	 end
end
addEventHandler("onMarkerHit", enter, enterHouse)

exitH = createMarker(318.58, 1114.902, 1082.883, "cylinder", 1.1, 255, 0, 0, 50)
setElementDimension(exitH, 2)
setElementInterior(exitH, 5)

function exit (thePlayer)
	     setElementPosition(thePlayer, -2494.091, 2269.59, 4.984)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 0)
end
addEventHandler("onMarkerHit", exitH, exit)

pedPosition = {
     {322.995, 1118.964, 1083.883},
     {322.267, 1127.333, 1083.883},
     {330.047, 1128.661, 1083.883},
     {332.156, 1128.554, 1083.883},
}

local skin = {
     {280},
	 {282},
	 {281},
	 {284},
	 {283},
	 {285},
	 {286},
	 {288},
	 {290},
}

newPed  = {}
col = {}
area = {}

markO = {}
 
function createPedOrgao(thePlayer)
	local id = math.random(#pedPosition)
		 if not isElement (newPed[thePlayer]) then
	         newPed[thePlayer] = createPed(0, pedPosition[id][1], pedPosition[id][2], pedPosition[id][3])
		 end
			 setElementModel(newPed[thePlayer], math.random(#skin))
			 
			 local x,y,z = getElementPosition(newPed[thePlayer])
		     markO[thePlayer] = createMarker(x, y, z, "arrow", 0.5 , 255, 0, 0, 100)
		     attachElements(markO[thePlayer], newPed[thePlayer], 0, 0, 0.5 )
			 setElementDimension(markO[thePlayer], 2)
			 setElementInterior(markO[thePlayer], 5)
			 
             setElementHealth(newPed[thePlayer], 0)
			 
			 setElementDimension(newPed[thePlayer], 2)
			 setElementInterior(newPed[thePlayer], 5)
	         setElementPosition(newPed[thePlayer], pedPosition[id][1], pedPosition[id][2], pedPosition[id][3])	
			 setElementVisibleTo (markO[thePlayer], root, false )
			 setElementVisibleTo (markO[thePlayer], thePlayer, true)
	         col[thePlayer] = createColSphere (pedPosition[id][1], pedPosition[id][2], pedPosition[id][3], 2)
			 setElementData(col[thePlayer], "colOwner", getPlayerName(thePlayer))
		     addEventHandler("onColShapeHit", col[thePlayer], enterCol)
		     addEventHandler("onColShapeLeave", col[thePlayer], exitCol)
	         local x,y,z = pedPosition[id][1], pedPosition[id][2], pedPosition[id][3]
	         setElementFrozen(newPed[thePlayer], true)
end

function enterCol (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
	     if (getElementData(source, "colOwner") == getPlayerName(thePlayer)) then
	         triggerClientEvent(thePlayer, "infoOrg", root, thePlayer)
		 end
	 end
end

function exitCol (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
	     triggerClientEvent(thePlayer, "infoOrg-Off", root, thePlayer)
	 end
end

object1 = {}
object2 = {}
object3 = {}
object4 = {}

addEvent('startLoadOrg', true)
addEventHandler('startLoadOrg', root, function(thePlayer)
	 triggerClientEvent(thePlayer, "progressService", root, 15)
end)

timerMoch = {}

function anms (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
	     setPedAnimation(thePlayer, "BOMBER", "BOM_Plant_Loop", -1, true, false, false )
		 setTimer(setPedAnimation, 15000, 1,thePlayer)
		 local x,y,z = getElementPosition(thePlayer)
		     if isElement(newPed[thePlayer]) then
			     setTimer(function(thePlayer)
				 if isElement(newPed[thePlayer]) then
			         destroyElement(newPed[thePlayer])
				 end
			     	 object1[thePlayer] = createObject(2906, x - 0.4, y - 0.1, z - 1)
				     object2[thePlayer] = createObject(2905, x + 0.2, y + 0.6, z - 1)
				     object3[thePlayer] = createObject(2907, x - 0.6, y - 0.3, z - 1)
				     object4[thePlayer] = createObject(2908, x + 0.4, y + 0.6, z - 1) 
					 
					 setElementCollisionsEnabled(object1[thePlayer], false)
					 setElementCollisionsEnabled(object2[thePlayer], false)
					 setElementCollisionsEnabled(object3[thePlayer], false)
					 setElementCollisionsEnabled(object4[thePlayer], false)
					 
					 setElementDimension(object1[thePlayer], 2)
					 setElementDimension(object2[thePlayer], 2)
					 setElementDimension(object3[thePlayer], 2)
					 setElementDimension(object4[thePlayer], 2)
					 if isElement(markO[thePlayer]) then
					     destroyElement(markO[thePlayer])
					 end	
					 
					 setElementInterior(object1[thePlayer], 5)
					 setElementInterior(object2[thePlayer], 5)
					 setElementInterior(object3[thePlayer], 5)
					 setElementInterior(object4[thePlayer], 5)
					 object[thePlayer] = createObject(1548, 0, 0, 0)
                     exports["bone_attach"]:attachElementToBone(object[thePlayer],thePlayer,3,0,-0.005,-0.18,0,0,90)
					 timerMoch[thePlayer] = setTimer(MochilaDebug, 1000, 0, thePlayer)
					 entregarDestiny (thePlayer)
					 setElementFrozen(thePlayer, false)
					 
					 timerMochila = setTimer(deletCorpo, 30000, 1, thePlayer)
					 
					 if isElement(col[thePlayer]) then
	                     destroyElement(col[thePlayer])
						 setTimer(entregarDestiny, 3000, 1, thePlayer)
	                 end		  
			 end, 15000, 1, thePlayer)
	     end
     end
end
addEvent("Anim", true)
addEventHandler("Anim", root, anms)

function deletCorpo (thePlayer)
	 if isElement (object1[thePlayer]) then  
		 destroyElement(object1[thePlayer])
		 destroyElement(object2[thePlayer])
		 destroyElement(object3[thePlayer])
		 destroyElement(object4[thePlayer])
	 end		 
end

object = {}

entreg = {}
blipE  = {}

local ramdomLocal = {
     {1100.325, -1318.777, 12.74},
     {2097.675, -1447.974, 22.787},
     {2523.987, -1658.689, 14.494},
     {2515.102, -1681.009, 12.432},
     {1445.108, -1283.094, 12.547},
     {1445.333, -1353.482, 12.547},
     {1475.412, -1360.757, 10.883},
     {1556.408, -1421.062, 10.883},
     {518.231, -1758.774, 13.239},
     {662.303, -1788.466, 11.475},
     {713.182, -1802.206, 11.469},
     {771.118, -1810.36, 12.023},
     {879.584, -1820.929, 11.146},
     {1586.75, -1449.847, 12.539},
     {1666.881, -1510.009, 12.547},
     {1649.054, -1578.602, 12.53},
     {344.073, -71.19, 1.431},
     {1309.931, -1368.163, 12.545},
     {1365.348, -1438.438, 12.547},
     {1733.029, -1583.219, 13.161},	 
     {254.499, -158.343, 0.57},
     {254.683, -54.725, 0.57},
     {1025.801, -1771.016, 12.547},
     {969.542, -1811.853, 12.9},
     {866.582, -1798.239, 12.812}, 
     {763.007, -1792.401, 12.023},
     {685.635, -1774.183, 12.633},
     {1470.714, -1177.479, 22.922},
     {1698.568, -1668.052, 19.194},
     {1017.225, -1557.623, 13.866},
}

function entregarDestiny (thePlayer)
local idL = math.random(#pedPosition)
	 if (getElementData(thePlayer, "ILEGAIS:Job") == 3) then
	 if not isElement(entreg[thePlayer]) then
		 entreg[thePlayer] = createMarker(ramdomLocal[idL][1], ramdomLocal[idL][2], ramdomLocal[idL][3], "cylinder", 1.1, 255, 0, 0, 50)
		 --setElementData(entreg[thePlayer], "owner", getElementData(thePlayer, "char:id"))
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFVá até a #7cc576Marcação de Bandeira Vermelha #FFFFFFno mapa, em Los Santos.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFEntregue os orgãos.", thePlayer, 255,255,255, true)

		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", ramdomLocal[idL][1], ramdomLocal[idL][2], ramdomLocal[idL][3])
		 setElementData(entreg[thePlayer], "markOwner", getPlayerName(thePlayer))
		 
		 addEventHandler("onMarkerHit", entreg[thePlayer],
	     function(thePlayer)
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then outputChatBox("#7cc576[ILEGAIS] #FFFFFFSaia do veiculo para completar essa missão.", thePlayer, 255,255,255, true) return end
		if (getElementData(source, "markOwner") == getPlayerName(thePlayer)) then
			if isElement(object[thePlayer]) then
		     destroyElement(object[thePlayer])
			 end
	     	 outputChatBox(" ", thePlayer, 255,255,255, true)
			 local money = math.random(1000, 2500)
			 outputChatBox(" ", thePlayer, 255,255,255, true)
			 outputChatBox(" ", thePlayer, 255,255,255, true)
			local x,y,z = getElementPosition(thePlayer)
			 exports.Script_futeis:setGPS(thePlayer, "Coordenada", x,y,z)
		     outputChatBox("#7cc576[ILEGAIS] #FFFFFFEntregua recebida, #7cc576D$"..money.."#FFFFFF Pago.", thePlayer, 255,255,255, true)	
			 setElementData(thePlayer, "char:moneysujo", (getElementData(thePlayer, "char:moneysujo") or 0) + money  )
             setTimer(SenterJob, 10000, 1, thePlayer)
			 if isTimer(timerMoch[thePlayer]) then
			     killTimer(timerMoch[thePlayer])
			 end
             if isElement(entreg[thePlayer]) then
			     destroyElement(entreg[thePlayer])
			 end
		     if isElement(blipE[thePlayer]) then
				 destroyElement(blipE[thePlayer])
		 end
	 end
end
)


	     end
	 end
end
--]]