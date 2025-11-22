function hasSpaceForItem( element )
	return call( getResourceFromName( "san_items" ), "vanSzabadSlot", element )
end

function hasItem( element, itemID, itemValue )
	return call( getResourceFromName( "san_items" ), "hasItemS", element, tonumber(itemID), tonumber(itemValue)) -- ITEM INDEXET ADJON VISSZA 2.NAK
end

function giveItem( element, itemID, itemValue, darab )
	return call( getResourceFromName( "san_items" ), "giveItem", element, tonumber(itemID), tonumber(itemValue), tonumber(darab), 0)
end

function takeAllItem( element, itemID, itemErtek )
	return call( getResourceFromName( "san_items" ), "osszesItemEltavolitas", element, itemID, itemErtek )
end

function takeItem( element, itemID, itemValue )
	return call( getResourceFromName( "san_items" ), "eltavolitasKonverzio", element, itemID, itemValue )
end

function takeItemIndex( element, itemIndex )
	return call( getResourceFromName( "san_items" ), "jatekosItemEltavolitas", element, itemIndex )
end

function updateItemValue( element, itemIndex, itemValue )
	return call( getResourceFromName( "san_items" ), "globalErtekModositas", element, itemIndex, itemValue )
end

function getItems ( element )
	return call( getResourceFromName( "san_items" ), "getJatekosItemek", element )
end

function RemovePlayerDutyItems ( element )
	return call( getResourceFromName( "san_items" ), "RemovePlayerDutyItems", element )
end

function deleteItem( element, itemID )
	return call( getResourceFromName( "san_items" ), "deleteItem", element, tonumber(itemID))
end