local dxEditBox = {}
local x, y = guiGetScreenSize()
czasPrzesun = getTickCount () 
czasUsun = getTickCount () 
local ms = 0
xck = 0

function createEditBox( id, xS, yS, w, h, widoczny, tekst, zamaskowany, dlugosc, czcionka, spacja, typ, kolor, prostokat, kolorProstokat, skala, clip, ms, tekstBool, tekstPomocniczy, tekstPomocniczyKolor, maZniknac, skalaPomoc, czcionkaPomoc, postGUI, wstawka, kolorWstawki, specjalneZnaki, mozeKliknac)
	if dxEditBox[id] == nil then
		dxEditBox[id] = {}
		dxEditBox[id].x = xS
		dxEditBox[id].y = yS
		dxEditBox[id].w = w
		dxEditBox[id].h = h 
		dxEditBox[id].widoczny = widoczny
		dxEditBox[id].przes = 0
		dxEditBox[id].tekst = tekst
		dxEditBox[id].zamaskowany = zamaskowany
		dxEditBox[id].dlugosc = dlugosc
		dxEditBox[id].czcionka = czcionka
		dxEditBox[id].spacja = spacja
		dxEditBox[id].typ = typ
		dxEditBox[id].kolor = kolor
		dxEditBox[id].kolorProstokat = kolorProstokat
		dxEditBox[id].prostokat = prostokat
		dxEditBox[id].skala = (skala/1280) * x
		dxEditBox[id].clip = clip
		dxEditBox[id].ms = ms
		dxEditBox[id].tekstPomocniczy = tekstPomocniczy
		dxEditBox[id].tekstPomocniczyKolor = tekstPomocniczyKolor
		dxEditBox[id].tekstBool = tekstBool
		dxEditBox[id].maZniknac = maZniknac
		dxEditBox[id].skalaPomoc = (skalaPomoc/1280) * x
		dxEditBox[id].czcionkaPomoc = czcionkaPomoc
		dxEditBox[id].postGUI = postGUI
		dxEditBox[id].wstawka = wstawka
		dxEditBox[id].kolorWstawki = kolorWstawki
		dxEditBox[id].dlugoscDX = 0
		dxEditBox[id].carretPrzesuniety = true
		dxEditBox[id].pozycjaCarretu = 1
		dxEditBox[id].aktywny = false
		dxEditBox[id].start = true
		dxEditBox[id].startCarretu = true
		dxEditBox[id].dlugoscTextuDX = 0
		if mozeKliknac == nil then
			dxEditBox[id].mozeKliknac = true
			else
			dxEditBox[id].mozeKliknac = mozeKliknac
		end	
		if specjalneZnaki == nil then
			dxEditBox[id].specjalneZnaki = false
			else
			dxEditBox[id].specjalneZnaki = specjalneZnaki
		end	
	end
end		

function changeText ( id, text ) 
	if dxEditBox[id] ~= nil then
		if not ( dxEditBox[id].dlugosc == #dxEditBox[id].tekst ) then
			dxEditBox[id].tekst = text
			return true
			else 
			return false
		end
	end
end

function changeVisibility( id, bool ) 
	if dxEditBox[id] ~= nil then
		dxEditBox[id].widoczny = bool
	end
end

function clickable( id, bool ) 
	if dxEditBox[id] ~= nil then
		dxEditBox[id].mozeKliknac = bool
	end
end	

function getText( id ) 
	if dxEditBox[id] ~= nil then
		return dxEditBox[id].tekst 
		else
		return false
	end
end

function setPosition( id, x, y ) 
	if dxEditBox[id] ~= nil then
		dxEditBox[id].x = x
		dxEditBox[id].y = y
	end
end

function setSize( id, w, h ) 
	if dxEditBox[id] ~= nil then
		dxEditBox[id].w = w
		dxEditBox[id].h = h
	end
end

function deleteEditBox( id ) 
	if dxEditBox[id] ~= nil then
		dxEditBox[id] = nil
	end
end

function isActive( id ) 
	if dxEditBox[id] ~= nil then
		return dxEditBox[id].aktywny
	end
end

function changeEditBoxColor ( id, tabelka )
	if dxEditBox[id] ~= nil then
		dxEditBox[id].kolorProstokat = tabelka 
	end
end	

function sprawdzObszar(psx, psy, pssx, pssy)
  if not isCursorShowing() then
    return false
  end
  cx, cy = getCursorPosition()
  cx, cy = cx*x,cy*y
  if cx >= psx and cx <= psx+pssx and cy >= psy and cy <= psy+pssy then
    return true, cx, cy
  else
    return false
  end
end	

function dlugoscTablicy(table)
    local n = 0
    for k, v in pairs(table) do
        n = n + 1
    end
    return n
end

function renderEditBoxow ()
	for k, v in pairs( dxEditBox ) do
		if dxEditBox[k].widoczny then			
			if dxEditBox[k].prostokat then
				dxDrawRectangle(x * (dxEditBox[k].x), y * (dxEditBox[k].y), x * (dxEditBox[k].w), y * (dxEditBox[k].h), tocolor(dxEditBox[k].kolorProstokat[1], dxEditBox[k].kolorProstokat[2], dxEditBox[k].kolorProstokat[3], dxEditBox[k].kolorProstokat[4]), dxEditBox[k].postGUI)
			end
			
			if dxEditBox[k].tekstBool then
				dxDrawText( dxEditBox[k].tekstPomocniczy, x * (dxEditBox[k].x ), y * (dxEditBox[k].y), x * (dxEditBox[k].x + dxEditBox[k].w), y * (dxEditBox[k].y + dxEditBox[k].h), tocolor(dxEditBox[k].tekstPomocniczyKolor[1], dxEditBox[k].tekstPomocniczyKolor[2], dxEditBox[k].tekstPomocniczyKolor[3], dxEditBox[k].tekstPomocniczyKolor[4]), x*(dxEditBox[k].skalaPomoc/1280), dxEditBox[k].czcionkaPomoc, "center", "center", dxEditBox[k].clip, nil, dxEditBox[k].postGUI)
			end
			if dxEditBox[k].zamaskowany == false then
				dxDrawText( dxEditBox[k].tekst, x * (dxEditBox[k].x ), y * (dxEditBox[k].y), x * (dxEditBox[k].x + dxEditBox[k].w), y * (dxEditBox[k].y + dxEditBox[k].h), tocolor(dxEditBox[k].kolor[1], dxEditBox[k].kolor[2], dxEditBox[k].kolor[3], dxEditBox[k].kolor[4]), x*(dxEditBox[k].skala/1280), dxEditBox[k].czcionka, "center", "center", dxEditBox[k].clip, nil, dxEditBox[k].postGUI)
				else
				dxDrawText( dxEditBox[k].tekst:gsub(".","*"), x * (dxEditBox[k].x ), y * (dxEditBox[k].y + dxEditBox[k].h/3), x * (dxEditBox[k].x + dxEditBox[k].w), y * (dxEditBox[k].y + dxEditBox[k].h), tocolor(dxEditBox[k].kolor[1], dxEditBox[k].kolor[2], dxEditBox[k].kolor[3], dxEditBox[k].kolor[4]), x*(dxEditBox[k].skala/1280), dxEditBox[k].czcionka, "center", "center", dxEditBox[k].clip, nil, dxEditBox[k].postGUI)
			end
			if dxEditBox[k].aktywny then
				if dxEditBox[k].wstawka then					
				sekundy = getTickCount() / 400
					if dxEditBox[k].dlugoscDX < ( x * ( dxEditBox[k].x +dxEditBox[k].w-0.004 )) then	
						if dxEditBox[k].start then
						dxDrawRectangle(math.floor(x * (dxEditBox[k].x + dxEditBox[k].w/2)), y * (dxEditBox[k].y+0.005), x * ( 0.002 ), y * ( dxEditBox[k].h * 0.85 ), tocolor( dxEditBox[k].kolorWstawki[1], dxEditBox[k].kolorWstawki[2], dxEditBox[k].kolorWstawki[3], math.abs(math.sin(sekundy) * 190)), dxEditBox[k].postGUI)			
						else
						dxDrawRectangle(math.floor(dxEditBox[k].dlugoscDX), y * (dxEditBox[k].y+0.005), x * ( 0.002 ), y * ( dxEditBox[k].h * 0.85 ), tocolor( dxEditBox[k].kolorWstawki[1], dxEditBox[k].kolorWstawki[2], dxEditBox[k].kolorWstawki[3], math.abs(math.sin(sekundy) * 190)), dxEditBox[k].postGUI)			
						end
					end				
				end
			end
		end	
	end
end	
	
if getKeyState("mouse1") then
	if math.floor(dxEditBox[k].dlugoscTextuDX) >= math.floor(dxEditBox[k].dlugoscDX) + ( x * xck - math.floor(dxEditBox[k].dlugoscDX)) then
		xck = getCursorPosition()
		dxDrawRectangle ( math.floor(dxEditBox[k].dlugoscDX), y * (dxEditBox[k].y+0.005), x * xck - math.floor(dxEditBox[k].dlugoscDX) , y * ( dxEditBox[k].h * 0.85 ), tocolor( 55, 254, 233, 255))
	end
end

local alfabetLacinski = {
["A"] = {true, 0},
["a"] = {true, 0},
["B"] = {true, 0},
["b"] = {true, 0},
["C"] = {true, 0},
["c"] = {true, 0},
["D"] = {true, 0},
["d"] = {true, 0},
["E"] = {true, 0},
["e"] = {true, 0},
["F"] = {true, 0},
["f"] = {true, 0},
["G"] = {true, 0},
["g"] = {true, 0},
["H"] = {true, 0},
["h"] = {true, 0},
["I"] = {true, 0},
["i"] = {true, 0},
["J"] = {true, 0},
["j"] = {true, 0},
["K"] = {true, 0},
["k"] = {true, 0},
["L"] = {true, 0},
["l"] = {true, 0},
["M"] = {true, 0},
["m"] = {true, 0},
["N"] = {true, 0},
["W"] = {true, 0},
["w"] = {true, 0},
["n"] = {true, 0},
["O"] = {true, 0},
["o"] = {true, 0},
["P"] = {true, 0},
["p"] = {true, 0},
["Q"] = {true, 0},
["q"] = {true, 0},
["R"] = {true, 0},
["r"] = {true, 0},
["S"] = {true, 0},
["s"] = {true, 0},
["T"] = {true, 0},
["t"] = {true, 0},
["U"] = {true, 0},
["u"] = {true, 0},
["V"] = {true, 0},
["v"] = {true, 0},
["X"] = {true, 0},
["x"] = {true, 0},
["Y"] = {true, 0},
["y"] = {true, 0},
["Z"] = {true, 0},
["z"] = {true, 0},
["1"] = {true, 1},
["2"] = {true, 1},
["3"] = {true, 1},
["4"] = {true, 1},
["5"] = {true, 1},
["6"] = {true, 1},
["7"] = {true, 1},
["8"] = {true, 1},
["9"] = {true, 1},
["0"] = {true, 1},
[" "] = {true, 4},
[","] = {true, 2},
["/"] = {true, 2},
["="] = {true, 2},
["?"] = {true, 2},
["."] = {true, 2},

}


function zmienWartoscEditBoxa(string)
if alfabetLacinski[string] then
	if alfabetLacinski[string][1] then
		for k, v in pairs( dxEditBox ) do 
			if dxEditBox[k].aktywny then
			dxEditBox[k].start = false
				if not ( dxEditBox[k].dlugosc == #dxEditBox[k].tekst ) then
					if string == " " then
						if (dxEditBox[k].spacja) then
							if not ( #dxEditBox[k].tekst == 0 ) then
								string = " "
							else
								string = ""
							end
						else
						string = ""
						end
					end	
					if dxEditBox[k].typ == 1 then
						if dxEditBox[k].specjalneZnaki == true then
							if alfabetLacinski[string][2] == 2 then
								else
									return
								end
							end
							if alfabetLacinski[string][2] == 1 then
							partSubString = dxEditBox[k].tekst:sub( 1, dxEditBox[k].pozycjaCarretu )
							partSubStringEdit = dxEditBox[k].tekst:sub( dxEditBox[k].pozycjaCarretu + 1, #dxEditBox[k].tekst )
							dxEditBox[k].tekst = partSubString ..string..partSubStringEdit
							dxEditBox[k].pozycjaCarretu = dxEditBox[k].pozycjaCarretu + 1
							--outputChatBox('hu')
							if dxEditBox[k].zamaskowany then
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, true )
							else
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, false )
							end
							
						end
					else
					if dxEditBox[k].typ == 0 then
					else
						return
					end
					if alfabetLacinski[string][2] == 2 then
						if dxEditBox[k].specjalneZnaki == true then
							else
								return
							end
						end
					partSubString = dxEditBox[k].tekst:sub( 1, dxEditBox[k].pozycjaCarretu )
					partSubStringEdit = dxEditBox[k].tekst:sub( dxEditBox[k].pozycjaCarretu + 1, #dxEditBox[k].tekst )
					dxEditBox[k].tekst = partSubString ..string..partSubStringEdit
					dxEditBox[k].pozycjaCarretu = dxEditBox[k].pozycjaCarretu + 1
					if dxEditBox[k].zamaskowany then
						dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, true )
							else
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, false )
							end
						end
					end	
				end
			end
		end
	end
end

function zwrocWartoscPrzesuniecia ( k, bool ) 
	if bool ~= true then
	local maxCarret = math.floor(x * (dxGetTextWidth( dxEditBox[k].tekst, dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
	local pozycjaTekstuDX = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )+0.001  ))
	dxEditBox[k].dlugoscTextuDX = pozycjaTekstuDX
	dxEditBox[k].maxTextDX = maxCarret
	return  math.abs(math.floor(x * ((dxGetTextWidth( dxEditBox[k].tekst, dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstuDX))
		else
		local maxCarret = math.floor(x * (dxGetTextWidth( (dxEditBox[k].tekst:gsub(".","*")), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
		local pozycjaTekstuDX = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )+0.001  ))
		dxEditBox[k].dlugoscTextuDX = pozycjaTekstuDX
		dxEditBox[k].maxTextDX = maxCarret
		return  math.abs(math.floor(x * ((dxGetTextWidth( dxEditBox[k].tekst:gsub(".","*"), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstuDX))
	end
end



function zwrocWartoscPrzesunieciaAktywnego ( k, bool ) 
	if bool ~= true then
	local maxCarret = math.floor(x * (dxGetTextWidth( dxEditBox[k].tekst, dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
	local pozycjaTekstuDX = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )+0.001  ))
	dxEditBox[k].dlugoscTextuDX = pozycjaTekstuDX
	dxEditBox[k].maxTextDX = maxCarret
	return  math.abs(math.floor(x * ((dxGetTextWidth( (dxEditBox[k].tekst:sub( 1, dxEditBox[k].pozycjaCarretu)), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstuDX))
		else
		local maxCarret = math.floor(x * (dxGetTextWidth(( dxEditBox[k].tekst:gsub(".","*")), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
		local pozycjaTekstuDX = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )+0.001  ))
		dxEditBox[k].dlugoscTextuDX = pozycjaTekstuDX
		dxEditBox[k].maxTextDX = maxCarret
		return  math.abs(math.floor(x * ((dxGetTextWidth( ((dxEditBox[k].tekst:sub( 1, dxEditBox[k].pozycjaCarretu)):gsub(".","*")), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstuDX))
	end
end

function klikniecieEditBoxa(przycisk, stan)
	if przycisk == "left" and stan == "down" then
		for k, v in pairs( dxEditBox ) do 
		dxEditBox[k].aktywny = false 
		if dxEditBox[k].tekstPomocniczyKopia ~= nil then
			if #dxEditBox[k].tekst == 0 then
			dxEditBox[k].tekstPomocniczy = dxEditBox[k].tekstPomocniczyKopia
			end
		end
			if dxEditBox[k].widoczny then
				if dxEditBox[k].mozeKliknac then
					else
					return
				end
				if sprawdzObszar( x * dxEditBox[k].x, y * dxEditBox[k].y, x * dxEditBox[k].w, y * dxEditBox[k].h ) then
					if dxEditBox[k].aktywny == false then
						dxEditBox[k].aktywny = true
						ms = dxEditBox[k].ms					
						if dxEditBox[k].zamaskowany then
							maxCarret = math.floor(x * (dxGetTextWidth( (dxEditBox[k].tekst:sub(1, #dxEditBox[k].tekst)):gsub(".","*"), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
							pozycjaTekstu = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )  ))
						else
							maxCarret = math.floor(x * (dxGetTextWidth( dxEditBox[k].tekst:sub(1, #dxEditBox[k].tekst), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))
							pozycjaTekstu = math.floor ( x * ( (dxEditBox[k].x + dxEditBox[k].w/2 - (maxCarret/2)/1280 )  ))
						end
						for i = 0, #dxEditBox[k].tekst do
						dxEditBox[k].startCarretu = false
						dxEditBox[k].carretPrzesuniety = false
							if dxEditBox[k].zamaskowany then
								pozycjaCarretu = math.abs(math.floor(x * ((dxGetTextWidth( (dxEditBox[k].tekst:sub(1, i)):gsub(".","*"), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstu))
								else
									pozycjaCarretu = math.abs(math.floor(x * ((dxGetTextWidth( dxEditBox[k].tekst:sub(1, i), dxEditBox[k].skala, dxEditBox[k].czcionka )/1280))+pozycjaTekstu))
								end
								local cX = getCursorPosition ()
								if ( math.abs(math.floor ( x * cX ) - pozycjaCarretu) ) <= 10 then
								dxEditBox[k].dlugoscDX = pozycjaCarretu
								dxEditBox[k].pozycjaCarretu = i								
								break
							end
						end
						if dxEditBox[k].maZniknac then
							if dxEditBox[k].tekstPomocniczy ~= "" then
							dxEditBox[k].tekstPomocniczyKopia = dxEditBox[k].tekstPomocniczy
							end
						dxEditBox[k].tekstPomocniczy = ""
						end
					end
				end
			end
		end
	end
end	

czasPrzesun = false
czasUsun = false

function usunString ()
	obecne = getTickCount()
	if getKeyState("arrow_l") or getKeyState("arrow_r" ) then
		if not czasPrzesun then
		czasPrzesun = getTickCount () 
		end
		if (( obecne - czasPrzesun ) >= 70 ) then
			czasPrzesun = false
			for k, v in pairs( dxEditBox ) do 
				if dxEditBox[k].aktywny then
					if getKeyState("arrow_l") then
						if (dxEditBox[k].pozycjaCarretu - 1) >= 0 then
							dxEditBox[k].pozycjaCarretu = dxEditBox[k].pozycjaCarretu - 1
							if dxEditBox[k].zamaskowany then
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, true )
							else
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, false )
							end
							break
						end
						else
						if getKeyState("arrow_r") then
							if (dxEditBox[k].pozycjaCarretu + 1) <= #dxEditBox[k].tekst then
							dxEditBox[k].pozycjaCarretu = dxEditBox[k].pozycjaCarretu + 1
							if dxEditBox[k].zamaskowany then
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, true )
							else
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, false )
							end
							break
							end
						end
					end	
				end
			end	
		end
	end
	if getKeyState("backspace") then
		if not czasUsun then
		czasUsun = getTickCount () 
	end
	if (( obecne - czasUsun ) >= ms ) then
		for k, v in pairs( dxEditBox ) do 
			if dxEditBox[k].aktywny then
				if not ( #dxEditBox[k].tekst == 0 ) then
					if getKeyState("backspace") then
						if dxEditBox[k].pozycjaCarretu ~= 0 then
							if dxEditBox[k].startCarretu == false then
							dxEditBox[k].tekstSUB = dxEditBox[k].tekst:sub( 1, dxEditBox[k].pozycjaCarretu-1 )
							dxEditBox[k].tekst = dxEditBox[k].tekstSUB..dxEditBox[k].tekst:sub( dxEditBox[k].pozycjaCarretu + 1) 
							czasUsun = false
							else
							dxEditBox[k].tekst = dxEditBox[k].tekst:sub( 0, -2) 
							czasUsun = false
							end
								dxEditBox[k].pozycjaCarretu = dxEditBox[k].pozycjaCarretu - 1
								czasUsun = false
						end
						if dxEditBox[k].carretPrzesuniety then
							if dxEditBox[k].zamaskowany then
							dxEditBox[k].dlugoscDX = zwrocWartoscPrzesuniecia ( k, true )
							else
							dxEditBox[k].dlugoscDX = zwrocWartoscPrzesuniecia ( k, false )
							end
							else
							if dxEditBox[k].zamaskowany then
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, true )
							else
								dxEditBox[k].dlugoscDX = zwrocWartoscPrzesunieciaAktywnego ( k, false )
							end
						end
						break
						end
					end
				end
			end
		end
	end
end	

function dodajHandlery ( )
	addEventHandler( "onClientPreRender", root, renderEditBoxow )
	addEventHandler( "onClientClick", root, klikniecieEditBoxa )
	addEventHandler( "onClientCharacter", root, zmienWartoscEditBoxa ) 
	addEventHandler('onClientPreRender', root, usunString)
end
addEventHandler("onClientResourceStart", resourceRoot, dodajHandlery )