function stopAnimBindKey()
	bindKey(source, "space", "down", animationStopCommand)
end
addEvent("stopAnimBindKey", false)
addEventHandler("stopAnimBindKey", getRootElement(), stopAnimBindKey)

function animLoop()
	setElementData(source, "animLoop", 1)
end
addEvent("animLoop", true)
addEventHandler("animLoop", getRootElement(), animLoop)

function nonAnimLoop()
	setElementData(source, "animLoop", 0)
end
addEvent("nonAnimLoop", true)
addEventHandler("nonAnimLoop", getRootElement(), nonAnimLoop)

function unbindStopAnimation()
	unbindKey(source, "space", "down", animationStopCommand)
end
addEvent("unbindStopAnimation", false)
addEventHandler("unbindStopAnimation", getRootElement(), unbindStopAnimation)


local jogador = {}


function animationStopCommand(player)
	if not getControlState(player, "sprint") then
		local animLoop = getElementData(player, "animLoop")
		setElementData(player, "handsup", false)
		if not (animLoop==1) then
			stopAnimation(player)
			triggerEvent("unbindStopAnimation", player)
			setElementData(player, "teste", nil)
			if isTimer(jogador[player]) then
				killTimer(jogador[player])
			end
		end
	end
end
addCommandHandler("stopanim", animationStopCommand, false, false)

function animationsList(player)
	outputChatBox("[#7cc576IRG - Anim]: #ffffffAnimações", player, 124, 197, 118, true)
	outputChatBox("/piss /wank /slapass /fixcar /handsup /hailtaxi /scratch /fu /carchat /tired", player, 255, 255, 255)
	outputChatBox("/strip 1-2 /lightup /drink /beg /mourn /cheer 1-3 /dance 1-4 /crack 1-2", player, 255, 255, 255)
	outputChatBox("/gsign 1-5 /puke /rap 1-3 /sit 1-3 /smoke 1-3 /smokelean /laugh /startrace", player, 255, 255, 255)
	outputChatBox("/daps 1-2 /shove /bitchslap /shocked /dive /what /fall /fallfront /cpr", player, 255, 255, 255)
	outputChatBox("/copcome /copleft /copstop /wait /think /shake /idle /lay /cry /aim /drag", player, 255, 255, 255)
	outputChatBox("/walk 1-37 /bat 1-3 /copaway /win 1-2", player, 255, 255, 255)
end
addCommandHandler("animlist", animationsList, false, false)
addCommandHandler("anims", animationsList, false, false)

function resetAnimation(player)
	stopAnimation(player)
end

function coverAnimation(player)
	local logged = true --getElementData(player, "loggedin")

	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "ped", "duck_cower", -1, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("cover", coverAnimation, false, false)

function vem(player)
	local logged = true --getElementData(player, "loggedin")

	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing") and not getElementData(player, "player->repairing")) then
		setPedAnimation(player, "FINALE", "FIN_Let_Go", -1, false, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("vem", vem, false, false)

function bug(player)
	local logged = true --getElementData(player, "loggedin")

	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing") and not getElementData(player, "player->repairing")) then
		--setPedAnimation(player, "FINALE", "FIN_Let_Go", -1, false, false, false, false)

		setPedAnimation(player , "parachute", "para_steerl_o", 1, false, false, false)

		setElementData(player, "handsup", false)
	end
end
addCommandHandler("bugadododo", bug)




function cprAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "medic", "cpr", 8000, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("cpr", cprAnimation, false, false)

function copawayAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "police", "coptraf_away", 1300, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("copaway", copawayAnimation, false, false)

function copcomeAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "POLICE", "CopTraf_Come", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("copcome", copcomeAnimation, false, false)

function copleftAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "POLICE", "CopTraf_Left", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("copleft", copleftAnimation, false, false)

function copanimationStopCommand(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "POLICE", "CopTraf_Stop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("copstop", copanimationStopCommand, false, false)

function pedWait(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "COP_AMBIENT", "Coplook_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "wait", pedWait, false, false )

function pedThink(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "COP_AMBIENT", "Coplook_think", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "think", pedThink, false, false )

function pedShake(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "COP_AMBIENT", "Coplook_shake", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "shake", pedShake, false, false )

function pedLean(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "GANGS", "leanIDLE", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "aguardar", pedLean, false, false )

function idleAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "DEALER", "DEALER_IDLE_01", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("idle", idleAnimation, false, false)

function pedPiss(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "PAULNMAC", "Piss_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "piss", pedPiss, false, false )

function pedWank(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "PAULNMAC", "wank_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "wank", pedWank, false, false )

function pedSlapAss(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "SWEET", "sweet_ass_slap", 2000, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "slapass", pedSlapAss, false, false )

function pedCarFix(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "CAR", "Fixn_Car_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "fixcar", pedCarFix, false, false )




function beijar(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "KISSING", "Playa_Kiss_03", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "beijar", beijar, false, false )



function pedHandsup(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "ped", "handsup", -1, false, false, false)
		setElementData(player, "handsup", true)
	end
end
addCommandHandler ( "handsup", pedHandsup, false, false )

function pedTaxiHail(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "MISC", "Hiker_Pose", -1, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ("hailtaxi", pedTaxiHail, false, false )

function pedScratch(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "MISC", "Scratchballs_01", -1, true, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "scratch", pedScratch, false, false )

function pedFU(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "RIOT", "RIOT_FUKU", 800, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "fu", pedFU, false, false )

function pedStrip( player, _, arg )
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "STRIP", "STR_Loop_C", -1, false, true, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "STRIP", "strip_D", -1, false, true, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "strip", pedStrip, false, false )

function pedLightup (player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "SMOKING", "M_smk_in", 4000, true, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "lightup", pedLightup, false, false )

function pedHeil (player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "ON_LOOKERS", "Pointup_in", 999999, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "apontar", pedHeil, false, false )

function pedDrink( player )
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "BAR", "dnk_stndM_loop", 2300, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "drink", pedDrink, false, false )

function pedLay( player, _, arg )
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "BEACH", "sitnwait_Loop_W", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "BEACH", "Lay_Bac_Loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "lay", pedLay, false, false )

function begAnimation( player )
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "SHOP", "SHP_Rob_React", 4000, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "beg", begAnimation, false, false )

function pedMourn( player )
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "GRAVEYARD", "mrnM_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "mourn", pedMourn, false, false )

function pedCry( player )
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "GRAVEYARD", "mrnF_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "cry", pedCry, false, false )

function pedCheer(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "OTB", "wtchrace_win", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "RIOT", "RIOT_shout", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "STRIP", "PUN_HOLLER", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "cheer", pedCheer, false, false )

local teste = {}
local animacao = true

function danceAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if isTimer(jogador[player]) then killTimer(jogador[player]) end
		if arg == 2 then
			setAnimationForPlayer( player, "DANCING", "DAN_Down_A", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "DANCING", "dnce_M_d", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 4 then
			setAnimationForPlayer(player, "GFUNK", "Dance_G3", -1, false, false, false)
			--jogador[player] = setTimer ( dancando2, 1100, 0, teste[player])
			setElementData(player, "handsup", false)
			setElementData(player, "teste", true)
			jogador[player] = setTimer(function(player)
				if getElementData(player, "teste") then
					setAnimationForPlayer(player, "GFUNK", "Dance_G2", -1, false, false, false)
				animacao = false
				setElementData(player, "teste", false)
				else
					setAnimationForPlayer(player, "GFUNK", "Dance_G3", -1, false, false, false)
				animacao = true
				setElementData(player, "teste", true)
				end
			end, 1100, 0, player)
		elseif arg == 5 then
			setAnimationForPlayer(player, "GFUNK", "Dance_B2", -1, false, false, false)
			--jogador[player] = setTimer ( dancando2, 1100, 0, teste[player])
			setElementData(player, "handsup", false)
			setElementData(player, "teste", true)
			jogador[player] = setTimer(function(player)
				if getElementData(player, "teste") then
					setAnimationForPlayer(player, "GFUNK", "Dance_B3", -1, false, false, false)
				animacao = false
				setElementData(player, "teste", false)
				else
					setAnimationForPlayer(player, "GFUNK", "Dance_B2", -1, false, false, false)
				animacao = true
				setElementData(player, "teste", true)
				end
			end, 1100, 0, player)		

		elseif arg == 6 then
			setAnimationForPlayer(player, "GFUNK", "Dance_G15", -1, false, false, false)
			--jogador[player] = setTimer ( dancando2, 1100, 0, teste[player])
			setElementData(player, "handsup", false)
			setElementData(player, "teste", true)
			jogador[player] = setTimer(function(player)
				if getElementData(player, "teste") then
					setAnimationForPlayer(player, "GFUNK", "Dance_G14", -1, false, false, false)
				animacao = false
				setElementData(player, "teste", false)
				else
					setAnimationForPlayer(player, "GFUNK", "Dance_G15", -1, false, false, false)
				animacao = true
				setElementData(player, "teste", true)
				end
			end, 1100, 0, player)
		else
			setAnimationForPlayer( player, "DANCING", "DAN_Right_A", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "dance", danceAnimation, false, false )

function quit()
	if isTimer(jogador[source]) then
	 killTimer(jogador[source]) 
	end
end
addEventHandler("onPlayerQuit", root, quit)


function crackAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	--if not arg then 
	--	outputChatBox("[#7cc576Brasil Top City - Anim]: #ffffffUso correto #7cc576/".. _ .." #ffffffnumero da animação", player, 124, 197, 118, true)
	--	return 
	--end
	setPedAnimation(player)
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "CRACK", "crckidle1", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "CRACK", "crckidle3", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 4 then
			setAnimationForPlayer( player, "CRACK", "crckidle4", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "CRACK", "crckidle4", -1, true, false, false)
			--setAnimationForPlayer( player, "CRACK", "crckidle2", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "crack", crackAnimation, false, false )

function gsignAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer(player, "GHANDS", "gsign2", 4000, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer(player, "GHANDS", "gsign3", 4000, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 4 then
			setAnimationForPlayer(player, "GHANDS", "gsign4", 4000, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 5 then
			setAnimationForPlayer(player, "GHANDS", "gsign5", 4000, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer(player, "GHANDS", "gsign1", 4000, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler("gsign", gsignAnimation, false, false)

function pukeAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "FOOD", "EAT_Vomit_P", 8000, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("puke", pukeAnimation, false, false)

function rapAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "LOWRIDER", "RAP_B_Loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "LOWRIDER", "RAP_C_Loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "LOWRIDER", "RAP_A_Loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler("rap", rapAnimation, false, false)

function aimAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "SHOP", "ROB_Loop_Threat", -1, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("aim", aimAnimation, false, false)

function sitAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if isPedInVehicle( player ) then
			if arg == 2 then
				setPedAnimation( player, "CAR", "Sit_relaxed" )
				setElementData(player, "handsup", false)
			else
				setPedAnimation( player, "CAR", "Tap_hand" )
				setElementData(player, "handsup", false)
			end
			source = player
			stopAnimBindKey()
		else
			if arg == 2 then
				setAnimationForPlayer( player, "FOOD", "FF_Sit_Look", -1, true, false, false)
				setElementData(player, "handsup", false)
			elseif arg == 3 then
				setAnimationForPlayer( player, "Attractors", "Stepsit_loop", -1, true, false, false)
				setElementData(player, "handsup", false)
			elseif arg == 4 then
				setAnimationForPlayer( player, "BEACH", "ParkSit_W_loop", 1, true, false, false)
				setElementData(player, "handsup", false)
			elseif arg == 5 then
				setAnimationForPlayer( player, "BEACH", "ParkSit_M_loop", 1, true, false, false)
				setElementData(player, "handsup", false)
			else
				setAnimationForPlayer( player, "ped", "SEAT_idle", -1, true, false, false)
				setElementData(player, "handsup", false)
			end
		end
	end
end
addCommandHandler("sit", sitAnimation, false, false)

function smokeAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "SMOKING", "M_smkstnd_loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "LOWRIDER", "M_smkstnd_loop", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "GANGS", "smkcig_prtl", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler("smoke", smokeAnimation, false, false)

function smokeleanAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "LOWRIDER", "M_smklean_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("smokelean", smokeleanAnimation, false, false)

function smokedragAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "SMOKING", "M_smk_drag", 4000, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("drag", smokedragAnimation, false, false)

function laughAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "RAPPING", "Laugh_01", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("laugh", laughAnimation, false, false)

function startraceAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "CAR", "flag_drop", 4200, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("startrace", startraceAnimation, false, false)

function carchatAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "CAR_CHAT", "car_talkm_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("carchat", carchatAnimation, false, false)

function tiredAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "FAT", "idle_tired", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("tired", tiredAnimation, false, false)

function handshakeAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "GANGS", "hndshkca", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "GANGS", "hndshkfa", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler("daps", handshakeAnimation, false, false)

function shoveAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "GANGS", "shake_carSH", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("shove", shoveAnimation, false, false)

function bitchslapAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "MISC", "bitchslap", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("bitchslap", bitchslapAnimation, false, false)

function shockedAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer(player, "ON_LOOKERS", "panic_loop", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("shocked", shockedAnimation, false, false)

function diveAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		
		setAnimationForPlayer(player, "ped", "EV_dive", -1, false, true, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler("dive", diveAnimation, false, false)

function whatAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "RIOT", "RIOT_ANGRY", -1, true, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "what", whatAnimation, false, false )

function fallfrontAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "ped", "FLOOR_hit_f", -1, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "fallfront", fallfrontAnimation, false, false )

function fallAnimation(player)
	local logged = true --getElementData(player, "loggedin")
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "ped", "FLOOR_hit", -1, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "fall", fallAnimation, false, false )


function batAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "CRACK", "Bbalbat_Idle_02", -1, true, false, false)
			setElementData(player, "handsup", false)
		elseif arg == 3 then
			setAnimationForPlayer( player, "Baseball", "Bat_IDLE", -1, true, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "CRACK", "Bbalbat_Idle_01", -1, true, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler("bat", batAnimation, false, false)

function winAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	arg = tonumber(arg)
	
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		if arg == 2 then
			setAnimationForPlayer( player, "CASINO", "manwinb", 2000, false, false, false)
			setElementData(player, "handsup", false)
		else
			setAnimationForPlayer( player, "CASINO", "manwind", 2000, false, false, false)
			setElementData(player, "handsup", false)
		end
	end
end
addCommandHandler ( "win", winAnimation, false, false )

function kickballsAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")
	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "FIGHT_E", "FightKick_B", 1, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "kickballs", kickballsAnimation, false, false )

function grabbAnimation(player, _, arg)
	local logged = true --getElementData(player, "loggedin")

	if (logged and not getElementData(player, "bodypart") and not getElementData(player, "player->repairing")) then
		setAnimationForPlayer( player, "BAR", "Barserve_bottle", 2000, false, false, false)
		setElementData(player, "handsup", false)
	end
end
addCommandHandler ( "grabbottle", grabbAnimation, false, false )

function setAnimationForPlayer(player, animblokk, nev, animTime, loop, posUpdate, perm)
	if animTime==nil then animTime=-1 end
	if loop==nil then loop=true end
	if posUpdate==nil then posUpdate=true end
	if perm==nil then perm=true end
	
	local animLoop = getElementData(player, "animLoop")
	if (animLoop==1) then return end
	if isElementInWater ( player ) then return end

	if isElement(player) and getElementType(player)=="player" and not getPedOccupiedVehicle(player) and getElementData(player, "freeze") ~= 1 then
		if getElementData(player, "injuriedanimation") or ( not perm and not getElementData(player, "animLoop")==1 ) then
			return false
		end
	
		triggerEvent("stopAnimBindKey", player)
		toggleAllControls(player, false, true, false)
		
		if (perm) then
			setElementData(player, "animLoop", 1)
		else
			setElementData(player, "animLoop", 0)
		end
		
		local setanim = setPedAnimation(player, animblokk, nev, animTime, loop, posUpdate, false)
		if animTime > 100 then
			setTimer(setPedAnimation, 50, 2, player, animblokk, nev, animTime, loop, posUpdate, false)
		end
		if animTime > 50 then
			setElementData(player, "animTimer", setTimer(stopAnimation, animTime, 1, player), false)
		end
		return setanim
	else
		return false
	end
end

function playerSpawn()
	setPedAnimation(source)
	toggleAllControls(source, true, true, false)
	setElementData(source, "animLoop", 0)
end
addEventHandler("onPlayerSpawn", getRootElement(), playerSpawn)
addEvent( "onPlayeranimationStopCommand", true )

function stopAnimation(player)
	if isElement(player) and getElementType(player)=="player" and getElementData(player, "freeze") ~= 1 and not getElementData(player, "injuriedanimation") and not getElementData(player, "player->repairing") then
		if isTimer( getElementData( player, "animTimer" ) ) then
			killTimer( getElementData( player, "animTimer" ) )
		end
		local updateCurrentAnimation = setPedAnimation(player)
		setElementData(player, "animLoop", 0)
		setElementData(player, "animTimer", 0)
		toggleAllControls(player, true, true, false)
		setPedAnimation(player)
		setTimer(setPedAnimation, 50, 2, player)
		setTimer(triggerEvent, 100, 1, "onPlayeranimationStopCommand", player)
		return updateCurrentAnimation
	else
		return false
	end
end