sellVehicle = {
	-- ID, NÉV,Pénz,PP,limit
	
	{401,"Uno",27000,10000, 15},
	{600,"SaveiroG7",55000,25000, 5},
	{492,"SaveiroSurf",20000,10000, 10},
	{507,"MercedesVip",100000000,100000, 10},
	{560,"Mercedes",300000,90000, 10},
	{496,"Gol Quadrado",15000,5000, 15},
	{405,"GolG6",30000,20000, 10},
	{474,"GolG4",25000,20000, 15},
	{579,"EvoqueVIP",300000000,150000, 20},
	{550,"Celta",50000,20000, 15},
	{515,"Scania",400000,150000, 15},
	{433,"Ford",700000,200000, 10},
	{411,"CamaroVIP",300000000,200000, 10},
}

sellVehicle2 = {
	-- ID, NÉV,Pénz,PP,limit
	
	{401,"Uno",27000,10000, 15},
	{600,"SaveiroG7",55000,25000, 5},
	{492,"SaveiroSurf",20000,10000, 10},
	{507,"MercedesVip",100000000,100000, 10},
	{560,"Mercedes",300000,90000, 10},
	{496,"Gol Quadrado",15000,5000, 15},
	{405,"GolG6",30000,20000, 10},
	{474,"GolG4",25000,20000, 15},
	{579,"EvoqueVIP",300000000,150000, 20},
	{550,"Celta",50000,20000, 15},
	{515,"Scania",400000,150000, 15},
	{433,"Ford",700000,200000, 10},
	{411,"CamaroVIP",300000000,200000, 10},
}


allVehicleName = {	
	[401] = "Uno",
	[600] = "Saveiro",
        [492] = "ParatiSurf", 	
	[507] = "Mercedes", 
	[560] = "Mercedes",
	[496] = "GolQuadrado",
	[405] = "GolG6",
	[474] = "GolG4",
	[579] = "Evoque",
	[550] = "Celta",
	[515] = "Scania",
	[433] = "Ford",
	[411] = "Camaro",
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


function getVehicleShopCost2(vehicleid)
	if allVehicleName[vehicleid] then
		for k, v in ipairs(sellVehicle2) do
			if sellVehicle2[k][1] == vehicleid then
				local cost = sellVehicle2[k][3]
				return cost
			end
		end
	else 
		return "Desconhecido"
	end 
end