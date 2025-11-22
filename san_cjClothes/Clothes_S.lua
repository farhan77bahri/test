addEvent( "onChangeClothesCJ", true )
addEventHandler( "onChangeClothesCJ", root,
function ( CJClothesTable, CJClothesString )
    if ( CJClothesTable ) then
        for int, index in pairs( CJClothesTable ) do
            local texture, model = getClothesByTypeIndex ( int, index )
            if ( texture ) then
                addPedClothes ( source, texture, model, int )
		end
    end
end
end
)

addEvent( "onPlayerBougtSkin", true )
addEventHandler( "onPlayerBougtSkin", root,
function ( thePrice ) 
    if ( thePrice ) then
	setElementData(source,"char:money", getElementData(source,"char:money") - thePrice)
		--takePlayerMoney(source, thePrice)
    end
end
)


