


mPlayer = nil
function player_Wasted (mPlayer, command)
mPlayer = source
setTimer(setElementDimension, 4000, 1, source, 0)
setTimer(setElementInterior, 4000, 1, source, 0)
--setTimer(setElementPosition, 4000, 1, source, 1166.06, -1360.764, 14.5)
--setTimer(setPedAnimation, 4000, 1,source, "CRACK", "crckdeth2")
setTimer(triggerClientEvent, 4000, 1, source, "MorreuDX", root)
toggleAllControls ( mPlayer, false )  
random = math.random(1,4)
if random == 1 then	
	setTimer(setElementPosition, 4000, 1, source, 1166.06, -1360.764, 14.5)
	setTimer(setPedAnimation, 4000, 1,source, "CRACK", "crckdeth2")
elseif random == 2 then
	setTimer(setElementPosition, 4000, 1, source, 1165.992, -1359.818, 14.5)
	setTimer(setPedAnimation, 4000, 1,source, "CRACK", "crckdeth2")
elseif random == 3 then
	setTimer(setElementPosition, 4000, 1, source, 1166.145, -1362.581, 14.5)
	setTimer(setPedAnimation, 4000, 1,source, "CRACK", "crckdeth2")
elseif random == 4 then
	setTimer(setElementPosition, 4000, 1, source, 1165.986, -1363.986, 14.5)
	setTimer(setPedAnimation, 4000, 1,source, "CRACK", "crckdeth2")
end 
setTimer(function()
setPedAnimation (mPlayer)
setElementInterior (mPlayer, 0)
setElementDimension (mPlayer, 0)
random = math.random(6,10)
if random == 6 then	
	setElementPosition (mPlayer, 1168.621, -1360.899, 13.47)
elseif random == 7 then
	setElementPosition(mPlayer, 1168.366, -1362.618, 13.47)
elseif random == 8 then
	setElementPosition(mPlayer, 1168.59, -1359.574, 13.47)
elseif random == 9 then
	setElementPosition(mPlayer, 1168.529, -1365.722, 13.47)
elseif random == 10 then
	setElementPosition(mPlayer, 1168.885, -1358.055, 13.47)
end
triggerClientEvent( mPlayer, "CuradoDX", root)
--exports.Scripts_Dxmessages:outputDx(mPlayer, "Você Foi Socorrido Com Sucesso!", "success")
toggleAllControls ( mPlayer, true )   	
mPlayer = nil
end,34000,1)

end
addEventHandler ( "CuradoDX", getRootElement(), player_Wasted )