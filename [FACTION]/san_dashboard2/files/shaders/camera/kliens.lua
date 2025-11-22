-----------------------
-----------------------
--		Blur
-----------------------
-----------------------
local sx,sy = guiGetScreenSize ()
local myScreenSource = dxCreateScreenSource( sx/2, sy/2 )
local blurHShader,tecName = dxCreateShader( "files/shaders/camera/blurH.fx" )
local blurVShader,tecName = dxCreateShader( "files/shaders/camera/blurV.fx" )
local ShowBlur = false
function renderBlur()
    if not ShowBlur then return end 
	local col = tocolor (255,255,255,255)
	local colForBackground = tocolor (255,255,255,255*0.85)
			
	RTPool.frameStart()
	dxUpdateScreenSource( myScreenSource )
--	local current = myScreenSource
			
--	current = applyDownsample( current )
--	current = applyGBlurH( current, Settings.var.bloom )
--	current = applyGBlurV( current, Settings.var.bloom )
	dxSetRenderTarget()
--	dxDrawImage( 0, 0, sx, sy, current, 0,0,0, col )
	dxDrawImage( 0, 0, sx, sy, "files/shaders/camera/img.dds" )
end
addEventHandler("onClientRender", getRootElement(), renderBlur)

function controlLencseFolt(a)
	ShowBlur = a
end

Settings = {}
Settings.var = {}
Settings.var.cutoff = 0
Settings.var.power = 1.88
Settings.var.bloom = 1

function applyDownsample( Src, amount )
	amount = amount or 2
	local mx,my = dxGetMaterialSize( Src )
	mx = mx / amount
	my = my / amount
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT )
	dxDrawImage( 0, 0, mx, my, Src )
	return newRT
end

function applyGBlurH( Src, bloom )
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurHShader, "tex0", Src )
	dxSetShaderValue( blurHShader, "tex0size", mx,my )
	dxSetShaderValue( blurHShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx, my, blurHShader )
	return newRT
end

function applyGBlurV( Src, bloom )
	local mx,my = dxGetMaterialSize( Src )
	local newRT = RTPool.GetUnused(mx,my)
	dxSetRenderTarget( newRT, true ) 
	dxSetShaderValue( blurVShader, "tex0", Src )
	dxSetShaderValue( blurVShader, "tex0size", mx,my )
	dxSetShaderValue( blurVShader, "bloom", bloom )
	dxDrawImage( 0, 0, mx,my, blurVShader )
	return newRT
end

RTPool = {}
RTPool.list = {}

function RTPool.frameStart()
	for rt,info in pairs(RTPool.list) do
		info.bInUse = false
	end
end

function RTPool.GetUnused( mx, my )
	-- Find unused existing
	for rt,info in pairs(RTPool.list) do
		if not info.bInUse and info.mx == mx and info.my == my then
			info.bInUse = true
			return rt
		end
	end
	-- Add new
	local rt = dxCreateRenderTarget( mx, my )
	if rt then
		RTPool.list[rt] = { bInUse = true, mx = mx, my = my }
	end
	return rt
end

dxFadeState = nil
dxFade = {}

function dxFadeCamera (state, czas, r, g, b)
	if state == true then
		if dxFadeState == true then
			removeEventHandler ("onClientRender", getRootElement(), renderFading)
		else
			removeEventHandler ("onClientRender", getRootElement(), renderHiding)
		end
		dxFade.startTime = getTickCount ()
		dxFade.endTime = dxFade.startTime + czas
		dxFade.startColor = {r,g,b,255}
		dxFade.endColor = {r,g,b,0}
		addEventHandler ("onClientRender", getRootElement(), renderFading)
		dxFadeState = true
	elseif state == false then
		if dxFadeState == false then
			removeEventHandler ("onClientRender", getRootElement(), renderHiding)
		else
			removeEventHandler ("onClientRender", getRootElement(), renderFading)
		end
		dxFade.startTime = getTickCount ()
		dxFade.endTime = dxFade.startTime + czas
		dxFade.startColor = {r,g,b,0}
		dxFade.endColor = {r,g,b,255}
		addEventHandler ("onClientRender", getRootElement(), renderHiding)
		dxFadeState = false
	end
end

function renderFading ()
	local r1,g1,b1,a1 = dxFade.startColor[1],dxFade.startColor[2],dxFade.startColor[3],dxFade.startColor[4]
	local r2,g2,b2,a2 = dxFade.endColor[1],dxFade.endColor[2],dxFade.endColor[3],dxFade.endColor[4]
	
	local now = getTickCount()
	local elapsedTime = now - dxFade.startTime
	local duration = dxFade.endTime - dxFade.startTime
	local progress = math.abs(elapsedTime / duration)
	if elapsedTime < duration then
		alpha = interpolateBetween (a2, 0, 0, a1, 0, 0, progress, "Linear")
	else
		alpha = 255
	end
	
	if alpha == 255 then
		removeEventHandler ("onClientRender", getRootElement(), renderFading)
	end
	dxDrawRectangle (0,0, screenX, screenY, tocolor(r1, g1, b1, alpha), true)
end