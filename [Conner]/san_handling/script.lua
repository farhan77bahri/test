function loadHandling(v)	
		if getElementModel(v) == 431 then -- Onibus
			setVehicleHandling(v, "maxVelocity", 60)
			setVehicleHandling(v, "engineAcceleration", 15)
		end	
		if getElementModel(v) == 492 then -- Parati 
			setVehicleHandling(v, "maxVelocity", 170)
		end
		if getElementModel(v) == 474 then -- Gol
			setVehicleHandling(v, "maxVelocity", 170)
		end
		if getElementModel(v) == 405 then -- Gol G5
			setVehicleHandling(v, "maxVelocity", 170)
		end
		if getElementModel(v) == 585 then -- Audi Q7
			setVehicleHandling(v, "maxVelocity", 170)
		end
		
		if getElementModel(v) == 550 then -- Celta
			setVehicleHandling(v, "maxVelocity", 180)
		end
		if getElementModel(v) == 538 then -- Celta
			setVehicleHandling(v, "maxVelocity", 100000)
		end
		if getElementModel(v) == 468 then -- Xt 660
			setVehicleHandling(v, "maxVelocity", 180)
		end
		if getElementModel(v) == 522 then -- Xj6
			setVehicleHandling(v, "maxVelocity", 180)
		end
		if getElementModel(v) == 547 then -- Jetta
			setVehicleHandling(v, "maxVelocity", 170)
		end
		if getElementModel(v) == 566 then -- Corolla
			setVehicleHandling(v, "maxVelocity", 170)
		end
		
		if getElementModel(v) == 481 then -- BIKE 1
			setVehicleHandling(v, "maxVelocity", 90)
		end
		
		if getElementModel(v) == 509 then -- BIKE 2
			setVehicleHandling(v, "maxVelocity", 90)
		end
		if getElementModel(v) == 510 then -- BIKE 3
			setVehicleHandling(v, "maxVelocity", 90)
		end
		
		if getElementModel(v) == 508 then -- Caminhao
			setVehicleHandling(v, "mass", 1600)
			setVehicleHandling(v, "turnMass", 3000)
			setVehicleHandling(v, "dragCoeff", 1.8)
			setVehicleHandling(v, "centerOfMass", { 0, 1.0, -0.50 } )
			setVehicleHandling(v, "percentSubmerged", 75)
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "ABS", false)
			setVehicleHandling(v, "steeringLock", 35)
			setVehicleHandling(v, "suspensionForceLevel", 1.8)
			setVehicleHandling(v, "suspensionDamping", 0.5)
			setVehicleHandling(v, "suspensionHighSpeedDamping", 0.1)
			setVehicleHandling(v, "suspensionUpperLimit", 0.3)
			setVehicleHandling(v, "suspensionLowerLimit", -0.05)
			setVehicleHandling(v, "suspensionFrontRearBias", 0.55)
			setVehicleHandling(v, "suspensionAntiDiveMultiplier", 0.5)
			setVehicleHandling(v, "seatOffsetDistance", 0.2)
			setVehicleHandling(v, "collisionDamageMultiplier", 0.60)
			setVehicleHandling(v, "monetary", 25000)
			setVehicleHandling(v, "modelFlags", 0x40000001)
			setVehicleHandling(v, "handlingFlags", 0x10308803)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
		end
		
		--[[if getElementData(v,"veh:id") == 191 then -- Caminhao
			setVehicleHandling(v, "mass", 1600)
			setVehicleHandling(v, "turnMass", 3000)
			setVehicleHandling(v, "dragCoeff", 1.8)
			setVehicleHandling(v, "centerOfMass", { 0, 1.0, -0.50 } )
			setVehicleHandling(v, "percentSubmerged", 75)
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "ABS", false)
			setVehicleHandling(v, "engineAcceleration", 20000)
			setVehicleHandling(v, "steeringLock", 35)
			setVehicleHandling(v, "suspensionForceLevel", 1.8)
			setVehicleHandling(v, "suspensionDamping", 0.5)
			setVehicleHandling(v, "suspensionHighSpeedDamping", 0.1)
			setVehicleHandling(v, "suspensionUpperLimit", 0.3)
			setVehicleHandling(v, "suspensionLowerLimit", -0.05)
			setVehicleHandling(v, "suspensionFrontRearBias", 0.55)
			setVehicleHandling(v, "suspensionAntiDiveMultiplier", 0.5)
			setVehicleHandling(v, "seatOffsetDistance", 0.2)
			setVehicleHandling(v, "collisionDamageMultiplier", 0.60)
			setVehicleHandling(v, "monetary", 25000)
			setVehicleHandling(v, "modelFlags", 0x40000001)
			setVehicleHandling(v, "handlingFlags", 0x10308803)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
		end]]
		
		if getElementModel(v) == 494 then -- Caminhao
			setVehicleHandling(v, "mass", 2000)
			setVehicleHandling(v, "turnMass", 3000)
			setVehicleHandling(v, "dragCoeff", 0.8)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			setVehicleHandling(v, "percentSubmerged", 75)
			setVehicleHandling(v, "tractionMultiplier", 0.2)
			setVehicleHandling(v, "tractionLoss", 0.8)
			setVehicleHandling(v, "tractionBias", 0.537)
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "maxVelocity", 100)
			setVehicleHandling(v, "engineAcceleration", 20)
			setVehicleHandling(v, "engineInertia", 0.2)
			setVehicleHandling(v, "engineType", "petrol")
			setVehicleHandling(v, "brakeDeceleration", 15)
			setVehicleHandling(v, "ABS", false)
			setVehicleHandling(v, "steeringLock", 45)
			setVehicleHandling(v, "suspensionForceLevel", 1.8)
			setVehicleHandling(v, "suspensionDamping", 0.5)
			setVehicleHandling(v, "suspensionHighSpeedDamping", 0.1)
			setVehicleHandling(v, "suspensionUpperLimit", 0.3)
			setVehicleHandling(v, "suspensionLowerLimit", -0.05)
			setVehicleHandling(v, "suspensionFrontRearBias", 0.55)
			setVehicleHandling(v, "suspensionAntiDiveMultiplier", 0.5)
			setVehicleHandling(v, "seatOffsetDistance", 0.2)
			setVehicleHandling(v, "collisionDamageMultiplier", 0)
			setVehicleHandling(v, "monetary", 25000)
			setVehicleHandling(v, "modelFlags", 0x40000001)
			setVehicleHandling(v, "handlingFlags", 0x10308803)
			setVehicleHandling(v, "headLight", 0)
			setVehicleHandling(v, "tailLight", 1)
			setVehicleHandling(v, "animGroup", 0)
		end
		
		
		if getElementModel(v) == 436 then -- bmw m4
			setVehicleHandling(v, "mass", 1644)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 5.1)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.7)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 250)
			setVehicleHandling(v, "engineAcceleration", 42.4)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		if getElementModel(v) == 489 then -- shervelet bleyzer
			setVehicleHandling(v, "mass", 2286)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 5.1)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1)
			setVehicleHandling(v, "tractionBias", 0.537)
			
          --  setVehicleHandling(v, "brakeBias", 0.8)
			setVehicleHandling(v, "maxVelocity", 160)
			setVehicleHandling(v, "engineAcceleration", 16.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
			if getElementModel(v) == 502 then -- jacvar ftype
			setVehicleHandling(v, "mass", 1665)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.3)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.7)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 300)
			setVehicleHandling(v, "engineAcceleration", 33.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 445 then -- BMW M5
			setVehicleHandling(v, "mass", 1855)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 4.6)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.7)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 260)
			setVehicleHandling(v, "engineAcceleration", 50.7)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		if getElementModel(v) == 551 then -- BMW e36
			setVehicleHandling(v, "mass", 1375)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.05)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 227)
			setVehicleHandling(v, "engineAcceleration", 17)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 5)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 451 then -- lambor
			setVehicleHandling(v, "mass", 1422)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.6)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 1)
			setVehicleHandling(v, "tractionLoss", 1.5)
			setVehicleHandling(v, "tractionBias", 0.350)
			
			setVehicleHandling(v, "maxVelocity", 325)
			setVehicleHandling(v, "engineAcceleration", 61)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 415 then -- camaro VIP
			setVehicleHandling(v, "mass", 1700)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 6)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.7)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 354)
			setVehicleHandling(v, "engineAcceleration", 120)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 12)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 506 then -- p1
			setVehicleHandling(v, "mass", 1497)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.7)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.3 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.7)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 350)
			setVehicleHandling(v, "engineAcceleration", 72.7)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 10)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		if getElementModel(v) == 482 then -- ford Van
			setVehicleHandling(v, "mass", 1970)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.5)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.4)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.537)
			
			setVehicleHandling(v, "maxVelocity", 160)
			setVehicleHandling(v, "engineAcceleration", 15)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 4)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 411 then -- dodge chalaenger
			setVehicleHandling(v, "mass", 1895)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 4.3)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.437)
			
			setVehicleHandling(v, "maxVelocity", 230)
			setVehicleHandling(v, "engineAcceleration", 37.2)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 8)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 587 then -- bmw m6
			setVehicleHandling(v, "mass", 1980)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.6)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 310)
			setVehicleHandling(v, "engineAcceleration", 56)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 8.5)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		
		if getElementModel(v) == 603 then -- coronet 440
			setVehicleHandling(v, "mass", 1860)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 8)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.507)
			
			setVehicleHandling(v, "maxVelocity", 168)
			setVehicleHandling(v, "engineAcceleration", 37.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 5.8)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 400 then -- bmw  x5
			setVehicleHandling(v, "mass", 2425)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 4.4)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.507)
			
			setVehicleHandling(v, "maxVelocity", 240)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 40.8)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 8)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		if getElementModel(v) == 401 then -- folox golf  GIT
			setVehicleHandling(v, "mass", 1387)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.25)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.507)
			
			setVehicleHandling(v, "maxVelocity", 250)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 23)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 8)
			 setVehicleHandling(v, "driveType", "fwd")
			
		end
		
		
		if getElementModel(v) == 579 then -- Gclass G65
			setVehicleHandling(v, "mass", 2835)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 7.2)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 230)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 62.1)
			setVehicleHandling(v, "engineInertia", 300)
			
			setVehicleHandling(v, "brakeDeceleration", 5)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		if getElementModel(v) == 429 then -- bmw z4
			setVehicleHandling(v, "mass", 1330)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.33)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.507)
			
			setVehicleHandling(v, "maxVelocity", 220)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 18.4)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 7)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		if getElementModel(v) == 585 then -- aodi a6
			setVehicleHandling(v, "mass", 1735)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.5)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.507)
			
			setVehicleHandling(v, "maxVelocity", 250)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 25.2)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 4.9)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		if getElementModel(v) == 580 then -- aodi rs4
			setVehicleHandling(v, "mass", 1795)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.5)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.487)
			
			setVehicleHandling(v, "maxVelocity", 280)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 45)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 5.8)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		if getElementModel(v) == 533 then -- koeni cc
			setVehicleHandling(v, "mass", 1180)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.2)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 1.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 395)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 80.6)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 14)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		
		if getElementModel(v) == 503 then -- bugatii
			setVehicleHandling(v, "mass", 1990)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.75)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 1.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 407)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 100.1)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 14)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		if getElementModel(v) == 507 then -- kerayseler srtB
			setVehicleHandling(v, "mass", 1904)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.55)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.457)
			
			setVehicleHandling(v, "maxVelocity", 274)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 43.1)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 6.5)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		if getElementModel(v) == 439 then -- dodge chalenger
			setVehicleHandling(v, "mass", 1904)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 5.4)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			setVehicleHandling(v, "numberOfGears", 4)
			setVehicleHandling(v, "tractionMultiplier", 0.6)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 220)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 42.5)
			setVehicleHandling(v, "engineInertia", 70)
			
			setVehicleHandling(v, "brakeDeceleration", 5)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		
		if getElementModel(v) == 526 then -- alfaromeo 159
			setVehicleHandling(v, "mass", 1630)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.85)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			setVehicleHandling(v, "numberOfGears", 4)
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 240)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 26.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 6)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		if getElementModel(v) == 458 then -- subaro
			setVehicleHandling(v, "mass", 1389)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.3)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "tractionMultiplier", 0.65)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 174)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 16.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 6)
			 setVehicleHandling(v, "driveType", "awd")
			
		end
		
		
		if getElementModel(v) == 494 then -- SLS
			setVehicleHandling(v, "mass", 1735)
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 3.9)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "tractionMultiplier", 1.2)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 320)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 65)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 12)
			 setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		if getElementModel(v) == 409 then -- limozin
			setVehicleHandling(v, "mass", 2800)
			setVehicleHandling(v, "steeringLock",  60.0 )
			setVehicleHandling(v, "turnMass", 3780)
			setVehicleHandling(v, "dragCoeff", 2.4)
			setVehicleHandling(v, "centerOfMass", { 0, 0.15, -0.4 } )
			setVehicleHandling(v, "numberOfGears", 5)
			setVehicleHandling(v, "tractionMultiplier", 0.8)
			setVehicleHandling(v, "tractionLoss", 1.1)
			setVehicleHandling(v, "tractionBias", 0.407)
			
			setVehicleHandling(v, "maxVelocity", 230)  
		--	setVehicleHandling(v, "ABS", false)---240
			
			
			setVehicleHandling(v, "engineAcceleration", 20.5)
			setVehicleHandling(v, "engineInertia", 100)
			
			setVehicleHandling(v, "brakeDeceleration", 9)
			setVehicleHandling(v, "driveType", "rwd")
			
		end
		
		
		
end

function loadHandlings()
	for k, v in ipairs(getElementsByType("vehicle")) do
		loadHandling(v)
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadHandlings)
--[[
addEventHandler("onVehicleEnter", root, function(player)
    loadHandling(source)
end)]]


--[[
function resetHandling()
	 for k, v in ipairs(getElementsByType("vehicle")) do
		 for k1,v1 in ipairs(setModelHandling(getVehicleModel(v))) do
			-- setVehicleHandling(v, k1, nil)
		 end
	 end
 end
 addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), resetHandling)]]--