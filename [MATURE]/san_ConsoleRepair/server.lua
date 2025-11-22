
function repararveiculo ( source )
local accName = getAccountName ( getPlayerAccount ( source ) )
	if isObjectInACLGroup("user." .. accName, aclGetGroup("Console")) then
	 if isPedInVehicle ( source ) then return end
		local x, y, z = getElementPosition(source) 
		local colcarros = createColSphere ( x, y, z, 2)
		local vehicle = getElementsWithinColShape ( colcarros, "vehicle" )
		destroyElement(colcarros)
		setPedAnimation( source, "CAR", "Fixn_Car_Loop", 4500, true, false, false, false)
		for theKey, veh in ipairs(vehicle) do
		setTimer ( function()
            fixVehicle(veh)

		end, 4500, 1 )	
        end 
	end
 end
addCommandHandler ( "reparar", repararveiculo  )

function displayVehicleLoss(loss)
	if getElementHealth(source) <= 255 then 
		setElementHealth(source, 255.5)
		setVehicleEngineState(source, false)
		setVehicleDamageProof(source, true)
	else
	if isVehicleDamageProof(source) then
		setVehicleDamageProof(source, false)
		end
	end
end
addEventHandler("onVehicleDamage", getRootElement(), displayVehicleLoss)

function displayVehicleLoss2()
	if getElementHealth(source) <= 255 then 
		setVehicleEngineState(source, false)
	else
	if isVehicleDamageProof(source) then
		setVehicleDamageProof(source, false)
		end
	end
end
addEventHandler("onVehicleEnter", getRootElement(), displayVehicleLoss2)
		
function DestroyVeiculo ()
destroyElement (veh[source])
end
addEventHandler ("onPlayerLogout", root, DestroyVeiculo)
addEventHandler ("onPlayerQuit", root, DestroyVeiculo)