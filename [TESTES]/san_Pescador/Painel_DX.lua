
local screenW,screenH = guiGetScreenSize()
local resW,resH = 1366,768
local x,y =  (screenW/resW), (screenH/resH)

local Font_1 = dxCreateFont("font/font.ttf", y*11)
local Font_2 = dxCreateFont("font/font1.ttf", y*11)
local Font_3 = dxCreateFont("font/fontNick.ttf", y*10)
local Font_4 = dxCreateFont("font/OpenSans-Bold.ttf", y*11)

	                               --=================================--
                                   ----------- PED_COMPRADOR -----------
                                   --=================================--	
local Ped_Comprador = createPed(240, 154.21423, -1942.25134, 3.77344)
setPedRotation(Ped_Comprador, 0)
setElementData(Ped_Comprador, "DNL:Comprador", true)
setElementData(Ped_Comprador, "DNL:Anuncio", "Comprador de #00FF00Peixes")
setElementFrozen(Ped_Comprador,true)
	
function Cancel_Damage ()
	cancelEvent() 
end
addEventHandler("onClientPedDamage", Ped_Comprador, Cancel_Damage)

function Ped_Click (_, state)
	if getElementData(Ped_Comprador, "DNL:Comprador") then
		if state == "down" then
			local x, y, z = getElementPosition(getLocalPlayer())
			local wx, wy, wz = getElementPosition(Ped_Comprador)
			if getDistanceBetweenPoints3D(x, y, z, wx, wy, wz) <= 5 then 
				Abrir_Peixaria ()
			end
		end
	end
end
addEventHandler("onClientClick", getRootElement(), Ped_Click)

	                               --===================================--
                                   ----------- ABRIR/FECHAR DX -----------
                                   --===================================--							  
function Abrir_Peixaria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Peixaria) then return end
	Reload_Peixes ()
	showCursor(true)
	ListaPeixes:SetVisible(true)
	addEventHandler("onClientRender", root, Dx_Peixaria)
end
addEvent("DNL:Abrir_Peixaria", true)
addEventHandler("DNL:Abrir_Peixaria", root, Abrir_Peixaria)

function Close_Peixaria ()
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Peixaria) then  
		showCursor(false)
		ListaPeixes:SetVisible(false)
		removeEventHandler("onClientRender", root, Dx_Peixaria)
	end
end

	                               --===================================--
                                   ----------- INTERFACE PAINEL ----------
                                   --===================================--
function Dx_Peixaria ()
		exports["sanBlur"]:dxDrawBluredRectangle(x*508, y*170, x*349, y*356, tocolor(255, 255, 255, 255))
        dxDrawRectangle(x*508, y*170, x*349, y*356, tocolor(0, 0, 0, 170), false)
        dxDrawRectangle(x*508, y*170, x*349, y*34, tocolor(0, 0, 0, 197), false)
        dxDrawLine(x*508, y*203, x*857, y*203, tocolor(16, 111, 231, 255), x*2, false)
        dxDrawText("Peixaria", x*662, y*175, x*704, y*192, tocolor(0,255,0, 255), 1.00, Font_1, "left", "top", false, false, false, false, false)
		
        dxDrawImage(x*524, y*470, x*153, y*43, "Img/botao.png", 0, 0, 0, Cor_Vender, false)
        dxDrawText("Vender", x*580, y*482, x*622, y*499, tocolor(0,0,0, 255), 1.00, Font_2, "left", "top", false, false, false, false, false)
		Cor_Vender = tocolor(16, 111, 231, 150)
	if isCursorOnElement(x*524, y*470, x*153, y*43) then
		Cor_Vender = tocolor(16, 111, 231, 200)
	end
		
        dxDrawImage(x*687, y*470, x*153, y*43, "Img/botao.png", 0, 0, 0, Cor_Fechar, false)
        dxDrawText("Fechar", x*743, y*482, x*782, y*499, tocolor(0,0,0, 255), 1.00, Font_2, "left", "top", false, false, false, false, false)
		Cor_Fechar = tocolor(16, 111, 231, 150)
	if isCursorOnElement(x*687, y*470, x*153, y*43) then
		Cor_Fechar = tocolor(16, 111, 231, 200)
	end
end
--addEventHandler("onClientRender", root, Dx_Peixaria)

addEventHandler("onClientResourceStart", resourceRoot,
  function ()
    ListaPeixes = dxGridW:Create(518, 213, 329, 244)
    ListaPeixes:AddColumn("Peixes - 4i20", 140)
    ListaPeixes:AddColumn("Quantidade", 55)
    ListaPeixes:AddColumn("Valor", 130)
    ListaPeixes:SetVisible(false)	
	Reload_Peixes ()
end)

function Reload_Peixes ()	
	local Pex_Tubarao = tonumber(getElementData(localPlayer, "peixe.Tubarão")) or 0  
	local Pex_Estrela = tonumber(getElementData(localPlayer, "peixe.Estrela do mar")) or 0  
	local Pex_Tilapia = tonumber(getElementData(localPlayer, "peixe.Tilápia")) or 0  
	local Pex_Tucunare = tonumber(getElementData(localPlayer, "peixe.Tucunaré")) or 0  
	local Pex_Carpa = tonumber(getElementData(localPlayer, "peixe.Carpa")) or 0  
	local Pex_Esponja = tonumber(getElementData(localPlayer, "peixe.Esponja")) or 0  
	local Pex_Enguia = tonumber(getElementData(localPlayer, "peixe.Enguia")) or 0  
    ListaPeixes:Clear(true)
	if Pex_Tubarao >= 0 then
        ListaPeixes:AddItem(1,"Tubarão")
	    ListaPeixes:AddItem(2, ""..Pex_Tubarao.."")
	    ListaPeixes:AddItem(3, tostring(100))
	end
	
	if Pex_Estrela >= 0 then
        ListaPeixes:AddItem(1,"Estrela do mar")
	    ListaPeixes:AddItem(2, ""..Pex_Estrela.."")
	    ListaPeixes:AddItem(3, tostring(90))
	end
	
	if Pex_Tilapia >= 0 then
        ListaPeixes:AddItem(1,"Tilápia")
	    ListaPeixes:AddItem(2, ""..Pex_Tilapia.."")
	    ListaPeixes:AddItem(3, tostring(60))
	end
	
	if Pex_Tucunare >= 0 then
        ListaPeixes:AddItem(1,"Tucunaré")
	    ListaPeixes:AddItem(2, ""..Pex_Tucunare.."")
	    ListaPeixes:AddItem(3, tostring(40))
	end
	
	if Pex_Carpa >= 0 then
        ListaPeixes:AddItem(1,"Carpa")
	    ListaPeixes:AddItem(2, ""..Pex_Carpa.."")
	    ListaPeixes:AddItem(3, tostring(30))
	end
	
	if Pex_Esponja >= 0 then
        ListaPeixes:AddItem(1,"Esponja")
	    ListaPeixes:AddItem(2, ""..Pex_Esponja.."")
	    ListaPeixes:AddItem(3, tostring(30))
	end
	
	if Pex_Enguia >= 0 then
        ListaPeixes:AddItem(1,"Enguia")
	    ListaPeixes:AddItem(2, ""..Pex_Enguia.."")
	    ListaPeixes:AddItem(3, tostring(10))
	end
end

	                               --=============================--
                                   ------------- Clicks ------------
                                   --=============================--
function Vender_Peixes ( _,state )
	if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Peixaria) then  
		if state == "down" then
			if isCursorOnElement(x*687, y*470, x*153, y*43) then -- Fechar Peixaria
				Close_Peixaria () 
			elseif isCursorOnElement(x*524, y*470, x*153, y*43) then -- Vender Peixes	
				if ListaPeixes:GetSelectedItem() then
					local Peixe = ListaPeixes:GetItemDetails(1, ListaPeixes:GetSelectedItem())
					local Quantidade = ListaPeixes:GetItemDetails(2, ListaPeixes:GetSelectedItem())
					local Valor = ListaPeixes:GetItemDetails(3, ListaPeixes:GetSelectedItem())
					playSoundFrontEnd(12)
					Reload_Peixes ()
					triggerServerEvent("DNL:Vender_Peixe", root, localPlayer, Peixe, Quantidade, Valor)
				else
					outputChatBox("#7cc576[sanMTA - Fishing] #ffffffSelecione o Peixe que Você Deseja Vender", source, 255, 255, 255, true)	
				end 
			end
		end
	end
end
addEventHandler ( "onClientClick", root, Vender_Peixes )
	     
	                               --=============================--
                                   ------------- IGNORA ------------
                                   --=============================--
--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

function renderIng( )
	local x, y, z = getCameraMatrix( )
	local dimension = getElementDimension( localPlayer )	
	for key, ped in ipairs ( getElementsByType( "ped" ) ) do
		if getElementDimension( ped ) == dimension then
			local px, py, pz = getElementPosition( ped )
			local distance = getDistanceBetweenPoints3D( px, py, pz, x, y, z )
			if distance <= 7 then
				local text = getElementData( ped, "DNL:Anuncio" )	
				if text and ( distance < 2 or isLineOfSightClear( x, y, z, px, py, pz + 1.1, true, true, true, true, false, false, true, localPlayer ) ) then
					local sx, sy = getScreenFromWorldPosition( px, py, pz + 1.1 )
					if sx and sy then
						local w = dxGetTextWidth( tostring( text ) )
						local h = ( text and 2 or 1 ) * dxGetFontHeight( )
						dxDrawText( tostring( text ), sx +30, sy +50, sx, sy, tocolor( 255, 255, 255, 255 ), 1.00, Font_4, "center", "center", false, false, false, true, false )
					end
				end
			end
		end
	end	
end
addEventHandler( "onClientRender", getRootElement( ),renderIng)
								   
--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

addEventHandler("onClientKey", root, 
	function (button, press)
    if isEventHandlerAdded("onClientRender", getRootElement(), Dx_Agencia) then  
			if button == "F1" or button == "F2" or button == "F3" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" or button == "F12" or button == "t" or button == "p" or button == "m" then
				cancelEvent()
			end
		end
	end
)

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-
						  
function isEventHandlerAdded( sEventName, pElementAttachedTo, func )
	if type( sEventName ) == 'string' and isElement( pElementAttachedTo ) and type( func ) == 'function' then
		local aAttachedFunctions = getEventHandlers( sEventName, pElementAttachedTo )
		if type( aAttachedFunctions ) == 'table' and #aAttachedFunctions > 0 then
			for i, v in ipairs( aAttachedFunctions ) do
				if v == func then
					return true
				end
			end
		end
	end
	return false
end

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-

local x,y = guiGetScreenSize()
function isCursorOnElement(x, y, w, h)
	if (not isCursorShowing()) then
		return false
	end
	local mx, my = getCursorPosition()
	local fullx, fully = guiGetScreenSize()
	cursorx, cursory = mx*fullx, my*fully
	if cursorx > x and cursorx < x + w and cursory > y and cursory < y + h then
		return true
	else
		return false
	end
end

--==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-==-