--[[ ---------------------------------------------------------------[ ÁREAS PUBLICAS ]-----------------------------------------------------------------
local agencia = createColCuboid(1159.85657, -1697.35083, 11.62815, 20.1396484375, 24.8876953125, 8.7000259399414)
function ColShapeHitagencia ( thePlayer, matchingDimension )
	local detection = isElementWithinColShape ( thePlayer, agencia )

	detection = detection and getElementDimension( thePlayer ) == getElementDimension( agencia )
	if detection then
        triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"agencia", "Pressione M e clique no NPC desejado com botão esquerdo ou direito do mouse para interagir!", 15 )
	end

end
addEventHandler ( "onColShapeHit", agencia, ColShapeHitagencia )


 ---------------------------------------------------------------[ POSTOS DE GASOLINA ]-----------------------------------------------------------------
local postodegasolina = createColCuboid(1923.66760, -1790.08020, 12.55537, 8.5860595703125, 20.162231445313, 4.6000017166138)
function ColShapeHitpostodegasolina ( thePlayer, matchingDimension )
	local detection = isElementWithinColShape ( thePlayer, postodegasolina )

	detection = detection and getElementDimension( thePlayer ) == getElementDimension( postodegasolina )
	if detection then
        triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"postodegasolina", "Bem vindo a loja de conveniência, Pressione M e clique no NPC desejado com botão esquerdo ou direito do mouse para interagir!", 15 )
	end

end
addEventHandler ( "onColShapeHit", postodegasolina, ColShapeHitpostodegasolina )


 ---------------------------------------------------------------[ ÁREAS SAFES ]-----------------------------------------------------------------
local safe = createColCuboid(1138.97058, -1385.14612, 12.77676, 77.492919921875, 94.2607421875, 18.09996547699)
function ColShapeHitsafe1 ( thePlayer, matchingDimension )
	local detection = isElementWithinColShape ( thePlayer, safe )

	detection = detection and getElementDimension( thePlayer ) == getElementDimension( safe )
	if detection then
        triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"safe", "Varede Mantaghe Amn(Safe Zone) Shodi!", 5 )
	end

end
addEventHandler ( "onColShapeHit", safe, ColShapeHitsafe1 )


local safe2 = createColCuboid(1443.51025, -1718.35168, 12.69655, 72.217163085938, 112.22180175781, 23.299962425232)
function ColShapeHitsafe2 ( thePlayer, matchingDimension )
	local detection = isElementWithinColShape ( thePlayer, safe2 )

	detection = detection and getElementDimension( thePlayer ) == getElementDimension( safe2 )
	if detection then
        triggerClientEvent(thePlayer,"JoinQuitGtaV:notifications", thePlayer,"safe2", "Az Mantaghe Amn (Safe Zone) Kharej Shodi!", 5 )
	end

end
addEventHandler ( "onColShapeHit", safe2, ColShapeHitsafe2 )]]