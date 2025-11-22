addEvent("municaoBTC", true)
addEventHandler("municaoBTC", root, function (a,b,c)
	if getElementData(source, "char:money") >= c then
	setElementData(source, "balas-"..a, getElementData(source, "balas-"..a) + b)
	exports.btc_infobox:addNotification(source, "Você comprou munição de "..a.." quantidade: "..b.." ","success")
	setElementData(source, "char:money", getElementData(source, "char:money") - c)
	else
	exports.btc_infobox:addNotification(source, "Você não tem dinheiro suficiente!","error")
	end
	
end)


addEventHandler('onPlayerQuit',root,
function()
    local vAcc = getPlayerAccount(source)
	if not vAcc or isGuestAccount(vAcc) then return end
	--setAccountData(vAcc,'silencedSaved',getElementData (source,"silenced"))
	setAccountData(vAcc,'balas-pistolaSaved',getElementData (source,"balas-pistola"))
	setAccountData(vAcc,'balas-shotgunSaved',getElementData (source,"balas-shotgun"))
	setAccountData(vAcc,'balas-fuzilSaved',getElementData (source,"balas-fuzil"))
	setAccountData(vAcc,'balas-subSaved',getElementData (source,"balas-submetralhadora"))
	setAccountData(vAcc,'balas-sniperSaved',getElementData (source,"balas-sniper"))
end)
 
addEventHandler('onPlayerLogin',root,
function(_,acc) 
		local v_Data2 = getAccountData(acc,'balas-pistolaSaved') or 0
		local v_Data3 = getAccountData(acc,'balas-shotgunSaved') or 0
		local v_Data4 = getAccountData(acc,'balas-fuzilSaved') or 0
		local v_Data5 = getAccountData(acc,'balas-subSaved') or 0
		local v_Data6 = getAccountData(acc,'balas-sniperSaved') or 0

		setElementData (source,"balas-pistola",v_Data2)
		setElementData (source,"balas-shotgun",v_Data3) 
		setElementData (source,"balas-fuzil",v_Data4) 
		setElementData (source,"balas-submetralhadora",v_Data5) 
		setElementData (source,"balas-sniper",v_Data6)
end)













