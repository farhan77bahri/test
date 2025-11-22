

addEvent("setPedAnimation",true)
addEventHandler("setPedAnimation",getRootElement(),
	function(player,menumovingCounter,animPanelmovingCounter)
		setPedAnimation(player,menumovingCounter, animPanelmovingCounter)
	end
)

addEvent( "removeAnimation", true )
addEventHandler( "removeAnimation", root,
	function(player)
		setPedAnimation(player)
		setElementData(player, "isAnim", false)
		if getElementData(player, "handsUp") then
		    setElementData(player, "handsUp", false)
		end
	end
)

addEvent( "onClientSetWalkingStyle", true )
addEventHandler( "onClientSetWalkingStyle", root,
	function(id)
		setPedWalkingStyle(source,id)
	end
)

function animationList(v)
	outputChatBox("/fall /think /lean /idle /fu /aim /wait /handsup /wank", v, 65, 105, 225)
	outputChatBox("/startrace /sit 1-5 /rap 1-3 /cover /no /yes /meno /bomb", v, 65, 105, 225)
	outputChatBox("/cpr /copaway /copcome /copleft /copstop /piss /slapass /fixcar", v, 65, 105, 225)
	outputChatBox("/hailtaxi /scratch /lightup /drink /cry /mourn /beg /carchat", v, 65, 105, 225)
	outputChatBox("/cheer 1-3 /dance 1-3 /lay 1-2 /bat 1-3 /crack 1-4 /daps 1-2 /what", v, 65, 105, 225)
	outputChatBox("/tired /sex1 /kiss /kiss2", v, 65, 105, 225)

end
addCommandHandler("animacoes", animationList, false, false)
	
addCommandHandler("fall",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "ped", "FLOOR_hit", -1, false, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("think",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "COP_AMBIENT", "Coplook_think", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("lean",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "GANGS", "leanIDLE", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("idle",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "DEALER", "DEALER_IDLE_01", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("fu",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "RIOT", "RIOT_FUKU", 800, false, true, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("fallfront",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "PED", "FLOOR_hit_f", -1, false, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("aim",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "SHOP", "ROB_Loop_Threat", -1, false, true, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("cruzar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "COP_AMBIENT", "Coplook_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)


addCommandHandler("handsup",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "ped", "handsup", -1, false, false, false)
			setElementData(v, "handsUp", true)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("punheta",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "PAULNMAC", "wank_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("startrace",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "CAR", "flag_drop", 4200, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

function sitAnimation(v, _, arg)
	if getElementData(v, "loggedin") then
	arg = tonumber(arg)
	
		if isPedInVehicle( v ) then
			if arg == 2 then
				setPedAnimation( v, "CAR", "Sit_relaxed" )
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation( v, "CAR", "Tap_hand" )
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			end
			source = v
		else
			if arg == 2 then
				setPedAnimation( v, "FOOD", "FF_Sit_Look", -1, true, false, false)
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation( v, "Attractors", "Stepsit_loop", -1, true, false, false)
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			elseif arg == 4 then
				setPedAnimation( v, "BEACH", "ParkSit_W_loop", 1, true, false, false)
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			elseif arg == 5 then
				setPedAnimation( v, "BEACH", "ParkSit_M_loop", 1, true, false, false)
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation( v, "ped", "SEAT_idle", -1, true, false, false)
				setElementData(v, "handsup", false)
				setElementData(v, "isAnim", true)
			end
		end
	end
end
addCommandHandler("sentar", sitAnimation, false, false)

addCommandHandler("papo",  
	function(v, _, arg)
	arg = tonumber(arg)
		if getElementData(v, "loggedin") then
			
			if arg == 2 then
				setPedAnimation(v, "LOWRIDER", "RAP_B_Loop", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation(v, "LOWRIDER", "RAP_C_Loop", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation(v, "LOWRIDER", "RAP_A_Loop", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("assutado",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "ped", "duck_cower", -1, false, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("nao",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "GANGS", "Invite_No", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("yes",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "GANGS", "Invite_Yes", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("papo",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "benchpress", "gym_bp_celebrate", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("plantar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "BOMBER", "BOM_Plant_Loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("resussitar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "medic", "cpr", 8000, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("pdpassar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "police", "coptraf_away", 1300, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("pdvim",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "POLICE", "CopTraf_Come", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("copleft",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "POLICE", "CopTraf_Left", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("copstop",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "POLICE", "CopTraf_Stop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("mijar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "PAULNMAC", "Piss_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("tapanajaca",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "SWEET", "sweet_ass_slap", 2000, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("fixcar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "CAR", "Fixn_Car_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("sinal",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "MISC", "Hiker_Pose", -1, false, true, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("coçar",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "MISC", "Scratchballs_01", -1, true, true, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("fumarbaseado",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "SMOKING", "M_smk_in", 4000, true, true, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("drink",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "BAR", "dnk_stndM_loop", 2300, false, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("passandomal",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "GRAVEYARD", "mrnF_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("arependido",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "GRAVEYARD", "mrnM_loop", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("beg",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "SHOP", "SHP_Rob_React", 4000, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("carchat",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "CAR_CHAT", "car_talkm_loop", 4000, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("cheer",  
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg == 2 then
				setPedAnimation(v, "DANCING", "OTB", "wtchrace_win", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation(v, "DANCING", "dnce_M_d", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
			    setPedAnimation(v, "DANCING", "RIOT", "RIOT_shout", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("dance",  
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg == 2 then
				setPedAnimation(v, "DANCING", "DAN_Down_A", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation(v, "DANCING", "dnce_M_d", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
			    setPedAnimation(v, "DANCING", "DAN_Right_A", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("lay",  
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg == 2 then
				setPedAnimation(v, "BEACH", "sitnwait_Loop_W", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation(v, "BEACH", "Lay_Bac_Loop", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("bat",
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg == 2 then
				setPedAnimation(v, "CRACK", "Bbalbat_Idle_02", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation(v, "Baseball", "Bat_IDLE", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation(v, "CRACK", "Bbalbat_Idle_01", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("crack",
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg ==2 then
				setPedAnimation(v, "CRACK", "crckidle1", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 3 then
				setPedAnimation(v, "CRACK", "crckidle3", -1, true, false, false)
				setElementData(v, "isAnim", true)
			elseif arg == 4 then
				setPedAnimation(v, "CRACK", "crckidle4", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation(v, "CRACK", "crckidle2", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("daps",  
	function(v, _, arg)
		if getElementData(v, "loggedin") then
			arg = tonumber(arg)
			
			if arg == 2 then
				setPedAnimation(v, "GANGS", "hndshkca", -1, true, false, false)
				setElementData(v, "isAnim", true)
			else
				setPedAnimation(v, "GANGS", "hndshkfa", -1, true, false, false)
				setElementData(v, "isAnim", true)
			end
		end
	end
)

addCommandHandler("what",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "RIOT", "RIOT_ANGRY", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)



addCommandHandler("tired",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "FAT", "IDLE_TIRED", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("sex1",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "BLOWJOBZ", "BJ_COUCH_LOOP_W", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("kiss",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "KISSING", "grlfrd_kiss_01", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("kiss2",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "KISSING", "grlfrd_kiss_02", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)


addCommandHandler("toddiek22",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "PED", "hit_walk", -1, true, false, false)
			setElementData(v, "isAnim", true)
		end
	end
)

addCommandHandler("vas",
	function(v)
		if getElementData(v, "loggedin") then
			setPedAnimation(v, "BOX","bxhipwlk", 250, true, true)
			setElementData(v, "isAnim", true)
		end
	end
)


