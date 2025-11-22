exitCar = {}
vehicleCar = {}

local detran = createBlip(776.1337890625, -1414.7060546875, 13.533306121826, 24) --Kórház
setElementData(detran ,"blip >> name", "Licença")
setBlipVisibleDistance(detrab, 100)

function createLicenseVehicle(player)
	x, y, z = 776.1337890625, -1414.7060546875, 13.533306121826
	vehicleCar[player] = createVehicle(442, x, y, z,0,0,90)
	exitCar[player] = true
	setElementData(vehicleCar[player], "carDetran", true)
	setElementData(vehicleCar[player], "veh:fuel", 100)
	addEventHandler ("onVehicleExit", vehicleCar[player], removeHelmetOnExit )
    addEventHandler ("onVehicleEnter", vehicleCar[player], enterCar)
	setElementHealth(vehicleCar[player], 1000)
	setVehicleColor (vehicleCar[player], 255, 255, 255, 255, 255, 255)
	setVehicleHeadLightColor ( vehicleCar[player], 255, 255, 255 )
	
	setElementData(vehicleCar[player], "enginebroke", 0)
	setElementData(vehicleCar[player], "dbid", -1)
	setElementData(vehicleCar[player], "owner", -1)
	setElementData(vehicleCar[player], "fuel", 100)
	setElementData(vehicleCar[player], "engine", 0)
	setElementData(vehicleCar[player], "lights", 0)
	setElementData(vehicleCar[player], "faction", -1)
	setElementInterior(vehicleCar[player], 0)
	setElementDimension(vehicleCar[player], 0)
	setElementInterior(vehicleCar[player], 0)
	setElementInterior(player, 0)
	setElementData(vehicleCar[player], "interior", 0)	
	setElementDimension(vehicleCar[player], 0)
	setElementDimension(player, 0)
	setElementData(vehicleCar[player], "dimension", 0)
	setVehicleEngineState(vehicleCar[player], false)
	setVehiclePlateText(vehicleCar[player], "TanulÃ³")
	setVehicleRespawnPosition(vehicleCar[player], x,y,z,0,0,90)
	
	warpPedIntoVehicle(player, vehicleCar[player])
end 
addEvent("createLicenseVehicle", true)
addEventHandler("createLicenseVehicle", getRootElement(), createLicenseVehicle)

addEvent("finishLicense", true)
addEventHandler("finishLicense", getRootElement(), 
	function(player)
		if player then
			 destroyElement(getPedOccupiedVehicle(player))
			 exitCar[player] = nil
			 vehicleCar[player] = nil
		end 
	end
)

function notifyAboutExplosion()
     if (getElementData(source, "carDetran")) then
	     destroyElement(source)
		 removeElementData(source, "carDetran")
	 end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion)

function removeHelmetOnExit ( thePlayer, seat, jacked )
    if (exitCar[thePlayer]) then  
         outputChatBox("#FFA000*san #FFFFFFVocê tem #FFA00010 Seundos #FFFFFFpara entrar no veiculo de auto escola novamente", thePlayer, 255,255,255, true)
		 setTimer(deletVehicle, 10000, 1, thePlayer)
		 exitCar[thePlayer] = false
    end
end

function enterCar ( thePlayer, seat, jacked )
    if (exitCar[thePlayer] == false) then  
		 exitCar[thePlayer] = true
    end
end

function deletVehicle (thePlayer)
     if not (exitCar[thePlayer]) then
		 if isElement(vehicleCar[thePlayer]) then
		     destroyElement(vehicleCar[thePlayer])
			 exitCar[thePlayer] = nil
			 vehicleCar[thePlayer] = nil
		 end
	 end
end

addEventHandler( "onPlayerWasted", getRootElement( ),
	function()
		 if (exitCar[source]) then
			 exitCar[source] = nil
			 vehicleCar[source] = nil
		     if isElement(vehicleCar[thePlayer]) then
		         destroyElement(vehicleCar[thePlayer])
		     end
		 end 
	end
)