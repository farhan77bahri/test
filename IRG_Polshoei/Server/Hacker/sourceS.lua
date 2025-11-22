--[[
enterH = createMarker(1243.253, 216.985, 22.056, "cylinder", 1.1, 255, 0, 0, 50)
blipH = createBlipAttachedTo ( enterH, 59 )

function enterJob (thePlayer)
     if not (getElementData(thePlayer, "JOB")) then
		 setElementData(thePlayer, "JOB", true)
		 setElementData(thePlayer, "ILEGAIS:Job", 5)
	     outputChatBox(" ", thePlayer, 255,255,255, true)
		 outputChatBox(" ", thePlayer, 255,255,255, true)
		 exports.Script_futeis:setGPS(thePlayer, "Coordenada", 1243.253, 216.985, 22.056)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFVá até a #7cc576Marcação de Boneco Roxo #FFFFFFno mapa.", thePlayer, 255,255,255, true)
		 outputChatBox("#7cc576[ILEGAIS] #FFFFFFPara iniciar seu serviço.", thePlayer, 255,255,255, true)
		 else
		 outputChatBox("#7cc576[BTC ERROR] #FFFFFFVocê já está em um serviço ilegal #7cc576digite #FFFFFFo comando #7cc576/demitir #FFFFFFpara sair.", thePlayer, 255,255,255, true)
	 end
end
addEvent("JOB:Hacker", true)
addEventHandler("JOB:Hacker", root, enterJob)

function enterHouse (thePlayer)
     if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then return end
	         setElementPosition(thePlayer, 2524.016, -1280.919, 1048.289)
		     setElementDimension(thePlayer, 0)
		     setElementInterior(thePlayer, 2)
	 end
end
addEventHandler("onMarkerHit", enterH, enterHouse)

exitHA = createMarker(2529.677, -1282.108, 1047.289, "cylinder", 1.1, 255, 0, 0, 50)
setElementDimension(exitHA, 0)
setElementInterior(exitHA, 2)

function exit (thePlayer)
	     setElementPosition(thePlayer, 1234.722, 216.539, 19.555)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 0)
end
addEventHandler("onMarkerHit", exitHA, exit)

addEvent("JOB:Hacker", true)
addEventHandler("JOB:Hacker", root, 
function (thePlayer, mode, text, tim)
     if mode then
	     triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", root, mode, text, tim )
	 end
end)

addEvent("startLoad", true)
addEventHandler("startLoad", root, 
function (thePlayer, tim)
     if tim then
	     triggerClientEvent(thePlayer, "progressService", root, tim)
	 end
end)

posxX = {}
posyY = {}
poszZ = {}

addEvent("setaInfor", true)
addEventHandler("setaInfor", root, 
function (thePlayer, posX, posY, posZ)
     if posY then
	     posxX[thePlayer] = tonumber(posX)
		 posyY[thePlayer] = tonumber(posY)
		 poszZ[thePlayer] = tonumber(posZ)
	     exports.Script_futeis:setGPS(thePlayer, "Coordenada", posxX[thePlayer], posyY[thePlayer], poszZ[thePlayer])
	 end
end)

anims = {}

addEvent("Anim", true)
addEventHandler("Anim", root, 
function (thePlayer, anim1, anim2, timeStop)
     if anim1 then
		 setPedAnimation(thePlayer, anim1, anim2, -1, true, false, false )
		 setTimer(setPedAnimation, timeStop, 1,thePlayer)
		 anims[thePlayer] = true
	 end
end)

addEvent("cDx", true)
addEventHandler("cDx", root, 
function (thePlayer)
     triggerClientEvent(thePlayer, "cancelDx", root)
end)









object = {}
addEvent("mochilahackerON", true)
addEventHandler("mochilahackerON", root,
function(thePlayer)
	 --if (getElementData(thePlayer, "ILEGAIS:Job") == 5) then
         object[thePlayer] = createObject(1548, 0, 0, 0)
         exports["bone_attach"]:attachElementToBone(object[thePlayer],thePlayer,3,0,-0.005,-0.18,0,0,90)
	-- end
end
)

object = {}
addEvent("mochilahackerOFF", true)
addEventHandler("mochilahackerOFF", root,
function(thePlayer)
	 if isElement(object[thePlayer]) then
		 destroyElement(object[thePlayer])
	 end
end
)



addEventHandler("onPlayerQuit", root,
function ()
	 if isElement(object[source]) then
		 destroyElement(object[source])
	 end
end)

addEventHandler("onPlayerWasted", getRootElement( ),
function ()
	 if isElement(object[source]) then
		 destroyElement(object[source])
	 end
end)

function exirService(thePlayer) 
     if not getElementData(thePlayer, "ILEGAIS:Job") then return end
	 if isElement(object[thePlayer]) then
		 destroyElement(object[thePlayer])
	 end				 
	 end
addCommandHandler("demitir", exirService)
--]]