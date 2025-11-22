local sprintSpeed = 0.7 -- analog control state
local lastSpaceClick = 0
--local sprintTime = 20000 -- 20s
local sprintClicks = 0
local sprintClicksLimit = 20000 -- przerabiamy to na czas w MS

addEventHandler ( "onClientPlayerSpawn", getLocalPlayer(), 
	function ()
		local stat = getPedStat (getLocalPlayer(),22) -- sprint
		--outputChatBox ("sprint stat: " .. stat)
		--sprintTime = 20000 + 100000*(stat/999)
		--outputChatBox ("sprint: " .. sprintTime/1000)
		sprintClicksLimit = 20000 + 100000*(stat/999)--40 + 120*stat/999
		--outputChatBox ("limit: " .. sprintClicksLimit/1000)
	end
)


function onKey (button,press)
	if isCursorShowing () == false and isControlEnabled (button) == true then
		if press == "down" then
			local sprintKey = false
			for i,v in pairs(getBoundKeys ("sprint")) do
				if getKeyState (i) then
					sprintKey = true
					break
				end
			end
			if sprintKey == false then
				setControlState ("walk",true)
			end
		else
			local f = false
			local keys = {"forwards","backwards","left","right"}
			for k,v in ipairs(keys) do
				local bound = getBoundKeys (v)
				for i,key in pairs(bound) do
					if getKeyState (i) then
						f = true
						break
					end
				end
			end
			if f == false then
				--if isControlEnabled ("sprint") then
					setControlState ("walk",false)
				--end
			end
		end
	end
end

addEventHandler ("onClientResourceStart",getResourceRootElement(),
	function ()
		local keys = {"forwards","backwards","left","right"}
		for k,v in ipairs(keys) do
			bindKey (v,"both",onKey)
		end
		bindKey ("walk","both",
			function ()
				setControlState ("walk",true)
			end
		)
		bindKey ("sprint","both",
			function (button,press)
				if press == "down" then
					setControlState ("sprint",false)
					--setAnalogControlState ("sprint",0)
					if isControlEnabled ("sprint") then
						setControlState ("walk",false)
					end
					local cTick = getTickCount ()
					local delay = cTick - lastSpaceClick
					if delay <= 500 then
						--sprintClicks = sprintClicks+1
						sprintClicks = sprintClicks+delay
						if sprintClicks < sprintClicksLimit then
							if isControlEnabled ("sprint") then
								setControlState ("sprint",true)
								--setAnalogControlState ("sprint",sprintSpeed)
							end
						else
							sprintClicks = sprintClicksLimit
							setControlState ("sprint",false)
							--setAnalogControlState ("sprint",0)
						end
						
					end
					lastSpaceClick = getTickCount ()
				else
					if getTickCount()-lastSpaceClick > 500 then
						setControlState ("walk",true)
					else
						lastSpaceClick = getTickCount ()
					end
				end
			end
		)
		setTimer (
			function ()
				local st = false
				local keys = {"forwards","backwards","left","right"}
				for k,v in ipairs(keys) do
					if getControlState (v) then
						st = true
						break
					end
				end
				if st then
					local sprintKey = false
					for i,v in pairs(getBoundKeys ("sprint")) do
						if getKeyState (i) then
							sprintKey = true
							break
						end
					end
					local cTick = getTickCount ()
					local delay = cTick-lastSpaceClick
					if delay > 500 then
						if sprintKey == false then
							setControlState ("walk",true)
							setControlState ("sprint",false)
							--setAnalogControlState ("sprint",0)
						else
							setControlState ("sprint",false)
							if isControlEnabled ("sprint") == false then
								setControlState ("walk",true)
							end
							--setAnalogControlState ("sprint",0)
						end
					end
					
				end
			end
		,500,0)
		setTimer (
			function ()
				if sprintClicks > 0 then
					--sprintClicks = sprintClicks-1
					sprintClicks = sprintClicks-100
					if sprintClicks < 0 then
						sprintClicks = 0
					end
				end
			end
		,1000,0)
	end
)





function onRender()
	if not getPedAnimation(getLocalPlayer()) and getControlState ( "jump" ) and getControlState ( "sprint" ) and getControlState ( "forwards" ) then -- W + SPACE + SHIFT
		setPedAnimation( getLocalPlayer(), "ped", "EV_dive", 2000, false, true, false)
	end
end
--addEventHandler("onClientRender", getRootElement(), onRender)