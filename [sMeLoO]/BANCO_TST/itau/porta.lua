porta1 = createObject ( 3051, 1836, -1406.6999511719, 14, 0, 0, 46.171417236328 )
x,y,z = getElementPosition (porta1)
Zona = createColCircle ( x,y, 3, 3 )
--portao aberto--
function Funcion ()
moveObject ( porta1, 2000, 1836, -1407.6999511719, 14 )
end
addEventHandler ( "onColShapeHit", Zona, Funcion )
--portao fechado--
function Funcion2 ()
moveObject ( porta1, 2000, 1836, -1406.6999511719, 14 )
end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )
-----------------------------------------------------------------------------------------------------------------------------------------
porta2 = createObject ( 3051, 1836, -1405.5, 14, 0, 0, 46.170043945313 )
x,y,z = getElementPosition (porta2)
Zona = createColCircle ( x,y, 3, 3 )
--portao aberto--
function Funcion ()
moveObject ( porta2, 2000, 1836, -1404.4000244141, 14 )
end
addEventHandler ( "onColShapeHit", Zona, Funcion )
--portao fechado--
function Funcion2 ()
moveObject ( porta2, 2000, 1836, -1405.5, 14 )
end
addEventHandler ( "onColShapeLeave", Zona, Funcion2 )

-----------------------------------------------------------------------------------------------------------------------------------------
