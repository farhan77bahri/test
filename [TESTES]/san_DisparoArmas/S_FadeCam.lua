function addRednessOnDamage ( )
      fadeCamera ( source, false, 5.0, 150, 150, 150 )
end
addEventHandler ( "onPlayerWasted", getRootElement(), addRednessOnDamage )

function fadeoff()
fadeCamera(source, true, 0.5 )
end
addEventHandler ( "onPlayerSpawn", getRootElement(), fadeoff )