local con = exports.san_mysql:getConnection()







--[[
CORPS:

BAEP
PMERJ
BOPE
PF/POLICIA FEDERAL
RADIO PATRULHA
ROTA
Exercito Brasileiro
PMPR
FT
BpChq
============================================================

FACS:

Milicia
BASTARDOS INGLORIUS
COMANDO VERMELHO
FAMILIA DO NORTE
MOTO CLUBE
PCC
grove
ballas
vagos
Odr
Club96
-]]

local AvisoTaxi = createMarker (1244.564453125, -1676.1829833984, 11.80127620697-1, "cylinder", 1.5, 55, 100, 0, 100 )
function AvisarTaxi( hitplayer )
	if (exports.san_employment:getPlayerJob(hitplayer,true) == "Taxista") or exports.san_dashboard:isPlayerInFaction(hitplayer , 19) then
    outputChatBox("#7cc576[IRG]: #ffffffType #7cc576/duty #ffffffto start taxi driver work", hitplayer, 255, 255, 0, true )
end
end
addEventHandler( "onMarkerHit", AvisoTaxi, AvisarTaxi )

local blip = createBlip (1277.072265625, -1652.0230712891, 16.671875, 42)
	setElementData(blip,"blip >> name", "Trabalho de Taxista")

-- Policia 1
local Baep = createColSphere(1886.4489746094, -1646.9307861328, 16.039939880371, 1)

-- Policia 2
local Pmerj = createColSphere(-1103.2280273438, -1063.2227783203, 129.26875305176, 3)

-- Policia 3				
local PoliciaCivil = createColSphere(1645.3842773438, -1324.1428222656, 25.551527023315,1)
--createColSphere(1887.7174072266, 657.21246337891, 10.8203125,3)
createMarker ( 1650.8099365234, -1328.7559814453, 16.5553646087, "cylinder", 1, 255, 255, 0, 170 )

-- Policia 4
local RadioPatrulha = createColSphere(-1588.5653076172, 675.55639648438, 15.355365753174,3)

-- Policia 5
local Rota = createColSphere(-2134.9604492188, -856.50073242188, 32.293983459473,3)

-- Policia 6
local ExercitoBrasileiro = createColSphere(224.29125976563, 1902.5748291016, 21.655364990234, 3)

-- Policia 7
local Ministerio = createColSphere(1412.2702636719, -1698.7316894531, 19.888145446777,3) 

-- Policia 8
local PMSC = createColSphere(1608.3552246094, 676.40875244141, 10.8203125,3)

-- Policia 9
local ForcaTatica = createColSphere(-2739.8942871094, 619.91540527344, 34.455368041992, 3)

-- Policia 10
local Choque = createColSphere(1011.2772827148, -308.75909423828, 74.706253051758, 3)

-- Policia 11
local Policia11 = createColSphere(29.835773468018, 274.68493652344, 8.055365562439, 1)

-- Policia 12
local Policia12 = createColSphere(1776.4361572266, -1140.8049316406, 24.155364990234, 3)

-- Policia 13
local Policia13 = createColSphere(2022.33, -1404.685, 17.182,3)

-- Policia 14
local Policia14 = createColSphere(1179.26, -1384.332, 13.632,3)

-- Policia 15
local Policia15 = createColSphere(1560.9700927734,-2268.9709472656,13.544875,5)

-- Samu
local Samu = createColSphere(2022.2239990234, -1404.7644042969, 17.181009292603,3)

-- Medicos
local Medicos = createColSphere(333.73574829102, -1484.322265625, 36.039062,1)


-- Mecanico
local Mecanico = createColSphere(380.97637939453, -1812.2946777344, 11.4077739715,1)

-- Detran
local Detran = createColSphere(1537.2578125, -2251.6613769531, 13.586245536804,3)

-- Taxi
local Taxi = createColSphere(1244.564453125, -1676.1829833984, 11.80127620697,1)

-- Gang 20
local ComandoVermelho = createColSphere(147.89471435547, 1374.6944580078, 1088.36718, 1)
setElementDimension(ComandoVermelho, 1949)
setElementInterior(ComandoVermelho, 5)--2

-- Gang 21
local Milicia = createColSphere(2349.2326660156, -1172.1025390625, 1027.9833984375, 3)
setElementDimension(Milicia, 0)
setElementInterior(Milicia, 5)

-- Gang 22
local BastardosIng = createColSphere(145.63832092285, 1386.7072753906, 1088.3671875, 3)
setElementDimension(BastardosIng, 0)
setElementInterior(BastardosIng, 5)

-- Gang 23
local Fdn = createColSphere(-292.53802490234, 1480.9765625, 1088.875, 3)
--setElementDimension(Pcc, 0)
--setElementInterior(Pcc, 15)

-- Gang 24
local MotoClube = createColSphere(3858.1730957031, -1177.5607910156, 3.6210470199585, 3)

-- Gang 25
local Pcc = createColSphere(-71.640396118164, 1366.3354492188, 1080.2185058594, 3)
setElementDimension(Pcc, 0)
setElementInterior(Pcc, 6)

-- Gang 26
local Groove = createColSphere(2261.3835449219, -1223.5716552734, 1049.0234375, 3)
setElementDimension(Groove, 0)
setElementInterior(Groove, 10)

-- Gang 27
local Ballas = createColSphere(2358.0537109375, -1135.0006103516, 1050.875, 3)
setElementDimension(Ballas, 0)
setElementInterior(Ballas, 8)

-- Gang 28
local Gang9 = createColSphere(-52.342887878418, 1404.3405761719, 1084.4370117188, 3)

-- Gang 29
local Gang10 = createColSphere(1278.3172607422, -785.76452636719, 1089.9375, 3)

-- Gang 30
local Rockfellers = createColSphere(2742.9562988281, -2280.6169433594, 1.7553654909134, 3)



local factionNames = {
	[1]="Baep",
	[2]="PMERJ",
	[3]="Polícia Civil",
	[4]="Rádio Patrulha",
	[5]="Rota",
	[6]="Policia 6",
	[7]="Grove Street",
	[8]="Policia 8",
	[9]="Policia 9",
	[10]="Policia 10",
	[11]="Policia 11",
	[12]="Policia 12",
	[13]="Policia 13",
	[14]="Policia 14",
	[15]="Policia 15",
	[16]="Samu",
	[17]="Mechanic",
	[18]="Detran",
	[19]="Taxi",
	[20]="C.V",
	[21]="Amigos dos Amigos",
	[22]="Bastardors Inglorius",
	[23]="Familia Do Norte",
	[24]="Moto Clube",
	[25]="Pimeiro Comando da Capital",
	[26]="Gang 7",
	[27]="Gang 8",
	[28]="Gang 9",
	[29]="Gang 10",
	[30]="Gang 11",
	[31]="Medic"
}


function sendGroupMessage(factionid, msg)
	for k, v in ipairs(getElementsByType("player")) do
	
		if exports.san_dashboard:isPlayerInFaction(v, tonumber(factionid))  then
			outputChatBox("#F9BF3B[" .. factionNames[factionid] .. "]#ffffff " .. msg, v, 255, 255, 255, true)
		end
	end
end
addEvent("sendGroupMessage", true)
addEventHandler("sendGroupMessage", root, sendGroupMessage)

function sendGroupMessageWithoutPlayer(player, factionid, msg)
	for k, v in ipairs(getElementsByType("player")) do
	
		--if exports.san_dashboard:isPlayerInFaction(v, factionid)  and getPlayerName(v) ~= getPlayerName(player) then
			outputChatBox("#F9BF3B[" .. factionNames[factionid] .. "]#ffffff " .. msg, v, 255, 255, 255, true)
		--end
	end
end

---------------------------------------------------------------------------------------------------------------

atmCooldown = {}
local atmBag = {}
local atmBagColShape = {}
local atmTimer = {}
local atmSerial = {}
ATM_TIMEOUT = 1*3

function atmSetTimeOut2 ( player, time )
    atmCooldown[player] = setTimer( 
    function (player) 
    atmCooldown[player] = nil 
    end, time, 1, player)
end

addEventHandler("onPlayerQuit", root,
    function ()
        if ( atmGetTimeOut2(source) ) then
            atmSerial[getPlayerSerial(source)] = atmGetTimeOut2(source)
        end
    end
)

addEventHandler("onPlayerJoin", root,
    function ()
        for serial, cooldown in pairs ( atmSerial ) do
            if ( getPlayerSerial(source) == serial ) then
                atmSetTimeOut2(source, cooldown*1000)
                atmSerial[serial] = nil
            end
        end
    end
)

function atmGetTimeOut2 ( player )
    if isTimer ( atmCooldown[player] ) then
        local miliseconds = getTimerDetails ( atmCooldown[player] )
        return math.ceil( miliseconds / 1000 )
    else
        return false
    end
end

function atmIsAbleToRob2 ( player )
    return not isTimer(atmCooldown[player])
end

---------------------------------------------------------------------------------------------------------------

local rootTable = {}










function dutyPlayers(player, commandName)

	if isTimer(timer) then 
	    if isElementWithinColShape(player, Medicos) or isElementWithinColShape(player, Baep) or isElementWithinColShape(player, Policia11) or isElementWithinColShape(player, Mecanico) or isElementWithinColShape(player, ComandoVermelho) then
		exports.san_infobox:addNotification(player,"Shoma Az /duty Sari Estefadeh Mikonid, Lotfan Sabor Bashid.","Errorr")
		end
		return end
	timer = setTimer(function() end, 3000, 1)


	local duty = getElementData(player, "char:duty") or false
	if isElementWithinColShape(player, Baep) and getElementDimension(player) == getElementDimension(Baep) then
		if exports.san_dashboard:isPlayerInFaction(player , 1) then
			if getElementData(player, "char:dutyfaction") ~= 1 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 165
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 1)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /job to join PD")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("You can only pick up the gun kit again in  ".. atmGetTimeOut2 ( player ) .. " Seconds", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))--getElementData(player, "duty:civilskin")
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Baep")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, Pmerj) and getElementDimension(player) == getElementDimension(Pmerj) then
		if exports.san_dashboard:isPlayerInFaction(player , 2) then
			if getElementData(player, "char:dutyfaction") ~= 2 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:prender", true)
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 2)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, 254)
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction PMERJ")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of PMEPRJ")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, PoliciaCivil) and getElementDimension(player) == getElementDimension(PoliciaCivil) then
	--outputChatBox("#7cc576[IRG-MTA] #ffffffBaraye Duty Az /duty Estefade Konid!",255, 255, 255, true)
	
		if exports.san_dashboard:isPlayerInFaction(player , 3) then
		--exports.san_infobox:addNotification(player,"Baraye Duty Az /duty Estefade Konid!","success")
			if getElementData(player, "char:dutyfaction") ~= 3 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 204
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 3)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				local number = {204, 168} 
				local numbers = number [ math.random ( #number ) ] 
				setElementModel(player, numbers)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Justice")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "Justice")
				setPlayerTeam(player, getTeamFromName ( "Justice" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, RadioPatrulha) and getElementDimension(player) == getElementDimension(RadioPatrulha) then
		if exports.san_dashboard:isPlayerInFaction(player, 4) then
			if getElementData(player, "char:dutyfaction") ~= 4 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:prender", true)
				setElementData(player, "char:dutyfaction", 4)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, 196)
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Rádio Patrulha")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Rádio Patrulha")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Rota) and getElementDimension(player) == getElementDimension(Rota) then
		if exports.san_dashboard:isPlayerInFaction(player , 5) then
			if getElementData(player, "char:dutyfaction") ~= 5 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 278
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 5)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Rota")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Rota")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, ExercitoBrasileiro) and getElementDimension(player) == getElementDimension(ExercitoBrasileiro) then
		if exports.san_dashboard:isPlayerInFaction(player , 6) then
			if getElementData(player, "char:dutyfaction") ~= 6 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:prender", true)
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 6)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, 78)
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 68, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				setElementData(player, "balas-sniper", 200)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Ministerio) and getElementDimension(player) == getElementDimension(Ministerio) then
		if exports.san_dashboard:isPlayerInFaction(player , 7) then
			if getElementData(player, "char:dutyfaction") ~= 7 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 187
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 7)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter no Ministerio")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "Minístro")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair do Ministerio")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, PMSC) and getElementDimension(player) == getElementDimension(PMSC) then
		if exports.san_dashboard:isPlayerInFaction(player , 8) then
			if getElementData(player, "char:dutyfaction") ~= 8 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:prender", true)
				setElementData(player, "char:dutyfaction", 8)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, 220)
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, ForcaTatica) and getElementDimension(player) == getElementDimension(ForcaTatica) then
		if exports.san_dashboard:isPlayerInFaction(player , 9) then
			if getElementData(player, "char:dutyfaction") ~= 9 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 295
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 9)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, Choque) and getElementDimension(player) == getElementDimension(Choque) then
		if exports.san_dashboard:isPlayerInFaction(player , 10) then
			if getElementData(player, "char:dutyfaction") ~= 10 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 10)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, 189)
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)		
				exports['san_items']:giveItem(player, 48, 1, 1, 1, true)	
				exports['san_items']:giveItem(player, 37, 1, 1, 1, true)
				
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Policia11) and getElementDimension(player) == getElementDimension(Policia11) then
		if exports.san_dashboard:isPlayerInFaction(player , 11) then
			if getElementData(player, "char:dutyfaction") ~= 11 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 248
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 11)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, Policia12) and getElementDimension(player) == getElementDimension(Policia12) then
		if exports.san_dashboard:isPlayerInFaction(player , 12) then
			if getElementData(player, "char:dutyfaction") ~= 12 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 12)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, math.random(106,107))
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Policia13) and getElementDimension(player) == getElementDimension(Policia13) then
		if exports.san_dashboard:isPlayerInFaction(player , 13) then
			if getElementData(player, "char:dutyfaction") ~= 13 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 295
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 13)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end

	
	if isElementWithinColShape(player, Policia14) and getElementDimension(player) == getElementDimension(Policia14) then
		if exports.san_dashboard:isPlayerInFaction(player , 14) then
			if getElementData(player, "char:dutyfaction") ~= 14 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
				if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 14)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, math.random(106,107))
				--setElementModel(player, dutySkin)


				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Policia15) and getElementDimension(player) == getElementDimension(Policia15) then
		if exports.san_dashboard:isPlayerInFaction(player , 15) then
			if getElementData(player, "char:dutyfaction") ~= 15 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 295
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 15)
				setElementData(player, "char:prender", true)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Policia")


			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 32, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 64, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)					
				-- if exports['san_items']:hasItemS(player, 112) then
				exports['san_items']:giveItem(player, 52, 1, 1, 1, true)
				-- end
				exports['san_items']:giveItem(player, 50, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 49, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				--setElementData(player, "balas-pistola", 200)
				--setElementData(player, "balas-shotgun", 200)
				--setElementData(player, "balas-submetralhadora", 200)
				--setElementData(player, "balas-fuzil", 200)

				else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
				end


				setElementData(player, "job", "LSPD")
				setPlayerTeam(player, getTeamFromName ( "LSPD" ))


				else
			exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
			setElementData(player, "char:duty", false)
			setElementData(player, "char:dutyfaction", false)
			setElementData(player, "char:prender", false)
			setElementModel(player, getElementData(player, "char:skin"))
			setElementFrozen(player, false)
			setPedArmor(player, 0)
			exports['san_items']:RemovePlayerDutyItems(player)
	
			setPlayerTeam(player, nil)
			setElementData(player, "job", "Bikar")

			--[[
			exports['san_items']:takePlayerItemToID(player, 32, 0)
			exports['san_items']:takePlayerItemToID(player, 64, 0)
			exports['san_items']:takePlayerItemToID(player, 84, 0)
			exports['san_items']:takePlayerItemToID(player, 52, 0)
			exports['san_items']:takePlayerItemToID(player, 50, 0)
			exports['san_items']:takePlayerItemToID(player, 49, 0)
			exports['san_items']:takePlayerItemToID(player, 45, 0)
			]]--

			--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Polícia")


			takeAllWeapons(player)
			--setElementData(player, "balas-pistola", 0)
			--setElementData(player, "balas-shotgun", 0)
			--setElementData(player, "balas-submetralhadora", 0)
			--setElementData(player, "balas-fuzil", 0)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Samu) and getElementDimension(player) == getElementDimension(Samu) then
		if exports.san_dashboard:isPlayerInFaction(player , 16) then
			if getElementData(player, "char:dutyfaction") ~= 16 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 274
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 16)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter no resgate")
				
				exports['san_items']:giveItem(player, 80, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 37, 1, 1, 1, true)
				setElementData(player, "char.inDuty", 1)
				--setElementData(player, "balas-pistola", 200)
                setElementData(player, "job", "Medic")
				setPlayerTeam(player, getTeamFromName ( "Medic" ))
				--setElementData(player, "job", "Samu")
				triggerClientEvent(player, "cargoSamu", player, tonumber(16))
				--setPlayerTeam(player, getTeamFromName ( "Samu" ))

				else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				--sendGroupMessage(4, getPlayerName(player):gsub("_"," ") .. " saiu do serviço.")
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				setElementData(player, "char.inDuty", 0)
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair de Medico")
				setPlayerTeam(player, nil)
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Medicos) and getElementDimension(player) == getElementDimension(Medicos) then
	
		if exports.san_dashboard:isPlayerInFaction(player , 31) then
		--exports.san_infobox:addNotification(player,"Baraye Duty E Ra Bezanid!","success")
			if getElementData(player, "char:dutyfaction") ~= 31 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 253
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 31)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter de Medico")


				exports['san_items']:giveItem(player, 64, 1, 10, 1, true)
				exports['san_items']:giveItem(player, 65, 1, 10, 1, true)
				exports['san_items']:giveItem(player, 56, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 80, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 81, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 45, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 37, 1, 1, 1, true)
				setElementData(player, "char.inDuty", 1)
				--setElementData(player, "balas-pistola", 200)

				--setElementData(player, "job", "Resgate")
				triggerClientEvent(player, "cargoSamu", player, tonumber(31))
				setPlayerTeam(player, getTeamFromName ( "Medic" ))

				else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				--sendGroupMessage(4, getPlayerName(player):gsub("_"," ") .. " saiu do serviço.")
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				setElementData(player, "char.inDuty", 0)
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair do resgate")
				setPlayerTeam(player, nil)
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Mecanico) and getElementDimension(player) == getElementDimension(Mecanico) then
		if exports.san_dashboard:isPlayerInFaction(player , 17) then
			if getElementData(player, "char:dutyfaction") ~= 17 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 50
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 17)
				setElementData(player, "duty:civilskin", getElementModel(player))
				--setElementData(player,"char:skin", skin)
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter no mecanico")


				setElementData(player, "job", "Mechanic")

				setPlayerTeam(player, getTeamFromName ( "Mechanic" ))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				--setElementData(player, "char:skin", 80)
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				--sendGroupMessage(3, getPlayerName(player):gsub("_"," ") .. " saiu do serviço.")
				--setElementModel(player,0)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				setPlayerTeam(player, nil)
				getElementData(player,"char:skin")
				--setElementData(player,"char:skin")
				setElementData(player, "job", "Bikar")
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair do mecanico")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Detran) and getElementDimension(player) == getElementDimension(Detran) then
		if exports.san_dashboard:isPlayerInFaction(player, 18) then
			if getElementData(player, "char:dutyfaction") ~= 18 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 25
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 18)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter no Detran")


				setElementData(player, "job", "Detran - Agente de Trânsito")

				setPlayerTeam(player, getTeamFromName ( "Detran" ))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				--sendGroupMessage(3, getPlayerName(player):gsub("_"," ") .. " saiu do serviço.")
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				setPlayerTeam(player, nil)
				setElementData(player, "job", "Bikar")
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair do Detran")
			end
		end
	end
	

	if isElementWithinColShape(player, Taxi) and getElementDimension(player) == getElementDimension(Taxi) then
		if (exports.san_employment:getPlayerJob(player,true) == "Taxista") then
			if getElementData(player, "char:dutyfaction") ~= 19 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 236
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 19)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter no Taxi")


				setElementData(player, "job", "Taxista")
				setPlayerTeam(player, getTeamFromName ( "Taxi" ))


				else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair do TAXI")
				setElementData(player, "job", "Bikar")
				setPlayerTeam(player, nil)
			end
		end
	end
	
	
	if isElementWithinColShape(player, ComandoVermelho) and getElementDimension(player) == getElementDimension(ComandoVermelho) then
		if exports.san_dashboard:isPlayerInFaction(player , 20) then
			if getElementData(player, "char:dutyfaction") ~= 20 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 156
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 20)
				setElementData(player, "duty:civilskin", getElementModel(player))
				local number = {156,157, 158} 
				local numbers = number [ math.random ( #number ) ] 
				setElementModel(player, numbers)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction CV")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				--exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			setElementData(player, "job", "MAFIA")
			triggerClientEvent(player, "seurankG", player, tonumber(20))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of CV")
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Milicia) and getElementDimension(player) == getElementDimension(Milicia) then
		if exports.san_dashboard:isPlayerInFaction(player , 21) then
			if getElementData(player, "char:dutyfaction") ~= 21 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 230
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 21)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter nos Ballas")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(21))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair nos Ballas")
				setElementData(player, "job", "Bikar")
			end
		end
	end
		
		
	if isElementWithinColShape(player, BastardosIng) and getElementDimension(player) == getElementDimension(BastardosIng) then
		if exports.san_dashboard:isPlayerInFaction(player , 22) then
			if getElementData(player, "char:dutyfaction") ~= 22 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 150
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 22)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Bastardos Inglorius")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(22))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Gang 3")
				setElementData(player, "job", "Bikar")
			end
		end
	end
		
		
	if isElementWithinColShape(player, Fdn) and getElementDimension(player) == getElementDimension(Fdn) then
		if exports.san_dashboard:isPlayerInFaction(player , 23) then
			if getElementData(player, "char:dutyfaction") ~= 23 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 266
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 23)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction FDN")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end


			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(23))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of FDN")
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, MotoClube) and getElementDimension(player) == getElementDimension(MotoClube) then
		if exports.san_dashboard:isPlayerInFaction(player , 24) then
			if getElementData(player, "char:dutyfaction") ~= 24 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 1
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 24)
				setElementData(player, "duty:civilskin", getElementModel(player))
--				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Milicia")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			setPlayerTeam(player, getTeamFromName ( "motoclube" ))
			triggerClientEvent(player, "seurankG", player, tonumber(24))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Milicia")
				setElementData(player, "job", "Bikar")
				setPlayerTeam(player, nil)
			end
		end
	end
	
	
	if isElementWithinColShape(player, Pcc) and getElementDimension(player) == getElementDimension(Pcc) then
		if exports.san_dashboard:isPlayerInFaction(player , 25) then
			if getElementData(player, "char:dutyfaction") ~= 25 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 272
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 25)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction PCC")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(25))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of PCC")
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Groove) and getElementDimension(player) == getElementDimension(Groove) then
		if exports.san_dashboard:isPlayerInFaction(player , 26) then
			if getElementData(player, "char:dutyfaction") ~= 26 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 26)
				setElementData(player, "duty:civilskin", getElementModel(player))
				local number = {311, 105, 106, 107} 
				local numbers = number [ math.random ( #number ) ] 
				setElementModel(player, numbers)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Grove")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(26))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Grove")
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Ballas) and getElementDimension(player) == getElementDimension(Ballas) then
		if exports.san_dashboard:isPlayerInFaction(player , 27) then
			if getElementData(player, "char:dutyfaction") ~= 27 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 1
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 27)
				setElementData(player, "duty:civilskin", getElementModel(player))
				local number = {102, 103, 104} 
				local numbers = number [ math.random ( #number ) ] 
				setElementModel(player, numbers)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction Milicia")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(27))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Milicia")
				setElementData(player, "job", "Bikar")
			end
		end
	end
		
		
	if isElementWithinColShape(player, Gang9) and getElementDimension(player) == getElementDimension(Gang9) then
		if exports.san_dashboard:isPlayerInFaction(player , 28) then
			if getElementData(player, "char:dutyfaction") ~= 28 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 108
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 28)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction BastardosIng")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(28))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of Gang 3")
				setElementData(player, "job", "Bikar")
			end
		end
	end
		
		
	if isElementWithinColShape(player, Gang10) and getElementDimension(player) == getElementDimension(Gang10) then
		if exports.san_dashboard:isPlayerInFaction(player , 29) then
			if getElementData(player, "char:dutyfaction") ~= 29 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 0
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 29)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Duty Kard Da Faction CV")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			triggerClientEvent(player, "seurankG", player, tonumber(29))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") You used /duty to get out of CV")
				setElementData(player, "job", "Bikar")
			end
		end
	end
	
	
	if isElementWithinColShape(player, Rockfellers) and getElementDimension(player) == getElementDimension(Rockfellers) then
		if exports.san_dashboard:isPlayerInFaction(player , 30) then
			if getElementData(player, "char:dutyfaction") ~= 30 and getElementData(player, "char:dutyfaction") then outputChatBox("#dc143c[IRG]:#ffffff You're already in service elsewhere.", player, 255, 255, 255, true) return end
			local dutySkin = 164
			if not duty then
				exports.san_infobox:addNotification(player,"!شما به سرویس پیوستید","success")
				setElementData(player, "char:duty", true)
				setElementData(player, "char:dutyfaction", 30)
				setElementData(player, "duty:civilskin", getElementModel(player))
				setElementModel(player, dutySkin)
				setElementFrozen(player, false)			
				setPedArmor(player, 100)

				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Used /duty to enter em uma @Anonimo")

			if ( atmIsAbleToRob2(player) ) then 
				atmSetTimeOut2(player, ATM_TIMEOUT)
				exports['san_items']:giveItem(player, 54, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 44, 1, 1, 1, true)
				exports['san_items']:giveItem(player, 84, 1, 1, 1, true)
			else
				exports.san_hud:dm("Você só pode pegar o kit de armas novamente em  ".. atmGetTimeOut2 ( player ) .. " segundos", player, 255, 0, 0) 
			end

			--setElementData(player, "job", "Comando Vermelho")
			--triggerClientEvent(player, "seurankG", player, tonumber(30))

			else
				exports.san_infobox:addNotification(player,"!شما از سرویس خارج شدید","success")
				setElementData(player, "char:duty", false)
				setElementData(player, "char:dutyfaction", false)
				setElementModel(player, getElementData(player, "char:skin"))
				setElementFrozen(player, false)
				exports['san_items']:RemovePlayerDutyItems(player)
				takeAllWeapons(player)
				
				--exports.san_admin:outputAdminMessage(" "..getPlayerName(player).." ID: #7cc576(" .. getElementData(player, "playerid")..") Utilizou o /duty para sair em uma @Anonimo")
				setElementData(player, "job", "Bikar")
			end
		end
	end

end

--addEvent("dutyPlayers", true)
--addEventHandler("dutyPlayers", root, dutyPlayers)

addCommandHandler("duty585858", dutyPlayers, false, false)
--bindKey ( player, "F1", "down", funcInput )
--bindKey("e", "down", dutyPlayers)


--[[

function ticketPlayer(thePlayer, commandName, targetPlayer, cost, ...)

	if getElementData(thePlayer, "char:dutyfaction") == 1  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 2 
	elseif getElementData(thePlayer, "char:dutyfaction") == 2  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 2 
	elseif getElementData(thePlayer, "char:dutyfaction") == 5 then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 5
	elseif getElementData(thePlayer, "char:dutyfaction") == 6  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 6 
	elseif getElementData(thePlayer, "char:dutyfaction") == 16  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 3000
		factionid = 16
	elseif getElementData(thePlayer, "char:dutyfaction") == 20  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 20
	elseif getElementData(thePlayer, "char:dutyfaction") == 19  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 20
	elseif getElementData(thePlayer, "char:dutyfaction") == 11  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 20
			elseif getElementData(thePlayer, "char:dutyfaction") == 21  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 21
	else
		factionid = false
		before = false
		between = false
		maxCost = false
	end
	
	if (factionid) then
		if not (targetPlayer) or not (cost) or not (...) then 
			outputChatBox("#7cc576Use:#ffffff /" ..commandName .. " [Nome / ID] [Meghdar] [Dalil]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if targetPlayer == thePlayer then outputChatBox("#dc143c[IRG - Error]:#ffffff Você nâo pode pagar por si mesmo.", thePlayer, 255, 255, 255, true) return end
			local cost = tonumber(cost)
			local reason = table.concat({...}, " ")
			
			local x, y, z = getElementPosition(thePlayer)
			local tx, ty, tz = getElementPosition(targetPlayer)
			local int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
			local tint, tdim = getElementInterior(targetPlayer), getElementDimension(targetPlayer)
			local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
			
			if cost <= 0 then outputChatBox("#dc143c[IRG - Error]:#ffffffVocê deve inserir uma Meghdar maior que 0.", thePlayer, 255, 255, 255, true) return end
			if maxCost < cost then outputChatBox("#dc143c[IRG - Error]:#ffffff Você bateu o limite máximo. (" .. maxCost .. ")", thePlayer, 255, 255, 255, true) return end
			
			if distance <= 4 and int == tint and dim == tdim then



				outputChatBox(before .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#ffffff emitiu uma " .. between .. ". Meghdar: #7cc576" .. cost .. "", targetPlayer, 255, 255, 255, true)
				outputChatBox(before .. " Dalil: #7cc576" .. reason, targetPlayer, 255, 255, 255, true)
				
				--exports.exg_dashboard:giveGroupBalance(factionid, cost)
				setElementData(targetPlayer, "char:money", getElementData(targetPlayer, "char:money")-cost)
				
				outputChatBox(before .. " Você Emitiu uma " .. between .. " para #7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. "#ffffff Meghdar: #7cc576" .. cost .. "", thePlayer, 255, 255, 255, true)
				outputChatBox(before .. " Dalil: #7cc576" .. reason, thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#dc143c[IRG - Error]:#ffffff Você Está muito longe do jogador.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("multar", ticketPlayer, false, false)

]]--


function ticketPlayer(thePlayer, commandName, cost, ...)
	if getElementData(thePlayer, "char:dutyfaction") == 1  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 1 
	elseif getElementData(thePlayer, "char:dutyfaction") == 2  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 2 
	elseif getElementData(thePlayer, "char:dutyfaction") == 3 then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 3
	elseif getElementData(thePlayer, "char:dutyfaction") == 4  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 4 
	elseif getElementData(thePlayer, "char:dutyfaction") == 5  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 3000
		factionid = 5
	elseif getElementData(thePlayer, "char:dutyfaction") == 6  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 6
	elseif getElementData(thePlayer, "char:dutyfaction") == 7  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 7
	elseif getElementData(thePlayer, "char:dutyfaction") == 8  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 8
	elseif getElementData(thePlayer, "char:dutyfaction") == 9  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 9
	elseif getElementData(thePlayer, "char:dutyfaction") == 10  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 2000
		factionid = 10 
	elseif getElementData(thePlayer, "char:dutyfaction") == 11  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 3000
		factionid = 11
	elseif getElementData(thePlayer, "char:dutyfaction") == 12  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 12
	elseif getElementData(thePlayer, "char:dutyfaction") == 13  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 13
	elseif getElementData(thePlayer, "char:dutyfaction") == 14  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 14
	elseif getElementData(thePlayer, "char:dutyfaction") == 15  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 15
	elseif getElementData(thePlayer, "char:dutyfaction") == 18  then
		before = "#7cc576[Jarime]:#ffffff"
		between = "Multa"
		maxCost = 4000
		factionid = 15
	else
		factionid = false
		before = false
		between = false
		maxCost = false
	end
	if (factionid) then
		if not (cost) or not (...) then 
			outputChatBox("#7cc576Use:#ffffff /" ..commandName .. " [Meghdar] [Dalil] - Nazdik Fard Bemanid!", thePlayer, 255, 255, 255, true)
		else
			local cost = tonumber(cost)
			local reason = table.concat({...}, " ")
			if cost <= 0 then outputChatBox("#dc143c[IRG - Error]:#ffffffMeghdar Bishtar Az 0 Bayad Vared Koni.", thePlayer, 255, 255, 255, true) return end
			if maxCost < cost then outputChatBox("#dc143c[IRG - Error]:#ffffff Bishtar Az Meghdar Taein Shode Ast! (" .. maxCost .. ")", thePlayer, 255, 255, 255, true) return end

			local posX1, posY1, posZ1 = getElementPosition(thePlayer)
			for _, player in ipairs(getElementsByType("player")) do
				local posX2, posY2, posZ2 = getElementPosition(player)
				local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
				if distance <= 1 then
					--if player then
					if player ~= thePlayer then
                                             outputChatBox(before .. " Jarime Sader Shod " .. between .. " Baraye #7cc576" .. getPlayerName(player):gsub("_"," ") .. "#ffffff Meghdar: #7cc576" .. cost .. "", thePlayer, 255, 255, 255, true)
											 outputChatBox(before .. " Dalil: #7cc576" .. reason, thePlayer, 255, 255, 255, true)
											 
											 outputChatBox(before .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#ffffff Jarime Sader Shode " .. between .. ". Meghdar: #7cc576" .. cost .. "", player, 255, 255, 255, true)
											 outputChatBox(before .. " Dalil: #7cc576" .. reason, player, 255, 255, 255, true)

											takeChar (player, cost)
											 return
					end
				--end
				end
			end
		end
	end
end
addCommandHandler("jarime", ticketPlayer, false, false)

function takeChar (thePlayer, cost)
 setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money")-cost)
end



--  or getElementData(thePlayer, "char:dutyfaction") == 23


function government(thePlayer, commandName, ...)
	local faction = false
	
	local mess = "chamMilicia"
    if getElementData(thePlayer, "char:dutyfaction") == 1  then 
	faction = "Baep"
	color = "#444CB3"	
	elseif getElementData(thePlayer, "char:dutyfaction") == 2 then
		faction = "Polícia Militar do Rj"
		color = "#444CB3"		
	elseif getElementData(thePlayer, "char:dutyfaction") == 3  then 
		faction = "Policia Rodoviaria Federal"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 4  then 
		faction = "Rádio Patrulha"
		color = "#444CB3"	
	elseif getElementData(thePlayer, "char:dutyfaction") == 5  then 
		faction = "1º BPChq Tobias de Aguiar"
		color = "#444CB3"	
	elseif getElementData(thePlayer, "char:dutyfaction") == 6  then 
		faction = "Exército Brasileiro"
		color = "#444CB3"	
	elseif getElementData(thePlayer, "char:dutyfaction") == 7  then 
		faction = "Supremo Tribunal Federal"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 8  then 
		faction = "PMPR"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 9  then 
		faction = "Força Tática"
		color = "#444CB3"	
	elseif getElementData(thePlayer, "char:dutyfaction") == 10  then 
		faction = "2.º bpchq"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 11  then 
		faction = "BOPE"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 12 then 
		faction = "Policia 12"
		color = "#444CB3"		
	elseif getElementData(thePlayer, "char:dutyfaction") == 13 then 
		faction = "Policia 13"
		color = "#FFFF00"
	elseif getElementData(thePlayer, "char:dutyfaction") == 14 then
		faction = "Policia 14"
		color = "#F89406"
	elseif getElementData(thePlayer, "char:dutyfaction") == 15 then
		faction = "Policia 15"
		color = "#F89406"
	elseif getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 31 then 
		faction = "Resgate"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 17  then 
		faction = "Mechanic"
		color = "#444CB3"
	elseif getElementData(thePlayer, "char:dutyfaction") == 18 then 
		faction = "Detran"
		color = "#444CB3"	
--	elseif getElementData(thePlayer, "char:dutyfaction") == 19 then
--		faction = "Taxi"
--		color = "#00ced1"
--		mess = "anúncio"
	end
	if (faction) then
		if not (...) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Anúncio]", thePlayer, 255, 255, 255, true)
		else
			
			local msg = table.concat({...}," ")
			if (msg) then
				--outputChatBox(" ", root, 255, 255, 255, true)
				--outputChatBox(color .. "[" .. faction .. " " .. mess .. "]:#ffffff " .. msg, root, 255, 255, 255, true)
				
				outputChatBox("#D64541===================== [#7cc576" .. faction .. "#D64541] =====================", root, 255, 255, 255, true)
							    outputChatBox(" ", root, 255, 255, 255, true)
				outputChatBox("#7cc576" .. msg, root, 255, 255, 255, true)
			    outputChatBox(" ", root, 255, 255, 255, true)
				outputChatBox("#D64541================================================", root, 255, 255, 255, true)				
				--exports.san_admin:outputAdminMessage("[GOV] #7cc576" .. getPlayerName(thePlayer) .. " (" .. getElementData(thePlayer, "playerid") .. ") #ffffff usou o #0094ff/" .. commandName .. "#ffffff.")
				triggerClientEvent(root, "playGovSound", root)
			end
		end
	end
end
addCommandHandler("gov", government, false, false)



function hasItem(element, itemID, itemValue)
	local lekerd = exports.san_item:hasItem(element, itemID, itemValue)
	return lekerd
end


function adminJail(thePlayer, commandName, targetPlayer, ido, ...)
	--if getElementData(thePlayer, "acc:admin") >= 1 then
		--if exports.san_dash:isInGroup(16) then  
			if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15 then

				if not (targetPlayer) or not (ido) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Nome / ID] [minuto] [Dalil]", thePlayer, 255, 255, 255, true)
		else

			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")
			local x, y, z = getElementPosition(thePlayer)
			local tx, ty, tz = getElementPosition(targetPlayer)
			local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
		 --	if thePlayer == targetPlayer then outputChatBox("#dc143c[IRG - Error]:#ffffffVocê nâo pode se curar.", thePlayer, 255, 255, 255, true) return end
		
			if distance <= 4 then
				if not (targetPlayer) then outputChatBox("nâo existe tal jogador.", thePlayer, 255, 255, 255, true) return end
				if not getElementData(targetPlayer, "loggedin") then return end			
			if not (targetPlayer) then
				return
			end
				if getElementData(targetPlayer, "adminjail") == 1 then
					outputChatBox("O jogador já Está preso.", thePlayer, 255, 255, 255, true)
					return
				end
			    setElementData(targetPlayer, "player:preso", true)
				outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffpor #1a75ff" .. ido .. "#ffffff minutos.", root ,255, 255, 255, true)
				outputChatBox("#dc143c[Departamento de policia]:#7cc576 Dalil:#ffffff " .. reason, root ,255, 255, 255, true)
				prisionSerialTimeOut(targetPlayer, PRISION_TIMEOUT)
				takeAllWeapons(targetPlayer)
				if exports['san_items']:hasItemS(targetPlayer, 38) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 38, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 32) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 32, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 64) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 64, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 84) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 84, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 52) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 52, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 50) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 50, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 49) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 49, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 44) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 44, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 51) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 51, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 53) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 53, 0)
				end
				if exports['san_items']:hasItemS(targetPlayer, 44) then 
				exports['san_items']:takePlayerItemToID(targetPlayer, 44, 0)
				end		
				local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
				local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
				if isTimer(theTimerCheck) then
					killTimer(theTimerCheck)
				end
				if isTimer(theTimerCheck2) then
					killTimer(theTimerCheck2)
				end
				if isPedInVehicle(targetPlayer) then
					removePedFromVehicle(targetPlayer)
				end
				setElementData(targetPlayer, "player:preso", true)
				fadeCamera(targetPlayer, false, 1.0)
				setElementFrozen(targetPlayer, true)
				if isPedInVehicle(targetPlayer) then
					toggleAllControls(targetPlayer, false, false, false)
				end
				setTimer(function()
					triggerClientEvent(targetPlayer, "triggerAdminjail", targetPlayer, thePlayer, reason, ido, 1, false)
				end, 500, 1)
				setTimer( function()
					local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
					local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
					local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
					local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
					setElementPosition(targetPlayer, 1571.6392822266, -1692.9930419922, 13.589937210083)
					setElementInterior(targetPlayer, 0)
					setElementDimension(targetPlayer, 0)
					local adminjailed = setElementData(targetPlayer, "adminjail", 1)
					local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
					local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
					local admin = setElementData(targetPlayer, "adminjail:admin", getPlayerName(thePlayer))
					local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", getPlayerSerial(thePlayer))
				end, 1500, 1)
								
				setTimer(function()
					fadeCamera(targetPlayer, true, 2.5)
					setElementFrozen(targetPlayer, false)
					toggleAllControls(targetPlayer, true, true, true)
				end, 7500, 1)
	
			else
			outputChatBox("#dc143c[IRG - Error]:#ffffff Você Está muito longe do jogador.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
--addCommandHandler("prender", adminJail)



----------------------------------------------------------------------------------------------------------------



--[[
function adminJail(thePlayer, commandName, ido, ...)
	if getElementData(thePlayer, "char:dutyfaction") == 16 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 19 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 23 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 20 then
	if not (ido) or not (...) then 
		outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [minuto] [Dalil]", thePlayer, 255, 255, 255, true)
		else
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")

			local posX1, posY1, posZ1 = getElementPosition(thePlayer)
			for _, player in ipairs(getElementsByType("player")) do
				local posX2, posY2, posZ2 = getElementPosition(player)
				local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
				if distance <= 1 then
					--if player then
					if player ~= thePlayer then

						if getElementData(player, "adminjail") == 1 then
							outputChatBox("O jogador já Está preso.", thePlayer, 255, 255, 255, true)
							return
						end
						outputChatBox("#dc143c[Departamento de policia]:#7cc576 " .. getPlayerName(thePlayer) .. "#ffffff Prendeu #7cc576" .. getPlayerName(player):gsub("_"," ") .. " #ffffffpor #1a75ff" .. ido .. "#ffffff minutos.", root ,255, 255, 255, true)
						outputChatBox("#dc143c[Departamento de policia]:#7cc576 Dalil:#ffffff " .. reason, root ,255, 255, 255, true)
						setTimer(function()
						triggerClientEvent(player, "triggerAdminjail", player, thePlayer, reason, ido, 1, false)
						end, 500, 1)
						local admin = setElementData(player, "adminjail:admin", getPlayerName(thePlayer))
						local adminSerial = setElementData(player, "adminjail:adminSerial", getPlayerSerial(thePlayer))
						local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(player, "char:id") .. "'", 1, reason, ido, ido, getPlayerName(thePlayer), getPlayerSerial(thePlayer))

						takeChar3 (player, reason, ido)
					return
				end
			end
		end
	end
end
end
addCommandHandler("prender", adminJail, false, false)

function takeChar3 (targetPlayer, reason, ido)
	prisionSerialTimeOut(targetPlayer, PRISION_TIMEOUT)
	takeAllWeapons(targetPlayer)
	if exports['san_items']:hasItemS(targetPlayer, 38) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 38, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 39) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 39, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 32) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 32, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 64) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 64, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 68) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 68, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 103) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 103, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 126) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 126, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 84) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 84, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 52) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 52, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 50) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 50, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 49) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 49, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 44) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 51) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 51, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 53) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 53, 0)
	end
	if exports['san_items']:hasItemS(targetPlayer, 44) then 
	exports['san_items']:takePlayerItemToID(targetPlayer, 44, 0)
	end		
	local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
	local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
	if isTimer(theTimerCheck) then
		killTimer(theTimerCheck)
	end
	if isTimer(theTimerCheck2) then
		killTimer(theTimerCheck2)
	end
	if isPedInVehicle(targetPlayer) then
		removePedFromVehicle(targetPlayer)
	end
	setElementData(targetPlayer, "player:preso", true)
	fadeCamera(targetPlayer, false, 1.0)
	setElementFrozen(targetPlayer, true)
	if isPedInVehicle(targetPlayer) then
		toggleAllControls(targetPlayer, false, false, false)
	end

	setTimer( function()
		local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
		local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
		local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
		local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
		setElementPosition(targetPlayer, 1571.6392822266, -1692.9930419922, 13.589937210083)
		setElementInterior(targetPlayer, 0)
		setElementDimension(targetPlayer, 0)
		local adminjailed = setElementData(targetPlayer, "adminjail", 1)
		local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
		local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
	end, 1500, 1)			
	setTimer(function()
		fadeCamera(targetPlayer, true, 2.5)
		setElementFrozen(targetPlayer, false)
		toggleAllControls(targetPlayer, true, true, true)
	end, 7500, 1)
end
]]--














prisionCollDown = {}
local prisionSerial = {}
PRISION_TIMEOUT = 600000*2

function prisionSerialTimeOut ( player, time )
    prisionCollDown[player] = setTimer( 
    function (player) 
    prisionCollDown[player] = nil 
    end, time, 1, player)
end

addEventHandler("onPlayerQuit", root,
    function ()
        if ( prisionGetTimeOut(source) ) then
            prisionSerial[getPlayerSerial(source)] = prisionGetTimeOut(source)
        end
    end
)

addEventHandler("onPlayerJoin", root,
    function ()
        for serial, cooldown in pairs ( prisionSerial ) do
            if ( getPlayerSerial(source) == serial ) then
                prisionSerialTimeOut(source, cooldown*1000)
                prisionSerial[serial] = nil
            end
        end
    end
)

function prisionGetTimeOut ( player )
    if isTimer ( prisionCollDown[player] ) then
        local miliseconds = getTimerDetails ( prisionCollDown[player] )
        return math.ceil( miliseconds / 1000 )
    else
        return false
    end
end

function verificationPrision ( player )
    return not isTimer(prisionCollDown[player])
end

----------------------------------------------------------------------------------------------------------------

function release(thePlayer, commandName, targetPlayer)
			if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use#ffffff /" .. commandName .. " [Nome / ID]", thePlayer, 255, 255, 255, true)
		else
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if getElementData(targetPlayer, "adminjail") == 1 then
			
				local theTimerCheck = getElementData(targetPlayer, "adminjail:timer")
				local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
				local x, y, z = getElementPosition(thePlayer)
				local tx, ty, tz = getElementPosition(targetPlayer)
				local int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
				local tint, tdim = getElementInterior(targetPlayer), getElementDimension(targetPlayer)
				local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				if distance <= 4 and int == tint and dim == tdim then
						--[[
							if (theTimerCheck) then
								killTimer(theTimerCheck)
								setElementData(targetPlayer, "adminjail:timer", false)
							end
							if (theTimerCheck2) then
								killTimer(theTimerCheck2)
								setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
							end]]--
							outputChatBox("#7cc576[Punição]:#ffffff Você foi liberado da cadeia. ", targetPlayer ,255, 255, 255, true)
							local adminjailed = setElementData(targetPlayer, "adminjail", false)
							local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
							local alapido = setElementData(targetPlayer, "adminjail:ido", false)
							local admin = setElementData(targetPlayer, "adminjail:player", false)
							
							
							--sql
							local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, jailed_player = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
							
							local idoTelikVege = setElementData(targetPlayer, "adminjail:idoTelik", false)
							local idoLeteltVege = setElementData(targetPlayer, "adminjail:idoLetelt", false)
							
							--pos
							setElementPosition(targetPlayer, 1580.8721923828, -1683.6528320313, 14.996187210083)
							setElementInterior(targetPlayer, 0)
							setElementDimension(targetPlayer, 0)
							
							--idoTelikLe(targetPlayer)
							
				else
					outputChatBox("#dc143c[IRG - Error]:#ffffff Você Está muito longe do jogador.", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox("#7cc576[Punição]:#ffffff " .. targetPlayerName:gsub("_"," ") .. " nâo Está sob custódia.", thePlayer ,255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("soltar", release, false, false)

function idoTelikLe(targetPlayer)
	if isElement(targetPlayer) and (getElementType(targetPlayer) == "player") then
		local idoTelik = tonumber(getElementData(targetPlayer, "idoTelik")) or false
		local idoLetelt = tonumber(getElementData(targetPlayer, "idoLetelt")) or false
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "idoTelik", idoTelik-1)
			setElementData(targetPlayer, "idoLetelt", idoLetelt+1)
			if (idoTelik) <= 1 then
				outputChatBox("Sua sentença expirou e Você foi solto!.", targetPlayer, 255, 255, 255, true)
				setElementData(targetPlayer, "player:preso", false)
				local theTimer = getElementData(targetPlayer, "adminjail:theTimer")
				if not (theTimer) then
					return false
				end
				--killTimer(theTimer)
							if (theTimerCheck) then
								killTimer(theTimerCheck)
								setElementData(targetPlayer, "adminjail:timer", false)
							end
							if (theTimerCheck2) then
								killTimer(theTimerCheck2)
								setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
							end	
				setElementData(targetPlayer, "adminjail:theTimer", false)
				local adminjailed = setElementData(targetPlayer, "adminjail", false)
				local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
				local alapido = setElementData(targetPlayer, "adminjail:ido", false)
				local admin = setElementData(targetPlayer, "adminjail:admin", false)
				local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
				local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
				local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
				local setPosition = setTimer(setElementPosition, 2000, 1,targetPlayer, 1580.5162353516, -1683.5106201172, 14.996187210083)
				local setInterior = setElementInterior(targetPlayer, 0)
				local setDimension = setElementDimension(targetPlayer, 0)
			end
		end
	end
end
--[[
local zone = createColCuboid(1569.38818, -1695.95154, 12.03388, 13.1005859375, 5.673095703125, 4.3000072479248)

addEventHandler("onColShapeLeave", zone,
function (hitElement)
     if (getElementData(hitElement, "player:preso")) then
	     setElementPosition(hitElement, 1571.34, -1692.791, 13.59)
		 outputChatBox("#dc143c[IRG - Error]:#ffffff Você ainda esta preso! Aguarde.", hitElement, 255, 255, 255, true)
		 if ( verificationPrision(hitElement) ) then exports.san_hud:dm("Você está preso por:  ".. tonumber(prisionGetTimeOut ( hitElement )) .. " segundos", hitElement, 255, 0, 0) return end
		 else
	 end
end)
--]]

---- /visz ---- (Ha kocsiba �l automat�n berakja a playert)
local timer = {}

function endVisz(thePlayer)
	if getElementData(thePlayer, "visz:viszi") then
			local x, y, z = getElementPosition(thePlayer)
			

			if isTimer(timer[getElementData(thePlayer, "acc:id")]) then
				killTimer(timer[getElementData(thePlayer, "acc:id")])
			end
			
			toggleAllControls(getElementData(thePlayer, "visz:viszi"), true)
			setElementFrozen(getElementData(thePlayer, "visz:viszi"), false)
			setElementFrozen(getElementData(thePlayer, "viszi:viszi"), true)
			setElementData(thePlayer, "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:vive", false)
			setElementData(thePlayer, "visz:viszi", false)
	end
end

function endVisz2(thePlayer, target)
	if getElementData(thePlayer, "visz:vive") then
			local x, y, z = getElementPosition(thePlayer)
			if isTimer(timer[getElementData(target, "acc:id")]) then
				killTimer(timer[getElementData(target, "acc:id")])
			end
			toggleAllControls(thePlayer, true)
			setElementFrozen(thePlayer, false)
			setElementData(thePlayer, "visz:status", false)
			setElementData(thePlayer, "visz:vive", false)
	end
end

--[[
function movePlayer(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "loggedin") then
	
		if not (targetPlayer) and not getElementData(thePlayer, "visz:viszi") then
			outputChatBox("#7cc576[IRG] Use:#ffffff /" .. commandName .. " [Nome / ID]", thePlayer, 255 ,255, 255, true)
		elseif not (targetPlayer) and getElementData(thePlayer, "visz:viszi") then
			
			local x, y, z = getElementPosition(thePlayer)
			setElementPosition(getElementData(thePlayer, "visz:viszi"), x, y+0.5, z)
			
			exports.san_chat:sendLocalMeAction(thePlayer, "Soltou " .. getPlayerName(getElementData(thePlayer, "visz:viszi")):gsub("_"," ") .. " -t.")
			
			if isTimer(timer[getElementData(thePlayer, "acc:id")]) then
				killTimer(timer[getElementData(thePlayer, "acc:id")])
			end
			
			toggleAllControls(getElementData(thePlayer, "visz:viszi"), true)
			setElementFrozen(getElementData(thePlayer, "visz:viszi"), false)
			setElementData(thePlayer, "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:vive", false)
			setElementData(thePlayer, "visz:viszi", false)
		
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
				
				local playerVisz = getElementData(thePlayer, "visz:viszi")
				local player = getElementData(thePlayer, "visz:status")
				local target = getElementData(targetPlayer, "visz:status")
			
				if isPedInVehicle(targetPlayer) then outputChatBox("#dc143c[IRG - Error]:#ffffff O jogador Está em um veículo.", thePlayer, 255, 255, 255, true) return end
				if player then outputChatBox("#dc143c[IRG - Error]:#ffffff Você já Está carregando um jogador.", thePlayer, 255, 255, 255, true) return end
				if target then outputChatBox("#dc143c[IRG - Error]:#ffffff Eles já Estáo levando o jogador.", thePlayer, 255, 255, 255, true) return end
				
				local x, y, z = getElementPosition(thePlayer)
				local tx, ty, tz = getElementPosition(targetPlayer)
				local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)
				if (distance < 5) then
				
				if getElementData(targetPlayer, "char.Cuffed") ~= 1 then outputChatBox("#dc143c[IRG - Error]:#ffffff Você tem que algemar primeiro.", thePlayer, 255, 255, 255, true) return end
				if thePlayer == targetPlayer then outputChatBox("#dc143c[IRG - Error]:#ffffff Você nâo pode puxar Você mesmo.", thePlayer, 255 ,255, 255, true)return end	
				setElementData(thePlayer, "visz:viszi", targetPlayer)
				setElementData(targetPlayer, "visz:vive", thePlayer)
				setElementData(thePlayer, "visz:status", 1)
				setElementData(targetPlayer, "visz:status", 2)
				toggleAllControls(targetPlayer, false)
				setElementFrozen(targetPlayer, true)
				toggleControl(targetPlayer, "chatbox", true)
				toggleControl(targetPlayer, "screenshot", true)
				exports.san_chat:sendLocalMeAction(thePlayer, "Esta carregando Você " .. getPlayerName(targetPlayer):gsub("_"," ") .." -t.")
				timer[getElementData(thePlayer, "acc:id")] = setTimer(function()
				if isElement(thePlayer) then
				if not targetPlayer then return end
				if tonumber(getElementData(targetPlayer, "adminjail") or 0) == 1 then
				endVisz(thePlayer)
				outputChatBox("#7cc576[IRG]:#ffffff " .. getPlayerName(targetPlayer) .. " admin ficou preso, então Você foi solto.", thePlayer, 255, 255, 255, true)
				killTimer(timer[getElementData(thePlayer, "acc:id")])
				return
				end
				x, y, z = getElementPosition(thePlayer)
				int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
				setElementPosition(targetPlayer, x, y+0.5, z)
				setElementInterior(targetPlayer, int)
				setElementDimension(targetPlayer, dim)
				if not isElement(targetPlayer) then
					endVisz(thePlayer)
				end
				end
				end, 1000, 0)
				else
					outputChatBox("#dc143c[IRG - Error]:#ffffff Você Está muito longe do jogador.", thePlayer, 255, 255, 255, true)
				end
			end	
		end
	end
end
addCommandHandler("puxar", movePlayer, false, false)
]]--



function movePlayer(thePlayer, commandName)
	if getElementData(thePlayer, "loggedin") then

	if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15 then


		--if getElementData(thePlayer, "visz:viszi") then
	--		outputChatBox("#7cc576[IRG] Use:#ffffff /" .. commandName .. " perto do jogador", thePlayer, 255 ,255, 255, true)
		if getElementData(thePlayer, "visz:viszi") then
			
			local x, y, z = getElementPosition(thePlayer)
			setElementPosition(getElementData(thePlayer, "visz:viszi"), x, y+0.5, z)
			
			exports.san_chat:sendLocalMeAction(thePlayer, "Soltou " .. getPlayerName(getElementData(thePlayer, "visz:viszi")):gsub("_"," ") .. " -t.")
			
			if isTimer(timer[getElementData(thePlayer, "acc:id")]) then
				killTimer(timer[getElementData(thePlayer, "acc:id")])
			end
			
			toggleAllControls(getElementData(thePlayer, "visz:viszi"), true)
			setElementFrozen(getElementData(thePlayer, "visz:viszi"), false)
			setElementData(thePlayer, "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:status", false)
			setElementData(getElementData(thePlayer, "visz:viszi"), "visz:vive", false)
			setElementData(thePlayer, "visz:viszi", false)

		else

			local posX1, posY1, posZ1 = getElementPosition(thePlayer)
			for _, player in ipairs(getElementsByType("player")) do
				local posX2, posY2, posZ2 = getElementPosition(player)
				local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
				if distance <= 1 then
					if player ~= thePlayer then

						local playerVisz = getElementData(thePlayer, "visz:viszi")
						local player2 = getElementData(thePlayer, "visz:status")
						local target = getElementData(player, "visz:status")
					
						if isPedInVehicle(player) then outputChatBox("#dc143c[IRG - Error]:#ffffff O jogador Está em um veículo.", thePlayer, 255, 255, 255, true) return end
						if player2 then outputChatBox("#dc143c[IRG - Error]:#ffffff Você já Está carregando um jogador.", thePlayer, 255, 255, 255, true) return end
						if target then outputChatBox("#dc143c[IRG - Error]:#ffffff Eles já Estáo levando o jogador.", thePlayer, 255, 255, 255, true) return end
						if getElementData(player, "char.Cuffed") ~= 1 then outputChatBox("#dc143c[IRG - Error]:#ffffff Você tem que algemar primeiro.", thePlayer, 255, 255, 255, true) return end
exports.san_chat:sendLocalMeAction(thePlayer, "Esta carregando Você " .. getPlayerName(player):gsub("_"," ") ..".")
setElementData(thePlayer, "visz:viszi", player)
setElementData(player, "visz:vive", thePlayer)
setElementData(thePlayer, "visz:status", 1)
setElementData(player, "visz:status", 2)
toggleAllControls(player, false)
setElementFrozen(player, true)
toggleControl(player, "chatbox", true)
toggleControl(player, "screenshot", true)
timer[getElementData(thePlayer, "acc:id")] = setTimer(function()
if isElement(thePlayer) then
if not player then return end
if tonumber(getElementData(player, "adminjail") or 0) == 1 then
endVisz(thePlayer)
outputChatBox("#7cc576[IRG]:#ffffff " .. getPlayerName(player) .. " admin ficou preso, então Você foi solto.", thePlayer, 255, 255, 255, true)
killTimer(timer[getElementData(thePlayer, "acc:id")])
return
end
x, y, z = getElementPosition(thePlayer)
int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
setElementPosition(player, x, y+0.5, z)
setElementInterior(player, int)
setElementDimension(player, dim)
if not isElement(player) then
	endVisz(thePlayer)
end
end
end, 1000, 0)



--						takeChar4 (player)
					return
				end
			end
		end
	end
end
end
end
addCommandHandler("cuff", movePlayer, false, false)

--[[
function takeChar4 (targetPlayer)
if getElementData(targetPlayer, "char.Cuffed") ~= 1 then outputChatBox("#dc143c[IRG - Error]:#ffffff Você tem que algemar primeiro.", thePlayer, 255, 255, 255, true) return end
setElementData(thePlayer, "visz:viszi", targetPlayer)
setElementData(targetPlayer, "visz:vive", thePlayer)
setElementData(thePlayer, "visz:status", 1)
setElementData(targetPlayer, "visz:status", 2)
toggleAllControls(targetPlayer, false)
setElementFrozen(targetPlayer, true)
toggleControl(targetPlayer, "chatbox", true)
toggleControl(targetPlayer, "screenshot", true)
timer[getElementData(thePlayer, "acc:id")] = setTimer(function()
if isElement(thePlayer) then
if not targetPlayer then return end
if tonumber(getElementData(targetPlayer, "adminjail") or 0) == 1 then
endVisz(thePlayer)
outputChatBox("#7cc576[IRG]:#ffffff " .. getPlayerName(targetPlayer) .. " admin ficou preso, então Você foi solto.", thePlayer, 255, 255, 255, true)
killTimer(timer[getElementData(thePlayer, "acc:id")])
return
end
x, y, z = getElementPosition(thePlayer)
int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
setElementPosition(targetPlayer, x, y+0.5, z)
setElementInterior(targetPlayer, int)
setElementDimension(targetPlayer, dim)
if not isElement(targetPlayer) then
	endVisz(thePlayer)
end
end
end, 1000, 0)
end
]]--



function onQuit()
	if getElementData(source, "visz:status") == 2 then
		for k, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "visz:viszi") == source then
				endVisz(v)
				outputChatBox("#7cc576[IRG]:#ffffff " .. getPlayerName(source):gsub("_"," ") .. " foi desconectado, então Você foi liberado.", v, 255, 255, 255, true)
			end
		end
	elseif getElementData(source, "visz:status") == 1 then
		for k, v in ipairs(getElementsByType("player")) do
			if getElementData(v, "visz:vive") == source then
				endVisz2(v, source)
				outputChatBox("#7cc576[IRG]:#ffffff " .. getPlayerName(source):gsub("_"," ") .. " foi desconectado, então Você foi liberado.", v, 255, 255, 255, true)
			end
		end
	end
end
addEventHandler("onPlayerQuit", getRootElement(), onQuit)

function vehicleEnter(thePlayer, seat, jacked)
	if isElement(thePlayer) and getElementData(thePlayer, "visz:status") == 1 then
		if isElement(getElementData(thePlayer, "visz:viszi")) then
			local veh = getPedOccupiedVehicle(thePlayer)
				if (warpPedIntoVehicle(getElementData(thePlayer, "visz:viszi"), veh, 3)) then
					exports.san_chat:sendLocalMeAction(thePlayer, "implantando o homem no veículo.")
				end
			end

		end
	end
addEventHandler("onVehicleEnter", getRootElement(), vehicleEnter)

function vehicleExit(thePlayer)
	if isElement(thePlayer) and getElementData(thePlayer, "visz:status") == 1 then
		if isElement(getElementData(thePlayer, "visz:viszi")) then
			local veh = source
			if (veh) then
				if (removePedFromVehicle(getElementData(thePlayer, "visz:viszi"))) then
					exports.san_chat:sendLocalMeAction(thePlayer, "removendo o homem do veículo.")
					setElementFrozen(getElementData(thePlayer, "viszi:viszi"), true)
				end
			end
		end
	end
end
addEventHandler("onVehicleExit", getRootElement(), vehicleExit)


function removeDutyItemOnQuit()
	exports['san_items']:RemovePlayerDutyItems(source)
	setElementData(source, "char.inDuty", 0)
end
addEventHandler("onPlayerQuit",getRootElement(),removeDutyItemOnQuit)





local myMarker = createMarker (331.37518310547, -1497.4442138672, 35.139062, "cylinder", 1, 255, 255, 0, 170 )
setElementData(myMarker,"informacao","RECUPERAR VIDA")
function checkMedicals(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" and not isPedInVehicle(hitplayer) then

	    local samuTeam = getTeamFromName ( "Medic" )
		local samuCount = countPlayersInTeam ( samuTeam )
		if samuCount <= 1 then
			triggerClientEvent(hitplayer, "showHealthPanel", hitplayer, hitplayer, 1)
		else
			outputChatBox("#dc143c[Error]:#ffffff At the moment we can not cure you because there is Medico online in the city", hitplayer, 255, 255, 255, true)
		end
		
	end
end
addEventHandler( "onMarkerHit", myMarker, checkMedicals )

function stopMedicals(hitplayer, dimension)
	if isElement(hitplayer) and getElementType(hitplayer) == "player" then
			triggerClientEvent(hitplayer, "showHealthPanel", hitplayer, hitplayer, 2)		
	end
end
addEventHandler( "onMarkerLeave", myMarker, stopMedicals )

function gyogyitPlayer(player)
	if isElement(player) then
		if getElementHealth(player) == 100 then
			outputChatBox("#dc143c[Error]:#ffffffYou're 100% life your ungrateful!.", player, 255, 255, 255, true)
			return
		end
		
		setElementHealth(player, 100)
		
		setPedHeadless(player, false)
		toggleAllControls(player, true, true, false)
		toggleControl(player, 'forwards', true) 
		toggleControl(player, 'left', true)
		toggleControl(player, 'right', true)
		toggleControl(player, 'backwards', true)
		toggleControl(player, 'enter_passenger', true)
		toggleControl(player, 'enter_exit', true)
		toggleControl(player, 'aim_weapon', true)
		toggleControl(player, 'jump', true)
		toggleControl(player, 'fire', true)
		
		--exports.ex_infobox:addNotification(player, "Sikeresen meggy�gy�tottad magad.", 4)
		outputChatBox("#1E8BC3[Informação]:#ffffff You have successfully completed your wounds. This cost: #00aeefR$: 200", player, 255, 255, 255, true)
		setElementData(player, "char:money", getElementData(player, "char:money")-200)
		--exports["ex_dashboard"]:giveGroupBalance(8, 100)
		
	end
end
addEvent("gyogyitPlayer", true)
addEventHandler("gyogyitPlayer", getRootElement(), gyogyitPlayer)




local prodel = createColCuboid(1566.37756, -1681.55640, 13.09150, 5.1129150390625, 9.270263671875, 8.2000059127808)
addEventHandler ("onColShapeHit", prodel,
function(hitElement)
  if (getElementType (hitElement) == "player") then
	if getElementData(thePlayer, "acc:admin") >= 1 or getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15 then
else
	exports.san_infobox:addNotification(hitElement,"PROIBIDO ENTRAR NESTE LOCAL!","info")
    setElementPosition(hitElement, 1557.6169433594,-1672.3117675781,16.191499710083)
end
end
end)




local LSPD = createColCuboid(1862.0216064453, -1656.7506103516, 14.89999961853, 3.34033203125, 12.6549072265625, 4.9)
addEventHandler ("onColShapeHit", LSPD,
function(hitElement)
 	if getElementType ( hitElement ) == "vehicle" then
	
	
	
    setElementPosition(hitElement, 1897.6921386719, -1632.6291503906, 13.456892013559  )
 	setElementVelocity(hitElement, 0, 0, 0)
	setElementRotation(hitElement,0,0,357)
	
end
end)




local LSPD2 = createColCuboid( 1863, -1656.7506103516, 14.89999961853, 3.34033203125, 12.6549072265625, 4.9)
addEventHandler ("onColShapeHit", LSPD2,
function(hitElement)
 	if getElementType ( hitElement ) == "player" then
	if exports.san_dashboard:isPlayerInFaction(hitElement, 1) then return end
	if exports['san_items']:hasItemS(hitElement, 44) or exports['san_items']:hasItemS(hitElement, 47) or exports['san_items']:hasItemS(hitElement, 48) or exports['san_items']:hasItemS(hitElement, 49) or exports['san_items']:hasItemS(hitElement, 50) or exports['san_items']:hasItemS(hitElement, 51) or exports['san_items']:hasItemS(hitElement, 52) or exports['san_items']:hasItemS(hitElement, 53)then
	--outputChatBox("#ff0000Error: #fff000Shoma Ba Aslahe Nemitoni Vared Beshi!", thePlayer, 255, 255, 255, true)
	exports.san_infobox:addNotification(hitElement,"Shoma Ba Aslahe Nemitoni Vared Beshi!","info")
    setElementPosition(hitElement, 1861.01953125, -1650.3760986328, 16.10000038147  )
 	setElementVelocity(hitElement, 0, 0, 0)
	setElementRotation(hitElement,0,0,271.2)
	end
end
end)






function loc(thePlayer, commandName, targetPlayer)
		if getElementData(thePlayer, "acc:admin") >= 10 then
	  	--if exports.san_dash:isInGroup(thePlayer, 2) or getElementData(thePlayer, "char:dutyfaction") == 17 or exports.san_dash:isInGroup(thePlayer, 16) or exports.san_dash:isInGroup(thePlayer, 20) or exports.san_dash:isInGroup(thePlayer, 3) or exports.san_dash:isInGroup(thePlayer, 4) or exports.san_dash:isInGroup(thePlayer, 12) then
		if not (targetPlayer) then
			outputChatBox("#7cc576Error:#ffffff /" .. commandName .. " [nome / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
			local x, y, z = getElementPosition(targetPlayer) 
			exports.Script_futeis:setGPS(thePlayer, "CoordenMilicia", x, y, z)
			exports.san_hud:dm("para desligar a localização use /parargps", thePlayer, 255, 255, 0)
			exports.san_hud:dm("Você localizou o jogador "..getPlayerName(targetPlayer).."", thePlayer, 255, 255, 0)


			--outputChatBox(" ", targetPlayer, 255, 255, 255, true )
			--outputChatBox(" ", targetPlayer, 255, 255, 255, true )
			--outputChatBox(" ", targetPlayer, 255, 255, 255, true )
			--outputChatBox(" ", targetPlayer, 255, 255, 255, true )
			--exports.san_hud:dm(" "..getPlayerName(thePlayer).." Te localizou no gps e está a caminho!", targetPlayer, 255, 200, 0)
			--outputChatBox(" "..getPlayerName(thePlayer).." #00ff00Te localizou no gps e está a caminho!", targetPlayer, 255, 255, 255, true )
			--outputChatBox("CASO A LOCALIZAÇÃO NÃO FOI FEITA POR #00ff00CHAMMilicia!", targetPlayer, 255, 255, 255, true )
			--outputChatBox("#fff000DENUNCIE #ffffffPARA A STAFF!", targetPlayer, 255, 255, 255, true )
		
				--for k, v in ipairs(getElementsByType("player")) do
				--ports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(thePlayer) .. " (" .. getElementData(thePlayer, "playerid") .. ") #ffffff usou o #0094ff/loc #ffffffno jogador #0094ff"..getPlayerName(targetPlayer).."(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff.")
				--end
			else
				outputChatBox("nâo existe tal jogador.", thePlayer, 255, 255, 255, true)
			end
		end
--		else
--		outputChatBox("Comando liberado apenas para corporações", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("loc", loc, false, false)





function policiaon(thePlayer)
    local policiaTeam = getTeamFromName ( "LSPD" )
    local groveCount = countPlayersInTeam ( policiaTeam )
    if groveCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(groveCount).." policais na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos nenhuma policia online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("LSPD", policiaon )


function motoclubeon(thePlayer)
    local policiaTeam = getTeamFromName ( "motoclube" )
    local groveCount = countPlayersInTeam ( policiaTeam )
    if groveCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(groveCount).." Moto Clube na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos nenhum Moto Clube online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("motoclube", motoclubeon )


function mecanicoon(thePlayer)
    local mecTeam = getTeamFromName ( "Mechanic" )
    local mecCount = countPlayersInTeam ( mecTeam )
    if mecCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(mecCount).." mecanicos na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos nenhum mecanico online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("Mechanic", mecanicoon )


function samuon(thePlayer)
    local samuTeam = getTeamFromName ( "Samu" )
    local samuCount = countPlayersInTeam ( samuTeam )
    if samuCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(samuCount).." samu na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos ninguem da samu online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("samu", samuon )
addCommandHandler("resgate", samuon )


function medicoson(thePlayer)
    local medicosTeam = getTeamFromName ( "Medic" )
    local medicosCount = countPlayersInTeam ( medicosTeam )
    if medicosCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(medicosCount).." medicos na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos ninguem da samu online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("Medic", medicoson )



function taxion(thePlayer)
    local taxiTeam = getTeamFromName ( "Taxi" )
    local taxiCount = countPlayersInTeam ( taxiTeam )
    if taxiCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(taxiCount).." Taxi na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos ninguem do Taxi online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("taxi", taxion )



function drvvon(thePlayer)
    local drvvTeam = getTeamFromName ( "Detran" )
    local drvvCount = countPlayersInTeam ( drvvTeam )
    if drvvCount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..tonumber(drvvCount).." Detrans na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos ninguem da Detran online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("detran", drvvon )


--   if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
--   if getElementData(player, "acc:admin") >= 1 then

--[[
function staffon(thePlayer)
    local staffteam = getElementData(player, "acc:admin") >= 1
    local staffcount = (tonumber(getElementData(thePlayer, "acc:admin")) >= 1)
    if staffcount >= 1 then
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente estamos com "..(staffcount).." Staff's na cidade",thePlayer,  255, 255, 255, true)
else
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer, 255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox(" ",thePlayer,  255, 255, 255, true)
    outputChatBox("#dc143c[IRG]:#ffffff Atualmente não temos ninguem da STAFF online na cidade",thePlayer,  255, 255, 255, true)
end
end
addCommandHandler("staffs", staffon )

]]--


-----------------------------------------------------------------------------------------------------------------------
----------------LSPD---------------
local factionSkins = {
    [1] = { -- LSPD
        skins = {
            ["1"] = {287}, ["2"] = {291}, ["3"] = {285}, ["4"] = {292}, ["5"] = {295},
            ["6"] = {304}, ["7"] = {298}, ["8"] = {293}, ["9"] = {288}, ["10"] = {297}
        },
        colshape = createColSphere(1888.29, -1646.90, 16.03, 3)
    },
    [3] = { -- Justice
        skins = {
            ["1"] = {1}, ["2"] = {300}, ["3"] = {303}
        },
        colshape = createColSphere(1650.45, -1324.00, 25.55, 3)
    },
    [31] = { -- Medic
        skins = {
            ["1"] = {101}, ["2"] = {102}
        },
        colshape = createColSphere(335.33, -1482.69, 36.03, 3)
    },
    [17] = { -- Mechanic
        skins = {
            ["1"] = {50}, ["2"] = {113}, ["3"] = {114}
        },
        colshape = createColSphere(382.42, -1812.13, 11.40, 3)
    },
    [20] = { -- Mafia
        skins = {
            ["1"] = {51}, ["2"] = {46}, ["3"] = {37}
        },
        colshape = createColSphere(148.03, 1372.59, 1088.36, 3)
    }
}


function changeSkin(thePlayer, commandName, level)
    local accName = getAccountName(getPlayerAccount(thePlayer))
    local playerFaction = getElementData(thePlayer, "char:dutyfaction")

    -- بررسی فکشن بازیکن
    if not playerFaction or not factionSkins[playerFaction] then
        outputChatBox("#ff0000!شما دیوتی نیستید", thePlayer, 255, 255, 255, true)
        return
    end

    -- بررسی موقعیت بازیکن
    local factionData = factionSkins[playerFaction]
    if not isElementWithinColShape(thePlayer, factionData.colshape) then
        outputChatBox("#ff0000!شما در منطقه مشخص‌شده برای تغییر اسکین نیستید", thePlayer, 255, 255, 255, true)
        return
    end

    -- بررسی سطح (level)
    if not level or not factionData.skins[level] then
        outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [1,...]", thePlayer, 255, 255, 255, true)
        return
    end

    -- اعمال اسکین
    local skinID = factionData.skins[level][1]
    setElementModel(thePlayer, skinID)
    outputChatBox("#7cc576Skin changed successfully to ID: " .. skinID, thePlayer, 255, 255, 255, true)
end
addCommandHandler("skin", changeSkin, false, false)










-------------------------------------------
------------medic
function dutyInfo(player, factionID, colShape)
    if exports.san_dashboard:isPlayerInFaction(player, factionID) then
        if getElementData(player, "char:dutyfaction") then
            exports["san_infobox"]:addNotification(player, "Baraye off Duty E Ra Bezanid", "info")
        else
            exports["san_infobox"]:addNotification(player, "Baraye Duty E Ra Bezanid", "info")
        end
    end
end
addEventHandler("onColShapeHit", Medicos, function(player) dutyInfo(player, 31, Medicos) end)
addEventHandler("onColShapeHit", Mecanico, function(player) dutyInfo(player, 17, Mecanico) end)
addEventHandler("onColShapeHit", Baep, function(player) dutyInfo(player, 1, Baep) end)
addEventHandler("onColShapeHit", PoliciaCivil, function(player) dutyInfo(player, 3, PoliciaCivil) end)








-- isElementWithinColShape(player, Medicos) or isElementWithinColShape(player, Baep) or isElementWithinColShape(player, Policia11) or isElementWithinColShape(player, Mecanico) or isElementWithinColShape(player, ComandoVermelho) then
		-------------AsanSor LSPD
		
		

















tpLSPD = createColSphere(1889.3803710938, -1654.74609375, 16.031684875488, 1, 1275, 0 )
tpLSPD2 = createColSphere(1855.9246826172, -1679.521484375, 20.60000038147, 1, 1275, 0 )
tpLSPD3 = createColSphere(1877.0618896484, -1655.0942382812, 28.80312538147, 1, 1275, 0 )
LSPD1 = createMarker ( 1889.3803710938, -1654.74609375, 16.031684875488-1, "cylinder", 1, 255, 255, 0, 170 )
LSPD2 = createMarker ( 1855.9246826172, -1679.521484375, 20.60000038147-1, "cylinder", 1, 255, 255, 0, 170 )
LSPD3 = createMarker ( 1877.0618896484, -1655.0942382812, 28.80312538147-1, "cylinder", 1, 255, 255, 0, 170 )



function tpLSPD1 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD) and getElementDimension(thePlayer) == getElementDimension(tpLSPD) then
	 setElementPosition(thePlayer, 1856.0443115234, -1678.1279296875, 20.600000381476)
 
end
end
end
addCommandHandler("bala1",tpLSPD1)



function tpLS2 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD2) and getElementDimension(thePlayer) == getElementDimension(tpLSPD2) then
	 setElementPosition(thePlayer, 1889.3803710938, -1654.74609375, 16.031684875488)
 
end
end
end
addCommandHandler("paein1",tpLS2)




function tpLS3 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD) and getElementDimension(thePlayer) == getElementDimension(tpLSPD) then
	 setElementPosition(thePlayer, 1877.0618896484, -1655.0942382812, 28.80312538147)
 
end
end
end
addCommandHandler("tp3",tpLS3)



function tpLS4 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD2) and getElementDimension(thePlayer) == getElementDimension(tpLSPD2) then
	 setElementPosition(thePlayer, 1877.1512451172, -1654.0001220703, 28.80312538147)
 
end
end
end
addCommandHandler("bala3",tpLS4)




function tpLS5 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD3) and getElementDimension(thePlayer) == getElementDimension(tpLSPD3) then
	 setElementPosition(thePlayer, 1855.9246826172, -1679.521484375, 20.60000038147)
 
end
end
end
addCommandHandler("paein3",tpLS5)




function tpLS6 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer, "char:dutyfaction") == 1 or ( isObjectInACLGroup ("user."..accName, aclGetGroup ( "Console" ) ) )  then
     if isElementWithinColShape(thePlayer, tpLSPD3) and getElementDimension(thePlayer) == getElementDimension(tpLSPD3) then
	 setElementPosition(thePlayer, 1889.3803710938, -1654.74609375, 16.031684875488)
 
end
end
end
addCommandHandler("tp",tpLS6)




function tp1 ( player )



    
    if exports.san_dashboard:isPlayerInFaction(player , 1) then
	
	--if getElementData(player,"char:dutyfaction") then
	exports["san_infobox"]:addNotification(player,"Baraye Bala Raftan Az 'Page Up' Va Paein 'Page Down'","info")
	
	end
    
    --end
end


addEventHandler ( "onColShapeHit", tpLSPD, tp1 )









------------------Asansor Justice
tpj = createColSphere(1644.4283447266, -1344.052734375, 17.590625762939, 1, 1275, 0 )
tpj2 = createColSphere(1645.8879394531, -1344.9757080078, 25.543750762939, 1, 1275, 0 )
justice1 = createMarker ( 1644.4283447266, -1344.052734375, 17.590625762939-1, "cylinder", 1, 255, 255, 0, 170 )
justice2 = createMarker ( 1645.8879394531, -1344.9757080078, 25.543750762939-1, "cylinder", 1, 255, 255, 0, 170 )



function tpjustice1 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

    if getElementData(thePlayer , "acc:id") then
     if isElementWithinColShape(thePlayer, tpj) and getElementDimension(thePlayer) == getElementDimension(tpj) then
	 setElementPosition(thePlayer, 1645.8879394531, -1344.9757080078, 25.543750762939)
 
end
end
end
addCommandHandler("bala1",tpjustice1)


function tpjustice2 ( thePlayer )
    local accName = getAccountName(getPlayerAccount(thePlayer))
	

   if getElementData(thePlayer , "acc:id") then
     if isElementWithinColShape(thePlayer, tpj2) and getElementDimension(thePlayer) == getElementDimension(tpj2) then
	 setElementPosition(thePlayer, 1644.4283447266, -1344.052734375, 17.590625762939)
 
end
end
end
addCommandHandler("paein1",tpjustice2)





function tpinfo ( player )



    
    if getElementData(player , "acc:id") then
	
	--if getElementData(player,"char:dutyfaction") then
	exports["san_infobox"]:addNotification(player,"Baraye Bala Raftan Az 'Page Up' Va Paein 'Page Down'","info")
	
	end
    
    --end
end


addEventHandler ( "onColShapeHit", tpj, tpinfo )


