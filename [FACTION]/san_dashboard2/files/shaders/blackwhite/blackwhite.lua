local screenX, screenY = guiGetScreenSize()
local screenSource = dxCreateScreenSource(screenX, screenY)

enabledBlackWhite = false

function changeBlackWhiteState(bOn)
	enabledBlackWhite = bOn
end

addEventHandler("onClientResourceStart", resourceRoot, function()
    if getVersion().sortable < "1.1.0" then
        outputChatBox("Resource is not compatible with this client.")
        return
	else
		blackWhiteShader, blackWhiteTec = dxCreateShader("files/shaders/blackwhite/fx/blackwhite.fx")
    end
end)

addEventHandler("onClientPreRender", root, function()
    if blackWhiteShader and enabledBlackWhite then
        dxUpdateScreenSource(screenSource)     
        dxSetShaderValue(blackWhiteShader, "screenSource", screenSource)
        dxDrawImage(-5, -5, screenX+10, screenY+10, blackWhiteShader)
    end
end)