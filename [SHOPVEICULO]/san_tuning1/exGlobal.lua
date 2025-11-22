availableTuningMarkers = {
	-- x y z cameramatrix (1-6)
	{ 394.09661865234, -1853.5124511719, 7.8553657531738}, -- Dokkok
}

availableWheelSizes = {
	["front"] = {
		["verynarrow"] = {0x100, 1},
		["narrow"] = {0x200, 2},
		["wide"] = {0x400, 4},
		["verywide"] = {0x800, 5}
	},
	["rear"] = {
		["verynarrow"] = {0x1000, 1},
		["narrow"] = {0x2000, 2},
		["wide"] = {0x4000, 4},
		["verywide"] = {0x8000, 5}
	}
}

tuningMenu = {
	[1] = {
		["categoryName"] = "Power",
		
		["subMenu"] = {
			[1] = {
				["categoryName"] = "Motor",
				["upgradeData"] = "engine",
				["cameraSettings"] = {"bonnet_dummy", 110, 15, 6, true},
				["handlingFlags"] = {{"engineAcceleration", 0.6}, {"maxVelocity", 9.5}, {"dragCoeff", -0.01}},

				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 100000 , ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 200000 , ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 300000 , ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800  , ["priceIgMoney"] = false}
				}
			},

			[2] = {
				["categoryName"] = "Turbo",
				["upgradeData"] = "turbo",
				["cameraSettings"] = {"bonnet_dummy", 110, 15, 6, true},
				["handlingFlags"] = {{"engineAcceleration", 1}},

				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 150000, ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 250000, ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 350000, ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800, ["priceIgMoney"] = false}
				}
			},

			[3] = {
				["categoryName"] = "gearbox",
				["upgradeData"] = "gearbox",
				["handlingFlags"] = {{"maxVelocity", 6}},

				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 300000, ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 400000, ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 500000, ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800, ["priceIgMoney"] = false}
				}
			},

			[4] = {
				["categoryName"] = "Drag",
				["upgradeData"] = "ecu",
				["handlingFlags"] = {{"dragCoeff", -0.01}},

				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 150000, ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 200000, ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 350000, ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800, ["priceIgMoney"] = false}
				}				
			},


			[5] = {
				["categoryName"] = "Traction",
				["upgradeData"] = "tires",
				["cameraSettings"] = {"wheel_rb_dummy", 60, 10, 4},
				["handlingFlags"] = {{"tractionMultiplier", 0.05}, {"tractionLoss", 0.02}},

				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 150000, ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 200000, ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 350000, ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800, ["priceIgMoney"] = false}
				}
			},

			[6] = {
				["categoryName"] = "Brakes",
				["upgradeData"] = "brakes",
				["handlingFlags"] = {{"brakeDeceleration", 0.02}, {"brakeBias", 0.08}},
				["cameraSettings"] = {"wheel_rf_dummy", 35, 5, 2, true},


				["subMenu"] = {
					[1] = {["categoryName"] = "Pacote de fábrica", ["tuningPrice"] = 0, ["priceIgMoney"] = true},
					[2] = {["categoryName"] = "Pacote de rua", ["tuningPrice"] = 100000, ["priceIgMoney"] = true},
					[3] = {["categoryName"] = "Pacote profissional", ["tuningPrice"] = 150000, ["priceIgMoney"] = true},
					[4] = {["categoryName"] = "Pacote de Competição", ["tuningPrice"] = 250000, ["priceIgMoney"] = true},
					[5] = {["categoryName"] = "Pacote VIP", ["tuningPrice"] = 800, ["priceIgMoney"] = false}
				}
			}
		}
	},

	[2] = {
		["categoryName"] = "Utilities",
		["availableUpgrades"] = {},
		["subMenu"] = {
			-- default tunings
			[1] = {["categoryName"] = "Front bumper", ["upgradeSlot"] = 14, ["tuningPrice"] = 2200, ["cameraSettings"] = {"bump_front_dummy", 130, 10, 6}},
			[2] = {["categoryName"] = "Rear bumper", ["upgradeSlot"] = 15, ["tuningPrice"] = 2200, ["cameraSettings"] = {"door_lf_dummy", -65, 3, 8}},
			[3] = {["categoryName"] = "Hood", ["upgradeSlot"] = 0, ["tuningPrice"] = 1800},
			[4] = {["categoryName"] = "escape", ["upgradeSlot"] = 13, ["tuningPrice"] = 1900, ["cameraSettings"] = {"door_lf_dummy", -65, 3, 8}},
			[5] = {["categoryName"] = "Spoiler", ["upgradeSlot"] = 2, ["tuningPrice"] = 2000, ["cameraSettings"] = {"boot_dummy", -65, 3, 8}},
			[6] = {["categoryName"] = "Wheels", ["upgradeSlot"] = 12, ["tuningPrice"] = 2200},
			[7] = {["categoryName"] = "threshold", ["upgradeSlot"] = 3, ["tuningPrice"] = 2200, ["cameraSettings"] = {"ug_wing_right", 65, 3, 4}},
			[8] = {["categoryName"] = "Roof spoiler", ["upgradeSlot"] = 7, ["tuningPrice"] = 2400},
			[9] = {["categoryName"] = "hydraulics", ["upgradeSlot"] = 9, ["tuningPrice"] = 10},
	
		}
	},

	[3] = {
		["categoryName"] = "Colour",

		["subMenu"] = {
			[1] = {["categoryName"] = "First color", ["tuningPrice"] = 4000},
			[2] = {["categoryName"] = "Second color", ["tuningPrice"] = 4000},
			[3] = {["categoryName"] = "light color", ["tuningPrice"] = 4000}
		}
	},

	[4] = {
		["categoryName"] = "Extra",

		["subMenu"] = {
			[1] = {
				["categoryName"] = "Front wheel width",
				["upgradeData"] = "wheelsize_f",

				["subMenu"] = {
					[1] = {["categoryName"] = "Extra estreito", ["tuningPrice"] = 6000, ["priceIgMoney"] = true, ["tuningData"] = "verynarrow"},
					[2] = {["categoryName"] = "estreito", ["tuningPrice"] = 4000, ["priceIgMoney"] = true, ["tuningData"] = "narrow"},
					[3] = {["categoryName"] = "normal", ["tuningPrice"] = 2000, ["priceIgMoney"] = true, ["tuningData"] = "default"},
					[4] = {["categoryName"] = "grande", ["tuningPrice"] = 4000, ["priceIgMoney"] = true, ["tuningData"] = "wide"},
					[5] = {["categoryName"] = "Extra grande", ["tuningPrice"] = 6000, ["priceIgMoney"] = true, ["tuningData"] = "verywide"}
				}
			},

			[2] = {
				["categoryName"] = "Rear wheel width",
				["upgradeData"] = "wheelsize_r",

				["subMenu"] = {
					[1] = {["categoryName"] = "Extra estreito", ["tuningPrice"] = 6000, ["priceIgMoney"] = true, ["tuningData"] = "verynarrow"},
					[2] = {["categoryName"] = "Estreito", ["tuningPrice"] = 4000, ["priceIgMoney"] = true, ["tuningData"] = "narrow"},
					[3] = {["categoryName"] = "Normal", ["tuningPrice"] = 2000, ["priceIgMoney"] = true, ["tuningData"] = "default"},
					[4] = {["categoryName"] = "Grande", ["tuningPrice"] = 4000, ["priceIgMoney"] = true, ["tuningData"] = "wide"},
					[5] = {["categoryName"] = "Extra Grande", ["tuningPrice"] = 6000, ["priceIgMoney"] = true, ["tuningData"] = "verywide"}
				}
			},

			[3] = {
				["categoryName"] = "LSD port",
				["subMenu"] = {
					[1] = {["categoryName"] = "Tirar", ["tuningPrice"] = 0, ["priceIgMoney"] = true, ["tuningData"] = false},
					[2] = {["categoryName"] = "Equipar", ["tuningPrice"] = 1200, ["priceIgMoney"] = false, ["tuningData"] = true}
				}
			},	

			[4] = {
				["categoryName"] = "Paintjob",
				["upgradeData"] = "paintjob", 

				["subMenu"] = {}
			},				
			
			[5] = {
				["categoryName"] = "Air-Ride",
				["cameraSettings"] = {"wheel_rf_dummy", 35, 5, 2, true},
				["upgradeSlot"] = 17,
				["subMenu"] = {
					[1] = {["categoryName"] = "Tirar", ["tuningPrice"] = 0, ["priceIgMoney"] = true, ["tuningData"] = false},
					[2] = {["categoryName"] = "Equipar", ["tuningPrice"] = 8000, ["priceIgMoney"] = true, ["tuningData"] = true}
				}
			},	
			
			[6] = {
				["categoryName"] = "Propulsion",
				["cameraSettings"] = {"wheel_rf_dummy", 35, 5, 2, true},
				["upgradeSlot"] = 17,
				["subMenu"] = {
					[1] = {["categoryName"] = "Front-wheel drive", ["tuningPrice"] = 7000, ["priceIgMoney"] = true, ["tuningData"] = "fwd"},
					[2] = {["categoryName"] = "Traction 4x4", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = "awd"},
					[3] = {["categoryName"] = "Rear wheel", ["tuningPrice"] = 7000, ["priceIgMoney"] = true, ["tuningData"] = "rwd"}
				}
			},				
			
			[7] = {
				["categoryName"] = "variante",
				["subMenu"] = {
					[1] = {["categoryName"] = "Tirar", ["tuningPrice"] = 0, ["priceIgMoney"] = true, ["tuningData"] = 255},
					[2] = {["categoryName"] = "Variante 1", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 0},
					[3] = {["categoryName"] = "Variante 2", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 1},
					[4] = {["categoryName"] = "Variante 3", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 2},
					[5] = {["categoryName"] = "Variante 4", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 3},
					[6] = {["categoryName"] = "Variante 5", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 4},
					[7] = {["categoryName"] = "Variante 6", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 5},
					[8] = {["categoryName"] = "Variante 7", ["tuningPrice"] = 10000, ["priceIgMoney"] = true, ["tuningData"] = 6},
				}
			},				
			
			[8] = {
				["categoryName"] = "Turning angle",
				["cameraSettings"] = {"wheel_rf_dummy", 35, 5, 2, true},
				["upgradeSlot"] = 17,
				["subMenu"] = {
					[1] = {["categoryName"] = "Tirar", ["tuningPrice"] = 0, ["priceIgMoney"] = true, ["tuningData"] = false},
					[2] = {["categoryName"] = "30°", ["tuningPrice"] = 2000, ["priceIgMoney"] = true, ["tuningData"] = 30},
					[3] = {["categoryName"] = "40°", ["tuningPrice"] = 2500, ["priceIgMoney"] = true, ["tuningData"] = 40},
					[4] = {["categoryName"] = "50°", ["tuningPrice"] = 3000, ["priceIgMoney"] = true, ["tuningData"] = 50},
					[5] = {["categoryName"] = "60°", ["tuningPrice"] = 3500, ["priceIgMoney"] = true, ["tuningData"] = 60}
				}
			},				
			[9] = {
				["categoryName"] = "plate number",
				["cameraSettings"] = {"door_lf_dummy", -65, 3, 8},
				["upgradeSlot"] = 17,
				["subMenu"] = {
				},
			},				
			
			[10] = {
				["categoryName"] = "Neon",
				["cameraSettings"] = {"chassis_dummy", 0, 3, 10},
				["upgradeSlot"] = 19,
				["subMenu"] = {
					[1] = {["categoryName"] = "Take", ["tuningPrice"] = 0,["priceIgMoney"] = true, ["tuningData"] = false},
					[2] = {["categoryName"] = "white", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "white"},
					[3] = {["categoryName"] = "blue", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "blue"},
					[4] = {["categoryName"] = "green", ["tuningPrice"] = 5000, ["priceIgMoney"] = true,["tuningData"] = "green"},
					[5] = {["categoryName"] = "red", ["tuningPrice"] = 5000, ["priceIgMoney"] = true,["tuningData"] = "red"},
					[6] = {["categoryName"] = "lemon", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "yellow"},
					[7] = {["categoryName"] = "Rose", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "pink"},
					[8] = {["categoryName"] = "orange", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "orange"},
					[9] = {["categoryName"] = "In blue light", ["tuningPrice"] = 5000, ["priceIgMoney"] = true, ["tuningData"] = "lightblue"},
					[10] = {["categoryName"] = "dreadlocks", ["tuningPrice"] = 15000, ["priceIgMoney"] = true, ["tuningData"] = "rasta"},
					[11] = {["categoryName"] = "White + Light Blue", ["tuningPrice"] = 15000, ["priceIgMoney"] = true, ["tuningData"] = "ice"},
				}
			},				
		}
	}
}

function getMainCategoryIDByName(name)
	if name then
		for categoryID, row in ipairs(tuningMenu) do
			if name == row["categoryName"] then
				return categoryID
			end
		end
	end
	
	return -1
end

function hasMoney(element, amount)
	local money = element:getData("char:money")
	if money >= amount then
		return true
	else
		return false
	end
end

function takeMoney(element, amount)
	if hasMoney(element, amount) then
		element:setData("char:money", element:getData("char:money") - amount)
	end
end

function hasPremium(element, amount)
	local pp = element:getData("char:pp")
	if pp >= amount then
		return true
	else
		return false
	end
end

function takePremium(element, amount)
	if hasPremium(element, amount) then
		element:setData("char:pp", element:getData("char:pp") - amount)
	end
end

function getVehicleHandlingProperty ( element, property )
    if isElement ( element ) and getElementType ( element ) == "vehicle" and type ( property ) == "string" then -- Make sure there's a valid vehicle and a property string
        local handlingTable = getVehicleHandling ( element ) -- Get the handling as table and save as handlingTable
        local value = handlingTable[property] -- Get the value from the table
        
        if value then -- If there's a value (valid property)
            return value -- Return it
        end
    end
    
    return false -- Not an element, not a vehicle or no valid property string. Return failure
end