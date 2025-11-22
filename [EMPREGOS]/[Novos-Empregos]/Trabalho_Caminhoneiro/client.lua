local alpha = 0
local r, g, b = 255, 0, 204
local size = 0
local typem = "cylinder" 
local posx, posy, posz = 2594.9274902344, 2790.7163085938, 10.8203125

local blip = createBlip (2594.9274902344, 2790.7163085938, 10.8203125, 42)
setElementData(blip,"blip >> name", "Caminhoneiro")

local entrada2 = createMarker (posx, posy, posz, typem, size, r, g, b, alpha)

addEventHandler( "onClientRender", root, function (  )
       local x, y, z = getElementPosition( entrada2 )
       local Mx, My, Mz = getCameraMatrix(entrada2)
        if ( getDistanceBetweenPoints3D( x, y, z, Mx, My, Mz ) <= 10 ) then
           local WorldPositionX, WorldPositionY = getScreenFromWorldPosition( x, y, z +1, 0.255 )
            if ( WorldPositionX and WorldPositionY ) then
			    dxDrawText("Trabalho Caminhoneiro", WorldPositionX + 1, WorldPositionY + 1, WorldPositionX + 1, WorldPositionY + 1, tocolor(255, 255, 255, 255), 0.5, "bankgothic", "center", "center", false, false, false, false, false)
			    
            end
      end
end 
)























