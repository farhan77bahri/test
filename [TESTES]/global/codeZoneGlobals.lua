gezn = getElementZoneName

local cache = { [true] = {}, [false] = {} }

function getElementZoneName( element, citiesonly )
	if citiesonly ~= true and citiesonly ~= false then citiesonly = false end

	if getElementDimension( element ) >= 19000 then
		local vehicle = exports.pool:getElement( "vehicle", getElementDimension( element ) - 20000 )
		if vehicle then
			return ( getElementZoneName( vehicle, citiesonly ) or "?" ) .. " [" .. getVehicleName( vehicle ) .. "]"
		end
	elseif not cache[citiesonly][ getElementDimension( element ) ] then
		name = ''
		if getElementDimension( element ) > 0 then
			if citiesonly then
				local parent = exports['san_interior']:findParent( element )
				if parent then
					name = getElementZoneName( parent, citiesonly, true )
				end
			else
				local dimension, entrance = exports['san_interior']:findProperty( element )
				if entrance then
					name = getElementData( entrance, 'name' )
				end
			end
			cache[citiesonly][ getElementDimension( element ) ] = name
		else
			name = gezn( element, citiesonly ), gezn( element, not citiesonly )
		end
		
		return name
	else
		return cache[citiesonly][ getElementDimension( element ) ]
	end
end