Gasolina = {
 {1931.9256591797, -1770.470458984, 12.609},
 {1016.428, -931.688, 41.18},
 {1597.671, 2218.427, 10.069},
 {646.82, 1708.041, 5.992},
 {-1688.736, 417.723, 6.18},
 {1492.517, -1670.941, 12.355},
}

for i,v in pairs(Gasolina) do
     mark = createMarker (v[1], v[2], v[3], "cylinder", 1.5, getColorFromString("#FFA00001"))
     icon = createPickup(v[1], v[2], v[3] + 1.5, 3, 1650, 0.5)
     function enterInfo (thePlayer)
         exports.san_hud:dm("Baraye Kharid /galon Bezanid.",thePlayer, 255, 255, 255)
	     exports.san_hud:dm("Gheymat Galon, R$800.00",thePlayer, 0, 255, 0)
		 setElementData(thePlayer, "Galao", true)
     end	 
	 addEventHandler("onMarkerHit", mark, enterInfo)
     function exitInfo (thePlayer)
		 setElementData(thePlayer, "Galao", false)
     end	 
	 addEventHandler("onMarkerLeave", mark, exitInfo)

end

function buyObject (thePlayer, commandName, mode)
     local theVehicle = getPedOccupiedVehicle ( thePlayer )
	 if theVehicle then exports.san_hud:dm("Saia do veiculo para comprar um galão de combustivel",thePlayer, 255, 0, 0) return end
	 if not (getElementData(thePlayer, "char:money") >= 800) then
    -- exports.san_hud:dm("Dinheiro insulficiente.",thePlayer, 255, 255, 255)
	 else
         if getElementData(thePlayer, "Galao") then
		     if exports['san_items']:hasItemS(thePlayer, 26) then
	 		    exports.san_hud:dm("Shoma 1 Galon Darid.",thePlayer, 255, 255, 255)
			 else
			     setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - 800)
                 exports['san_items']:giveItem(thePlayer, 26, 1, 1, 0, false)
		   	     exports.san_hud:dm("Galão adquirido com sucesso.",thePlayer, 255, 255, 255)
			 end
		 end
	 end
end
addCommandHandler("galon", buyObject)

function clicktheCar (thePlayer, car)
local theVehicle = getPedOccupiedVehicle ( thePlayer )
     if theVehicle then return end
     if car then
	     if not exports['san_items']:hasItemS(thePlayer, 26) then
		     return
		 end
			 if getElementData(car, "veh:fuel") <= 50 then
		         triggerEvent('sanMTA->#takePlayerItemToID', thePlayer, thePlayer, 26, false)
			     exports.san_hud:dm("Bak Mashin, + 50% Por Shod",thePlayer, 0, 255, 0)
			     setElementData(car, "veh:fuel", getElementData(car, "veh:fuel") + 50)
				 exports['san_items']:takeItemS(thePlayer, 26) 
				-- exports.san_chat:sendLocalMeAction(thePlayer, "Está abastecendo o veiculo ("..getVehicleName(car)..") com um galão de gasolina.")
				 else
				 exports.san_hud:dm("Bak Mashin Pore!!.",thePlayer, 255, 255, 255)
			 end
	 end
end
addEvent ( "san:Galao", true )
addEventHandler ( "san:Galao", root, clicktheCar)