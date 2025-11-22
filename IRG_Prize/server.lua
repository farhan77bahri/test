-- işe yarar bi function
function iif(a,b,c)
	if a then return b else return c end
end

-- oyuncu hesaba girdiğinde
timers = {}
function loginFunc(_,acc)
	local today = getRealDateTimeString()
	local lastTime = getAccountData(acc,"lastTime")
	if today ~= lastTime then -- eğer hesapta son ödül alma günü bugün değilse
		if minute*60*1000 < 50 then -- eğer oynanması gereken dakika ms cinsinden 50'den küçükse direk işlemleri gerçekleştir.
			local prizeCount = getAccountData(acc,"prizeCount") or 0 -- oyuncunun kaç kere ödül aldığını çektik (yoksa 0)
			local weekCount = getAccountData(acc,"weekCount") or 0
			triggerClientEvent(source,"prizeSystem:sendPrizeToClient",source,prizes,prizeCount,weekCount) -- tabloyu ve oyuncunun ödül alma sayısını cliente yolladık
		return end
		outputChatBox("#999999Prêmio diário #999999você vai conseguir em #00FF00"..minute.." #999999minutos :)",source,0,0,0,true)
		timers[source] = setTimer(function(pl,acc)
			local acc = getPlayerAccount(pl)
			if not isGuestAccount(acc) then
				local prizeCount = getAccountData(acc,"prizeCount") or 0 -- oyuncunun kaç kere ödül aldığını çektik (yoksa 0)
				local weekCount = getAccountData(acc,"weekCount") or 0
				triggerClientEvent(pl,"prizeSystem:sendPrizeToClient",pl,prizes,prizeCount,weekCount) -- tabloyu ve oyuncunun ödül alma sayısını cliente yolladık
			end
			timers[pl] = nil
		end,minute*60*1000,1,source,acc)
	end
end
addEvent("prizeSystem:onPlayerLogin",true)
addEventHandler("prizeSystem:onPlayerLogin",root,loginFunc)
addEventHandler("onPlayerLogin",root,loginFunc)






addCommandHandler("prize",
    function(player)
		local prizeCount = getAccountData(player,"prizeCount") or 0 -- oyuncunun kaç kere ödül aldığını çektik (yoksa 0)
				local weekCount = getAccountData(player,"weekCount") or 0
        -- ارسال اطلاعات جوایز به کلاینت
       -- local prizes = {
      --      [1] = {"Para", 100, "$"},
       --     [2] = {"Para", 200, "$"},
       --     [3] = {"EXP", 10, "XP"},
      --      [4] = {"Para", 50, "$"},
            -- اضافه کردن جوایز دیگر در صورت نیاز
      --  }
       -- local weekCount = 1 -- مثال: برای هفته 1
        triggerClientEvent(player,"prizeSystem:sendPrizeToClient",player,prizes,prizeCount,weekCount) 
    end
)






addEventHandler("onPlayerQuit",root,function()
	if isTimer(timers[source]) then
		killTimer(timers[source])
		timers[source] = nil
	end
end)

-- ödülü aldığını kaydet
function givePrize(oyuncu,hesap,kod,miktar,birim) -- ödülü veren fonksiyon
	if kod == "Para" then -- eğer hediye kodu Para ise
		--givePlayerMoney(oyuncu,miktar)
		setElementData(oyuncu, "char:money", getElementData(oyuncu, "char:money") + miktar)
	elseif kod == "Puan" then -- eğer hediye kodu Puan ise
		--local puan = getAccountData(hesap,"points") or 0 -- oyuncunun hesaptaki puanını çektik
		--setAccountData(hesap,"points",puan+miktar) -- oyuncunun puanına hediyeyi ekleyip hesaba kayıt ettik
	end
	outputChatBox("Shoma hadiye roozane khod ro daryaft kardid! +#00FF00"..miktar..birim,oyuncu,150,150,150,true)
end
addEvent("prizeSystem:givePrize",true)
addEventHandler("prizeSystem:givePrize",root,function(day)
	local acc = getPlayerAccount(source)
	if not isGuestAccount(acc) then
		local today = getRealDateTimeString()
		setAccountData(acc,"lastTime",today)
		setAccountData(acc,"prizeCount",iif(day==7,0,day))
		local week = getAccountData(acc,"weekCount") or 0
		if day == 7 then
			setAccountData(acc,"weekCount",week+1)
		end
		local tablo = prizes[day] -- o günün hediyesi
		givePrize(source,acc,tablo[1],tablo[2]+tablo[2]*(week/2),tablo[3])
	else
		outputChatBox("Shoma nemitavanid hadiye roozane khod ra bedoon vorood be hesaabe karbari-etan daryaft konid!",source,255,0,0,true)
	end
end)
-- bu fonksiyon kullanıldığı sıradaki yıl-ay-gün verir
function getRealDateTimeString()
	local time = getRealTime()
    return string.format( '%04d-%02x-%02d'
                        ,time.year + 1900
                        ,time.month + 1
                        ,time.monthday
                        )
end

-- bu kısmı boşver
setTimer(function()
	for i,pl in pairs(getElementsByType("player")) do
		local acc = getPlayerAccount(pl)
		if not isGuestAccount(acc) then
			triggerEvent("prizeSystem:onPlayerLogin",pl,1,acc)
		end
	end
end,1000,1)







local con = exports.san_mysql:getConnection()


-- مدیریت وضعیت ادمین دیوتی
addEvent("adminDuty:toggle1", true)
addEventHandler("adminDuty:toggle1", root, function(isAdminDuty)
    local player = source  -- بازیکن که درخواست را ارسال کرده است
    local dutyStatus = getElementData(player, "char:adminduty") or 0
	local getPlayerAdminName = function(p)
		local name = tostring(getElementData(p, "char:name")) or ""
		return name
	end
	if getElementData(player,"acc:admin") >= 1 then
    -- بررسی وضعیت ادمین دیوتی برای بازیکن
    if isAdminDuty then
        -- وارد شدن به حالت ادمین دیوتی
        setElementData(player, "char:adminduty", 1)  -- تغییر == به = برای تنظیم مقدار



			setElementData(player, "char:oldName", getPlayerName(player))
            setPlayerName(player, getPlayerAdminName(player))
            setElementData(player, "char:adminduty", 1)
            setElementData(player, "job", "STAFF IRAN-GAMING")
            exports["a_infobox"]:addBox(root, "admin", "Admin " .. getPlayerName(player) .. " Duty Kard")
            exports.irg_logs:createLog("ADUTY", getPlayerAdminName(player, true) .. " Duty Kard.", player)
       -- outputChatBox(getPlayerName(player) .. " وارد حالت ادمین دیوتی شد.", root, 255, 0, 0)
	   local adutyTimer1 = setTimer(function()
		if isElement(player) and getElementData(player, "char:adminduty") == 1 then
			local adutytime = getElementData(player, "aduty:time") or 0
			adutytime = adutytime + 1
			setElementData(player, "aduty:time", adutytime)
			dbExec(con, "UPDATE characters SET adutyTime=? WHERE id='" .. getElementData(player, "char:id") .. "'", adutytime)
		end
		end, 60000, 0)
		setElementData(player, "aduty:timer", adutyTimer1)

        -- مدل‌های مختلف برای ادمین‌ها
        local adminModels = {
            [1] = 100, [2] = 101, [3] = 102, [4] = 103, [5] = 104,
            [6] = 105, [7] = 106, [8] = 107, [9] = 108, [10] = 109,
            [11] = 110, [12] = 111, [13] = 112, [14] = 306
        }

        -- تنظیم مدل ادمین بر اساس سطح ادمین
        local adminLevel = getElementData(player, "acc:admin") or 0
        if adminLevel > 0 then
            setElementModel(player, adminModels[adminLevel] or getElementModel(player))
        end

    else
        -- خروج از حالت ادمین دیوتی
		setPlayerName(player, getElementData(player, "char:oldName"))
    	exports["a_infobox"]:addBox(root, "admin", "Admin " .. getPlayerName(player) .. " Off Duty Kard")
        setElementData(player, "char:adminduty", 0)  -- تغییر == به = برای تنظیم مقدار
		setElementData(player, "job", "Bikar")
		setElementModel(player, getElementData(player, "char:skin"))
		exports.irg_logs:createLog("OFFDUTY", getPlayerAdminName(player, true) .. " Off Duty Kard.", player)

		-- Reset custom data (if any)
		local farhan = getElementData(player, "char:farhan") or 0
		dbExec(con, "UPDATE characters SET farhan=? WHERE id='" .. getElementData(player, "char:id") .. "'", farhan)
    end
end
end)


addEvent("admin:teleportToPlayer", true)
addEventHandler("admin:teleportToPlayer", root, function(targetID)
    if client and getElementData(client, "acc:admin") >= 1 then
        local targetPlayer = exports["san_core"]:findPlayer(nil, targetID)
		
        if targetPlayer then
            local x, y, z = getElementPosition(targetPlayer)
            local interior = getElementInterior(targetPlayer)
            local dimension = getElementDimension(targetPlayer)
            setElementPosition(client, x, y, z + 1)
            setElementInterior(client, interior)
            setElementDimension(client, dimension)
            outputChatBox("شما به بازیکن #" .. targetID .. " تلپورت شدید.", client, 0, 255, 0)
        else
            outputChatBox("بازیکنی با این آی‌دی پیدا نشد!", client, 255, 0, 0)
        end
    end
end)


addEvent("admin:spawnVehicleByDBID", true)
addEventHandler("admin:spawnVehicleByDBID", root, function(dbid)
    if client and getElementData(client, "acc:admin") >= 1 then
        local vehicle = tonumber(getElementData(dbid, "veh:id")) or -1
        if vehicle then
            local x, y, z = getElementPosition(client)
            local rx, ry, rz = getElementRotation(client)
            setElementPosition(vehicle, x + 2, y, z)
            setElementRotation(vehicle, 0, 0, rz)
            setElementFrozen(vehicle, false)
            setTimer(function()
                setVehicleDamageProof(vehicle, false)
            end, 1000, 1)
            outputChatBox("وسیله نقلیه با DBID #" .. dbid .. " اسپاون شد!", client, 0, 255, 0)
        else
            outputChatBox("وسیله نقلیه‌ای با این DBID یافت نشد!", client, 255, 0, 0)
        end
    end
end)
