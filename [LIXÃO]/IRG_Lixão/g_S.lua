Marker_Fabricante = {}
Markers_Fabricantes = 
 {   
   {2182.8818359375, -1981.4375, 13.551666259766},
   {2185.4755859375, -1980.0513916016, 13.552004814148},
   {2183.177734375, -1978.2416992188, 13.552446365356},
   {2180.5122070313, -1977.7666015625, 13.552562713623},
   {2172.2863769531, -1984.005859375, 13.551038742065},
   {2181.0529785156, -1983.6256103516, 13.551132202148},
   {2191.4182128906, -1979.8720703125, 13.552048683167},
   {2191.4182128906, -1976.5894775391, 13.552849769592},
   {2187.3374023438, -1977.1407470703, 13.552715301514},
 }
 
 local Lixao = createBlip(2180.2421875, -1985.0357666016, 13.55078792572, 7)
 setElementData(Lixao ,"blip >> name", "Lixão")
 setBlipVisibleDistance(Lixao, 100)

function Gerar_Fabricante ()
	for i, markers in ipairs ( Marker_Fabricante ) do
		if isElement ( markers ) then destroyElement ( markers ) end
	end
	for i, v in ipairs ( Markers_Fabricantes ) do
		Marker_Fabricante[i] = createMarker ( v[1], v[2], v[3]-1, "cylinder", 1.5, 65, 105, 225, 0)			
		setElementData(Marker_Fabricante[i], "Marker_Fabricante", true)
		setElementVisibleTo ( Marker_Fabricante[i], root, false )
        setElementDimension(Marker_Fabricante[i], 0)
        setElementInterior(Marker_Fabricante[i], 0)		
	end	
	for ins, Player in ipairs(getElementsByType("player")) do
		local Emprego = getElementData ( Player, "char.jobID" )	
		for i, M_Fabricante in ipairs ( Marker_Fabricante ) do
			setElementVisibleTo ( M_Fabricante, Player, true )		
		end
	end
end

Gerar_Fabricante ()
setTimer(function()
	Gerar_Fabricante ()
end, 10000, 0)

local valores = {88,148,90,25,88,88,10,159,10,148,90,176,88,148,90,25,88,88,10,159,10,148,90,88,10,155,88,148,90,25,88,88,10,159,10,148,90,88,148,90,25,88,88,10,159,10,148,90,88,10,155,88,148,90,25,88,88,10,159,10,148,90,175,90,25,159,174,88,88,148,90,25,88,88,10,159,10,148,90,173}

function Catar (source)
	local Emprego = getElementData ( source, "char.jobID" )	
	if getElementData(source, "catando") == false then
		for _, Marker in ipairs( getElementsByType 'marker' ) do 
			if getElementData(Marker, "Marker_Fabricante") == true then
				if isElementWithinMarker(source, Marker) then
					if isElement ( Marker ) then destroyElement ( Marker ) end
					triggerClientEvent(source, "INICIO:MONTAR", root)
					setElementData(source, "catando", true)		
						setTimer(function()
                       setElementData(source, "catando", false)
					end, 8000, 1)
				end
			end
		end
	else
		outputChatBox("#4169E1[4i20]: #ffffffAguarde para catar lixo novamente",source, 255,255,255,true)
	end
end
addCommandHandler("catar", Catar)

function Mensagem_Aviso3 (source)
	local Emprego = getElementData ( source, "char.jobID" )	
	if getElementData(source, "catando") == false then
		for _, Marker in ipairs( getElementsByType 'marker' ) do 
			if getElementData(Marker, "Marker_Fabricante") == true then
				if isElementWithinMarker(source, Marker) then
					exports["san_infobox"]:addNotification(source,"Use: /catar para catar o lixo","semsom")
				end
			end
		end
	end
end
addEventHandler("onMarkerHit", root, Mensagem_Aviso3)

addEvent("setPlantAnim2",true)
addEventHandler("setPlantAnim2",getRootElement(),function(p)
	setPedAnimation ( p, "BOMBER","BOM_Plant_2Idle", -1, true, false, false, false)
	setElementFrozen(p, true)
	toggleAllControls(p, false, true, false)
end)

addEvent("offPlantAnim2",true)
addEventHandler("offPlantAnim2",getRootElement(),function(p)
	setPedAnimation ( p, nil,nil)
	setElementFrozen(p, false)
	toggleAllControls(p, true, true, true)
end)


function armarandom1(player, randomitems, ALEATORIO, ALEATORIO)
	exports.san_items:giveItem(player, randomitems, ALEATORIO, ALEATORIO, 1, true)
end
addEvent("itemrandom1", true)
addEventHandler("itemrandom1", getRootElement(), armarandom1)


