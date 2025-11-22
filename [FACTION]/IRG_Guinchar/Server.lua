local my = {}

function exitCar (player)
local vehicle = getPedOccupiedVehicle (player)
	 if (vehicle) then
		if (getElementData(player, "char:dutyfaction") == 18) then
	     if (getElementModel(vehicle) == 578) then
	         local xX, yY, zZ = getElementPosition(vehicle)
		     if isElement(my[vehicle]) then
                 destroyElement(my[vehicle])
             end
		     my[vehicle] = createColSphere (xX + 2.5, yY + 7, zZ, 3)
		     attachElements (my[vehicle], vehicle, 0, -8, -0.5 )
		     removeEventHandler("onColShapeHit", my[vehicle], exitCar)
			 addEventHandler("onColShapeHit", my[vehicle], exitCar)

			 				 
			 addEventHandler( "onElementDestroy", vehicle,
			 function ()
				--setElementData(player, "char:guinchado", false)

				setElementData(vehicle, "mec:veh", nil)
				removeElementData(vehicle, "mec:veh")

				 if isElement(my[vehicle]) then 
						  destroyElement(my[vehicle])
				 end
			 end
			 )

		 end
		end
	 end
end
addEventHandler("onVehicleStartExit", getRootElement(), exitCar)

function exitCar (thePlayer)
  	 if (source == my[thePlayer]) then
	     if (getElementData(thePlayer, "char:dutyfaction") == 18) then
             outputChatBox("#FFA000[GUINCHO] #FFFFFFUtilize #FFA000/guinchar #FFFFFFpara guinchar o veiculo.", thePlayer, 255,255,255, true)
		 end
	 end
end

local allowed = { { 48, 57 }, { 65, 90 }, { 97, 122 } } 

function generateString ( len )
    if tonumber ( len ) then
        math.randomseed ( getTickCount () )
        local str = ""
        for i = 1, len do
            local charlist = allowed[math.random ( 1, 3 )]
            str = str .. string.char ( math.random ( charlist[1], charlist[2] ) )
        end
        return str
    end
    return false
    
end

function warpVehicle (player)
	if (getElementData(player, "char:dutyfaction") == 18) then
		if (getElementData(player, "char:guinchado") == true) then return end

local vehicle = getPedOccupiedVehicle (player)
	 local vehicleP = generateString (20)
	 for index, isEvent in pairs(getElementsWithinColShape(my[vehicle], "vehicle")) do

		outputChatBox("#FFA000[GUINCHO] #FFFFFFVeiculo guinchado!", player, 255,255,255, true)
		setElementData(player, "char:guinchado", true)
		setElementData(player, "mec:reboque", vehicleP)


		--if getPedOccupiedVehicle( isEvent ) then outputChatBox("#FFA000[GUINCHO] #FFFFFFVocê só pode usar o #FFA000/guinchar #FFFFFFquando não tem ninguem no veiculo!.", player, 255,255,255, true) return end
		if (getElementModel(isEvent) == 578) then 
		outputChatBox("#FFA000[GUINCHO] #FFFFFFVocê não pode usar o #FFA000/guinchar #FFFFFFneste tipo de veiculo!.", player, 255,255,255, true) 
		return 
		end
		
		 attachElements (isEvent, vehicle, 0, -2, 1.0)
		 setElementData(isEvent, "mec:veh", vehicleP)
		end
	 end
end
addCommandHandler("guinchar", warpVehicle)


addCommandHandler("dguinchar",
function(player)
local vehicle2 = getPedOccupiedVehicle (player)
     if (getElementData(player, "char:dutyfaction") == 18) then
	 local vehP = getElementData(player, "mec:reboque")
	     if (vehP) then
		     for _, vehicle in ipairs(getElementsByType("vehicle")) do
			     if (getElementData(vehicle, "mec:veh") == vehP) then
				 
					attachElements (vehicle, my[vehicle2], 0, -8, -0.5 )
					detachElements ( vehicle )
					--detachElements ( my[vehicle2] )
					local xX, yY, zZ = getElementPosition(my[vehicle2])
					setElementPosition(vehicle, xX, yY, zZ)
					
					--if isElement(my[vehicle2]) then 
					--destroyElement(my[vehicle2])
					--end
					setElementData(player, "char:guinchado", false)

					setElementData(vehicle, "mec:veh", nil)
					removeElementData(vehicle, "mec:veh")
					setElementData(player, "mec:reboque", nil)
					removeElementData(player, "mec:reboque")
					--[[
					setTimer(function(vehicle)
					local xX, yY, zZ = getElementPosition(my)
					setElementPosition(vehicle, xX, yY, zZ)
					end,70,1, vehicle)]]--
				 end
			 end
		 end
	 end
end)


addEventHandler("onPlayerQuit", root,
function ()
     if (getElementData(source, "char:dutyfaction") == 18) then
	 local vehP = getElementData(source, "mec:reboque")
	     if (vehP) then
		     for _, vehicle in ipairs(getElementsByType("vehicle")) do
			     if (getElementData(vehicle, "mec:veh") == vehP) then
				     --outputChatBox("Mec Viado Saiu", root)
				     detachElements ( vehicle )
				 end
			 end
		 end
	 end
end)


