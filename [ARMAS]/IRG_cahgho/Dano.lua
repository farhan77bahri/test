function playerDamage ( attacker, weapon, bodypart, loss ) 
    if ( weapon == 4 ) then 
        setElementHealth ( source, getElementHealth(source) - 20 ) 
    end 
end 
  
addEventHandler ( "onPlayerDamage", getRootElement (), playerDamage ) 