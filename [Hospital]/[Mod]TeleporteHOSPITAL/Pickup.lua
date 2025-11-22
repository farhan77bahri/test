----------
--==================================================--
-------------------------CASA-------------------------
--==================================================--

MarkerCAS = createMarker ( 323.202, -1502.666, 36.033, "arrow", 1.5, 255, 255, 255, 255 )
MarkerSAID = createMarker ( 323.111, -1502.641, 71.469, "arrow", 1.5, 255, 255, 255, 255 ) 
setElementInterior(MarkerSAID, 0)

function IntSTAFF(thePlayer)
if source == MarkerCAS then
fadeCamera(thePlayer, false)
setTimer( fadeCamera, 1000, 1, thePlayer, true)
setTimer(setElementInterior, 1000, 1, thePlayer, 0)
setTimer(setElementPosition, 1000, 1, thePlayer, 321.363, -1505.004, 71.469, true)
setTimer(setPedRotation, 1000, 1, thePlayer, 0)
end
end
addEventHandler("onMarkerHit", getRootElement(), IntSTAFF)

function SaidSTAFF(thePlayer)
if source == MarkerSAID then
fadeCamera(thePlayer, false)
setTimer( fadeCamera, 1000, 1, thePlayer, true)
setTimer(setElementInterior, 1000, 1, thePlayer, 0)
setTimer(setElementPosition, 1000, 1, thePlayer, 321.363, -1505.004, 36.039, true)
setTimer(setPedRotation, 1000, 1, thePlayer, 135)
end
end
addEventHandler("onMarkerHit", getRootElement(), SaidSTAFF)