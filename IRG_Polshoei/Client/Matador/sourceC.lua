--[[
function startFunction()
     if (getElementData(localPlayer, "ILEGAIS:Job") == 2) then
	     timerExec  = math.random(1)
		 setTimer(execFunction, timerExec*12000, 1)
	 end
end
addEvent("Matador", true)
addEventHandler("Matador", root, startFunction)

function execFunction ()
     if (getElementData(localPlayer, "ILEGAIS:Job") == 2) then
	     randomService = math.random(1)
		     createCena(randomService)
	 end
end

function createCena (cenaID)
cena = tonumber(cenaID)
     if (getElementData(localPlayer, "ILEGAIS:Job") == 2) then
	     if (cena == 1) then
		     outputChatBox("#7cc576[MATADOR] #FFFFFFSurgiu um cliente que quer que realize o serviço nas proximidades de.", 255,255,255, true)
		     outputChatBox("#7cc576[MATADOR] #FFFFFFVocê tem #7cc57615 Minutos #FFFFFFpara concluir.", 255,255,255, true)
			     local vitima = createPed(165, 1130.686, -1167.609, 31.028)
				 setElementRotation(vitima, -0, 0, 273.505)
				 local ped    = createPed(166, 1132.38, -1167.432, 31.028)
				 setElementRotation(ped, -0, 0, 91.64)
				 
				 local segurity  = createPed(187, 1143.708, -1160.16, 31.028)
				 local segurity2 = createPed(286, 1129.416, -1182.838, 31.028)
				 local segurity3 = createPed(166, 1137.84, -1182.656, 31.028)
				 local segurity4 = createPed(166, 1126.25, -1160.164, 31.028)
				 
				 setElementRotation(segurity, -0, 0, 176.454)
				 setElementRotation(segurity2, -0, 0, 354.512)
				 setElementRotation(segurity3, -0, 0, 354.512)
				 setElementRotation(segurity4, -0, 0, 176.454)
				 
				 zone = createColCuboid(1123.47620, -1183.62732, 31.03212, 21.12158203125, 24.189697265625, 10.113848114014)
		 end
	 end
end

addEventHandler("onColShapeHit", root,
     function ()
	     if (source == zone) then
		     outputChatBox("#7cc576[MATADOR] #FFFFFFViado.", 255,255,255, true)
		 end
	 end
)
--]]