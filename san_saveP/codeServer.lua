
local connection = exports["san_mysql"]:getConnection()


function loadCharacter(player)
	local account = getPlayerAccount(player)
	local pos = getElementData(player, "spawnPos")
	local hp = getElementData(player, "spawnedHp")
	local armor = getElementData(player, "spawnedArmor")
	local hunger = getElementData(player, "spawnedHunger")
	local drink = getElementData(player,"spawnedDrink")
	local skin = getElementData(player, "char:skin")
	local stats = getAccountData(account, "stats")


	spawnPlayer(player, pos[1], pos[2], pos[3], 0, skin, pos[4], pos[5])
	setTimer(function()
		setElementHealth(player, hp)
		if tonumber(hp or 0) <= 1 then
			killPed(player, player)
		end
		setPedArmor(player, armor)
		setElementData(player, "char:hunger", hunger)
		setElementData(player, "char:thirst", drink)
		setPlayerName(player, getElementData(player, "char:name"):gsub(" ", "_"))
		setCameraTarget(player)
		setElementData(player, "loggedin", true)	
	end, 300, 1)

	if (stats) then
        for stat, value in pairs(fromJSON(stats)) do
            setPedStat(source, stat, value)
        end
    end

	if getElementData(player, "adminjail") == 1 then
		setElementFrozen(player, true)
		fadeCamera(player, false, 1.0)
		showChat(player, false)
		setTimer(function()
			triggerClientEvent(player, "triggerAdminjail", player, getElementData(player, "adminjail:admin"), getElementData(player, "adminjail:reason"), getElementData(player, "adminjail:alapIdo"), 2, getElementData(player, "adminjail:ido"))
		end, 500, 1)
		setTimer(function()
			fadeCamera(player, true, 2.5)
			setElementFrozen(player, false)
			toggleAllControls(player, true, true, true)
			showChat(player, true)
		end, 7500, 1)
		
		setElementPosition(player, 1571.6392822266, -1692.9930419922, 13.589937210083)
		setElementInterior(player, 0)
		setElementDimension(player, 0)
		
	end


end
addEvent("loadCharacter", true)
addEventHandler("loadCharacter", root, loadCharacter)
--[[
function informPlayerOnModelChange(oldModel, newModel)
    if ( getElementType(source) == "player" ) then -- Make sure the element is a player
        outputChatBox("Skin mudada de: "..oldModel.." para: ".. newModel, source, 0, 255, 0) -- Message for player
		local account = getPlayerAccount(source)
		local stats = getAccountData(account, "stats")
		if (getElementModel(source ) == 0) then
			if (stats) then
				for stat, value in pairs(fromJSON(stats)) do
					setPedStat(source, stat, value)
				end
			end
		end
    end
end
addEventHandler("onElementModelChange", root, informPlayerOnModelChange)]]

function getAllPedStats(thePed)
    local stats = { }
    for stat=0, 230 do
        local value = getPedStat(thePed, stat)
        if (value) and (value > 0) then
            stats[stat] = value
        end
    end
    return stats
end

--[[
function _call(_called, ...)
	local co = coroutine.create(_called);
	coroutine.resume(co, ...);
end

function sleep(time)
	local co = coroutine.running();
	local function resumeThisCoroutine()
		coroutine.resume(co);
	end
	setTimer(resumeThisCoroutine, time, 1);
	coroutine.yield();
end

function UpdateStates()
	_call(saveAllPlayer); 
end

function startResources ()
	_call(UpdateStates); 
end
--addEventHandler ( "onResourceStart", resourceRoot, startResources );
]]--

function saveAllPlayer()
	for _, player in ipairs(getElementsByType("player")) do
		saveOnePlayer(player)
		--sleep(200);
	end
end
addEventHandler("onResourceStop", resourceRoot, saveAllPlayer)
--setTimer(saveAllPlayer, 1000*60*30, 0)

--setTimer(UpdateStates, 1000*60*40, 0)




function saveAllPlayerCmd(p)
	if tonumber(getElementData(p, "acc:admin") or 0) >= 8 then
		for _, player in ipairs(getElementsByType("player")) do
			saveOnePlayer(player)
		--_call(UpdateStates);
		end
		outputDebugString("[Conta]: conta salva com sucesso todas as contas!")
	end
end
addCommandHandler("saveall", saveAllPlayerCmd, false, false)

function saveOnePlayer(player)
	if isElement(player) and getElementData(player, "loggedin") then
		local account = getPlayerAccount(player)
		local x,y,z = getElementPosition(player)
		local int = getElementInterior(player)
		local dim = getElementDimension(player)
		local position = toJSON({x,y,z,int,dim})

		local money = getElementData(player, "char:money")or 0
		local bmoney = getElementData(player, "char:bankmoney")or 0
		local aduty = getElementData(player, "char:adminduty")or 0
		local admin = getElementData(player, "acc:admin") or 0
		local adutyTime = getElementData(player, "aduty:time") or 0
		local played = getElementData(player, "char:playedTime") or 0
		local played1 = getElementData(player, "char:onlineTime") or 0
		local job = getElementData(player, "job") or "Desempregado"
		local hp = getElementHealth(player)
		local armor = getPedArmor(player)
		local hunger = getElementData(player, "char:hunger") or 0
		local drink = getElementData(player, "char:thirst") or 0
		local premium = getElementData(player, "char:pp") or 0
		local stats = getAllPedStats(player)
		local numberphone1 = getElementData(player, "char:numberphone") or 0
		
		local level = getElementData(player,"Sys:Level") or 0
		local exp = getElementData(player,"LSys:EXP") or 0

		local texture = {}
		local model = {}
		for i=0, 17 do
			local clothesTexture, clothesModel = getPedClothes(player, i)
			if ( clothesTexture ~= false ) then
				table.insert(texture, clothesTexture)
				table.insert(model, clothesModel)
			else
				table.insert(texture, " ")
				table.insert(model, " ")
			end	
		end
		local allTextures = table.concat(texture, ",")
		local allModels = table.concat(model, ",")
		texture = {}
		model = {}	
		
		setAccountData(account, "stats", toJSON(stats))

		--outputDebugString("[Conta]: salvamento da conta "..getElementData(player,"acc:id").." sucesso!")
		
		dbExec(connection, "UPDATE characters SET pos = ?, money = ?,bankmoney = ?, adminduty = ?, playedTime = ?, onlineTime = ?, job = ?,Level = ?,LevelEXP = ?, cj = ?, cjm = ?, hp = ?, armor = ?, hunger = ?, drink = ?, premiumpont = ?, adutyTime = ? WHERE id = ?",position, money, bmoney, aduty, played, played1, job, level, exp, allTextures , allModels, hp, armor, hunger, drink, premium, adutyTime, getElementData(player, "acc:id"))
		dbExec(connection, "UPDATE accounts SET admin = ? WHERE id = ?", admin, getElementData(player,"acc:id"))
	end
end

function leavePlayer()
	if isElement(source) then
		local accid = getElementData(source, "acc:id")
		if not tonumber(accid) then return end
		--dbExec(connection, "UPDATE accounts SET online = 0 WHERE id = ?", accid)
		outputDebugString(getPlayerName(source) .. " Ele saiu. Conta guardada.")
		saveOnePlayer(source)
	end
end
addEventHandler("onPlayerQuit", root, leavePlayer)