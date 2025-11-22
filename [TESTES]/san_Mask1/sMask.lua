

addEventHandler("onPlayerQuit", root,
	function()
		triggerClientEvent("removeMask", source);
	end
)

function removerMask(source)
	triggerClientEvent("removeMask", source, source)
end
addCommandHandler ("remvitem", removerMask)


addEvent("removeMask2", true)
addEventHandler("removeMask2", root,
function(source)
	triggerClientEvent("removeMask", source, source)
end
)