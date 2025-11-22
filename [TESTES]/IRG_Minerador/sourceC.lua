local font = dxCreateFont('files/calibris.ttf', 10)
-- local font = 'default'

-- local hit = 1000
local hit = 10
local ppHit = 20

local sellPed = {}
local sellCol = {}

local sellPos = {
	{156, 1234.7646484375, -1158.0845947266, 23.541213989258, "Ahmad", 0, 3, 3, 2, 0, 0}
}

function createSellPed()
	for index, value in ipairs (sellPos) do 
		if isElement(sellPed[index]) then destroyElement(sellPed[index]) end
		if isElement(sellCol[index]) then destroyElement(sellCol[index]) end
		sellPed[index] = createPed(value[1], value[2], value[3], value[4])
		
		local blip = createBlipAttachedTo ( sellPed[index], 25 )
		setElementData(blip,"blip >> name", "Foroosh-e Sang")
	
		


		setElementInterior(sellPed[index], value[10])
		setElementDimension(sellPed[index], value[11])
		setPedRotation(sellPed[index], value[6])
		setElementData(sellPed[index], "Ped:Name", value[5])
		setElementData(sellPed[index], "name:tags", "Foroosh-e Sang")	
		setElementData(sellPed[index], "ped >> death", true)		
		setElementFrozen(sellPed[index], true)
		sellCol[index] = createColCuboid(value[2]-value[7]/2, value[3]-value[8]+3, value[4]-0.5, value[7], value[8], value[9])
		setElementData(sellCol[index], "sell >> ore", true)
		setElementInterior(sellCol[index], value[10])
		setElementDimension(sellCol[index], value[11])
	end
end
createSellPed()

addEventHandler("onClientRender", root, function()
	for k,v in ipairs(getElementsByType("object", getResourceRootElement(getThisResource()), true)) do
		if isElement(v) and getElementData(v, 'stone >> ID') > 0 then 
			local x, y ,z = getElementPosition(v)
			local wx, wy, wz = getScreenFromWorldPosition(x , y, z)
			if wx and wy then
				local playerx, playery, playerz = getElementPosition(getLocalPlayer())
				if getDistanceBetweenPoints3D(playerx, playery, playerz, x, y ,z) <= 6 then
					local stone_HP = (getElementData(v, 'stone >> Health') or 0)
					if stone_HP > 0 then
						dxDrawRectangle(wx-200/2,wy,200,30,tocolor(0,0,0,170))
						dxDrawRectangle(wx-200/2+2,wy+2, (stone_HP/1000)*(200 - 4) ,26,tocolor(124, 197, 118, 190))
						dxDrawText(math.floor(stone_HP/10) .. '%',  wx-200/2 + 200/2+1, wy+30/2, wx-200/2 + 200/2+1, wy+30/2, tocolor(0, 0, 0,255),1, font, "center","center",false,false,false,true,false)
						dxDrawText(math.floor(stone_HP/10) .. '%', wx-200/2 + 200/2, wy+30/2, wx-200/2 + 200/2, wy+30/2, tocolor(255, 255, 255,255),1, font, "center","center",false,false,false,true,false)
					end
				end
			end
		end
	end
end, true, "low-5")

addEventHandler("onClientObjectDamage", getRootElement(), function(loss, attacker)
	if isTimer(minerTImer) then
		return
	end
	
	if (getElementData(source, 'stone >> ID') or 0) > 0 and getPedWeapon(localPlayer) == 11 and getElementModel(source) == 868 then
		if attacker == localPlayer then
			local health = getElementData(source, 'stone >> Health') or 1000
			if health <= hit then 
				triggerServerEvent('sanMTA->#giveOre', attacker, attacker)
				setElementData(source, 'stone >> Health', health - hit)
				local sound = playSound("files/crash.mp3", false)
				setSoundVolume(sound, 0.1)
			else
				minerTImer = setTimer(function() end,2000,1)
				playSound("files/pickaxe.mp3", false)
				setElementData(source, 'stone >> Health', health - hit)
			end		
		end
	elseif (getElementData(source, 'stone >> ID') or 0) > 0 and getPedWeapon(localPlayer) == 10 and getElementModel(source) == 868 then
		if attacker == localPlayer then
			local health = getElementData(source, 'stone >> Health') or 1000
			if health <= ppHit then 
				triggerServerEvent('sanMTA->#giveOre', attacker, attacker)
				setElementData(source, 'stone >> Health', health - ppHit)
				local sound = playSound("files/crash.mp3", false)
				setSoundVolume(sound, 0.1)
			else
				minerTImer = setTimer(function() end,2000,1)
				playSound("files/pickaxe.mp3", false)
				setElementData(source, 'stone >> Health', health - ppHit)
			end		
		end
	end
end)

addEventHandler("onClientColShapeHit", getRootElement(),
	function(player)
		if player ~= getLocalPlayer() then return end
		if source and getElementData(source, "sell >> ore") then 
			getPlayerItem()
		end
	end
)

function getPlayerItem()
	triggerServerEvent("sanMTA->#SellOre", localPlayer, localPlayer)
end

addEventHandler("onClientPlayerStealthKill", getRootElement(), function(targetPlayer) 
	if (getElementType(targetPlayer) == 'ped' and getElementData(targetPlayer, "ped >> death")) then  
		cancelEvent()
	end
end)