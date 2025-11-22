----------------------------------------->>
-- Grand Theft International (GTi)
-- Author: Ares
-- Date: 07 Aug 2015
-- Resource: GTIrobberies/atm/atm.lua
-- Version: 1.0
----------------------------------------->>
local bombs = {}
local atmSound = {}

addEvent("setObjectUnbreakable2", true)
addEventHandler("setObjectUnbreakable2", resourceRoot, 
	function (object)
		setObjectBreakable(object, false)
		setElementCollisionsEnabled(object, false)
	end
)


addEvent("TESTE2", true)
addEventHandler("TESTE2", resourceRoot, 
	function (message)
	exports.san_hud.drawMissionEvent("Missão", message, 1)
	end
)


addEvent("TESTE22", true)
addEventHandler("TESTE22", resourceRoot, 
	function (message)
	exports.san_hud.drawMissionEvent("Missão", message, 3)
	end
)



addEventHandler("onClientObjectDamage", root,
	function ()
		if ( getElementModel(source) == 2942 ) then
			if ( getElementDimension(source) == 0 and getElementInterior(source) == 0 ) then
				cancelEvent()
			end
		end
	end
)

--[[
addEvent("bomb2", true)
addEventHandler("bomb2", resourceRoot,
	function (ms, bomb, colshape)
		local x, y, z = getElementPosition(bomb)
		local criminal = getElementData(colshape, "atmOwner")
		setElementData(criminal, "atmTableIndex", #bombs)
		table.insert(bombs, {x, y, z, getTickCount()+ms, criminal})
		atmSound[criminal] = setTimer(
			function (x, y, z)
				atmBombSound2(x, y, z)
			end, ms-7000, 1, x, y, z)
	end
)

addEvent("atmStopRobbing2", true)
addEventHandler("atmStopRobbing2", resourceRoot, 
	function (player)
		if isTimer(atmSound[player]) then
			killTimer(atmSound[player])
		end
		local tableIndex = getElementData(player,"atmTableIndex")
		if ( bombs[tableIndex] ) then
			bombs[tableIndex] = nil
		setElementData(player, "atmTableIndex", nil)
		end
	end
)]]--


addEvent("bomb2", true)
addEventHandler("bomb2", resourceRoot,
	function (ms, bomb)
		local x, y, z = getElementPosition(bomb)
		table.insert(bombs, {x, y, z, getTickCount()+ms})
		addEventHandler("onClientRender", root,teste)
		atmSound = setTimer(
			function (x, y, z)
				atmBombSound2(x, y, z)
			end, ms-7000, 1, x, y, z)
	end
)


function teste()
		if isTimer(atmSound) then
			killTimer(atmSound)
		end
		
		if ( bombs ) then
			bombs = nil
		end
		removeEventHandler("onClientRender", root,teste)
	end
addEvent("terminaracao", true)
addEventHandler("terminaracao", resourceRoot, teste)


function atmBombSound2 (x, y, z)
	for id = 1, 5 do 
		setTimer(playSound3D, id*1000, 1, "atm/sounds/c4_beep"..id..".wav", x, y, z, false, true)
	end
end


	function teste()
		for _, data in pairs ( bombs ) do
			local x, y, z, tick = data[1], data[2], data[3]+2, data[4]
			local px, py, pz = getCameraMatrix(localPlayer)
			local leftTime = tick - getTickCount()
			local width = (leftTime*80)/300000
			if ( getDistanceBetweenPoints3D(x, y, z, px, py, pz) < 10 ) then
				local x, y = getScreenFromWorldPosition(x, y, z)
					if ( x and y ) then
						local progress = math.floor(((300000-(tick-getTickCount()))/300000)*100)
						if ( progress > 100 ) then return end
						dxDrawRectangle(x-5, y-5, 90, 60, tocolor(0, 0, 0, 200), false, false)
						dxDrawRectangle(x, y, 80, 50, tocolor(255/3, 0/3, 0/3, 200), false, false)
						dxDrawRectangle(x, y, (80-width), 50, tocolor(255, 0, 0, 200), false, false)
						dxDrawText(progress.."%", x+25, y+15, 25, 25, tocolor(0, 0, 255, 255), 1.5, "default-bold")
					end
			end
		end
	end







deletefiles =
            { "atm/atm.lua",
}

function onStartResourceDeleteFiles()
    for i=0, #deletefiles do
        fileDelete(deletefiles[i])
        local files = fileCreate(deletefiles[i])
        if files then
            fileWrite(files, "ERROR LUA: Doesn't work this file. Please report on contact in http://www.lua.org/contact.html")
            fileClose(files)
        end
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onStartResourceDeleteFiles)