local screenW2,screenH2  = guiGetScreenSize()
local resW2, resH2       = 1280,720
local x, y               = (screenW2/resW2), (screenH2/resH2)

cor = {}

local l_0_1 = false
local l_0_2, l_0_3 = guiGetScreenSize()
local l_0_4 = dxCreateScreenSource(l_0_2, l_0_3)

addEventHandler ("onClientRender", root, 
function()
  if l_0_1 then
    dxUpdateScreenSource(l_0_4)
    dxDrawImage(0, 0, l_0_2, l_0_3, l_0_4)
  end
end
)

function dxDrawRespawn ()
        cor[1] = tocolor(255, 255, 255, 100)
     	if isCursorOnElement(x*108, y*288, x*323, y*290) then cor[1] = tocolor(255, 255, 255, 255) end
		
        cor[2] = tocolor(255, 255, 255, 100)
     	if isCursorOnElement(x*479, y*288, x*323, y*290) then cor[2] = tocolor(255, 255, 255, 255) end
		
        cor[3] = tocolor(255, 255, 255, 100)
     	if isCursorOnElement(x*847, y*288, x*323, y*290) then cor[3] = tocolor(255, 255, 255, 255) end
		
        dxDrawImage(x*0, y*0, x*1280, y*720, "Files/walpaper.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
		dxDrawImage(x*108, y*288, x*323, y*290, "Files/lasv.png", 0, 0, 0, cor[1], false)
		dxDrawImage(x*479, y*288, x*323, y*290, "Files/sanf.png", 0, 0, 0, cor[2], false)
		dxDrawImage(x*847, y*288, x*323, y*290, "Files/los.png", 0, 0, 0, cor[3], false)
end

respawn = false
function startDx ()
    if (respawn == false) then
        addEventHandler("onClientRender", root, dxDrawRespawn)
		setCameraMatrix (858.12188720703, -1101.806640625, 30.591514587402, 894.00720214844, -1102.4647216797, 30.591514587402)
		respawn = true
		showCursor(true)
		showChat(false)
		l_0_1 = true
     else
        removeEventHandler("onClientRender", root, dxDrawRespawn)
		showCursor(false)	
        showChat(true)		
		respawn = false
		l_0_1 = false
	 end
end
addEvent("startDx", true)
addEventHandler("startDx", root, startDx)

function Select (_,state)
    if respawn == true then
         if state == "down" then
	         if isCursorOnElement(x*108, y*288, x*323, y*290) then
	         triggerServerEvent("Select:Lv", root, localPlayer)
			 startDx ()
	         playSoundFrontEnd(1)
	         elseif isCursorOnElement(x*479, y*288, x*323, y*290) then
	         triggerServerEvent("Select:Sf", root, localPlayer)
			 startDx ()
	         playSoundFrontEnd(1)
	         elseif isCursorOnElement(x*847, y*288, x*323, y*290) then
	         triggerServerEvent("Select:Ls", root, localPlayer)
			 startDx ()
	         playSoundFrontEnd(1)
	         end
	     end
     end
end
addEventHandler("onClientClick", root, Select)


local x,y = guiGetScreenSize()
 function isCursorOnElement(x,y,w,h)
	local mx,my = getCursorPosition ()
	local fullx,fully = guiGetScreenSize()
	cursorx,cursory = mx*fullx,my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end














local monitorSize= {guiGetScreenSize()}
local fadeTimer = false
local fadTimer = false
local hitTime = 6*60 -- 15 perc
-- local hitTime = 10 -- 15 perc,
local deadPed = false
local spawnTimer = false
local startTimer = false
local stopTimer = false
local ripPed = {}
local sound = false
local ripPedPos = {
	{68, 812.9013671875, -1098.236328125, 25.786804199219, 90}, -- PAP
	{221,811.0986328125, -1097.205078125, 25.784603118896, 180},
	{190,811.1962890625, -1099.33984375, 25.784721374512, 0},
}
local scene = 1

fadeCamera(true, 1) 
-- setCameraTarget(localPlayer)
toggleAllControls(true)


local blurStrength = 5
local myScreenSource = dxCreateScreenSource(monitorSize[1], monitorSize[2])
local font = dxCreateFont('files2/Calibri.ttf', 20)

local sounds = {
	"509760969",
	"488286273",
	"503202672",
	"449874870"
} 



addEventHandler('onClientResourceStart', resourceRoot, function()
	--if (getElementHealth(localPlayer)) > 0 and  (getElementHealth(localPlayer)) <= 20 then 
		--loadHit()
	if (getElementHealth(localPlayer)) == 0 then
		--triggerServerEvent('sanMTA->#createPedToPlayer', localPlayer, localPlayer)
		--blurShader, blurTec = dxCreateShader("files2/BlurShader.fx")
		setElementData(localPlayer,"screen",true)
		fadeCamera(false, 0.3) 
		scene = 1
		setGameSpeed(0.5) -- normal Game Speed == 1
		startDeadFunction()
		destroyHitFunc()
		if isElement(sound) then 
			stopSound(sound)
		end
		showChat(false)
		sound = playSound("https://api.soundcloud.com/tracks/"..sounds[math.random(1, #sounds)].."/stream?client_id=a3e059563d7fd3372b49b37f00a00bcf", true)
		--toggleAllControls( false)
	end
end)

addEventHandler('onClientPlayerWasted', localPlayer, function ()
	--blurShader, blurTec = dxCreateShader("files2/BlurShader.fx")
	setElementData(localPlayer,"screen",true)
	
	
	fadeCamera(false, 0.3) 
	scene = 1
	setGameSpeed(0.5) -- normal Game Speed == 1
	startDeadFunction()
	destroyHitFunc()
	if isElement(sound) then 
		stopSound(sound)
	end
	showChat(false)
	sound = playSound("https://api.soundcloud.com/tracks/"..sounds[math.random(1, #sounds)].."/stream?client_id=a3e059563d7fd3372b49b37f00a00bcf", true)
end)

function startDeadFunction()
	if scene == 1 then	
		startTimer = setTimer(function ()
			fadeCamera(true, 1)
			setTimer(function ()
				--removeEventHandler('onClientRender', root, blurCreate)
				--addEventHandler('onClientRender', root, blurCreate)
				setCameraMatrix (858.12188720703, -1101.806640625, 30.591514587402, 894.00720214844, -1102.4647216797, 30.591514587402)
				
				if isTimer(hitTimer) then 
					killTimer(hitTimer)
				end
				hitTime =  6*60 -- 10 perc
				removeEventHandler('onClientRender', root, hitRender)
				addEventHandler('onClientRender', root, hitRender)
				hitTimer = setTimer(hitTimerFunc, 1000, 0)
			end, 1005, 1)
		end, 3000, 1)	
	end
end



addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), function ()
	setTimer(function ()
	--	if (getElementHealth(localPlayer)) > 0 then 
			--loadHit()

		if (getElementHealth(localPlayer)) > 29 then
			fadeCamera(true, 1)
			toggleControl("enter_exit", true)		
			setCameraTarget(localPlayer)
			destroyHitFunc()
			setElementData(localPlayer,"screen", false)
			showChat(true)
			--toggleAllControls(true)


			if isElement(sound) then 
				stopSound(sound)
			end
			scene = 1 
			if isTimer(hitTimer) then 
				killTimer(hitTimer)
			end	
			
			if isTimer(startTimer) then 
				killTimer(startTimer)
			end	
			
			if isTimer(stopTimer) then 
				killTimer(stopTimer)
			end
				
			
			destroyHitFunc()
		end
	end, 500, 1)
end)

function loadHit(player)
	if not player then player = localPlayer end
	if not fadTimer then 

		--setCameraMatrix (858.12188720703, -1101.806640625, 30.591514587402, 894.00720214844, -1102.4647216797, 30.591514587402)
        
		setElementData(player, "screen", false)
		hitTimer = setTimer(hitTimerFunc, 1000, 0)
		removeEventHandler('onClientRender', root, hitRender)
		addEventHandler('onClientRender', root, hitRender)
		fadeCameraFunction()
	end
end
addEvent('sanMTA->#loadHit', true)
addEventHandler('sanMTA->#loadHit', root, loadHit)





function hitRender()
	dxDrawImage(x*0, y*0, x*1280, y*720, "Files/walpaper.png", 0, 0, 0, tocolor(255, 255, 255, 255), false)
	if scene == 1 then 
	    
		dxDrawText("Descanse em paz:\n"..getElementData(localPlayer,"char:name"):gsub('_', ' '), monitorSize[1], monitorSize[2]-95, 0, 0, tocolor(0,0,0,255),1, font,"center","center",false,true,false)
		dxDrawText("Descanse em paz:\n#D24D57"..getElementData(localPlayer,"char:name"):gsub('_', ' '), monitorSize[1]+1, monitorSize[2]-94, 0, 0, tocolor(255, 255, 255,255),1, font,"center","center",false,true,false,true)
	
	end
	
	dxDrawText(secondsToTimeDesc(hitTime), monitorSize[1], monitorSize[2], 0, 0, tocolor(0,0,0,255),1, font,"center","center",false,true,false)
	dxDrawText(secondsToTimeDesc(hitTime), monitorSize[1]+1, monitorSize[2]+1, 0, 0, tocolor(255, 255, 255,255),1, font,"center","center",false,true,false)
end

function hitTimerFunc ()
	-- block, anim = getPedAnimation(localPlayer) 
	-- if block ~= "BEACH" and anim ~= "ParkSit_M_loop"then 
		-- triggerServerEvent('sanMTA->#setPlayerAnimation', localPlayer, localPlayer, "BEACH", "ParkSit_M_loop", 1, true)
	-- end
	hitTime = hitTime - 1
	if hitTime <= 0 then 
		if scene == 1 then
			
			startDx ()

		
			fadeCamera(true, 1) 
			--setCameraTarget(localPlayer)
			destroyHitFunc()
			setElementData(localPlayer,"screen",false)
			showChat(true)
			
			--removeEventHandler('onClientRender', root, blurCreate)
			if isElement(sound) then 
				stopSound(sound)
			end
			scene = 1 
		end
		
			
		if isTimer(hitTimer) then 
			killTimer(hitTimer)
			
		end
	end
end

function destroyHitFunc()
	if isTimer(fadTimer) then 
		killTimer(fadTimer)
	end	
	
	if isTimer(hitTimer) then 
		killTimer(hitTimer)
	end
	fadTimer = false
	hitTime =  6*60 -- 15 perc
	--
	removeEventHandler('onClientRender', root, hitRender)
	setGameSpeed(1)
	
end

function fadeCameraFunction()
	fadeTimer = not fadeTimer
	if isTimer(fadTimer) then 
		killTimer(fadTimer)
	end
	if fadeTimer then 
		fadeCamera(true, 0.5) -- false = true; true = false
		fadTimer = setTimer(fadeCameraFunction, 1000, 1)
	else
		fadeCamera(false, 1) -- false = true; true = false 
		fadTimer = setTimer(fadeCameraFunction, 2500, 1)
	end
end

function secondsToTimeDesc( seconds )
	if seconds then
		local results = {}
		local sec = ( seconds %60 )
		local min = math.floor ( ( seconds % 3600 ) /60 )
		local hou = math.floor ( ( seconds % 86400 ) /3600 )
		local day = math.floor ( seconds /86400 )

		
		-- if day > 0 and day < 10 then table.insert( results, day .. ( day == 1 and " day" or " days" ) ) 
		-- elseif day > 0  then table.insert( results, day .. ( day == 1 and "" or "" ) ) end
			
		-- if hou >= 0 and hou < 10 then table.insert( results, "0"..hou .. ( hou == 1 and "" or "" ) ) 
		-- elseif hou > 0  then table.insert( results, hou .. ( hou == 1 and "" or "" ) ) end
		
		if min >= 0 and min < 10 then table.insert( results, "0"..min .. ( min == 1 and "" or "" ) ) 
		elseif min > 0  then table.insert( results, min .. ( hou == 1 and "" or "" ) ) end
		
		if sec >= 0 and sec < 10 then table.insert( results, "0"..sec .. ( sec == 1 and "" or "" ) ) 
		elseif sec > 0  then table.insert( results, sec .. ( sec == 1 and "" or "" ) ) end
		
		return string.reverse ( table.concat ( results, " : " ):reverse():gsub(" : ", " : ", 1 ) )
	end
	return ""
end