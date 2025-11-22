

local alpha = 0
local r, g, b = 255, 0, 204
local size = 0
local typem = "cylinder" 
local posx, posy, posz = 2681.224609375,-1953.1666259766,13.60781288147

local entrada2 = createMarker (posx, posy, posz, typem, size, r, g, b, alpha)

addEventHandler( "onClientRender", root, function (  )
       local x, y, z = getElementPosition( entrada2 )
       local Mx, My, Mz = getCameraMatrix(   )
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 10 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +1, 0.255 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("Trabalho de eletricista", WorldPositionX + 1, WorldPositionY + 1, WorldPositionX + 1, WorldPositionY + 1, tocolor(255, 255, 255, 255), 0.5, "bankgothic", "center", "center", false, false, false, false, false)
			    
            end
      end
end 
)




function choque1 ()
choque1 = playSound3D("choque.mp3", 267.5, -1432.6999511719, 26, 274.47143554688, true)
setSoundVolume(choque1,5)
setSoundMaxDistance(choque1, 20)
setTimer ( function()
stopSound (choque1)
	end, 20000, 1 )
end
addEvent("som", true)
addEventHandler("som", getRootElement(), choque1)


function choque2 ()
choque2 = playSound3D("choque.mp3", 1289.71936, -1414.51587, 27.01842, true)
setSoundVolume(choque2,5)
setSoundMaxDistance(choque2, 20)
setTimer ( function()
stopSound (choque2)
	end, 20000, 1 )
end
addEvent("som", true)
addEventHandler("som", getRootElement(), choque2)



function choque3 ()
choque3 = playSound3D("choque.mp3", 2025.67297, -1743.03003, 22.39486, true)
setSoundVolume(choque3,5)
setSoundMaxDistance(choque3, 20)
setTimer ( function()
stopSound (choque3)
	end, 20000, 1 )
end
addEvent("som", true)
addEventHandler("som", getRootElement(), choque3)



function choque4 ()
choque4 = playSound3D("choque.mp3", 1844.47852, -1922.40723, 21.50410, true)
setSoundVolume(choque4,5)
setSoundMaxDistance(choque4, 20)
setTimer ( function()
stopSound (choque4)
	end, 20000, 1 )
end
addEvent("som", true)
addEventHandler("som", getRootElement(), choque4)


function choque5 ()
choque5 = playSound3D("choque.mp3", 2281.56860, -2230.49512, 22.33304, true)
setSoundVolume(choque5,5)
setSoundMaxDistance(choque5, 20)
setTimer ( function()
stopSound (choque5)
	end, 20000, 1 )
end
addEvent("som", true)
addEventHandler("som", getRootElement(), choque5)










