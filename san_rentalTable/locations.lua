----------------------------------------->>
-- GTI: Grand Theft International
-- Date: 17 Mar 2014
-- Resource: GTIrentalTable/locations.slua
-- Type: Server Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

rent_table = {

--[[
{
	name="Location\nPurpose\nRental Station",	pos={x, y, z},	colorText={r, g, b},
	restrictions={"Job", "Team"},
		-- Vehicles
	vehicles={
		{ID, "spawn1"						}, -- Vehicle Name
		{ID, "spawn2", {"Job_Name;lvl"},	}, -- Vehicle Name
	},
	spawn_points={
		["spawn1"] = {
			{x, y, z, rot},
			{x, y, z, rot},
		},
		["spawn2"] = {
			{x, y, z, rot},
		},
	},
		-- Weapons
	weapons={
		{weaponID, ammo},	-- Weapon Name (X Ammo)
	},
	cost=true, -- Should rentals cost money? Do not add for job vehicles.
},

-- {"Job_Name;lvl"}, => Individual Vehicle Restrictions (By Level)
--]]


-- Bus Driver
-------------->>

{
	name="Motorista de ônbus\nJobs\nVehicle",	pos={1234.4266357422,-1823.6735839844,12.591278076172},	colorText={255,200,0},
	restrictions={"Motorista"},
	vehicles={
		{431, "ground"},
        --{437, "ground", {"Bus Driver;2"}},
	},
	spawn_points={
		["ground"] = {
		
			{1262.1826171875, -1799.771484375, 13.517366409302, 0},
			{1268.083984375, -1799.7421875, 13.506160736084, 0},
			{1274.4072265625, -1799.689453125, 13.517143249512, 0},
		},
	},
},


-- Firefighter
--------------->>
--[[
{
	name="Market\nFirefighter\nRental Station",	pos={1274.221, -1245.268, 12.558},	colorText={30,255,125},
	restrictions={"Firefighter"},
		-- Vehicles
	vehicles={
		{407, "ground"						}, -- Fire Truck
		{544, "ground",	{"Firefighter;2"},	}, -- Fire Truck (Ladder)
		{563, "air", 	{"Firefighter;3"},  }, -- Fire Truck (Raindance)
	},
	spawn_points={
		["ground"] = {
			{1268.845, -1249.287, 12.558, 180},
			{1260.475, -1249.553, 12.558, 180},
		},
		["air"] = {
			{1234.738, -1220.159, 25.0, 90},
		},
	},
		-- Weapons
	weapons={
		{42, 5000},	-- Fire Extinguisher (5000 Ammo)
	},
},]]--

{
	name="Job\nBombeiro",	pos={1741.9100341797, -1455.4821777344, 12.520735740662},	colorText={30,255,125},
	restrictions={"Bombeiro"},
		-- Vehicles
	vehicles={
		{407, "ground"						}, -- Fire Truck
	},
	spawn_points={
		["ground"] = {
			{1795.2498779297,-1438.4448242188,12.83083152771, 148.28393554688},
		},
	},
},




-- Mechanic
------------>>

{
	name="Mechanic\nJob\nVehicle",	pos={382.21963500977, -1857.7967529297, 6.8656253814697},	colorText={255,200,0},
	restrictions={"Mechanic"},
	vehicles={
		{525, "ground"},
	},
	spawn_points={
		["ground"] = {
			{383.78515625, -1843.4252929688, 7.8553657531738, 266.60699462891},
		},
	},
},




{
	name="Mechanic\nJob\nVehicle",	pos={396.59176635742, -1870.7172851562, 6.91147804260254697},	colorText={255,200,0},
	restrictions={"Mechanic"},
	vehicles={
		{525, "ground"},
	},
	spawn_points={
		["ground"] = {
			{394.33044433594, -1876.1865234375, 7.911478042602, 180.60699462891},
		},
	},
},

-- Mail Carrier
---------------->>

{
	name="Sedex\nJob\nVehicle",	pos={1665.20703125, -1426.4541015625, 12.679351806641},	colorText={255,200,0},
	restrictions={"Sedex"},
	vehicles={
		--{440, "default"}, -- Boxville
		
		
		{413, "default"}, -- Pony
	},
	spawn_points={
		["default"] = {
			{1651.953125, -1426.431640625, 13.593105316162, 45},
			{1656.7294921875, -1427.212890625, 13.64079284668, 45},
			--{2275.926, -2405.522, 12.547, 45},
		},
	},
},


{
	name="Departament\nPolice\nVehicles",	pos={1901.1829833984, -1733.5411376953, 12.60000038147},	colorText={255,200,0},
	restrictions={"Job", "LSPD"},
	vehicles={
		{597, "default"}, -- Pony
		--{523, "default"}, -- Pony
		{451, "default"}, 
		{490, "default"},
		{596, "default"},
	},
	spawn_points={
		["default"] = {
			{1897.8193359375, -1712.3872070312, 13.60000038147, 90},
		},
	},
		--[[weapons={
		{3, 1},	-- bastao (1 Ammo)
		{23, 999},	-- bastao (1 Ammo)
		{31, 199},	-- m4 (1 Ammo)
	},]]
},



{
	name="Departament\nJustice\nVehicles",	pos={1628.4547119141, -1364.3361816406, 17.590625762939-1},	colorText={255,200,0},
	restrictions={"Job", "Justice"},
	vehicles={
		{597, "default"}, -- Pony
		--{523, "default"}, -- Pony
		{451, "default"}, 
		{490, "default"},
		{596, "default"},
	},
	spawn_points={
		["default"] = {
			{1633.5803222656, -1357.2458496094, 17.590625762939, 0},
		},
	},
		--[[weapons={
		{3, 1},	-- bastao (1 Ammo)
		{23, 999},	-- bastao (1 Ammo)
		{31, 199},	-- m4 (1 Ammo)
	},]]
},



{
	name="Departament\nMedic\nVehicles",	pos={281.76354980469, -1531.4190673828, 23.693752},	colorText={255,200,0},
	restrictions={"Job", "Medic"},
	vehicles={
		{416, "default"}, -- Pony
		--{523, "default"}, -- Pony
	--	{451, "default"}, 
	--	{490, "default"},
	--	{596, "default"},
	},
	spawn_points={
		["default"] = {
			{295.1965637207, -1540.7028808594, 24.5937,  55.541},
		},
	},
		--[[weapons={
		{3, 1},	-- bastao (1 Ammo)
		{23, 999},	-- bastao (1 Ammo)
		{31, 199},	-- m4 (1 Ammo)
	},]]
},


{
	name="Departament\nMAFIA\nVehicles",	pos={ 1245.8172607422, -2009.6722412109, 58.82524490356452},	colorText={255,200,0},
	restrictions={"Job", "MAFIA"},
	vehicles={
		{410, "default"}, -- Pony
		--{523, "default"}, -- Pony
	--	{451, "default"}, 
	--	{490, "default"},
	--	{596, "default"},
	},
	spawn_points={
		["default"] = {
			{ 1246.3621826172, -2019.6591796875, 59.8155174257,  270.441},
		},
	},
		--[[weapons={
		{3, 1},	-- bastao (1 Ammo)
		{23, 999},	-- bastao (1 Ammo)
		{31, 199},	-- m4 (1 Ammo)
	},]]
},









-- Pilot
--------->>

--[[
{
	name="Los Santos Int'l\nPilot\nRental Station",	pos={1713.611, -2536.768, 12.569},	colorText={255,200,0},
	restrictions={"Pilot"},
		-- Vehicles
	vehicles={
		{593, "small", nil, 		}, 	-- Dodo
		{511, "small",   },	-- Beagle
		{513, "small",   },	-- Stuntplane

		{519, "small",   },	-- Shamal
		{553, "large",   },	-- Nevada

		{592, "large",   },	-- Andromada
		{577, "large",   },	-- AT-400

		{417, "small", {"Pilot;4"}}, 	-- Leviathan
		{487, "small", {"Pilot;4"}}, 	-- Maverick
		{563, "small", {"Pilot;4"}}, 	-- Raindance
		{469, "small", {"Pilot;4"}}, 	-- Sparrow
	},
	spawn_points={
		["small"] = {
			{1991.244, -2251.001, 13.500, 90},
			{1991.244, -2315.450, 13.500, 90},
			{1991.244, -2382.288, 13.500, 90},
			{1894.990, -2625.977, 13.500, 0},
			{1845.447, -2625.977, 13.500, 0},
			{1792.539, -2625.977, 13.500, 0},
			{1749.855, -2625.977, 13.500, 0},
			{1709.420, -2625.977, 13.500, 0},
			{1641.253, -2414.216, 13.500, 180},
			{1721.938, -2415.935, 13.500, 180},
		},
		["large"] = {
			{1443.949, -2593.021, 13.500, 270},
			{1570.464, -2633.182, 13.500, 310},
		},
	},
		-- Weapons
	weapons={
		{46, 1},	-- Parachute (1 Ammo)
	},
},
{
	name="Easter Bay Airport\nPilot\nRental Station",	pos={-1247.505, 14.553, 13.148},	colorText={255,200,0},
	restrictions={"Pilot"},
		-- Vehicles
	vehicles={
		{593, "small", nil, 		}, 	-- Dodo
		{511, "small", }, 	-- Beagle
		{513, "small", }, 	-- Stuntplane

		{519, "small", }, 	-- Shamal
		{553, "large", }, 	-- Nevada

		{592, "large", }, 	-- Andromada
		{577, "large", }, 	-- AT-400

		{417, "small", {"Pilot;4"}}, 	-- Leviathan
		{487, "small", {"Pilot;4"}}, 	-- Maverick
		{563, "small", {"Pilot;4"}}, 	-- Raindance
		{469, "small", {"Pilot;4"}}, 	-- Sparrow
	},
	spawn_points={
		["small"] = {
			{-1244.113, -94.158, 13.181, 135},
			{-1204.776, -143.771, 13.193, 135},
			{-1271.763, -625.632, 13.191, 0},
			{-1334.110, -623.596, 13.163, 0},
			{-1397.394, -623.561, 13.192, 0},
			{-1460.110, -624.472, 13.174, 0},
		},
		["large"]  = {
			{-1558.857, -605.308, 14.148, 281.213},
			{-1694.237, -304.506, 14.148, 355.473},
			{-1113.830, -208.023, 14.148, 96.031},
		},
	},
		-- Weapons
	weapons={
		{46, 1},	-- Parachute (1 Ammo)
	},
},
{
	name="Las Venturas Airport\nPilot\nRental Station",	pos={1308.013, 1600.383, 9.820},	colorText={255,200,0},
	restrictions={"Pilot"},
		-- Vehicles
	vehicles={
		{593, "small", nil, 		}, 	-- Dodo
		{511, "small", }, 	-- Beagle
		{513, "small", }, 	-- Stuntplane

		{519, "small",}, 	-- Shamal
		{553, "large", }, 	-- Nevada

		{592, "large", }, 	-- Andromada
		{577, "large", }, 	-- AT-400

		{417, "small", {"Pilot;4"}}, 	-- Leviathan
		{487, "small", {"Pilot;4"}}, 	-- Maverick
		{563, "small", {"Pilot;4"}}, 	-- Raindance
		{469, "small", {"Pilot;4"}}, 	-- Sparrow
	},
	spawn_points={
		["small"] = {
			{1304.531, 1323.974, 10.264, 270},
			{1304.531, 1363.979, 10.265, 270},
			{1355.285, 1713.570, 10.264, 270},
			{1355.285, 1756.223, 10.264, 270},
			{1393.855, 1812.567, 10.264, 180},
			{1503.790, 1838.361, 10.264, 90},
			{1503.790, 1722.582, 10.264, 90},
			{1609.813, 1635.160, 10.264, 180},
			{1678.475, 1635.160, 10.264, 180},
		},
		["large"] = {
			{1477.876, 1805.563, 10.813},
			{1429.353, 1600.603, 10.813},
		},
	},
		-- Weapons
	weapons={
		{46, 1},	-- Parachute (1 Ammo)
	},
},
{
	name="Verdant Meadows\nPilot\nRental Station",	pos={338.785, 2534.446, 15.795},	colorText={255,200,0},
	restrictions={"Pilot"},
		-- Vehicles
	vehicles={
		{593, "small", nil, 		}, 	-- Dodo
		{511, "small", }, 	-- Beagle
		{513, "small", }, 	-- Stuntplane

		{519, "small", }, 	-- Shamal
		{553, "large", }, 	-- Nevada

		{592, "large", }, 	-- Andromada
		{577, "large", }, 	-- AT-400

		{417, "small", {"Pilot;4"}}, 	-- Leviathan
		{487, "small", {"Pilot;4"}}, 	-- Maverick
		{563, "small", {"Pilot;4"}}, 	-- Raindance
		{469, "small", {"Pilot;4"}}, 	-- Sparrow
	},
	spawn_points={
		["small"] = {
			{351.202, 2535.461, 15.2, 179},
			{422.762, 2506.158, 15.484, 89},
			{241.075, 2465.735, 15.484, 0},
		},
		["large"]  = {
			{-37.164, 2500.507, 17, 270},
		},
	},
		-- Weapons
	weapons={
		{46, 1},	-- Parachute (1 Ammo)
	},
},
]]--


-- Pizza Delivery
------------------>>

{
	name="Uber Eats\nJob\nVehicle",	pos={2123.3410644531,-1813.5629882813,12.554412841797},	colorText={255,200,0},
	restrictions={"Uber Eats"},
	vehicles={
		{448, "spawn1"}, -- Pizzaboy
	},
	spawn_points={
		["spawn1"] = {
			{2097.363, -1812.996, 12.982, 88},
			{2097.363, -1820.471,  12.982, 88},
		},
	},
},


{
	name="Eletricista\nJob\nVehicle",	pos={2677.6301269531, -1948.7376708984, 12.60781288147, 23},	colorText={255, 200, 0},
	restrictions={"eletricista"},
		-- Vehicles
	vehicles={
		{589, "spawn55"}, -- Trashmaster
	},
	spawn_points={
		["spawn55"] = {
			{2678.8278808594, -1969.1545410156, 13.546875, 284.5},
		},
	},
},


{
	name="Caminhoneiro\nJob\nVehicle",	pos={2591.8579101563, 2795.3896484375, 9.8203125, 23},	colorText={255,200,0},
	restrictions={"caminhoneiro"},
	vehicles={
		{515, "spawncamin"}, -- Pizzaboy
	},
	spawn_points={
		["spawncamin"] = {
			{2574.3837890625, 2745.3720703125, 11.464741706848, 359},
			{2569.6254882813, 2745.3720703125, 11.464741706848, 359},
			{2565.4990234375, 2745.3720703125, 11.464741706848, 359},
			{2557.2182617188, 2745.3720703125, 11.464741706848, 359},
			{2553.0751953125, 2745.3720703125, 11.464741706848, 359},
		},
	},
},


-- Quarry Miner (LV)
----------------------->>


{
	name="Minerador\nJob\nVehicle",	pos={817.19091796875, 856.88610839844, 11.7890625, 23},	colorText={255,200,0},
	restrictions={"Minerador"},
		-- Vehicles
	vehicles={
		{455, "miner"}, 	-- Streak
		--{573, "miner"}, 	-- Freight
		--{406, "miner"}, 	-- Freight
	},
	spawn_points={
		["miner"] = { {827.85546875, 849.13214111328, 11.721641540527, 23}, },
	},
	
		weapons={
		{6, 1},	-- picareta (1 Ammo)
	},
	
	
},


-- Train Driver
---------------->>

{
	name="Maquinista\nJob\nVehicle",	pos={1706.624, -1939.626, 12.573},	colorText={255,200,0},
	restrictions={"Maquinista"},
		-- Vehicles
	vehicles={
		{538, "trains"}, 	-- Streak
		{537, "trains"}, 	-- Freight
	},
	spawn_points={
		["trains"] = { {1720.710, -1941.678, 12.580}, },
	},
},



-- Trash Collector
------------------->>

{
	name="Lixeiro\nJob\nVehicle",	pos={-61.502, -1130.897, 0.078},	colorText={255, 200, 0},
	restrictions={"Lixeiro"},
		-- Vehicles
	vehicles={
		{408, "spawn1"}, -- Trashmaster
	},
	spawn_points={
		["spawn1"] = {
			{-80.833, -1126.745, 0.078, 65.444},
		},
	},
},

--[[
-- Temp Vehicle Spawns
----------------------->>
{
	name="Vehicle Gratis",	pos={1148.7052001953, -1748.6993408203, 12.578125},	colorText={255,0,255},
	vehicles={
		{481, "default"}, 	-- BMX

	},
	spawn_points={
		["default"] = {
			{1149.3806152344, -1743.4819335938, 13.40625, 90},
		},
	},
	cost=true,
},
]]--

}

function getRentTable()
	return rent_table
end
