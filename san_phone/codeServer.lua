--[[
function EnviarMoney(item, targetplayer)
         if item < getElementData(source, "char:money") or item == getElementData(source, "char:money") then
		local targetPlayer2, targetPlayerName = exports.san_core:findPlayer(source, targetplayer)
		
		setElementData(source, "char:money", (getElementData(source, "char:money") or 0)-item)
		setElementData(targetPlayer2, "char:money", (getElementData(targetPlayer2, "char:money") or 0) + item)
		outputChatBox("#7cc576[BV  - Banco]: #ffffff "..getPlayerName(source).." Fez uma transferência R$ "..item.." para você!", targetPlayer2, 25, 152, 139, true)
		else
		outputChatBox("#7cc576[BV  - Banco]: #ffffffVocê não tem dinheiro", source, 25, 152, 139, true)
    end
end
addEvent("EnviarMoney", true)
addEventHandler("EnviarMoney", root, EnviarMoney)]]--

function giveMoneyToPlayer(id,money)
if isTimer(timer) then return end

local player2 = exports.san_core:findPlayer(source, id)
if player2 then
if (source ~= player2) then
local x, y, z = getElementPosition(source)
local tx, ty, tz = getElementPosition(player2)
local distance = getDistanceBetweenPoints3D(x, y, z, tx, ty, tz)	
if distance <= 3  then
	timer = setTimer(function() end, 5000, 1) 
if getElementData(source, "char:money") >= money then 
setElementData(source, "char:money", getElementData(source, "char:money")-money)
setElementData(player2, "char:money", getElementData(player2, "char:money")+money)
outputChatBox ( "#FFFFFF*Você enviou R$: "..money.." para " .. getPlayerName(player2), source , 200, 0, 0, true)
outputChatBox ( "#FFFFFF*" .. getPlayerName(source) .." enviou R$: "..money.." para você ", player2, 200, 0, 0, true)
exports.san_hud:dm("Você enviou R$: "..money.." para " .. getPlayerName(player2),source, 200, 100, 0)
exports.san_hud:dm("*" .. getPlayerName(source) .." enviou R$: "..money.." para você",player2, 200, 100, 0)
else
	outputChatBox('#0071fe[TRANSFERIDOR] #FFFFFFVocê está sem dinheiro', source,255,255,255,true) 
end
else
exports.san_hud:dm("*Este jogador esta muito longe de você",source, 200, 100, 0)
end
else
exports.san_hud:dm("*Você pode enviar dinheiro pra você mesmo!",source, 200, 100, 0)
outputChatBox ( "#FFFFFF*Você pode enviar dinheiro pra você mesmo!", source , 200, 0, 0, true)
end
else
exports.san_hud:dm("*Este jogador não esta online!",source, 200, 100, 0)
outputChatBox ( "#FFFFFF*Este jogador não esta online!", source , 200, 0, 0, true)
end
end
addEvent("MoneyTransfer",true)
addEventHandler("MoneyTransfer",root,giveMoneyToPlayer)

local animTimer = {}
local phone = {}


addEvent("sandroid.startAnimation", true)
addEventHandler("sandroid.startAnimation", root, function()
    --setPedWeaponSlot(client, 0)
	phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
	exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
	setElementDimension(phone[client], getElementDimension(client))
	setElementInterior(phone[client], getElementInterior(client))
	setPedAnimation ( client, "ped","phone_in", 1000, false, false, false, true)
	animTimer[client] = setTimer(function(player)
		if ( isElement(player) ) then
			setPedAnimationProgress(player, "phone_in", 0.8)
		end
	end, 500, 0, client)
end)



-----------------------------------------------------------------
addEvent("sandroid.startAnimation1", true)
addEventHandler("sandroid.startAnimation1", root, function()
    toggleControl(client, "aim_weapon", false)
	toggleControl(client, "fire", false)
	toggleControl(client, "jump", false)
	--setElementData(client, "playerInUse", false)
    --setPedWeaponSlot(client, 0)
	phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
	exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
	setElementDimension(phone[client], getElementDimension(client))
	setElementInterior(phone[client], getElementInterior(client))
	setPedAnimation ( client, "ped","phone_in", 1000, false, false, false, true)
	animTimer[client] = setTimer(function(player)
		if ( isElement(player) ) then
			setPedAnimationProgress(player, "phone_in", 0.8)
		end
	end, 500, 0, client)
end)
addEvent("sandroid.startAnimation2", true)
addEventHandler("sandroid.startAnimation2", root, function()
    toggleControl(client, "aim_weapon", false)
	toggleControl(client, "fire", false)
	toggleControl(client, "jump", false)
	--setElementData(client, "playerInUse", false)
    --setPedWeaponSlot(client, 0)
	--phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
	--exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
	setElementDimension(phone[client], getElementDimension(client))
	setElementInterior(phone[client], getElementInterior(client))
	setPedAnimation ( client, "ped","phone_in", 1000, false, false, false, true)
	animTimer[client] = setTimer(function(player)
		if ( isElement(player) ) then
			setPedAnimationProgress(player, "phone_in", 0.8)
		end
	end, 500, 0, client)
	--setPedAnimation(client, "ped", "phone_in", -1, false, false, false, false)
	
end)


addEvent("sandroid.startAnimation3", true)
addEventHandler("sandroid.startAnimation3", root, function()
    toggleControl(client, "aim_weapon", false)
	toggleControl(client, "fire", false)
	toggleControl(client, "jump", false)
	--setElementData(client, "playerInUse", false)
    --setPedWeaponSlot(client, 0)
	phone[client] = createObject(330, 0, 0, 0, 0, 0, 0)
	exports.bone_attach:attachElementToBone(phone[client], client, 12, 0, 0.01, 0.03, -15, 270, -15)
	setElementDimension(phone[client], getElementDimension(client))
	setElementInterior(phone[client], getElementInterior(client))
	setPedAnimation ( client, "ped","phone_in", 1000, false, false, false, true)
	--[[animTimer[client] = setTimer(function(player)
		if ( isElement(player) ) then
			setPedAnimationProgress(player, "phone_in", 0.8)
		end
	end, 500, 0, client)]]
	--setPedAnimation(client, "ped", "phone_in", -1, false, false, false, false)
	
end)

addEvent("sandroid.stopAnimation1", true)
addEventHandler("sandroid.stopAnimation1", root, function()
    toggleControl(client, "aim_weapon", true)
	--setElementData(client, "playerInUse", true)
	toggleControl(client, "fire", true)
	toggleControl(client, "jump", true)
	removePhone(client)
	setPedAnimation ( client, "ped", "phone_out", 50, false, false, false, false)
end)

addEvent("sandroid.stopAnimation3", true)
addEventHandler("sandroid.stopAnimation1", root, function()
    toggleControl(client, "aim_weapon", true)
	--setElementData(client, "playerInUse", true)
	toggleControl(client, "fire", true)
	toggleControl(client, "jump", true)
	--removePhone(client)
	setPedAnimation ( client, "ped", "phone_out", 50, false, false, false, false)
end)
-------------------------------------------------------------------


addEvent("sandroid.stopAnimation", true)
addEventHandler("sandroid.stopAnimation", root, function()
	removePhone(client)
	setPedAnimation ( client, "ped", "phone_out", 50, false, false, false, false)
end)

addEventHandler("onPlayerQuit", root, function()
	removePhone(source)
end)

addEventHandler("onPlayerWasted", root, function()
	removePhone(source)
end)

addEvent("onPlayerArrested", true)
addEventHandler("onPlayerArrested", root, function()
	removePhone(source)
end)

addEvent("server->payMoney", true)
addEventHandler("server->payMoney", getRootElement(), function(to, amount)
	if (getElementData(client, "char:moneysujo") or 0) < amount then
		outputChatBox("#7cc576[BV ]: #ffffffVocê não tem tanto dinheiro sujo.", client, 255, 255, 255, true)
		return
	end

	setElementData(client, "char:moneysujo", (getElementData(client, "char:moneysujo") or 0) - amount)
	setElementData(to, "char:moneysujo", (getElementData(to, "char:moneysujo") or 0) + amount)
	
	exports.san_chat:sendLocalMeAction(client, "passou dinheiro sujo para " .. getPlayerName(to):gsub("_", " "))
	outputChatBox("#7cc576[BV ]: #2ab8e8"..getPlayerName(client):gsub("_", " ").." #ffffffte passou #7cc576"..(amount).."#ffffff de dinheiro sujo.", to, 255, 255, 255, true)
	setPedAnimation(client)
	setPedAnimation(to)
	
end)

function animpassandomoney()
	setPedAnimation(source, "DEALER", "shop_pay", 2000, false, true, true)
end
addEvent("animpassandomoney", true)
addEventHandler("animpassandomoney", root, animpassandomoney)

function removePhone(player)
	if (phone[player]) then
		destroyElement(phone[player])
		phone[player] = nil
	end
	if (animTimer[player]) then
		killTimer(animTimer[player])
		animTimer[player] = nil
	end	
	setPedAnimation(player)
end


function abrircelular()
	exports.san_chat:sendLocalMeAction(source, "Telphon Ra Biron Avard.")
end
addEvent("abrircelular", true)
addEventHandler("abrircelular", root, abrircelular)


function animarcelular(teste)
executeCommandHandler (teste, source)

end
addEvent("animarcelular", true)
addEventHandler("animarcelular", root, animarcelular)

 function painel(thePlayer)
	if getElementData(thePlayer, "loggedin") == false then return end
	if exports.san_items:hasItemS(thePlayer, 16) then 
		setElementData(thePlayer, "celular", true)
		triggerClientEvent(thePlayer, "Celular", getRootElement())
		
		

	else
	setElementData(thePlayer, "celular", false)
	triggerClientEvent(thePlayer, "Celular", getRootElement())
	--	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	--	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	--	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	--	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	--	outputChatBox("#7cc576[IRG-MTA]:#ffffff Você não tem celular é preciso comprar um nos comercios da cidade ( Icone Bolinha amarela no F11 ).", thePlayer, 255, 255, 255, true)
	end
end

local objetosom = { }
local objetocaixa = { }
local objetoflor = { }
local objetoguardachuva = { }

addEvent( "objetomaosom", true )
addEventHandler( "objetomaosom", root,
function (thePlayer, object)

		if isElement(objetosom[thePlayer]) then


			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

	setPedAnimation ( thePlayer )
	outputChatBox("#7cc576[BV ] #bebebeVocê soltou o(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		else

			
			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end


		outputChatBox("#7cc576[BV ] #bebebeVocê está segurando um(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		objetosom[thePlayer] = createObject(2226,0,0,0) 
		exports.san_anims:setJobAnimation(thePlayer)
		setElementDimension(objetosom[thePlayer], getElementDimension(thePlayer))
		setElementInterior(objetosom[thePlayer], getElementInterior(thePlayer))
		exports.bone_attach:attachElementToBone(objetosom[thePlayer],thePlayer,12,0,0,0.4,0,180,0) 
	end
end
)


addEvent( "objetomaocaixa", true )
addEventHandler( "objetomaocaixa", root,
function (thePlayer, object)
		if isElement(objetocaixa[thePlayer]) then

			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end

			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		setPedAnimation ( thePlayer )
		outputChatBox("#7cc576[BV ] #bebebeVocê soltou o(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		else
		

			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		outputChatBox("#7cc576[BV ] #bebebeVocê está segurando um(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		local rot = getElementRotation(thePlayer)
		objetocaixa[thePlayer] = createObject(337, 0, 0, 0)

		setElementDimension(objetocaixa[thePlayer], getElementDimension(thePlayer))
		setElementInterior(objetocaixa[thePlayer], getElementInterior(thePlayer))

		setObjectScale(objetocaixa[thePlayer], 1.5)	
		exports.bone_attach:attachElementToBone(objetocaixa[thePlayer],thePlayer,12,0.3,0.05,0.2,0,200,0)
	end
end
)


addEvent( "objetomaoflor", true )
addEventHandler( "objetomaoflor", root,
function (thePlayer, object)
		if isElement(objetoflor[thePlayer]) then

			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		setPedAnimation ( thePlayer )
		outputChatBox("#7cc576[BV ] #bebebeVocê soltou o(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		else

			
			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		outputChatBox("#7cc576[BV ] #bebebeVocê está segurando um(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		objetoflor[thePlayer] = createObject(325,0,0,0) 
		exports.san_anims:setJobAnimation(thePlayer)
		
		setElementDimension(objetoflor[thePlayer], getElementDimension(thePlayer))
		setElementInterior(objetoflor[thePlayer], getElementInterior(thePlayer))
		exports.bone_attach:attachElementToBone(objetoflor[thePlayer],thePlayer,12,-0.02,0,0,0,-90,0) 
	end
end
)


addEvent( "objetgchuva", true )
addEventHandler( "objetgchuva", root,
function (thePlayer, object)
		if isElement(objetoguardachuva[thePlayer]) then

			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		setPedAnimation ( thePlayer )
		outputChatBox("#7cc576[BV ] #bebebeVocê soltou o(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		else

			
			if isElement(objetoguardachuva[thePlayer]) then
				destroyElement(objetoguardachuva[thePlayer])
			end
			
			if isElement(objetosom[thePlayer]) then
				destroyElement(objetosom[thePlayer])
			end

			if isElement(objetoflor[thePlayer]) then
				destroyElement(objetoflor[thePlayer])
			end

			if isElement(objetocaixa[thePlayer]) then
				destroyElement(objetocaixa[thePlayer])
			end

		outputChatBox("#7cc576[BV ] #bebebeVocê está segurando um(a) #7cc576"..object.."", thePlayer, 255, 255, 255, true)
		objetoguardachuva[thePlayer] = createObject(642,0,0,0) 
		setElementDimension(objetoguardachuva[thePlayer], getElementDimension(thePlayer))
		setElementInterior(objetoguardachuva[thePlayer], getElementInterior(thePlayer))
		setObjectScale(objetoguardachuva[thePlayer], 0.5)	

		exports.bone_attach:attachElementToBone(objetoguardachuva[thePlayer],thePlayer,12,-0.5,-0.21,-0.1,120,-60,0) 


		setPedAnimation ( thePlayer, "GANGS", "smkcig_prtl_f", -0, true, false, false )
		setTimer ( setPedAnimationProgress, 100, 1, thePlayer, "smkcig_prtl_f", 1.9)
		setTimer ( setPedAnimationSpeed, 100, 1, thePlayer, "smkcig_prtl_f", 0)

		--exports.san_anims:setJobAnimation(thePlayer, "CARRY", "crry_prtial", 500, false, false, true, true)

	end
end
)






addEventHandler("onPlayerQuit", root, function()
	if isElement(objetosom[source]) then
		destroyElement(objetosom[source])
	end

	if isElement(objetoflor[source]) then
		destroyElement(objetoflor[source])
	end


	if isElement(objetocaixa[source]) then
		destroyElement(objetocaixa[source])
	end


	if isElement(objetoguardachuva[source]) then
		destroyElement(objetoguardachuva[source])
	end
	
	if isElement(objetosom[source]) then
		destroyElement(objetosom[source])
	end

	if isElement(objetoflor[source]) then
		destroyElement(objetoflor[source])
	end

end)




function removerobj (thePlayer, commandName)
	if isElement(objetosom[thePlayer]) then
		destroyElement(objetosom[thePlayer])
	end

	if isElement(objetoflor[thePlayer]) then
		destroyElement(objetoflor[thePlayer])
	end


	if isElement(objetocaixa[thePlayer]) then
		destroyElement(objetocaixa[thePlayer])
	end


	if isElement(objetoguardachuva[thePlayer]) then
		destroyElement(objetoguardachuva[thePlayer])
	end
	
	if isElement(objetosom[thePlayer]) then
		destroyElement(objetosom[thePlayer])
	end

	if isElement(objetoflor[thePlayer]) then
		destroyElement(objetoflor[thePlayer])
	end


end
addCommandHandler("removerobj", removerobj)


function restart()
	for index, player in ipairs(getElementsByType("player")) do
		bindKey(player, "b", "down", painel) -- Bind Para Abrir/Fechar Painel
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), restart)

function entrar()
	bindKey(source, "b", "down", painel) -- Bind Para Abrir/Fechar Painel
end
addEventHandler("onPlayerJoin", getRootElement(), entrar)

function fechar(player)
	for index, player in ipairs(getElementsByType("player")) do
		unbindKey(player, "b", "down", painel) -- Bind Para Abrir/Fechar Painel
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), fechar)



























local BLIP_VISIBLE_DISTANCE = 750

local blips2 = {}
local blips3 = {}
local blips4 = {}

local BLIP_VISIBLE_DISTANCE = 750
local blips = {}

player_blips = {} --creating a table 


local medicoCall = {}
local medicoCallCount = 0
addEvent( "SendMsgToTeammedic", true )
addEventHandler( "SendMsgToTeammedic", root,
function (menCopom)
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)


		if getElementData(source, "call:medico") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Você já tem uma chamada em andamento aguarde 1 minuto para fazer novamente.", source, 255, 255, 255, true) return end

		outputChatBox("#bebebeVocê chamou o medico, aguarde.", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Você chamou o médico, aguarde.", source, 255, 200, 0)

		medicoCallCount = medicoCallCount + 1
		medicoCall[medicoCallCount] = source
		setElementData(source, "call:medico", medicoCallCount)

		setTimer ( setElementData, 60000, 1, source, "call:medico", nil)
		tirarchamadomedicoCall = setTimer(function()
			medicoCall[medicoCallCount] = nil
		end, 180000, 1 )


		local x, y, z = getElementPosition(source)
		setElementData(source, "call:medicoposx", x)
		setElementData(source, "call:medicoposy", y)
		setElementData(source, "call:medicoposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if getElementData(player, "char:dutyfaction") == 31 then
			   outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
         outputChatBox("#FFA000[COPOM RESGATE] #FFFFFFUnidade disponivel? Chamada: #FFA000"..medicoCallCount, player, 255, 255, 255, true)
				 outputChatBox("#FFA000[COPOM RESGATE] #FFFFFFChamada feita por: "..getPlayerName(source), player, 255, 255, 255, true)
				 outputChatBox("#FFA000[COPOM RESGATE] #FFFFFFChamada emitida: #FFA000"..menCopom, player, 255, 255, 255, true)
			  end
		end
end )

function aceitarmedico(thePlayer, commandName, acceptID)
	if getElementData(thePlayer, "char:dutyfaction") == 31 then
		if (acceptID) then
			local acceptID = tonumber(acceptID)
			if medicoCall[acceptID] then
				exports.san_hud:dm("Você aceitou o chamado " .. acceptID .. " desloque até o local.", thePlayer, 255, 200, 0)
				exports.san_hud:dm("O medico aceitou sua chamada e está a caminho", medicoCall[acceptID], 255, 200, 0)
				if isTimer(tirarchamadomedicoCall) then
				killTimer(tirarchamadomedicoCall)
				end
				local x, y, z = getElementData(medicoCall[acceptID], "call:medicoposx"), getElementData(medicoCall[acceptID], "call:medicoposy"), getElementData(medicoCall[acceptID], "call:medicoposz")
				triggerClientEvent(thePlayer, "createMedicoMarker", thePlayer, thePlayer, acceptID, medicoCall[acceptID], x, y, z)
				medicoCall[acceptID] = nil
			  else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff Não existe essa chamada ou a chamada já foi aceita.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("ac", aceitarmedico)






local msCall = {}
local msCount = 0
addEvent( "SendMsgToTeamPolicia", true )
addEventHandler( "SendMsgToTeamPolicia", root,
function (menCopom)
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)

		if getElementData(source, "call:policia") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Você já tem uma chamada em andamento aguarde 1 minuto para fazer novamente.", source, 255, 255, 255, true) return end
		msCount = msCount + 1
		msCall[msCount] = source
		setElementData(source, "call:policia", msCount)

		outputChatBox("#bebebeVocê chamou a policia, aguarde.", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Você chamou a policia, aguarde.", source, 255, 200, 0)

		setTimer ( setElementData, 60000, 1, source, "call:policia", nil)
		tirarchamadomsCount = setTimer(function()
		msCall[msCount] = nil
		end, 25000, 1 )


		local x, y, z = getElementPosition(source)
		setElementData(source, "call:policiaposx", x)
		setElementData(source, "call:policiaposy", y)
		setElementData(source, "call:policiaposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if getElementData(player, "char:dutyfaction") == 1 or getElementData(player, "char:dutyfaction") == 2  or getElementData(player, "char:dutyfaction") == 3 or getElementData(player, "char:dutyfaction") == 4 or getElementData(player, "char:dutyfaction") == 5 or getElementData(player, "char:dutyfaction") == 6 or getElementData(player, "char:dutyfaction") == 7 or  getElementData(player, "char:dutyfaction") == 8 or getElementData(player, "char:dutyfaction") == 9 or getElementData(player, "char:dutyfaction") == 10  or getElementData(player, "char:dutyfaction") == 11 or getElementData(player, "char:dutyfaction") == 12 or getElementData(player, "char:dutyfaction") == 13 or getElementData(player, "char:dutyfaction") == 14 or getElementData(player, "char:dutyfaction") == 15 then
			     outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
				 outputChatBox(" ", player, 255, 255, 255, true)
                 outputChatBox("#FFA000[COPOM POLICIA] #FFFFFFUnidade disponivel? Chamada: #FFA000"..msCount, player, 255, 255, 255, true)
				 outputChatBox("#FFA000[COPOM POLICIA] #FFFFFFChamada feita por: "..getPlayerName(source), player, 255, 255, 255, true)
				 outputChatBox("#FFA000[COPOM POLICIA] #FFFFFFChamada emitida: #FFA000"..menCopom, player, 255, 255, 255, true)
			  end
		end
end )

function aceitarpolicia(thePlayer, commandName, acceptID)
	if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "char:dutyfaction") == 2 or getElementData(thePlayer, "char:dutyfaction") == 3 or getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "char:dutyfaction") == 5 or getElementData(thePlayer, "char:dutyfaction") == 6 or getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "char:dutyfaction") == 8 or getElementData(thePlayer, "char:dutyfaction") == 9 or getElementData(thePlayer, "char:dutyfaction") == 10 or getElementData(thePlayer, "char:dutyfaction") == 11 or getElementData(thePlayer, "char:dutyfaction") == 12 or getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "char:dutyfaction") == 14 or getElementData(thePlayer, "char:dutyfaction") == 15  then
			if (acceptID) then
			local acceptID = tonumber(acceptID)
			if msCall[acceptID] then
				exports.san_hud:dm("Você aceitou o chamado " .. acceptID .. " desloque até o local.", thePlayer, 255, 200, 0)
				exports.san_hud:dm("A Policia aceitou sua chamada e está a caminho", msCall[acceptID], 255, 200, 0)

				if isTimer(tirarchamadomsCount) then
						killTimer(tirarchamadomsCount)
				end

				local x, y, z = getElementData(msCall[acceptID], "call:policiaposx"), getElementData(msCall[acceptID], "call:policiaposy"), getElementData(msCall[acceptID], "call:policiaposz")
				triggerClientEvent(thePlayer, "createPoliciaMarker", thePlayer, thePlayer, acceptID, msCall[acceptID], x, y, z)
				msCall[acceptID] = nil
			else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff Não existe essa chamada ou a chamada já foi aceita.", thePlayer, 255, 255, 255, true)
			end
		end
	
	end
end
addCommandHandler("ac", aceitarpolicia)





local mecanicoCall = {}
local mecanicoCount = 0
addEvent( "SendMsgToTeamMecanico", true )
addEventHandler( "SendMsgToTeamMecanico", root,
function (  )
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)

	if getElementData(source, "call:mecanico") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Você já tem uma chamada em andamento aguarde 1 minuto para fazer novamente.", source, 255, 255, 255, true) return end


		outputChatBox("#bebebeVocê chamou o mecanico, aguarde.", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Você chamou o mecanico, aguarde.", source, 255, 200, 0)





		mecanicoCount = mecanicoCount + 1
		mecanicoCall[mecanicoCount] = source
		setElementData(source, "call:mecanico", mecanicoCount)



		setTimer ( setElementData, 60000, 1, source, "call:mecanico", false)

		tirarchamadomecanicoCount = setTimer(function()
			mecanicoCall[mecanicoCount] = nil
		end, 180000, 1 )



		local x, y, z = getElementPosition(source)
		setElementData(source, "call:mecanicoposx", x)
		setElementData(source, "call:mecanicoposy", y)
		setElementData(source, "call:mecanicoposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if getElementData(player, "char:dutyfaction") == 17  then
				outputChatBox("#bebebe"..getPlayerName(source).." chamou o mecanico utilize /ac " .. mecanicoCount .. " para aceitar o pedido", player, 255, 255, 255, true)
				displayServerMessage(player, ""..getPlayerName(source).." chamou  o mecanico utilize /ac " .. mecanicoCount .. " para aceitar o pedido", "warning")
			  end
		end
end )

function aceitarmecanico(thePlayer, commandName, acceptID)
	if getElementData(thePlayer, "char:dutyfaction") == 17  then
		if (acceptID) then
			local acceptID = tonumber(acceptID)
			if mecanicoCall[acceptID] then
				exports.san_hud:dm("Você aceitou o chamado " .. acceptID .. " desloque até o local.", thePlayer, 255, 200, 0)
				exports.san_hud:dm("O mecanico aceitou sua chamada e está a caminho", mecanicoCall[acceptID], 255, 200, 0)

					if isTimer(tirarchamadomecanicoCount) then
						killTimer(tirarchamadomecanicoCount)
					end



				local x, y, z = getElementData(mecanicoCall[acceptID], "call:mecanicoposx"), getElementData(mecanicoCall[acceptID], "call:mecanicoposy"), getElementData(mecanicoCall[acceptID], "call:mecanicoposz")
				triggerClientEvent(thePlayer, "createMecanicoMarker", thePlayer, thePlayer, acceptID, mecanicoCall[acceptID], x, y, z)
				mecanicoCall[acceptID] = nil
			else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff Não existe essa chamada ou a chamada já foi aceita.", thePlayer, 255, 255, 255, true)
			end
		end
	
	end
end
addCommandHandler("ac", aceitarmecanico)










local taxiCall = {}
local taxiCount = 0
addEvent( "SendMsgToTeamtaxi", true )
addEventHandler( "SendMsgToTeamtaxi", root,
function (  )
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)

	if getElementData(source, "call:taxi") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Você já tem uma chamada em andamento aguarde 1 minuto para fazer novamente.", source, 255, 255, 255, true) return end


		outputChatBox("#bebebeVocê chamou o taxi, aguarde.", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Você chamou o taxi, aguarde.", source, 255, 200, 0)





		taxiCount = taxiCount + 1
		taxiCall[taxiCount] = source
		setElementData(source, "call:taxi", taxiCount)

		setTimer ( setElementData, 60000, 1, source, "call:taxi", nil)
		tirarchamadotaxiCall = setTimer(function()
			taxiCall[taxiCount] = nil
		end, 25000, 1 )


		local x, y, z = getElementPosition(source)
		setElementData(source, "call:taxiposx", x)
		setElementData(source, "call:taxiposy", y)
		setElementData(source, "call:taxiposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if (exports.san_employment:getPlayerJob(player,true) == "Taxista") then
				outputChatBox("#bebebe"..getPlayerName(source).." chamou o taxi utilize /ac " .. taxiCount .. " para aceitar o pedido", player, 255, 255, 255, true)
				displayServerMessage(player, ""..getPlayerName(source).." chamou  o taxi utilize /ac " .. taxiCount .. " para aceitar o pedido", "warning")
			  end
		end
end )

function aceitartaxi(thePlayer, commandName, acceptID)
	if (exports.san_employment:getPlayerJob(thePlayer,true) == "Taxista")  then
		if (acceptID) then
			local acceptID = tonumber(acceptID)
			if taxiCall[acceptID] then
				exports.san_hud:dm("Você aceitou o chamado " .. acceptID .. " desloque até o local.", thePlayer, 255, 200, 0)
				exports.san_hud:dm("O taxi aceitou sua chamada e está a caminho", taxiCall[acceptID], 255, 200, 0)



				if isTimer(tirarchamadotaxiCall) then
						killTimer(tirarchamadotaxiCall)
				end



				local x, y, z = getElementData(taxiCall[acceptID], "call:taxiposx"), getElementData(taxiCall[acceptID], "call:taxiposy"), getElementData(taxiCall[acceptID], "call:taxiposz")
				triggerClientEvent(thePlayer, "createtaxiMarker", thePlayer, thePlayer, acceptID, taxiCall[acceptID], x, y, z)
				taxiCall[acceptID] = nil

			else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff Não existe essa chamada ou a chamada já foi aceita.", thePlayer, 255, 255, 255, true)
			end
		end
	
	end
end
addCommandHandler("ac", aceitartaxi)





local detranCall = {}
local detranCount = 0
addEvent( "SendMsgToTeamDetran", true )
addEventHandler( "SendMsgToTeamDetran", root,
function (  )
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)

	if getElementData(source, "call:detran") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Você já tem uma chamada em andamento aguarde 1 minuto para fazer novamente.", source, 255, 255, 255, true) return end


		outputChatBox("#bebebeVocê chamou o detran, aguarde.", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Você chamou o detran, aguarde.", source, 255, 200, 0)


		detranCount = detranCount + 1
		detranCall[detranCount] = source
		setElementData(source, "call:detran", detranCount)


		setTimer ( setElementData, 60000, 1, source, "call:detran", nil)
		tirarchamadodetranCall = setTimer(function()
			detranCall[detranCount] = nil
		end, 25000, 1 )


		local x, y, z = getElementPosition(source)
		setElementData(source, "call:detranposx", x)
		setElementData(source, "call:detranposy", y)
		setElementData(source, "call:detranposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if getElementData(player, "char:dutyfaction") == 18  then
				outputChatBox("#bebebe"..getPlayerName(source).." chamou o detran utilize /ac " .. detranCount .. " para aceitar o pedido", player, 255, 255, 255, true)
				displayServerMessage(player, ""..getPlayerName(source).." chamou  o detran utilize /ac " .. detranCount .. " para aceitar o pedido", "warning")
			  end
		end
end )

function aceitardetran(thePlayer, commandName, acceptID)
	if getElementData(thePlayer, "char:dutyfaction") == 18  then
		if (acceptID) then
			local acceptID = tonumber(acceptID)
			if detranCall[acceptID] then
				exports.san_hud:dm("Você aceitou o chamado " .. acceptID .. " desloque até o local.", thePlayer, 255, 200, 0)
				exports.san_hud:dm("O detran aceitou sua chamada e está a caminho", detranCall[acceptID], 255, 200, 0)

				if isTimer(chamadodetranCall) then
					killTimer(chamadodetranCall)
					end
				if isTimer(tirarchamadodetranCall) then
						killTimer(tirarchamadodetranCall)
				end


				local x, y, z = getElementData(detranCall[acceptID], "call:detranposx"), getElementData(detranCall[acceptID], "call:detranposy"), getElementData(detranCall[acceptID], "call:detranposz")
				triggerClientEvent(thePlayer, "createdetranMarker", thePlayer, thePlayer, acceptID, detranCall[acceptID], x, y, z)
				detranCall[acceptID] = nil
			else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff Não existe essa chamada ou a chamada já foi aceita.", thePlayer, 255, 255, 255, true)
			end
		end
	
	end
end
addCommandHandler("ac", aceitardetran)





local staffCall = {}
local staffCount = 0
addEvent( "SendMsgToTeamstaff", true )
addEventHandler( "SendMsgToTeamstaff", root,
function (  )
	--if isTimer(timer) then return end
	--timer = setTimer(function() end, 10000, 1)

	if getElementData(source, "call:staff") then outputChatBox("#7cc576[IRG-MTA]:#ffffff Shoma Taze Ba Shahr Dar Tamas Gerefti, 1 Min Sabr Konid.", source, 255, 255, 255, true) return end


		outputChatBox("#bebebeBa Shahr Dar Tamas Gerefti, Lotfan Kami Sabr Konid...", source, 255, 255, 255, true)
		exports.san_hud:dm(" "..getPlayerName(source).." Ba Shahr Dar Tamas Gerefti, Lotfan Kami Sabr Konid...", source, 255, 200, 0)


		staffCount = getElementData(source,"acc:id")
		staffCall[staffCount] = source
		setElementData(source, "call:staff", staffCount)


		setTimer ( setElementData, 60000, 1, source, "call:staff", nil)
		tirarchamadostaffCall = setTimer(function()
			staffCall[staffCount] = nil
		end, 180000, 1 )


		local x, y, z = getElementPosition(source)
		setElementData(source, "call:staffposx", x)
		setElementData(source, "call:staffposy", y + 2)
		setElementData(source, "call:staffposz", z)
		for theKey,player in ipairs (getElementsByType("player")) do
			if getElementData(player, "char:adminduty") == 1  then
				outputChatBox("#bebebe"..getPlayerName(source).. " Report Dad Baraye Ghabol Kardan /ac " .. staffCount .. " Ra Bezanid", player, 255, 255, 255, true)
				displayServerMessage(player, ""..getPlayerName(source).." Report Dad Baraye Ghabol Kardan /ac " .. staffCount .. " Ra Bezanid", "warning")
			  end
		end
end )

function aceitarstaff(thePlayer, commandName, acceptID)
	if getElementData(thePlayer, "char:adminduty") == 1  then
		if (acceptID) then
			local acceptID = tonumber(acceptID)
			if staffCall[acceptID] then
				exports.san_hud:dm("Shoma Report Ra Javab Dadi " .. acceptID .. "", thePlayer, 255, 200, 0)
				exports.san_hud:dm("Shahr Dar Tamas Shoma Ra Javab Dad", staffCall[acceptID], 255, 200, 0)

				if isTimer(chamadostaffCall) then
					killTimer(chamadostaffCall)
					end
				if isTimer(tirarchamadostaffCall) then
						killTimer(tirarchamadostaffCall)
				end


				local x, y, z = getElementData(staffCall[acceptID], "call:staffposx"), getElementData(staffCall[acceptID], "call:staffposy"), getElementData(staffCall[acceptID], "call:staffposz")
				setElementPosition(thePlayer, x, y, z)
				setElementData(thePlayer, "call:staff", nil)
				--triggerClientEvent(thePlayer, "createstaffMarker", thePlayer, thePlayer, acceptID, staffCall[acceptID], x, y, z)
				staffCall[acceptID] = nil
			else
				outputChatBox("#7cc576[IRG-MTA]:#ffffff In Report Baz Nist.", thePlayer, 255, 255, 255, true)
			end
		end
	
	end
end
addCommandHandler("ac", aceitarstaff)










function displayServerMessage(source, message, type)
	triggerClientEvent(source, "servermessagesCelular", getRootElement(), message, type)
end











