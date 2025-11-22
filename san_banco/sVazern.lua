local sql = exports.san_mysql:getConnection()
local obj = 2942
local atm = {}
local marker = {}
--local adminlog = "INSERT INTO adminlog SET admin_name=?, adminacc_id=?, tevkod=?, chatlog=?, target_name=?, targetacc_id=?, date=CURDATE(), time=CURTIME()"



function getPlayerFromPartialName(name)
    local name = name and name:gsub("#%x%x%x%x%x%x", ""):lower() or nil
    if name then
        for _, player in ipairs(getElementsByType("player")) do
            local name_ = getPlayerName(player):gsub("#%x%x%x%x%x%x", ""):lower()
            if name_:find(name, 1, true) then
                return player
            end
        end
    end
end

function fadeCameraDelayed(player) 
    if (isElement(player)) then
        fadeCamera(player, true, 0.5)
    end
end

function onDepositMoney(thePlayer, money)
	--takePlayerMoney(thePlayer, money)
	
	if money <= getElementData(thePlayer, "char:money") or money == getElementData(thePlayer, "char:money") then
	--if getElementData(thePlayer, "char:bankmoney") >= money then 

	setElementData(thePlayer, "char:bankmoney", getElementData(thePlayer, "char:bankmoney") + money)
	setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - money)
	exports.san_hud:dm("Você depositou R$: "..money.."",thePlayer, 200, 100, 0)
else
	outputChatBox('#0071fe[TRANSFERIDOR] #FFFFFFVocê está sem dinheiro', thePlayer,255,255,255,true) 
end	

	--dbPoll ( dbQuery( sql, "UPDATE characters SET bankmoney=? WHERE id='?'", money, getElementData(thePlayer, "acc:id")), -1 ) --Sql mentés.

end
addEvent("onDepositMoney", true)
addEventHandler("onDepositMoney", root, onDepositMoney)

function saqueBankMoney(thePlayer, money)

	if money == getElementData(thePlayer, "char:bankmoney") or money <= getElementData(thePlayer, "char:bankmoney") then
	setElementData(thePlayer, "char:bankmoney", getElementData(thePlayer, "char:bankmoney") - money)
	setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") + money)
else
	outputChatBox('#0071fe[TRANSFERIDOR] #FFFFFFVocê está sem dinheiro', thePlayer,255,255,255,true) 
end	

	--dbPoll ( dbQuery( sql, "UPDATE characters SET bankmoney=? WHERE id='?'", money, getElementData(thePlayer, "acc:id")), -1 )


end
addEvent("saqueBankMoney", true)
addEventHandler("saqueBankMoney", root, saqueBankMoney)

function transMoney(item, targetplayer)
    if grid == "" then return end
	
	local targetPlayer2, targetPlayerName = exports.san_core:findPlayer(source, targetplayer)
	
	
	--local targetPlayer, targetPlayerName = exports.san_main:findPlayer(source, item) --getPlayerFromPartialName(item)
	
	if item == getElementData(source, "char:bankmoney") or  item < getElementData(source, "char:bankmoney") then

	--if getElementData(source, "char:bankmoney") >= item then 

		setElementData(source, "char:bankmoney", getElementData(source, "char:bankmoney")-item)
		setElementData(targetPlayer2, "char:bankmoney", getElementData(targetPlayer2, "char:bankmoney")+item)

		exports.san_hud:dm("Você enviou R$: "..item.." para " .. getPlayerName(targetPlayer2),source, 200, 100, 0)
		
		exports.san_hud:dm(""..getPlayerName(source).." Fez uma transferência R$ "..item.." para você!",targetPlayer2, 200, 100, 0)


    --setElementData(targetPlayer2, "char:bankmoney", getElementData(targetPlayer2, "char:bankmoney") + item)
	outputChatBox("#dc143c[IRG - Banco]: #ffffff "..getPlayerName(source).." Fez uma transferência R$ "..item.." para você!", targetPlayer2, 25, 152, 139, true)
else
	outputChatBox('#0071fe[TRANSFERIDOR] #FFFFFFVocê está sem dinheiro', source,255,255,255,true) 
end						
	--dbExec(sql, adminlog, getPlayerName(source), getElementData(source, "acc:id"), "Banco", getPlayerName(source) .. " Transferiu " .. item .. " no para "..targetPlayerName.." ", getPlayerName(source), getElementData(source, "acc:id"))
							
end
addEvent("transMoney", true)
addEventHandler("transMoney", root, transMoney)



function loadatm(id)
	local query = dbQuery(sql, "SELECT * FROM atms WHERE id=?", id)
	local qh = dbPoll(query, -1)
	for k, v in ipairs(qh) do
		atm[tonumber(v["id"])] = createObject(obj, v["x"], v["y"], v["z"])
		setElementDimension(atm[tonumber(v["id"])], v["dimension"])
		setElementInterior(atm[tonumber(v["id"])], v["interior"])
		setElementRotation(atm[tonumber(v["id"])], 0, 0, tonumber(v["rotation"]))
		setElementData(atm[tonumber(v["id"])], "bankThing", true)
		
		marker[tonumber(v["id"])] = createMarker ( v["x"], v["y"], v["z"] +0.2 , "cylinder", 1.5, 255, 255, 0, 0 )
		
		
		--setElementData(marker[tonumber(v["id"])], "informacao", "teste")
		setElementData(marker[tonumber(v["id"])],"informacao","Clique para acessar!")		
		
		setElementData(atm[tonumber(v["id"])], "bankID", tonumber(v["id"]))
	end
end

function loadatms()
	local query = dbQuery(sql, "SELECT * FROM atms")
	local qh = dbPoll(query, -1)
	for k, v in ipairs(qh) do
		loadatm(tonumber(v["id"]))
	end
end
loadatms()

function createATM(p)
	if getElementData(p, "acc:admin") >= 8 then
		local x, y, z = getElementPosition(p)
		local _, _, r = getElementRotation(p)
		local int, dim = getElementInterior(p), getElementDimension(p)
		local query = dbQuery(sql, "INSERT INTO atms SET x=?, y=?, z=?, dimension=?, interior=?, rotation=?", x, y, z-1.0, dim, int, r-180)
		local qh, _, id = dbPoll(query, -1)
		outputChatBox("#dc143c[IRG - Bank]: #ffffffVocê criou com sucesso um caixa eletrônico! #dc143c(" .. id .. ")", p, 25, 152, 139, true)
		loadatm(id)
	end
end
addCommandHandler("criarcaixa", createATM)

function delATM(p, cmd, id)
	if getElementData(p, "acc:admin") >= 8 then
		if tonumber(id) then
			id = tonumber(id)
			local query = dbQuery(sql, "SELECT * FROM atms WHERE id=?", id)
			local qh = dbPoll(query, -1)
			local van = false
			for k, v in ipairs(qh) do
				van = true
				dbPoll(dbQuery(sql, "DELETE FROM atms WHERE id=?", id), -1)
				destroyElement(atm[id])
				outputChatBox("#dc143c[IRG - Banco]: #ffffffVocê excluiu com sucesso o caixa eletrônico!", p, 25, 152, 139, true)
			end
			if not van then outputChatBox("#dc143c[IRG - Banco]: #ffffffNão existe tal caixa eletrônico!", p, 25, 152, 139, true) return end
		end
	end
end
addCommandHandler("delcaixa", delATM)

function nearbyATMs(p)
	if getElementData(p, "acc:admin") >= 8 then
		local van = false
		local px, py, pz = getElementPosition(p)
		outputChatBox("#dc143c[IRG - ATM]: #ffffffCaixas eletrônicos por perto:", p, 25, 152, 139, true)
		for k, v in ipairs(getElementsByType("object")) do
			if getElementData(v, "bankThing") then
				local x, y, z = getElementPosition(v)
				if getDistanceBetweenPoints3D(px, py, pz, x, y, z) <= 10 then
					van = true
					outputChatBox("#dc143c[IRG - ATM]: #ffffffID: "..getElementData(v, "bankID"), p, 25, 152, 139, true)
				end
			end
		end
		if not van then
			outputChatBox("#dc143c[IRG - Banco]: #ffffffNão há caixa eletrônico perto de você", p, 25, 152, 139, true)
		end
	end
end
addCommandHandler("caixaperto", nearbyATMs)


