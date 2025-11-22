function createDebugNotification(player, value, str)
	if isElement(player) then
		triggerClientEvent(player, "onNewNotificationCreate", getRootElement(), value, str)
	end
end