function addNotification(player,text,type)
	if player and text and type then 
		triggerClientEvent(player,"boxos",player,text,type)
	end
end

