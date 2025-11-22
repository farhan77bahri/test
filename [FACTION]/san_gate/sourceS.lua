 
 --Portão Taxi
gate = createObject (16773, 1286.3621826172, -1652.2672119141, 16.546875 , 0, 0, 89 )                                             
local marker = createMarker( 1286.8142089844, -1652.1851806641, 13.546875  - 1, "cylinder", 10, 255, 255, 255, 0)

function moveGate(thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
if exports.san_dashboard:isPlayerInFaction(thePlayer , 19) or (exports.san_employment:getPlayerJob(thePlayer,true) == "Taxista") or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
           moveObject ( gate, 1000, 1286.3621826172, -1652.2672119141, 8.546875) 
end
end
end
addEventHandler("onMarkerHit", marker, moveGate)

function moveGate(thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		if exports.san_dashboard:isPlayerInFaction(thePlayer , 19) or (exports.san_employment:getPlayerJob(thePlayer,true) == "Taxista") or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
		   moveObject ( gate, 1000, 1286.3621826172, -1652.2672119141, 16.546875 )
		end
	end
end
addEventHandler("onMarkerLeave", marker, moveGate)





--PORTÃO PM
local markerPM = createMarker( 1548.8664550781, -1627.5307617188, 14.3828125  - 1, "cylinder", 10, 255, 255, 255, 0)
myGate1 = createObject ( 980, 1548.8664550781, -1627.5307617188, 14.5, 0, 0, 90 )

 function openMyGate (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		--if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "ROTA" ) ) ) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			 if exports.san_dashboard:isPlayerInFaction(thePlayer , 1) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate1, 1500, 1548.8664550781, -1627.5307617188, 9.0, 0 )
end
end
end
addEventHandler("onMarkerHit", markerPM, openMyGate)
 
 
 function movingMyGateBack (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		--if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "ROTA" ) ) ) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			 if exports.san_dashboard:isPlayerInFaction(thePlayer , 1) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate1, 1500, 1548.8664550781, -1627.5307617188, 14.5 )
end
 end
end
addEventHandler("onMarkerLeave", markerPM, movingMyGateBack)




 
--portão DRVV
local marker = createMarker( 1548.0520019531, -2276.41015625, 15.05063533783  - 1, "cylinder", 7, 255, 255, 255, 0)
Gate = createObject ( 980,1548.6744384766, -2274.6843261719,15.05063533783 , 0, 0, 179.49462890625 )

function Portao1(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer , 18) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (Gate, 1000, 1548.6744384766, -2274.6843261719,0 )
			end
		end
	end
end
addEventHandler("onMarkerHit", marker, Portao1)


function Portao2(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer , 18) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (Gate, 1000, 1548.6744384766, -2274.6843261719,15.05063533783 )
			end
		end
	end
end
addEventHandler("onMarkerLeave", marker, Portao2)



--Portão Pmpr
local markerPMPR = createMarker( -1571.896, 661.515, 8.188, "cylinder", 7, 255, 255, 255, 0)
GatePMPR = createObject ( 16775, -1571.896, 661.515, 8.188, -0, 0, 90.987 )

function Portao5(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer, 4) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (GatePMPR, 1000, -1571.896, 661.515, 18.188 )
			end
		end
	end
end
addEventHandler("onMarkerHit", markerPMPR, Portao5)

function Portao6(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer, 4) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (GatePMPR, 1000, -1571.896, 661.515, 8.188 )
			end
		end
	end
end
addEventHandler("onMarkerLeave", markerPMPR, Portao6)



--Portão Rockfellers Family  2725.8908691406, -2282.9174804688, 16.7890625
PortaoRock = createObject ( 3113, 2608, -2281.1000976563, -0.40000000596046, 0, 0, 0 )
local AreaRock = createMarker( 2608.5405273438, -2280.7873535156, 0.79555296897888, "cylinder", 10.0, 255, 255, 255, 0)

function Portao000(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 30) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoRock, 1000, 2608, -2281.1000976563, -10.40000000596046 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaRock, Portao000)


function Portao00(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 30) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoRock, 1000, 2608, -2281.1000976563, -0.40000000596046 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaRock, Portao00)--


--Portão Rockfellers Family 2
PortaoRock2 = createObject ( 1967, 2725.4, -2283.0, 17.1, 0, 0, 91 )
local AreaRock2 = createMarker( 2726.1359863281, -2282.5725097656, 16.7890625, "cylinder", 3.0, 255, 255, 255, 0)

function Portao0002(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 30) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoRock2, 1000, 2721.4, -2283.0, 17.1 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaRock2, Portao0002)


function Portao002(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 30) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoRock2, 1000, 2725.4, -2283.0, 17.1 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaRock2, Portao002)--


--Portão da Polícia Civil
PortaoGOE = createObject ( 2930, 1288.7, -1350.8120117188, 17.4, 0, 0, 90 )
local AreaDp = createMarker( 1289.3104248047, -1351.2015380859, 15.907936096191, "cylinder", 2, 255, 255, 255, 0)

function Portao21(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer , 3) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (PortaoGOE, 1000, 1290, -1350.8120117188, 17.4 )--Abrir
			end
		end
	end
end
addEventHandler("onMarkerHit", AreaDp, Portao21)


function Portao22(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
			if exports.san_dashboard:isPlayerInFaction(thePlayer , 3) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
				moveObject (PortaoGOE, 1000, 1288.7, -1350.8120117188, 17.4 )--Fechar
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaDp, Portao22)





--Portão da Força Tatíca
PortaoFT = createObject ( 980, -2566.4211425781, 578.23504638672, 16.0, -0, 0, -180 )
local AreaFT = createMarker( -2566.4211425781, 578.23504638672, 10.0, "cylinder", 7, 255, 255, 255, 0)

function Portao23(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 9) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoFT, 1000, -2566.4211425781, 578.23504638672, 9.0 )--Abrindo / Para onde vai abrir / Aberto
			end
		end
	end
end
addEventHandler("onMarkerHit", AreaFT, Portao23)

function Portao24(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 9) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoFT, 1000, -2566.4211425781, 578.23504638672, 16.0 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaFT, Portao24)




--Portão da PMSC
PortaoPMSC = createObject ( 980, 1577.6024169922, 712.81640625, 12.0, -0, 0, 90 )
local AreaPMSC = createMarker( 1577.6024169922, 712.81640625, 12.0, "cylinder", 7, 255, 255, 255, 0)

function Portao25(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 8) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPMSC, 1000, 1577.6024169922, 712.81640625, 5.0 )--Abrindo / Para onde vai abrir / Aberto
			end
		end
	end
end
addEventHandler("onMarkerHit", AreaPMSC, Portao25)


function Portao26(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 8) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPMSC, 1000, 1577.6024169922, 712.81640625, 12.0 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaPMSC, Portao26)




--Portão do Ministro
PortaoMinisterio = createObject ( 980, 1399.0532226563, -1700.2640380859, 15.1, 0, 0, 1 )
local AreaMinisterio = createMarker( 1395.0327148438, -1700.4287109375, 13.0, "cylinder", 2.5, 255, 255, 255, 0)

function Portao27(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 7) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoMinisterio, 1000, 1399.0532226563, -1700.2640380859, 9.0 )--Abrindo / Para onde vai abrir / Aberto
			end
		end
	end
end
addEventHandler("onMarkerHit", AreaMinisterio, Portao27)


function Portao28(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 7) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoMinisterio, 1000, 1399.0532226563, -1700.2640380859, 15.1 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaMinisterio, Portao28)





--Portão dos Medicos
PortaoMedicos = createObject ( 1567, 1170.0, -1360.1, 12.9, 0, 0, 90 )
local AreaMedicos = createMarker( 1169.9729003906, -1359.3200683594, 13.824970245361, "cylinder", 2.5, 255, 255, 255, 0)

function Portao29(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 31) or exports.san_dashboard:isPlayerInFaction(thePlayer, 16) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoMedicos, 760, 1169.9729003906, -1360.1, 9 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaMedicos, Portao29)


function Portao30(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 31) or exports.san_dashboard:isPlayerInFaction(thePlayer, 16) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoMedicos, 760, 1170.0, -1360.1, 12.9 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaMedicos, Portao30)--




--Portão Polícia Federal
PortaoPF = createObject ( 980, 1977.6470947266, 703.23876953125, 11.4, 0, 0, 271 )
local AreaPF = createMarker( 1977.6470947266, 703.23876953125, 10.5, "cylinder", 5.0, 255, 255, 255, 0)

function Portao31(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 3) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPF, 1000, 1977.6470947266, 703.23876953125, 5 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaPF, Portao31)


function Portao32(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 3) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPF, 1000, 1977.6470947266, 703.23876953125, 11.4 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaPF, Portao32)--




--Portão Pmerj
PortaoPmerj = createObject ( 16775, -1146.7001953125, -977, 130.80000305176, 0, 0, 90 )
local AreaPmerj = createMarker( -1146.7001953125, -977, 130.80000305176, "cylinder", 7.0, 255, 255, 255, 0)

function Portao33(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 2) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPmerj, 1000, -1146.7001953125, -977, 124.0 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaPmerj, Portao33)


function Portao34(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 2) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoPmerj, 1000, -1146.7001953125, -977, 130.80000305176 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaPmerj, Portao34)--




--Portão Segundo BpChoque
PortaoChoque = createObject ( 980, 1032.7, -364.32531738281, 75.39966583252, 0, 0, 179 )
local AreaChoque = createMarker( 1033.0032958984, -363.93716430664, 74.481201171875, "cylinder", 7.0, 255, 255, 255, 0)

function Portao35(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 10) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoChoque, 1000, 1032.7, -364.32531738281, 60.39966583252 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaChoque, Portao35)


function Portao36(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 10) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoChoque, 1000, 1032.7, -364.32531738281, 75.39966583252 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaChoque, Portao36)--




--Portão Segundo BpChoque2  698.796875, -1629.7835693359, 3.6553654670715
PortaoChoque2 = createObject ( 980, 1017.0, -364.32531738281, 75.39966583252, 0, 0, 179 )
local AreaChoque2 = createMarker( 1017.1982421875, -363.93585205078, 74.52375793457, "cylinder", 7.0, 255, 255, 255, 0)

function Portao37(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 10) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoChoque2, 1000, 1017.0, -364.32531738281, 60.39966583252 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaChoque2, Portao37)


function Portao38(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 10) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoChoque2, 1000, 1017.0, -364.32531738281, 75.39966583252 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaChoque2, Portao38)--




--Portão Vagos 40.643196105957, 241.85577392578, 3.0062503814697
PortaoVagos = createObject ( 980, 698.796875, -1626.2, 3.6553654670715, 0, 0, 271 )
local AreaVagos = createMarker( 699.25573730469, -1629.7122802734, 3.4240207672119, "cylinder", 2.0, 255, 255, 255, 0)

function Portao39(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 28) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoVagos, 1000, 698.796875, -1626.2, -5 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaVagos, Portao39)


function Portao40(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 28) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoVagos, 1000, 698.796875, -1626.2, 3.6553654670715 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaVagos, Portao40)--




--Portão Bope
PortaoBope = createObject ( 980, 40.643196105957, 241.85577392578, 4.0, 0, 0, 331.0 )
local AreaBope = createMarker( 40.643196105957, 241.85577392578, 4.0, "cylinder", 6.0, 255, 255, 255, 0)

function Portao41(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 11) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoBope, 1000, 40.643196105957, 241.85577392578, -1.0 )--Abrindo / Para onde vai abrir / Aberto
			end 
		end
	end
end
addEventHandler("onMarkerHit", AreaBope, Portao41)


function Portao42(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				if exports.san_dashboard:isPlayerInFaction(thePlayer, 11) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (PortaoBope, 1000, 40.643196105957, 241.85577392578, 4.0 )--Fechado / Voltando ao normal / Posição do createObject
			end
		end
	end
end
addEventHandler("onMarkerLeave", AreaBope, Portao42)--


---mechanicccc


MECHANICC = createObject ( 1902,375.8408203125+0.1, -1827.3634033203+0.1, 7.8359375-1, 0, 0, 90 )
local AreaBope5 = createMarker( 375.8408203125, -1827.3634033203, 7.8359375, "cylinder", 6.0, 255, 255, 255, 0)

function ee(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				--if exports.san_dashboard:isPlayerInFaction(thePlayer, 11) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (MECHANICC, 1000, 375.8408203125+0.1, -1827.3634033203+0.1, 7.8359375-6 )--Abrindo / Para onde vai abrir / Aberto
			--end 
		end
	end
end
addEventHandler("onMarkerHit", AreaBope5, ee)


function eee(thePlayer)
	if getElementType(thePlayer) == "player" then 
		if getElementType(thePlayer) == "player" then 
			local accName = getAccountName(getPlayerAccount(thePlayer))
				--if exports.san_dashboard:isPlayerInFaction(thePlayer, 11) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ))) then
				moveObject (MECHANICC, 1000, 375.8408203125+0.1, -1827.3634033203+0.1, 7.8359375-1 )--Fechado / Voltando ao normal / Posição do createObject
			--end
		end
	end
end
addEventHandler("onMarkerLeave", AreaBope5, eee)--






--Mechanic


--local markerPM1 = createMarker( 399.28051757812, -1824.1370849609, 7.8808903694153  - 1, "cylinder", 10, 255, 255, 255, 0)
myGate11 = createObject ( 980, 392.15045166016+0.6, -1839.9350585938, 7.8553657531738+1.8, 0, 0, 0 )
markerPM1 = createColSphere(392.15045166016+0.6, -1839.9350585938, 7.8553657531738, 5, 1275, 0 )
 function openMyGate11 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		 if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
		 if isElementWithinColShape(thePlayer, markerPM1) then 

			-- if exports.san_dashboard:isPlayerInFaction(thePlayer , 1) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate11, 980, 392.15045166016+0.6, -1839.9350585938, 7.8553657531738-4, 0, 0, 0 )
end
end
end
end
addCommandHandler("down", openMyGate11)
--addEventHandler("onMarkerHit", markerPM1, openMyGate11)
 
 
 function movingMyGateBack11 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		--if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "ROTA" ) ) ) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			  if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
			  if isElementWithinColShape(thePlayer, markerPM1) then
 moveObject ( myGate11, 980,392.15045166016+0.6, -1839.9350585938, 7.8553657531738+1.8, 0, 0, 0 )
end
end
 end
end
addCommandHandler("up", movingMyGateBack11)
--addEventHandler("onMarkerLeave", markerPM1, movingMyGateBack11)
--11313
--[[
-----------------------------

--local markerPM11 = createMarker( 398.10545043945, -1796.3553466797, 8.8808903694153  - 1, "cylinder", 10, 255, 255, 255, 0)
myGate111 = createObject ( 11313, 398.10545043945, -1796.52934667, 8.8808903694153, 0, 0, -90 )

 function openMyGate111 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		 if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			-- if exports.san_dashboard:isPlayerInFaction(thePlayer , 1) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate111, 11313, 398.10545043945, -1796.52934667, 11.8808903694153, 0, 0, -0.1 )
end
end
end
addCommandHandler("mechup", openMyGate111)
--addEventHandler("onMarkerHit", markerPM1, openMyGate11)
 
 
 function movingMyGateBack111 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		--if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "ROTA" ) ) ) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			  if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate111, 11313, 398.10545043945, -1796.52934667, 8.8808903694153, 0, 0, 0 )
end
 end
end
addCommandHandler("mechdown", movingMyGateBack111)







--local markerPM12 = createMarker( 405, -1796.3553466797, 8.8808903694153  - 1, "cylinder", 10, 255, 255, 255, 0)
myGate112 = createObject ( 1867,375.8408203125, -1827.3634033203, 7.8359375, 0, 0, -90 )

 function openMyGate112 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		 if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			-- if exports.san_dashboard:isPlayerInFaction(thePlayer , 1) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate112,1867, 375.8408203125, -1827.3634033203, 7.8359375, 0, 0, 0.1 )
end
end
end
addCommandHandler("mechup", openMyGate112)
--addEventHandler("onMarkerHit", markerPM1, openMyGate11)
 
 
 function movingMyGateBack112 (thePlayer)
	if getElementType(thePlayer) == "player" then 
		local accName = getAccountName(getPlayerAccount(thePlayer))
		--if ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "ROTA" ) ) ) or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then

			  if getElementData(thePlayer, "char:dutyfaction") == 17 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) ) then
 moveObject ( myGate112, 11313, 405, -1796.52934667, 500.8808903694153, 0, 0, 0 )
end
 end
end
addCommandHandler("mechdown", movingMyGateBack112)

]]