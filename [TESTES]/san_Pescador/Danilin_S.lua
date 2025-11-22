local Vara = {}
local Isca = {}
local Anim_ = {}

local Marker_Emprego = createMarker ( 154.21423, -1942.25134, 3.77344 -2.2, "cylinder", 2.5, 16, 111, 231, 0)
local Blip_Emprego = createBlipAttachedTo( Marker_Emprego, 53 )
setBlipVisibleDistance(Blip_Emprego, 150)


	                               --======================================--
                                   ------------ Iniciar Trabalho ------------
                                   --======================================--
function Iniciar_Trabalho (source)
	if not isPedInVehicle ( source ) then
			Criar_Vara (source)
	else
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffSaia do veiculo para que começe a pescar", source, 255, 255, 255, true)	
	end
end
addCommandHandler("pescar", Iniciar_Trabalho)

	                               --================================--
                                   ------------ Criar Vara ------------
                                   --================================--
function Criar_Vara (source)
	if not Vara[source] then 
		Vara[source] = createObject(338, 0, 0, 0)
		exports["bone_attach"]:attachElementToBone(Vara[source], source,12,0,0,0.07,0,260,0)
		setElementData(source, "DNL:Vara_Pescar", true)
		triggerClientEvent(root, "DNL:Sincronia", root, false, Vara, false)
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffVocê pegou a vara e está pronto pra pescar", source, 255, 255, 255, true)	
	elseif Vara[source] or not type then
		destroyElement(Vara[source]) Vara[source] = nil
		triggerClientEvent(root, "DNL:Sincronia", root, false, Vara, false)
		setElementData(source, "DNL:Vara_Pescar", false)
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffSua vara de pesca foi destruida", source, 255, 255, 255, true)
	end
end
addEvent("DNL:Criar_Vara", true)
addEventHandler("DNL:Criar_Vara", root, Criar_Vara)

	                               --================================--
                                   ------------ Criar Vara ------------
                                   --================================--
function Criar_Isca (source, worldX, worldY)
	if not Isca[source] then 
		Isca[source] = createObject(1974, worldX, worldY, 0)
		setObjectScale(Isca[source], 2)
		triggerClientEvent(root, "DNL:Sincronia", root, Isca, false, false)
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffVocê Jogou a Isca, Aguarde Um Pouco Para Que Pegue Algum Peixe", source, 255, 255, 255, true)
	else
		destroyElement(Isca[source]) Isca[source] = nil
		triggerClientEvent(root, "DNL:Sincronia", root, Isca, false, false)
	end
end
addEvent("DNL:Criar_Isca", true)
addEventHandler("DNL:Criar_Isca", root, Criar_Isca)

	                               --================================--
                                   ------------ Animation -------------
                                   --================================--
function setPlayerAbimation(source, state, Anim, Animname)
	setPedAnimation(source, Anim, Animname, -1, true, true, true)
	Anim_[source] = state
	triggerClientEvent(root, "DNL:Sincronia", root, false, false, Anim_)
end
addEvent("setPlayerAbimation", true)
addEventHandler("setPlayerAbimation", root, setPlayerAbimation)

	                               --================================--
                                   ------------ RECOMPENSA ------------
                                   --================================--
Peixes = 
 {   
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Carpa"}, 								-- Carpa 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Enguia"}, 		-- Enguia
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tubarão"}, 	-- Tubarão 
   {"Enguia"}, 		-- Enguia
   {"Nada"}, -- Nada
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Esponja"}, -- Esponja 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Nada"}, -- Nada
   {"Tilápia"}, 				-- Tilápia 
   {"Enguia"}, 		-- Enguia
   {"Carpa"}, 								-- Carpa 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Nada"}, -- Nada
   {"Carpa"}, 								-- Carpa 
   {"Esponja"}, -- Esponja 
   {"Enguia"}, 		-- Enguia
   {"Nada"}, -- Nada
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Enguia"}, 		-- Enguia
   {"Tilápia"}, 				-- Tilápia 
   {"Carpa"}, 								-- Carpa 
   {"Nada"}, -- Nada
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Esponja"}, -- Esponja 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Carpa"}, 								-- Carpa 
   {"Esponja"}, -- Esponja 
   {"Nada"}, -- Nada
   {"Carpa"}, 								-- Carpa 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Enguia"}, 		-- Enguia
   {"Tubarão"}, 	-- Tubarão 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponj
   {"Carpa"}, 								-- Carpa a 
   {"Enguia"}, 		-- Enguia
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Nada"}, -- Nada
   {"Tilápia"}, 				-- Tilápia 
   {"Nada"}, -- Nada
   {"Enguia"}, 		-- Enguia
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Carpa"}, 								--
   {"Tucunaré"}, 									-- Tucunaré  Carpa 
   {"Tilápia"}, 				-- Tilápia 
   {"Carpa"}, 								-- Carpa 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Enguia"}, 		-- Enguia
   {"Esponja"}, -- Esponja
   {"Tucunaré"}, 									-- Tucunaré 
   {"Carpa"}, 							
   {"Tucunaré"}, 									-- Tucunaré 	
   {"Esponja"}, -- Esponja 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Nada"}, -- Nada
   {"Tubarão "}, 	-- Tubarão 
   {"Esponja"}, -- Esponja 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Enguia"}, 		-- Enguia
   {"Esponja"}, -- Esponja 
   {"Nada"}, -- Nada
   {"Tilápia"}, 				-- Tilápia 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Enguia"}, 		-- Enguia
   {"Esponja"}, -- Esponja 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Carpa"}, 								-- Carpa 
   {"Tilápia"}, 				-- Tilápia 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Estrela do mar"}, 		-- Estrela do mar 
   {"Tucunaré"}, 									-- Tucunaré 
   {"Esponja"}, -- Esponja 
   {"Carpa"}, 								-- Carpa 
   {"Nada"}, -- Nada
   {"Esponja"}, -- Esponja 
   {"Tubarão"}, 	-- Tubarão 
   {"Enguia"}, 		-- Enguia
   {"Esponja"}, -- Esponja 
 }
 
function Fim_Emprego(source)
	local Xp = tonumber(getElementData(source, "Exp")) or 0
	local Random_Peixes = math.random ( #Peixes )
	local Recompensa = math.random(80, 150)
	if Random_Peixes and source then 		
		local Peixe_Ganho = getElementData(source, "Peixe_Ganho") or "Nada"
		local Peixe_Player = tonumber(getElementData(source, "peixe."..Peixe_Ganho.."")) or 0
		setElementData(source, "Peixe_Ganho", ""..Peixes[Random_Peixes][1].."")
		setElementData(source, "peixe."..Peixe_Ganho.."", Peixe_Player +1)
        outputChatBox("#7cc576[sanMTA - Fishing] #ffffffVocê conseguiu pegar um #F5D76E" ..Peixe_Ganho.. "", source, 255, 255, 255, true)		
		if isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Console")) then
			setElementData(source, "Recompensa", Recompensa *2)
			setElementData(source, "Exp", Xp + getElementData(source, "Recompensa"))
		elseif isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Admin")) then
			setElementData(source, "Recompensa", Recompensa *2)
			setElementData(source, "Exp", Xp + getElementData(source, "Recompensa"))
		if isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(source)), aclGetGroup("Everyone")) then
			setElementData(source, "Recompensa", Recompensa)
			setElementData(source, "Exp", Xp + getElementData(source, "Recompensa"))
		end
	end
end
end
addEvent("DNL:Fim_Emprego", true)
addEventHandler("DNL:Fim_Emprego", root, Fim_Emprego)

	                               --===================================--
                                   ------------ Vender Peixes ------------
                                   --===================================--
function Vender_Peixe (source, Peixe, Quantidade, Valor)
	local Peixe_ = tonumber(getElementData ( source, "peixe."..Peixe.."" )) or 0
	if Peixe_ >= 1 then
	    setElementData(source,"char:money", getElementData(source,"char:money") + Valor)
		setElementData(source, "peixe."..Peixe.."", Peixe_ -1)
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffVocê Vendeu um Peixe #F5D76E"..Peixe.."", source, 255, 255, 255, true)
	else
		outputChatBox("#7cc576[sanMTA - Fishing] #ffffffVocê não tem esse tipo de peixe", source, 255, 255, 255, true)
	end
end
addEvent ("DNL:Vender_Peixe", true)
addEventHandler ("DNL:Vender_Peixe", root, Vender_Peixe)

	                               --==============================--
                                   ------------ ANTI BUG ------------
                                   --==============================--
function Join_Server ()
	triggerClientEvent(root, "DNL:Sincronia", root, Isca, Vara, Anim_)
end
addEventHandler("onPlayerJoin", getRootElement(), Join_Server)

function Quit_Server ()
	if (Vara[source]) then Criar_Vara(source) end	
	if (Isca[source]) then Criar_Isca(source) end
end
addEventHandler( "onPlayerQuit", root, Quit_Server)