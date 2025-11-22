

addEventHandler("onPlayerDamage", getRootElement(),
	function (attacker, weapon, bodypart, loss)
		if bodypart == 9 then
			if result == true then
				killPed(source, attacker, weapon, bodypart)
			end
		end
	end
)

local weapons = {348, 24}

function onClientPedDamage(_, weapon)
    if(getElementType(source) == "player") then
       if(weapons[weapon]) then
           return killPed(source)
       end
    end
end
addEventHandler("onClientPedDamage", getRootElement(), onClientPedDamage)

for _, v in ipairs ( { "pro", "std", "poor" } ) do
    setWeaponProperty ( "Deagle", v, "damage", 80 )
end