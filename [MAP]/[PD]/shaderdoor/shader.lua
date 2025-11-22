
addEventHandler('onClientResourceStart', resourceRoot,
function()
shader = dxCreateShader('shader.fx')
terrain = dxCreateTexture('img/dverkofe.jpg')
dxSetShaderValue(shader, 'gTexture', terrain)
engineApplyShaderToWorldTexture(shader, 'cj_wooddoor2')
engineApplyShaderToWorldTexture(shader, '')
end
)
addEventHandler('onClientResourceStart', resourceRoot,
function()
shader = dxCreateShader('shader.fx')
terrain = dxCreateTexture('img/oknosolon.png')
dxSetShaderValue(shader, 'gTexture', terrain)
engineApplyShaderToWorldTexture(shader, 'ws_carshowwin1')
end
)
addEventHandler('onClientResourceStart', resourceRoot,
function()
shader = dxCreateShader('shader.fx')
terrain = dxCreateTexture('img/stena1.jpg')
dxSetShaderValue(shader, 'gTexture', terrain)
engineApplyShaderToWorldTexture(shader, 'ws_altz_wall5')
engineApplyShaderToWorldTexture(shader, 'badhousewallc02_128')
end
)

















