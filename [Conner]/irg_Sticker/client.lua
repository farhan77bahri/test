local shaders = {}
local textureCache = {}
local cache = {}

function applyTexture(element, name, texture)
    if element and name and texture then
        local texture = "stickers/"..texture..".jpg"
        cache[element] = {name, texture}
        destroyTexture(element)
		if not fileExists(texture) then
			return
		end
		if not textureCache[texture] then
			textureCache[texture] = dxCreateTexture(texture, "dxt5")
		end
		shaders[element] = dxCreateShader("fx/replace.fx", 0, 100, false, "all")
		engineApplyShaderToWorldTexture(shaders[element], name, element)
		dxSetShaderValue(shaders[element], "gTexture", textureCache[texture])
		addEventHandler("onClientElementDestroy", element, function ()
			if source == element then
				destroyTexture(element)
			end
		end)
	end
end
addEvent("client->applyTexture", true)
addEventHandler("client->applyTexture", root, applyTexture)

function destroyTexture(element)
	if isElement(element) and shaders[element] then
		destroyElement(shaders[element])
		shaders[element] = nil
	end
end
addEvent("destroyTexture", true)
addEventHandler("destroyTexture", root, destroyTexture)

addEventHandler("onClientResourceStart", resourceRoot, function()
    local data = getElementData(root, "stickercache") or {}
    for i,v in pairs(data) do
        if isElement(i) and getElementType(i) == "object" then
            applyTexture(i, v[1], v[2])
        end
    end
end)

addEventHandler("onClientResourceStop", resourceRoot, function()
    setElementData(root, "stickercache", cache, false)
end)