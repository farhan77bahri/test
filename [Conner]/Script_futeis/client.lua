setBirdsEnabled(false)
setAmbientSoundEnabled("gunfire", false)
setOcclusionsEnabled(false)
setBlurLevel(0)

-- converter Segundos em H M S Root 
------------------------------------->

function isBoolean(date)
	if date == true or date == false or date == nil then
		return true
	else
		return false
	end
end

-- Number Check
------------------------>>
function isNumber(date)
	if not isBoolean(date) then
		local date = tonumber(date)
		if date >= 0 or date <= 0 then
			return true
		else
			return false
		end
	else
		return false
	end
end


--GPS

function findRotation(x1,y1,z1,x2,y2,z2)
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end
  local roty = 90+(math.deg(math.asin((z2 - z1) / getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2))))
  return roty,t-90
end

function ArrowRender()
	local coordenada = getElementData(localPlayer,"Player:GPS:cordenada") or nil
	if coordenada ~= false and coordenada ~= true and coordenada ~= nil and isElement(Arrow) then
		local type = tostring(coordenada[1])
		pass = false
		if type == "Coordenada" then
			lx,ly,lz = tonumber(coordenada[2]),tonumber(coordenada[3]),tonumber(coordenada[4])
			if isNumber(lx) then
				pass = true
			end
		end
		if type == "Player" then
			local player = getPlayerFromName(tostring(coordenada[2]))
			if isElement(player) and getElementType(player) == "player" then
				lx,ly,lz = getElementPosition(player)	
				if isNumber(lx) then
					pass = true
				end	
			end
		end
		if pass == false then cancelRender() return end
		if getPedOccupiedVehicle(localPlayer) then
			tx,ty,tz = getElementPosition(getPedOccupiedVehicle(localPlayer))
			local roty,rotz = findRotation(tx,ty,tz,lx,ly,lz)
			if isElement(Arrow) then
				setElementPosition(Arrow, tx, ty, tz+2)
				setElementRotation(Arrow, 0, roty, rotz)
			end
		else
			tx,ty,tz = getElementPosition(localPlayer)
			local roty,rotz = findRotation(tx,ty,tz,lx,ly,lz)
			if isElement(Arrow) then
				setElementPosition(Arrow, tx, ty, tz+1.15)
				setElementRotation(Arrow, 0, roty, rotz)
			end
		end



		if getDistanceBetweenPoints3D(tx,ty,tz,lx,ly,lz) < 2 then 
			cancelRender()
			--exports.Script_Textos:createNewDxMessage("Você chegou no seu destino!", 255, 255, 255)
		end		
	end
end
addEventHandler("onClientPreRender", getRootElement(), ArrowRender)

function cancelRender()
	if isElement(blip) then destroyElement(blip) end
	if isElement(Arrow) then destroyElement(Arrow) end
	setElementData(localPlayer,"Player:GPS:cordenada",nil)
end
addCommandHandler("parargps",cancelRender)

function setGPS(type,x,y,z)
	if tostring(type) == "Player" then
		local player = getPlayerFromName(x)
		if isElement(player) then
			setElementData(localPlayer,"Player:GPS:cordenada",{type,x,0,0})
			if isElement(blip) then
				destroyElement(blip)
			end			
			blip = createBlipAttachedTo(player,41,1,255,255,255,255,0,9999)
		end
	end
	if tostring(type) == "Coordenada" then
		if not isElement(x) then
			setElementData(localPlayer,"Player:GPS:cordenada",{type,x,y,z})
			if isElement(blip) then
				destroyElement(blip)
			end
			blip = createBlip(x,y,z,41,1,255,255,255,255,0,9999)
		end
	end	
	if isElement(Arrow) then
		destroyElement(Arrow)
	end
	local rx,ry,rz = getElementPosition(localPlayer)
	Arrow = createObject(1318,rx,ry,rz)	
	setElementCollisionsEnabled(Arrow,false)
end
addEvent("Futeis>GPS>Server", true)
addEventHandler("Futeis>GPS>Server", root, setGPS)



function gpspos(cmd,x,y,z)
	if isNumber(x) and isNumber(x) and isNumber(z) then 
		setGPS("Coordenada",x,y,z)
	end
end
addCommandHandler("gps",gpspos)

function clearChat()
    local lines = getChatboxLayout()["chat_lines"]
	for i=1,lines do
	outputChatBox(" ")
	end
end
addEvent("trigger_clearChat", true)
addEventHandler("trigger_clearChat", root, clearChat)


-->> Arredonda  numeros ex 5,513156 para 5, numdpsdavirgula
function arredondar(numero, numdpsdavirgula)
  local mult = 10^(numdpsdavirgula or 0)
  return math.floor(numero * mult + 0.5) / mult
end

-->> Converter cor 
function RGBToHex(rgb)
	local hexadecimal = '#'

	for key, value in pairs(rgb) do
	local hex = ''

	while(tonumber(value) > 0)do
	local index = math.fmod(tonumber(value), 16) + 1
	value = math.floor(tonumber(value) / 16)
	hex = string.sub('0123456789ABCDEF', index, index) .. hex			
	end

	if(string.len(hex) == 0)then
	hex = '00'

	elseif(string.len(hex) == 1)then
	hex = '0' .. hex
	end

	hexadecimal = hexadecimal .. hex
	end

	return hexadecimal
end

