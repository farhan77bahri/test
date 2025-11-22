

local default = 56

addEventHandler("onClientResourceStart", getResourceRootElement(), 
	function() 
		setElementData(localPlayer, "isAnim", false)
		for k, v in pairs(getElementsByType("player")) do
			setPedWalkingStyle(v, default)
		end
	end
)

local sx,sy = guiGetScreenSize ()
local walkingGuiState = false
local walkingGui = {}
local walkingStylesList = {}

walkingStylesList[56] = "Estilo 1"
walkingStylesList[55] = "Estilo 2"
walkingStylesList[119] = "Estilo 3"
walkingStylesList[120] = "Estilo 4"
walkingStylesList[123] = "Estilo 5"
walkingStylesList[121] = "Estilo 6"
walkingStylesList[122] = "Estilo 7"
walkingStylesList[124] = "Estilo 8"
walkingStylesList[125] = "Estilo 9"
walkingStylesList[126] = "Estilo 10"
walkingStylesList[129] = "Estilo 11"
walkingStylesList[131] = "Estilo 12"
walkingStylesList[133] = "Estilo 13"
walkingStylesList[128] = "Estilo 14"

function isWalkingGuiShowing ()
	return walkingGuiState
end

function showWalkingGui (state)
	if state ~= walkingGuiState then
		if state == true then
			local width,height = 270,350
		
			walkingGui.window = guiCreateWindow (sx/2-width/2,sy/2-height/2,width,height,"Estilos de Andar",false)
			guiWindowSetSizable (walkingGui.window,false)
			walkingGui.grid = guiCreateGridList (10,25,width-20,height-60,false,walkingGui.window)
			walkingGui.column = guiGridListAddColumn (walkingGui.grid,"Estilos",0.85)
			
			for i,v in pairs(walkingStylesList) do
				local row = guiGridListAddRow (walkingGui.grid)
				guiGridListSetItemText (walkingGui.grid,row,walkingGui.column,v,false,false)
				guiGridListSetItemData (walkingGui.grid,row,walkingGui.column,i)
			end
			
			addEventHandler ("onClientGUIDoubleClick",walkingGui.grid,
				function ()
					local row = guiGridListGetSelectedItem (walkingGui.grid)
					if row > -1 then
						local id = guiGridListGetItemData (walkingGui.grid,row,walkingGui.column)
						if id then
							triggerServerEvent ("onClientSetWalkingStyle",getLocalPlayer(),id)
							showWalkingGui (false)
						end
					end
				end
			,false)
			
			walkingGui.closeButton = guiCreateButton (10,height-30,width-20,22,"Fechar",false,walkingGui.window)
			
			addEventHandler ("onClientGUIClick",walkingGui.closeButton,
				function ()
					showWalkingGui (false)
				end
			,false)
			
			walkingGuiState = state
			showCursor (state)
			triggerEvent ("onWalkingGuiStateChange",getLocalPlayer(),state)
			
		elseif state == false then
			destroyElement (walkingGui.window)
			walkingGui = {}
			
			walkingGuiState = state
			showCursor (state)
			triggerEvent ("onWalkingGuiStateChange",getLocalPlayer(),state)
		end
	end
end

addCommandHandler ("estilos",
	function ()
		showWalkingGui (not walkingGuiState)
	end
)

bindKey("space", "down", 
	function() 
		if getElementData(localPlayer, "loggedin") and getPedAnimation(localPlayer) and getElementData(localPlayer, "char.tazed") == false and getElementData(localPlayer, "lockedAnimation") == false then
			triggerServerEvent("removeAnimation", getRootElement(), localPlayer)
		end
	end
)

local animTable = {

	ifp = {},

	anims = {
		"abseil",
		"ARRESTgun",
		"ATM",
		"BIKE_elbowL",
		"BIKE_elbowR",
		"BIKE_fallR",
		"BIKE_fall_off",
		"BIKE_pickupL",
		"BIKE_pickupR",
		"BIKE_pullupL",
		"BIKE_pullupR",
		"bomber",
		"CAR_alignHI_LHS",
		"CAR_alignHI_RHS",
		"CAR_align_LHS",
		"CAR_align_RHS",
		"CAR_closedoorL_LHS",
		"CAR_closedoorL_RHS",
		"CAR_closedoor_LHS",
		"CAR_closedoor_RHS",
		"CAR_close_LHS",
		"CAR_close_RHS",
		"CAR_crawloutRHS",
		"CAR_dead_LHS",
		"CAR_dead_RHS",
		"CAR_doorlocked_LHS",
		"CAR_doorlocked_RHS",
		"CAR_fallout_LHS",
		"CAR_fallout_RHS",
		"CAR_getinL_LHS",
		"CAR_getinL_RHS",
		"CAR_getin_LHS",
		"CAR_getin_RHS",
		"CAR_getoutL_LHS",
		"CAR_getoutL_RHS",
		"CAR_getout_LHS",
		"CAR_getout_RHS",
		"car_hookertalk",
		"CAR_jackedLHS",
		"CAR_jackedRHS",
		"CAR_jumpin_LHS",
		"CAR_LB",
		"CAR_LB_pro",
		"CAR_LB_weak",
		"CAR_LjackedLHS",
		"CAR_LjackedRHS",
		"CAR_Lshuffle_RHS",
		"CAR_Lsit",
		"CAR_open_LHS",
		"CAR_open_RHS",
		"CAR_pulloutL_LHS",
		"CAR_pulloutL_RHS",
		"CAR_pullout_LHS",
		"CAR_pullout_RHS",
		"CAR_Qjacked",
		"CAR_rolldoor",
		"CAR_rolldoorLO",
		"CAR_rollout_LHS",
		"CAR_rollout_RHS",
		"CAR_shuffle_RHS",
		"CAR_sit",
		"CAR_sitp",
		"CAR_sitpLO",
		"CAR_sit_pro",
		"CAR_sit_weak",
		"CAR_tune_radio",
		"CLIMB_idle",
		"CLIMB_jump",
		"CLIMB_jump2fall",
		"CLIMB_jump_B",
		"CLIMB_Pull",
		"CLIMB_Stand",
		"CLIMB_Stand_finish",
		"cower",
		"Crouch_Roll_L",
		"Crouch_Roll_R",
		"DAM_armL_frmBK",
		"DAM_armL_frmFT",
		"DAM_armL_frmLT",
		"DAM_armR_frmBK",
		"DAM_armR_frmFT",
		"DAM_armR_frmRT",
		"DAM_LegL_frmBK",
		"DAM_LegL_frmFT",
		"DAM_LegL_frmLT",
		"DAM_LegR_frmBK",
		"DAM_LegR_frmFT",
		"DAM_LegR_frmRT",
		"DAM_stomach_frmBK",
		"DAM_stomach_frmFT",
		"DAM_stomach_frmLT",
		"DAM_stomach_frmRT",
		"DOOR_LHinge_O",
		"DOOR_RHinge_O",
		"DrivebyL_L",
		"DrivebyL_R",
		"Driveby_L",
		"Driveby_R",
		"DRIVE_BOAT",
		"DRIVE_BOAT_back",
		"DRIVE_BOAT_L",
		"DRIVE_BOAT_R",
		"Drive_L",
		"Drive_LO_l",
		"Drive_LO_R",
		"Drive_L_pro",
		"Drive_L_pro_slow",
		"Drive_L_slow",
		"Drive_L_weak",
		"Drive_L_weak_slow",
		"Drive_R",
		"Drive_R_pro",
		"Drive_R_pro_slow",
		"Drive_R_slow",
		"Drive_R_weak",
		"Drive_R_weak_slow",
		"Drive_truck",
		"DRIVE_truck_back",
		"DRIVE_truck_L",
		"DRIVE_truck_R",
		"Drown",
		"DUCK_cower",
		"endchat_01",
		"endchat_02",
		"endchat_03",
		"EV_dive",
		"EV_step",
		"facanger",
		"facgum",
		"facsurp",
		"facsurpm",
		"factalk",
		"facurios",
		"FALL_back",
		"FALL_collapse",
		"FALL_fall",
		"FALL_front",
		"FALL_glide",
		"FALL_land",
		"FALL_skyDive",
		"Fight2Idle",
		"FightA_1",
		"FightA_2",
		"FightA_3",
		"FightA_block",
		"FightA_G",
		"FightA_M",
		"FIGHTIDLE",
		"FightShB",
		"FightShF",
		"FightSh_BWD",
		"FightSh_FWD",
		"FightSh_Left",
		"FightSh_Right",
		"flee_lkaround_01",
		"FLOOR_hit",
		"FLOOR_hit_f",
		"fucku",
		"gang_gunstand",
		"gas_cwr",
		"getup",
		"getup_front",
		"gum_eat",
		"GunCrouchBwd",
		"GunCrouchFwd",
		"GunMove_BWD",
		"GunMove_FWD",
		"GunMove_L",
		"GunMove_R",
		"Gun_2_IDLE",
		"GUN_BUTT",
		"GUN_BUTT_crouch",
		"Gun_stand",
		"handscower",
		"handsup",
		"HitA_1",
		"HitA_2",
		"HitA_3",
		"HIT_back",
		"HIT_behind",
		"HIT_front",
		"HIT_GUN_BUTT",
		"HIT_L",
		"HIT_R",
		"HIT_walk",
		"HIT_wall",
		"Idlestance_fat",
		"idlestance_old",
		"IDLE_armed",
		"IDLE_chat",
		"IDLE_csaw",
		"Idle_Gang1",
		"IDLE_HBHB",
		"IDLE_ROCKET",
		"IDLE_stance",
		"IDLE_taxi",
		"IDLE_tired",
		"Jetpack_Idle",
		"JOG_femaleA",
		"JOG_maleA",
		"JUMP_glide",
		"JUMP_land",
		"JUMP_launch",
		"JUMP_launch_R",
		"KART_drive",
		"KART_L",
		"KART_LB",
		"KART_R",
		"KD_left",
		"KD_right",
		"KO_shot_face",
		"KO_shot_front",
		"KO_shot_stom",
		"KO_skid_back",
		"KO_skid_front",
		"KO_spin_L",
		"KO_spin_R",
		"pass_Smoke_in_car",
		"phone_in",
		"phone_out",
		"phone_talk",
		"Player_Sneak",
		"Player_Sneak_walkstart",
		"roadcross",
		"roadcross_female",
		"roadcross_gang",
		"roadcross_old",
		"run_1armed",
		"run_armed",
		"run_civi",
		"run_csaw",
		"run_fat",
		"run_fatold",
		"run_gang1",
		"run_left",
		"run_old",
		"run_player",
		"run_right",
		"run_rocket",
		"Run_stop",
		"Run_stopR",
		"Run_Wuzi",
		"SEAT_down",
		"SEAT_idle",
		"SEAT_up",
		"SHOT_leftP",
		"SHOT_partial",
		"SHOT_partial_B",
		"SHOT_rightP",
		"Shove_Partial",
		"Smoke_in_car",
		"sprint_civi",
		"sprint_panic",
		"Sprint_Wuzi",
		"swat_run",
		"Swim_Tread",
		"Tap_hand",
		"Tap_handP",
		"turn_180",
		"Turn_L",
		"Turn_R",
		"WALK_armed",
		"WALK_civi",
		"WALK_csaw",
		"Walk_DoorPartial",
		"WALK_drunk",
		"WALK_fat",
		"WALK_fatold",
		"WALK_gang1",
		"WALK_gang2",
		"WALK_old",
		"WALK_player",
		"WALK_rocket",
		"WALK_shuffle",
		"WALK_start",
		"WALK_start_armed",
		"WALK_start_csaw",
		"WALK_start_rocket",
		"Walk_Wuzi",
		"WEAPON_crouch",
		"woman_idlestance",
		"woman_run",
		"WOMAN_runbusy",
		"WOMAN_runfatold",
		"woman_runpanic",
		"WOMAN_runsexy",
		"WOMAN_walkbusy",
		"WOMAN_walkfatold",
		"WOMAN_walknorm",
		"WOMAN_walkold",
		"WOMAN_walkpro",
		"WOMAN_walksexy",
		"WOMAN_walkshop",
		"XPRESSscratch"
	}

}

addEventHandler("onClientResourceStart", resourceRoot,
	function()

		animTable.ifp["block"] = "ped"
		animTable.ifp["ifp"] = engineLoadIFP("ped.ifp", animTable.ifp["block"])

		for _, v in ipairs(animTable.anims) do
			engineReplaceAnimation(localPlayer, "ped", v, animTable.ifp["block"], v)
		end

	end
)
