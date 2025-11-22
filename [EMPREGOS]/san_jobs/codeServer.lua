local connection = exports["san_mysql"]:getConnection()

addEvent("updateJobToServer", true)
addEventHandler("updateJobToServer", root, function (JobID)
	dbPoll ( dbQuery( connection, "UPDATE characters SET job='?' WHERE id = '?'", JobID, getElementData(source, "acc:id")), -1 )
end)


addEvent("trabalho", true)
addEventHandler("trabalho", root, function (a,b)
	exports.san_employment:setPlayerJob(source, a, a, b,true)
end)



-- ایونت برای اخراج بازیکن از شغل
addEvent("onPlayerResignJob", true)
addEventHandler("onPlayerResignJob", root, function(player)
    -- ارسال اطلاع‌رسانی به بازیکن
    exports.san_infobox:addNotification(player, "Soma Az Shoghl Khod Estefa Dadid!", "success")
    
    -- تغییر شغل بازیکن به "Desempregado" (بی‌کار)
    exports.san_employment:setPlayerJob(player, "Desempregado", "0", true)
    
    -- دریافت موقعیت فعلی بازیکن و ارسال به GPS
    local x, y, z = getElementPosition(player)
    exports.Script_futeis:setGPS(player, "Coordenada", x, y, z)
    
    -- ارسال یک ایونت به کلاینت برای اجرای عملکردی دیگر (مثلاً HUD)
    triggerClientEvent(player, "hudids", player)
    
    -- می‌توانید این موارد را برای حذف آیتم‌ها یا سایر تغییرات اضافه کنید
    -- exports['san_items']:RemovePlayerDutyItems(player)
    -- exports['san_items']:takePlayerItemToID(player, 55, 0)
end)

-- تعریف دستور برای فراخوانی ایونت
addCommandHandler("estefa", function(player)
    -- فراخوانی ایونت برای اخراج بازیکن
    triggerEvent("onPlayerResignJob", root, player)
end)
