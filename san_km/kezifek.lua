--[[
function reczny1 ( player )
local vehicle = getPedOccupiedVehicle ( player )
if vehicle then
if isElementFrozen ( vehicle ) then
setElementFrozen ( vehicle, false )
hand.state = false
outputChatBox ( "Você soltou o freio de mão!", player, 255, 255, 0 )
else
setElementFrozen ( vehicle, true )
hand.state = true
outputChatBox ( "Você pegou o freio de mão!", player, 255, 255, 0 )
end
else
--outputChatBox ( "", player, 255, 0, 0 )
end
end
addCommandHandler ( "fm", reczny1 )]]--
