

addEvent("giveItems",true)
addEventHandler("giveItems",getRootElement(),function(player,name,azon,kep,erv)
	exports["san_items"]:giveItem(player,29,toJSON({name,azon,kep,erv}),1)
end)