function showBox(player, value)
	if isElement(player) then
		triggerClientEvent(player, "showBox", getRootElement(), value)
	end
end