addEvent("server->applyTexture", true)
addEventHandler("server->applyTexture", root, function(element, name, texture)
    if element and name and texture then
        triggerClientEvent(root, "client->applyTexture", root, element, name, texture)
    end
end)

addEvent("server->destroyTexture", true)
addEventHandler("server->destroyTexture", root, function(element)
    if element then
        triggerClientEvent(root, "destroyTexture", root, element)
    end
end)