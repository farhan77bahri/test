
-------------------------------------------------

local screenW, screenH = guiGetScreenSize()
local resW, resH = 1366, 768
local x, y = (screenW/resW), (screenH/resH)

InteriorDP = 0
DimensaoDP = 0

AirNew_Marker_Prisao = createMarker ( 1582.6306152344, -1650.8499755859, 12.179698944092, "cylinder", 3.2, 0, 0, 0, 0 )
setElementInterior ( AirNew_Marker_Prisao, InteriorDP )
setElementDimension ( AirNew_Marker_Prisao, DimensaoDP )

function Jogador_na_Prisao ( player )
	return isElementWithinMarker ( player, AirNew_Marker_Prisao )
end

Policial_Atirar = {}
Timer_Policial_Atirar = {}

function Resetar_AgressaoPolicial ( cop )
	if Policial_Atirar[cop] and Policial_Atirar[cop] == true then
		Policial_Atirar[cop] = false	
	end 
end

Abrir_Fechar_Prender = "F9"

function Mensagens_Exports ( source, msg )
    triggerServerEvent ( "AirNewSCR_Mensagens_Exports", getRootElement(), source, msg )
end

addEventHandler("onClientPreRender", root,
function ( )
	local Policial = getElementData ( localPlayer, "Policia:Captura" )
	if isElement ( Policial ) then
		if isPedInVehicle ( Policial ) then
			statecop = true
		else
			statecop = false
		end
		if isPedInVehicle ( localPlayer ) then
			statecriminal = true
		else
			statecriminal = false
		end		
		if statecop ~= statecriminal then
			if statecop == true then
				local vh = getPedOccupiedVehicle ( Policial )
				if isElement ( vh ) then
					local passengers = getVehicleMaxPassengers ( vh )
					for seat = 0, passengers do
						if seat > 0 and not getVehicleOccupant ( vh, seat ) then
							triggerServerEvent ( "AirNewSCR_TeleportarVeiculo", localPlayer, true, localPlayer, vh, seat )
							break
						end
					end				
				end
			else
				triggerServerEvent("AirNewSCR_TeleportarVeiculo", localPlayer,false, localPlayer , vhw , 0)
			end
		end
		local copX, copY, copZ = getElementPosition ( Policial )
		local PrisonerX, PrisonerY, PrisonerZ = getElementPosition ( localPlayer )
		
		local copInt = getElementInterior ( Policial )
		local prisonerInt = getElementInterior ( localPlayer )
		if copInt ~= prisonerInt and not isTimer ( intTimer ) then
			intTimer = setTimer ( function ( ) end, 3000, 1 )
			triggerServerEvent ( "AirNewSCR_TeleportarPlayer", localPlayer, localPlayer, "INT", copInt, copX, copY, copZ )
		end
		
		local copDim = getElementDimension ( Policial )
		local prisonerDim = getElementDimension ( localPlayer )
		if copDim ~= prisonerDim and not isTimer ( dimTimer ) then
			dimTimer = setTimer(function() end, 3000, 1)
			triggerServerEvent ( "AirNewSCR_TeleportarPlayer", localPlayer, localPlayer, "DIM", copDim, copX+0.1, copY+0.1, copZ+0.5)
		end
		local Distancia_Policial_Capturado = getDistanceBetweenPoints3D ( copX, copY, copZ, PrisonerX, PrisonerY, PrisonerZ )
		if Distancia_Policial_Capturado > 20 then
			if not isTimer ( Muito_Longe_do_Policial ) then
				triggerServerEvent ( "AirNewSCR_TeleportarPlayer", localPlayer, localPlayer, false, false, copX+1, copY+1, copZ )
				setPedControlState ( "forwards", false )
				setPedControlState ( "walk", false )
				setPedControlState ( "sprint", false )
				Muito_Longe_do_Policial = setTimer ( function ( ) end, 3000, 1 )
			end
		elseif Distancia_Policial_Capturado > 10 then
			setPedControlState ( "forwards", true )
			setPedControlState ( "sprint", true )
			setPedControlState ( "walk", false )
		elseif Distancia_Policial_Capturado > 3 then
			setPedControlState ( "forwards", true )
			setPedControlState ( "sprint", false )
			setPedControlState ( "walk", false )
		elseif Distancia_Policial_Capturado > 2 then
			setPedControlState ( "forwards", true )
			setPedControlState ( "sprint", false )
			setPedControlState ( "walk", true )
		elseif Distancia_Policial_Capturado > 1 then
			setPedControlState ( "forwards", false )
			setPedControlState ( "walk", false )
			setPedControlState ( "sprint", false )
		end
		setPedRotation ( localPlayer, 360-math.deg(math.atan2((copX-PrisonerX), (copY-PrisonerY))) % 360 )
		setCameraTarget ( localPlayer )
	end
end)

function AbrirFechar_Prisao ( )
    if getElementData ( localPlayer, "AirNew_Perm_Prender" ) == "Sim" then
        if guiGetVisible ( AirNew_Painel_Prender ) == false then
		    if getElementData ( localPlayer, "AirNewSCR_PrisaoArea" ) == "Sim" then
		    	showCursor ( true )
		    	guiSetVisible ( AirNew_Painel_Prender, true )
		    	AtualizarListaDeNicks ()
				SetarNaLista ()
		   		playSoundFrontEnd ( 43 )
			end
	    else
		    showCursor ( false )
		    guiSetVisible ( AirNew_Painel_Prender, false )
		    playSoundFrontEnd ( 40 )
	    end
	end
end
bindKey ( Abrir_Fechar_Prender, "down", AbrirFechar_Prisao )

addEventHandler("onClientResourceStart", getResourceRootElement(),
function()
	guiSetInputMode("no_binds_when_editing")
end)

AirNew_Painel_Prender = guiCreateWindow((screenW - 535) / 2, (screenH - 362) / 2, 535, 362, "Panel Zendan - Belle~Ville ("..Abrir_Fechar_Prender..")", false)
guiWindowSetSizable(AirNew_Painel_Prender, false)
guiSetAlpha(AirNew_Painel_Prender, 0.70)
guiSetVisible ( AirNew_Painel_Prender, false )

AirNew_Gridlist_Prender = guiCreateGridList(19, 37, 184, 299, false, AirNew_Painel_Prender)
AirNew_Gridlist_Prender_Coluna = guiGridListAddColumn(AirNew_Gridlist_Prender, "Jogadores", 0.9)
	
AirNew_Gridlist_Tempo = guiCreateGridList(226, 97, 289, 113, false, AirNew_Painel_Prender)
AirNew_Gridlist_Tempo_Coluna = guiGridListAddColumn(AirNew_Gridlist_Tempo, "Tempo", 0.9)
	
AirNew_Label_Motivo = guiCreateLabel(228, 218, 287, 15, "Dalil Zendani Kardan", false, AirNew_Painel_Prender)
guiLabelSetHorizontalAlign(AirNew_Label_Motivo, "center", false)
guiLabelSetVerticalAlign(AirNew_Label_Motivo, "center")
AirNew_Edit_Motivo = guiCreateEdit(226, 237, 289, 34, "", false, AirNew_Painel_Prender)

AirNew_Edit_SMHD = guiCreateEdit(226, 56, 289, 34, tonumber("0"), false, AirNew_Painel_Prender)
AirNew_Label_SMHD = guiCreateLabel(228, 37, 287, 15, "Player Ra Entekhab Va Zamane Jail Ra Type Kon!", false, AirNew_Painel_Prender)
guiLabelSetHorizontalAlign(AirNew_Label_SMHD, "center", false)
guiLabelSetVerticalAlign(AirNew_Label_SMHD, "center")
	
AirNew_Botao_Prender = guiCreateButton(236, 288, 127, 48, "OK", false, AirNew_Painel_Prender)
guiSetProperty(AirNew_Botao_Prender, "NormalTextColour", "FF17FE00")
	
AirNew_Botao_Fechar = guiCreateButton(378, 288, 127, 48, "Cancel", false, AirNew_Painel_Prender)
guiSetProperty(AirNew_Botao_Fechar, "NormalTextColour", "FFFD0000")

function AtualizarListaDeNicks ()
guiGridListClear ( AirNew_Gridlist_Prender )
	for index, player in ipairs ( getElementsByType ( "player" ) ) do
	    Lista_AirNew = guiGridListAddRow ( AirNew_Gridlist_Prender )
		local x, y, z = getElementPosition ( localPlayer) -- Eu
        local x1, y1, z1 = getElementPosition ( player ) -- Jogadores Proximos
        local Distancia = getDistanceBetweenPoints3D ( x, y, z, x1, y1, z1 )
		if Distancia <= 5 then
		    guiGridListSetItemText ( AirNew_Gridlist_Prender, Lista_AirNew, AirNew_Gridlist_Prender_Coluna, (string.gsub ( getPlayerName(player), '#%x%x%x%x%x%x', '' ) or getPlayerName(player)), false, false)
		    guiGridListSetItemData ( AirNew_Gridlist_Prender, Lista_AirNew, AirNew_Gridlist_Prender_Coluna, getPlayerName(player) )
		end
	end
end
addEventHandler ( "onClientPlayerJoin", getRootElement(), AtualizarListaDeNicks )
addEventHandler ( "onClientPlayerQuit", getRootElement(), AtualizarListaDeNicks )
addEventHandler ( "onClientResourceStart", getRootElement(), AtualizarListaDeNicks )
addEventHandler ( "onClientPlayerChangeNick", getRootElement(), AtualizarListaDeNicks )

function SetarNaLista ()
    guiGridListClear ( AirNew_Gridlist_Tempo )
    local components = { "Saniye", "Daghighe", "Sa.at", "Roz" }
    for _, component in ipairs( components ) do
        ListaAnimF = guiGridListAddRow ( AirNew_Gridlist_Tempo )
        guiGridListSetItemText ( AirNew_Gridlist_Tempo, ListaAnimF, AirNew_Gridlist_Tempo_Coluna, component, false, false)
        guiGridListSetItemData ( AirNew_Gridlist_Tempo, ListaAnimF, AirNew_Gridlist_Tempo_Coluna, component)
    end
end
addEventHandler ( "onClientResourceStart", getRootElement(), SetarNaLista )

function AirNew_Clicar_Botoes ()
    if guiGetVisible ( AirNew_Painel_Prender ) == true then
	    if getElementData ( localPlayer, "AirNew_Perm_Prender" ) == "Sim" then
	        if source == AirNew_Botao_Prender then
			    local Jogador_Selecionado = guiGridListGetItemData( AirNew_Gridlist_Prender, guiGridListGetSelectedItem ( AirNew_Gridlist_Prender ), 1 ) or nil
				local SMHD_Selecionado = tonumber( guiGetText ( AirNew_Edit_SMHD ) ) or nil
				local Tempo_Selecionado = guiGridListGetItemData( AirNew_Gridlist_Tempo, guiGridListGetSelectedItem ( AirNew_Gridlist_Tempo ), 1 ) or nil
				local Motivo_Prisao = guiGetText ( AirNew_Edit_Motivo ) or nil
				if Jogador_Selecionado == nil then
				    return outputChatBox ( "Erro: Selecione um Jogador para Prender!", 255, 255, 255, true )
				end
				if SMHD_Selecionado == tonumber("0") or SMHD_Selecionado == nil then
				    return outputChatBox ( "Erro: Zaman Jail Ra Moshakhas Kon!", 255, 255, 255, true )
				end
				if Tempo_Selecionado == nil then
				    return outputChatBox ( "Erro: Selecione um Tempo (Seg, Min etc) para Prender o Jogador!", 255, 255, 255, true )
				end
				if Motivo_Prisao == "" or Motivo_Prisao == nil then
				    return outputChatBox ( "Erro: Informe o Motivo da Prisão Corretamente para Prender o Jogador!", 255, 255, 255, true )
				end
				local Converter_Jogador = getPlayerFromName ( Jogador_Selecionado )
				if Converter_Jogador == localPlayer then
				    return outputChatBox ( "Erro: Você não pode Prender você mesmo!", 255, 255, 255, true )
				end
		        local x, y, z = getElementPosition ( localPlayer ) -- Eu
                local x1, y1, z1 = getElementPosition ( Converter_Jogador ) -- Jogadores Proximos
                local Distancia = getDistanceBetweenPoints3D ( x, y, z, x1, y1, z1 )
		        if Distancia > 15 then
		            return outputChatBox ( "Erro: Chegue mais Proximo do Jogador para Prende-lo!", 255, 255, 255, true )
		        end
				triggerServerEvent ( "AirNew_Enviar_Prisao", getLocalPlayer(), Jogador_Selecionado, SMHD_Selecionado, Tempo_Selecionado, Motivo_Prisao )
			    if guiGetVisible ( AirNew_Painel_Prender ) == true then
		            AbrirFechar_Prisao ()
			    end
			elseif source == AirNew_Botao_Fechar then
			    if guiGetVisible ( AirNew_Painel_Prender ) == true then
		            AbrirFechar_Prisao ()
			    end
			end
		end
	end
end
addEventHandler ( "onClientGUIClick", getRootElement(), AirNew_Clicar_Botoes )

function Verificar_Fuga ( )
	if isElementWithinMarker ( localPlayer, AirNew_Marker_Prisao ) and getElementData ( localPlayer, "AirNew_Preso" ) == "Não" then
	    if isPedInVehicle ( localPlayer ) then
			triggerServerEvent ( "AirNewSCR_Remover_Jogador_Veiculo", localPlayer, localPlayer )
		end
	    setElementPosition ( localPlayer, 1542.2760009766, -1634.1373291016, 13.546875 )
		setElementInterior ( localPlayer, 0 )
		setElementDimension ( localPlayer, 0 )
	    setElementRotation ( localPlayer, 0, 0, 90 )
		setTimer ( setCameraTarget, 50, 1, localPlayer )
	elseif not isElementWithinMarker ( localPlayer, AirNew_Marker_Prisao ) and getElementData ( localPlayer, "AirNew_Preso" ) == "Sim" then
	    if isPedInVehicle ( localPlayer ) then
		    triggerServerEvent ( "AirNewSCR_Remover_Jogador_Veiculo", localPlayer, localPlayer )
		end
		setElementPosition ( localPlayer, 1582.6306152344, -1650.8499755859, 12.179698944092 )
		setElementInterior ( localPlayer, InteriorDP )
		setElementDimension ( localPlayer, DimensaoDP )
	    setElementRotation ( localPlayer, 0, 0, 270 )
		setTimer ( setCameraTarget, 50, 1, localPlayer )
    end
end
setTimer ( Verificar_Fuga, 50, 0 )

function CronometroPrisao ()
    if getElementData ( localPlayer, "AirNew_Preso" ) == "Sim" then
        Tempo_Preso = getElementData ( localPlayer, "AirNew_Tempo_Prisao" ) or 0
	    if tonumber ( Tempo_Preso ) > 0 then
		    Tempo_Preso = Tempo_Preso - 1
		    setElementData ( localPlayer, "AirNew_Tempo_Prisao", tonumber(Tempo_Preso))
		    local horas_seg = 3600
		    local hora = math.floor(Tempo_Preso/horas_seg)
		    local minuto = math.floor((Tempo_Preso-(horas_seg*hora))/60)
		    local segundo = math.floor((Tempo_Preso-(horas_seg*hora)-(minuto*60)))
		    if hora > 0 then Medida = "Sa.at"
			elseif hora < 1 and minuto > 0 then Medida = "Daghighe"
			elseif hora < 1 and minuto < 1 and segundo > 0 then Medida = "Saniye"
			end
            if hora == 9 then hora = "09" elseif hora == 8 then hora = "08" elseif hora == 7 then hora = "07" elseif hora == 6 then hora = "06" elseif hora == 5 then hora = "05" elseif hora == 4 then hora = "04" elseif hora == 3 then hora = "03" elseif hora == 2 then hora = "02" elseif hora == 1 then hora = "01" elseif hora == 0 then hora = "00" end		
			exports.Scripts_OnMarkerMsgs_:create("Zamane Azadi: "..hora..":"..string.format("%02d:%02d", minuto, segundo).." "..Medida.."")
	    elseif tonumber ( Tempo_Preso ) <= 0 then
			Tempo_Preso = 0
			exports.Scripts_OnMarkerMsgs_:delete()
			if not getElementData ( localPlayer, "AirNew_PagouFianca" ) == "Sim" then
			    outputChatBox ( "Sucesso: Você cumpriu sua pena na Prisão, Agora você está Livre!", 255, 255, 255, true )
			end
			setElementData ( localPlayer, "AirNew_Tempo_Prisao", tonumber(0) )
			setElementData ( localPlayer, "AirNew_Preso", "Não" )
			setElementData ( localPlayer, "AirNew_PagouFianca", "Não" )
	    end
	end	
end
setTimer ( CronometroPrisao, 1000, 0 )

Verificar_Tempo_Capturado = false

function ParaPrender_AirNewSCR ( )
	Tempo_para_Prender = tonumber ( getElementData ( localPlayer, "PoliceToPrision:Time" ) ) or 0
	if Tempo_para_Prender > 0 then
		Tempo_para_Prender = Tempo_para_Prender - 1
		setElementData ( localPlayer, "PoliceToPrision:Time", tonumber ( Tempo_para_Prender ) )
		local horas_seg = 3600
		local hora = math.floor ( Tempo_para_Prender / horas_seg )
		local minuto = math.floor ( ( Tempo_para_Prender - ( horas_seg * hora ) ) / 60 )
		local segundo = math.floor ( ( Tempo_para_Prender - ( horas_seg * hora ) - ( minuto * 60 ) ) )	
		exports.Scripts_OnMarkerMsgs_:create2 ( "Tempo para levar o criminoso: "..string.format("%02d:%02d",minuto,segundo).." segundos") 		
	end
	if Tempo_para_Prender <= 0 then
		if Verificar_Tempo_Capturado == true then 
			exports.Scripts_OnMarkerMsgs_:delete2 ( )	
			Tempo_para_Prender = 0
			setElementData ( localPlayer, "PoliceToPrision:Time", tonumber(0) )
			triggerServerEvent ( "AirNewSCR_FalharCapturaLiberar", getRootElement(), localPlayer )
			Verificar_Tempo_Capturado = false
			return
		end
	end
end
setTimer ( ParaPrender_AirNewSCR, 1000, 0 )

Tempo_Prender = 0

function Mostrar_Tempo_Captura ( )
	if Verificar_Tempo_Capturado == false then
	    Verificar_Tempo_Capturado = true
	end
end
addEvent("ShowTimeParaPrender:Time", true )
addEventHandler("ShowTimeParaPrender:Time", getRootElement(), Mostrar_Tempo_Captura )

function Cancelar_Tempo_Captura ( )
	if Verificar_Tempo_Capturado == true then
		exports.Scripts_OnMarkerMsgs_:delete2 ( )
		setElementData ( localPlayer, "PoliceToPrision:Time", tonumber(0) )
		Verificar_Tempo_Capturado = false
	end
end
addEvent ( "CancelTimeParaPrender:Time", true )
addEventHandler ( "CancelTimeParaPrender:Time", getRootElement ( ), Cancelar_Tempo_Captura )