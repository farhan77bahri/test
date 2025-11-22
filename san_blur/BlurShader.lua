--  [[
-- 	Scripted By Miki! 
--	]]
local screenWidth, screenHeight = guiGetScreenSize()
local blurShaders = {}
local myScreenSource = dxCreateScreenSource(screenWidth, screenHeight)

function createBlur(name, strenght)
	if strenght > 10 then strenght = 10 end
	blurShaders[#blurShaders + 1] = {s_name = name, shader = dxCreateShader("shaders/BlurShader.fx"), strenght_s = strenght}
end

function removeBlur(name)
	for k, v in ipairs(blurShaders) do
		if v.s_name == name then
			table.remove(blurShaders, k)
			return
		end
	end
end

addEventHandler("onClientRender", getRootElement(),
function()
	for k, v in ipairs(blurShaders) do
		if v.shader then
			dxUpdateScreenSource(myScreenSource)
			
			dxSetShaderValue(v.shader, "ScreenSource", myScreenSource);
			dxSetShaderValue(v.shader, "BlurStrength", v.strenght_s);
			dxSetShaderValue(v.shader, "UVSize", screenWidth, screenHeight);

			dxDrawImage(0, 0, screenWidth, screenHeight, v.shader)
		end
	end
end)