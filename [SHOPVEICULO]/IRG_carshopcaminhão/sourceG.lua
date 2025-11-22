sellVehicle = {
	-- ID, NÉV,Pénz,PP,limit
	
	{508,"Hyundai 55Kg",100000,80000, 20},
	{515,"Scania 80Kg",400000,150000, 50},
	{433,"Ford 100Kg",700000,200000, 50},
}

allVehicleName = {	
	[508] = "Hyundai",
	[515] = "Scania",
	[433] = "Ford"
}







function getVehicleRealName(vehicleid)
	if allVehicleName[vehicleid] then
		return allVehicleName[vehicleid]
	else 
		return "Desconhecido"
	end 
end

function getVehicleShopCost(vehicleid)
	if allVehicleName[vehicleid] then
		for k, v in ipairs(sellVehicle) do
			if sellVehicle[k][1] == vehicleid then
				local cost = sellVehicle[k][3]
				return cost
			end
		end
	else 
		return "Desconhecido"
	end 
end