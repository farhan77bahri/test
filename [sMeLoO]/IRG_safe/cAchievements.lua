safe = {
 {1911.8590087891, -1764.1839599609, 13.555365562439, 47.999389648438, 24.000072860718},
}

for i,v in pairs(safe) do
     zone = createColCuboid(v[1], v[2], v[3], v[4], v[5], v[6])
     function enterInfo (theElement, matchingDimension)
	     if ( theElement == localPlayer ) then
			 exports.san_notifactions:createDebugNotification(1,"Você acaba de entrar em um local safe.")
		 end
     end	 
	 addEventHandler("onClientColShapeHit", zone, enterInfo)
end