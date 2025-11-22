function ModSamu(attacker, weapon, bodypart)
	if weapon == 23 then return end
	--if ( bodypart == 9 ) then
		--cancelEvent()
		triggerServerEvent("OnDano", source, attacker)
		--exports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(source) .. " (" .. getElementData(source, "playerid") .. ") #ffffffAcabou de ser derrubado pelo "..getPlayerName(attacker).."")
	--end
end
--addEventHandler("onClientPlayerDamage",root,ModSamu)

function text()
    for _, player in ipairs(getElementsByType('player')) do
        if isElementOnScreen(player) and getElementData(player, "PlayerCaido") then
            local x, y, z = getElementPosition(player)
            local cx, cy, cz = getCameraMatrix()
            local vx, vy, vz = getPedBonePosition(player, 8)
            local dist = getDistanceBetweenPoints3D(cx, cy, cz, vx, vy, vz)
            local drawDistance = 30.0
            if (dist < drawDistance or player == target) then
                if(isLineOfSightClear(cx, cy, cz, vx, vy, vz, true, false, false)) then
                    local x, y = getScreenFromWorldPosition (vx, vy, vz + 0.6)
                    if(x and y) then
                        local px, py = getScreenFromWorldPosition (vx, vy, vz + 0.3)
                        local w = dxGetTextWidth("PRECISANDO DE AJUDA!", 1, "default-bold")
                        local h = dxGetFontHeight(1, "default-bold")
                       dxDrawText("#FFFFFFPRECISANDO DE #FF0000AJUDA#FFFFFF!", x - 0  - w / 2,y - 15 - h - 12, w, h, tocolor(255,0,0, math.abs(math.sin(getTickCount()/170))*200), 1, "default-bold", "left", "top", false, false, false, true, false)
                    end
                end
            end
        end
    end
end
addEventHandler("onClientRender", root, text)

function abortAllStealthKills(targetPlayer)
    cancelEvent()
end
addEventHandler("onClientPlayerStealthKill", getLocalPlayer(), abortAllStealthKills)

-------------------------------------- [ CIRURGIA ] --------------------------------- 
function cirurgiaIniciando(player)
	if isElement(player) then
		
		setElementPosition(localPlayer, 1178.5531005859, -1297.6356201172, 14.65549659729)
		setElementRotation(localPlayer, 277)
		setElementData(localPlayer, "nacirurgia", true)
--		setElementDimension(localPlayer, getElementData(localPlayer, "dbid")+130) 1180.2794189453, -1322.8889160156, 15.924971580505
		setCameraMatrix(1178.9328613281, -1297.5860595703, 19.724967956543, 1178.9328613281, -1297.5860595703, 19.0)
		show = true
		setPedAnimation(localPlayer, "CRACK", "crckidle2", -1, false, false, false, true)
		toggleAllControls ( localPlayer, false ) 
		addEventHandler("onClientRender", root, PainelCirurgia)
		showChat(false)
		
		timerS = setTimer(function()

			timer = timer - 1
			if timer == 40 or timer == 100 then
				setCameraMatrix(1184.6879882813, -1292.453125, 18.824970245361, 1181.5301513672, -1294.9281005859, 17.324974060059)
			end
			if timer == 140 or timer == 80 or timer == 20 then
				setCameraMatrix(1169.3719482422, -1302.3201904297, 16.724975585938, 1175.0893554688, -1299.6751708984, 15.824976921082)
			end
			if timer == 120 or timer == 60 then
				setCameraMatrix(1178.9328613281, -1297.5860595703, 19.724967956543, 1178.9328613281, -1297.5860595703, 19.0)
			end
		end, 1000, 180)
		
	end
end
addEvent("cirurgiaIniciando", true)
addEventHandler("cirurgiaIniciando", getRootElement(), cirurgiaIniciando)

function CirurgiaFinalizada(source)
	if isElement(source) then
		setElementPosition(localPlayer, 1183.9915771484, -1333.7785644531, 14.855496406555)
		setElementDimension(localPlayer, 0)
		setElementRotation(localPlayer, 282)
		setElementHealth(localPlayer, 100)
		setElementData(localPlayer, "nacirurgia", false)
		setElementData(localPlayer, "char:thirst", 100)
		setElementData(localPlayer, "char:hunger", 100)
		toggleAllControls ( localPlayer, true )
		setCameraTarget(localPlayer)
		show = false
		triggerServerEvent("tiraranim", localPlayer)
		triggerServerEvent("tiraranim", localPlayer, localPlayer)
		removeEventHandler("onClientRender", root, PainelCirurgia)
		setPedAnimation(localPlayer, "CRACK", "crckidle2", -1, false, false, false, true)
		showChat(true)
		killTimer(timerS)
	end
end
addEvent("acaboucirurgia", true)
addEventHandler("acaboucirurgia", getRootElement(), CirurgiaFinalizada)

function CirurgiaFinalizadaStaff()
	if getElementData(localPlayer, "char:dutyfaction") == 31 or  getElementData(localPlayer, "acc:admin") >= 5 then
		setElementPosition(localPlayer, 1183.9915771484, -1333.7785644531, 14.855496406555)
		setElementDimension(localPlayer, 0)
		setElementRotation(localPlayer, 282)
		setElementHealth(localPlayer, 100)
		setElementData(localPlayer, "nacirurgia", false)
		setElementData(localPlayer, "char:thirst", 100)
		setElementData(localPlayer, "char:hunger", 100)
		toggleAllControls(localPlayer, true)
		setCameraTarget(localPlayer)
		show = false
		triggerServerEvent("tiraranim", localPlayer)
		triggerServerEvent("tiraranim", localPlayer, localPlayer)
		removeEventHandler("onClientRender", root, PainelCirurgia)
		setPedAnimation(localPlayer, "CRACK", "crckidle2", -1, false, false, false, true)
		showChat(true)
		killTimer(timerS)
	end
end
addCommandHandler("medic2323", CirurgiaFinalizadaStaff, false, false)

function PainelCirurgia()
	if show then
		local monitorSize = {guiGetScreenSize()}
		local panelSize = {600, 200}
		local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2
		local szoveg = "\nOs médicos deram inicio a sua cirurgia.\nNo momento você se encontra anestesiado e a duração da operação \nserá com base na gravidade da situação. E de como seu corpo irá reagir,\nao procedimento, torcemos para que dê tudo certo e não ocorra nenhum imprevisto.\nAo termino da cirurgia, se der tudo certo,  você será encaminhado para\noutra sala onde o médico cuidará do seu pós operatório. \n\n#ffffffEspere os #7cc576Medicos #ffffffterminarem a cirurgia."
		
		dxDrawRectangle(panelX, panelY, panelSize[1], panelSize[2], tocolor(0, 0, 0, 180))
		dxDrawText("#ffffffIRG Roleplay - #7cc576Hospital", panelX+600/2, panelY+20, panelX+600/2, panelY+10, tocolor(255, 255, 255, 230), 1.5, "default-bold", "center", "center", false, false, true, true)
		dxDrawText(szoveg, panelX+600/2, panelY+200/2, panelX+600/2, panelY+200/2, tocolor(255, 255, 255, 230), 1.2, "default-bold", "center", "center", false, false, true, true)
	
	end
end

