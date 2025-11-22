--[[
local factor = 1.5

function relateVelocity(speed)
	return factor * speed
end

function getVehicleVelocity(vehicle)
	speedx, speedy, speedz = getElementVelocity (vehicle)
	return relateVelocity((speedx^2 + speedy^2 + speedz^2)^(0.5)*100)
end

function getVehiclesOwnedByCharacter(thePlayer)
	local dbid = tonumber(getElementData(thePlayer, "dbid"))
	
	local carids = { }
	local numcars = 0
	local indexcars = 1
	for key, value in ipairs(getElementsByType('vehicle')) do
		local owner = tonumber(getElementData(value, "owner"))

		if (owner) and (owner==dbid) then
			local id = getElementData(value, "dbid")
			carids[numcars+1] = id
			numcars = numcars + 1
		end
	end
	return numcars, carids
end

function canPlayerBuyVehicle(thePlayer)
	if (isElement(thePlayer)) then
		if getElementData(thePlayer, "loggedin") == 1 then
			local maxvehicles = getElementData(thePlayer, "maxvehicles") or 0
			local novehicles, veharray = getVehiclesOwnedByCharacter(thePlayer)
			if (novehicles < maxvehicles) then
				return true
			end
			return false, "Você tem muitos veículos!" 
			
		end
		return false, "Você não está logado!"
	end
	return false, "Este item não foi encontrado!"
end
]]--