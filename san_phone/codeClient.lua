local screenW,screenH = guiGetScreenSize()
resW, resH = 1366,768
sx,sy = (screenW/resW), (screenH/resH)

local jobPed = {}
local roboto2 = "bankgothic"--dxCreateFont("files/Roboto.ttf",14)
local roboto = dxCreateFont("files/Roboto.ttf",14)


local startTick = getTickCount()
local progress = ""
local elements = ""

local maxElem = 7
local nextPage = 0
local nextPageanimacoes = 0
local nextPageobjetos = 0
local inicio = false
local semcelular = false
local servicos = false
local dinheiro = false
local player = false
local semcelulardinheiro = false
local objetos = false

local celular_Table = {
	{"Mojodi", ""},
	{"Service", ""}, 
	{"Enteghal Vajh", ""}, 
	{"Object", ""}, 
	{"Animations", ""}, 
	{"Revistar Jogador", ""}, 
	--{"Loc", ""},
}


local celularPlayer_Table = {
	{"Money", ""}, 
	{"Bank", ""},
	{"Pol Dozdi", ""},
	{"Back", ""},
}

local celularSEM_Table = {
	{"Money", ""}, 
	{"Bank", ""},
	{"Enteghal Vajh", ""}, 
}

local celularServicos_Table = {
	{"STAFF", ""},
	{"Police", ""}, 
	{"Medic", ""}, 
	{"Taxi", ""}, 
	{"Mechanic", ""}, 
	{"Detran", ""}, 
	{"Back", ""},
}


local celulardinheiro_Table = {
	{"OK", ""},
	{"Back", ""},
}

local semcelulardinheiro_Table = {
	{"OK", ""},
	{"Back", ""},
}

local celularobjetos_Table = {
	{"Back", ""},
	{"Zabt",""},
	{"Gol",""},
	{"Chatr",""},
	{"Alicate hidráulico",""},
}

local celularanimacoes_Table = {
	{"Stop", ""},
	--{"Back", ""},
	{"Hands-Up",""},
	{"What?",""},
	{"Taxi", ""},
	{"Cry", ""},
	{"Fuck!", ""},
	{"wait", ""},
	{"Aguardando", ""},
	{"Mirar", ""},
	{"Fumar", ""},
	{"Fumando encostado", ""},
	{"Iniciar corrida", ""},
	{"Medo", ""},
	{"Pensando", ""},	
}

function keyControl(k, s)
	if k == "mouse_wheel_up" then
		if(nextPage>0)then
			nextPage = nextPage - 1
		end
		if(nextPageanimacoes>0)then
		nextPageanimacoes = nextPageanimacoes - 1
		end
	elseif k == "mouse_wheel_down" then
		nextPage = nextPage + 1
		if(nextPage > #celular_Table-maxElem)then
			nextPage = #celular_Table-maxElem
		end
		
		if(nextPageobjetos>0)then
			nextPageobjetos = nextPageobjetos - 1
		end
	elseif k == "mouse_wheel_down" then
		nextPage = nextPage + 1
		if(nextPage > #celular_Table-maxElem)then
			nextPage = #celular_Table-maxElem
		end
		
		nextPageobjetos = nextPageobjetos + 1
		if(nextPageobjetos > #celularobjetos_Table-maxElem)then
			nextPageobjetos = #celularobjetos_Table-maxElem
		end
		
		nextPageanimacoes = nextPageanimacoes + 1
		if(nextPageanimacoes > #celularanimacoes_Table-maxElem)then
			nextPageanimacoes = #celularanimacoes_Table-maxElem
		end
		--[[
	elseif k == "backspace" then
		removeEventHandler("onClientRender", root, createPanel)
		removeEventHandler("onClientKey",root,keyControl)
		show = false]]--
	end
end	




function createPanel()
	local elem = 0

	if getElementData(localPlayer, "celular") then

	if getElementData(localPlayer, "celular-inicio") then	

		--if getElementData(localPlayer, "char:adminduty") == 1 then
			--teste = 0
			--else
		--	teste = 75
		--	end
			--dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*200-teste,tocolor(40 ,40, 40,190), 15)
			--dxDrawRectangle(sx*860,sy*320,sx*250,sy*190-teste,tocolor(40 ,40, 40,190))

			dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*90,tocolor(40 ,40, 40,190), 15)
			--dxDrawRectangle(sx*860,sy*320,sx*250,sy*80,tocolor(40 ,40, 40,190))
			dxDrawText("IRAN GAMING",sx*1970, sy*450, sx/2, 0,tocolor(255,255,255,255),sy/0.9,"pricedown","center", "center",false,false,false,true)

	for index, value in ipairs (celular_Table) do 
		if (index > nextPage and elem < maxElem) then
			elem = elem + 1
			dinheiro = false
			semcelular = false
			inicio = true
			player = false
			animacoes = false
			semcelulardinheiro = false
			objetos = false
			local r, g, b = 255, 255, 255	

			
		if value[1] == "Revistar Jogador" then 
			if getElementData(localPlayer, "char:adminduty") == 1 or getElementData(localPlayer, "char:dutyfaction") == 20 or getElementData(localPlayer, "char:dutyfaction") == 21 or getElementData(localPlayer, "char:dutyfaction") == 22 or getElementData(localPlayer, "char:dutyfaction") == 23 or getElementData(localPlayer, "char:dutyfaction") == 24 or getElementData(localPlayer, "char:dutyfaction") == 25 or getElementData(localPlayer, "char:dutyfaction") == 26 or getElementData(localPlayer, "char:dutyfaction") == 27 or getElementData(localPlayer, "char:dutyfaction") == 28 or getElementData(localPlayer, "char:dutyfaction") == 29 then
				dxDrawRectangle(sx*860,sy*194+elem*(sy*52), sx*250,sy*55,tocolor(40 ,40, 40,190))	
				if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then		
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
				else
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
				end	
				--elem = elem + 1
				dxDrawText(value[1], sx*1970, sy*445+elem*(sy*105), sx/2, 0, tocolor(255, 255, 255, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			else
				elem = elem - 1
			end
		else
			dxDrawRectangle(sx*860,sy*194+elem*(sy*52), sx*250,sy*55,tocolor(40 ,40, 40,190))
			--dxDrawRectangle(sx*860,sy*190+elem*(sy*52), sx*250,sy*60,tocolor(40 ,40, 40,190))
			if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then					
				dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
			else
				dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
			end				
			dxDrawText("#FFFFFF"..value[1], sx*1970, sy*445+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
		end


		end	
	end
	end
	
		if getElementData(localPlayer, "celular-objetos") then
		dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*90,tocolor(40 ,40, 40,190), 15)
		--dxDrawRectangle(sx*860,sy*320,sx*250,sy*80,tocolor(40 ,40, 40,190))
		dxDrawText("Object",sx*1970, sy*450, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)

	local elem2 = 0
	for index, value in ipairs (celularobjetos_Table) do 
	if (index > nextPageobjetos and elem2 < maxElem) then
		elem2 = elem2 + 1
		semcelular = false
		inicio = false
		dinheiro = false
		servicos = false
		player = false
		animacoes = false
		objetos = true
		semcelulardinheiro = false
		local r, g, b = 255, 255, 255	

		dxDrawRectangle(sx*860,sy*194+elem2*(sy*52), sx*250,sy*55,tocolor(40 ,40, 40,180))
		if not isInSlot(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40) then					
			dxDrawRectangle(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
		else
			dxDrawRectangle(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
		end				
		dxDrawText("#FFFFFF"..value[1], sx*1970, sy*445+elem2*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)


	end	
end
end
	
		if getElementData(localPlayer, "celular-player") then
	dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*129,tocolor(40 ,40, 40,190), 15)
	dxDrawRectangle(sx*860,sy*320,sx*250,sy*139,tocolor(40 ,40, 40,190))
			dxDrawText("Mojodi",sx*1970, sy*450, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
		for index, value in ipairs (celularPlayer_Table) do 
		if (index > nextPage and elem < maxElem) then
			elem = elem + 1
			semcelular = false
			player = true
			inicio = false
			dinheiro = false
			servicos = false
			animacoes = false
			semcelulardinheiro = false
			objetos = false
			local r, g, b = 255, 255, 255				


			if value[1] == "Money" then 
				if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then			
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
				else
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
				end	
			local money = (getElementData(localPlayer, "char:money") or 0)
			dxDrawText("#FFFFFF"..value[1]..": " .. money.."", sx*1970, sy*450+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			elseif value[1] == "Bank" then
				if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then			
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
				else
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
				end	
			local bankMoney = (getElementData(localPlayer, "char:bankmoney") or 0)
			dxDrawText("#FFFFFF"..value[1]..": " .. bankMoney .."", sx*1970, sy*450+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			elseif value[1] == "Pol Dozdi" then
				if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then			
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
				else
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
				end	
			local dinheiroSujo = (getElementData(localPlayer, "char:moneysujo") or 0)
			dxDrawText("#FFFFFF"..value[1]..": " .. dinheiroSujo .."", sx*1970, sy*450+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			--dxDrawText("#FFFFFF"..value[1]..": Em breve", sx*1970, sy*450+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			else
				if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then			
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
				else
					dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
				end	
			dxDrawText("#FFFFFF"..value[1],sx*1970, sy*450+elem*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			end	
		end	
	end
	end
	
	if getElementData(localPlayer, "celular-servicos") then
		dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*285,tocolor(40 ,40, 40,190), 15)
		dxDrawRectangle(sx*860,sy*320,sx*250,sy*295,tocolor(40 ,40, 40,190))
		dxDrawText("Service",sx*1970, sy*450, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
			
			
		for index, value in ipairs (celularServicos_Table) do 
		if (index > nextPage and elem < maxElem) then
			elem = elem + 1
			semcelular = false
			inicio = false
			player = false
			dinheiro = false
			servicos = true
			animacoes = false
			semcelulardinheiro = false
			objetos = false
			local r, g, b = 255, 255, 255		
			if not isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then
								
				dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
			else
				dxDrawRectangle(sx*863,sy*205+elem*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
			end
			dxDrawText("#FFFFFF"..value[1], sx*1970, sy*450+elem*(sy*104), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
		end	
	end
	end
	if getElementData(localPlayer, "celular-dinheiro") then
			semcelular = false
			inicio = false
			player = false
			dinheiro = true
			servicos = false
			animacoes = false
			semcelulardinheiro = false
			objetos = false
			local r, g, b = 255, 255, 255		
			dxDrawRoundedRectangle(sx*515,sy*290,sx*306,sy*310,tocolor(40 ,40, 40,190), 15)
			dxDrawRectangle(sx*515,sy*320,sx*306,sy*305,tocolor(40 ,40, 40,190))
			dxDrawText("Enteghal Vajh",sx*1350, sy*630, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
			if not isInSlot(sx*547, sy*500, sx*242, sy*46) then
				dxDrawRectangle(sx*547, sy*500, sx*242, sy*46, tocolor(28,28,28, 255))
			else
				dxDrawRectangle(sx*547, sy*500, sx*242, sy*46, tocolor(28,28,28, 210))
			end		
			
			if not isInSlot(sx*547, sy*566, sx*242, sy*46) then
				dxDrawRectangle(sx*547, sy*566, sx*242, sy*46, tocolor(28,28,28, 255))
			else
				dxDrawRectangle(sx*547, sy*566, sx*242, sy*46, tocolor(28,28,28, 210))
			end
			createEditBox("1", 0.379, 0.443, 0.22, 0.06, true, "", false, 7, "default", false, 1, {0, 0, 0, 127 }, true, { 255,255,255, 210 }, sy/2, true, 60, true, "Meghdar Vajh o valor", { 0, 0, 0, 127 }, true, sy/2, "default", true, true, {0, 0, 0}, false) 
			createEditBox("2", 0.379, 0.543, 0.22, 0.06, true, "", false, 7, "default", false, 1, {0, 0, 0, 127 }, true, { 255,255,255, 210 }, sy/2, true, 60, true, "ID", { 0, 0, 0, 127 }, true, sy/2, "default", true, true, {0, 0, 0}, false) 
			dxDrawText("OK",sx*1340, sy*1050, sx/2, 0,tocolor(255,255,255,255),sy/0.7,"default","center", "center",false,false,false,true)
			dxDrawText("Cancel",sx*1340, sy*1175, sx/2, 0,tocolor(255,255,255,255),sy/0.7,"default","center", "center",false,false,false,true)
			if isInSlot(sx*517, sy*341, sx*302, sy*46) then
			dxDrawText("Meghdar Vajh",sx*1340, sy*530, sx/2, 0,tocolor(255,255,255,255),sy/0.5,"default","center", "center",false,false,false,true)
			end
			if isInSlot(sx*517, sy*416, sx*302, sy*46) then
			dxDrawText("ID",sx*1340, sy*530, sx/2, 0,tocolor(255,255,255,255),sy/0.5,"default","center", "center",false,false,false,true)
			end	
			
		--end	
	--end
	end
	if getElementData(localPlayer, "celular-animacoes") then
			dxDrawRoundedRectangle(sx*860,sy*200,sx*250,sy*285,tocolor(40 ,40, 40,190), 15)
			dxDrawRectangle(sx*860,sy*320,sx*250,sy*295,tocolor(40 ,40, 40,190))
			dxDrawText("Animations",sx*1970, sy*450, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
		local elem2 = 0
		for index, value in ipairs (celularanimacoes_Table) do 
		if (index > nextPageanimacoes and elem2 < maxElem) then
			elem2 = elem2 + 1
			semcelular = false
			inicio = false
			dinheiro = false
			servicos = false
			player = false
			animacoes = true
			semcelulardinheiro = false
			local r, g, b = 255, 255, 255		
			if not isInSlot(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40) then
								
				dxDrawRectangle(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
			else
				dxDrawRectangle(sx*863,sy*205+elem2*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
			end
			dxDrawText("#FFFFFF"..value[1], sx*1970, sy*450+elem2*(sy*104), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)

		end	
	end
	end

	else
	
		local elem2 = 0
		if not getElementData(localPlayer, "semcelular-dinheiro") then
	dxDrawRoundedRectangle(sx*860,sy*400,sx*250,sy*170,tocolor(40 ,40, 40,190), 15)
	dxDrawRectangle(sx*860,sy*420,sx*250,sy*185,tocolor(40 ,40, 40,190))
	dxDrawText("Informações",sx*1970, sy*850, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
		for index, value2 in ipairs (celularSEM_Table) do 
			elem2 = elem2 + 1
			dinheiro = false
			semcelular = true
			inicio = false
			player = false
			servicos = false
			semcelulardinheiro = false
			local r, g, b = 255, 255, 255		
			if not isInSlot(sx*863,sy*405+elem2*(sy*52), sx*245,sy*40) then
				dxDrawRectangle(sx*863,sy*405+elem2*(sy*52), sx*245,sy*40, tocolor(56,56,56, 255))
			else
				dxDrawRectangle(sx*863,sy*405+elem2*(sy*52), sx*245,sy*40, tocolor(144,238,144, 210))
			end
			if value2[1] == "Money" then 
			    local money = (getElementData(localPlayer, "char:money") or 0)
			dxDrawText("#FFFFFF"..value2[1]..": " .. money.."", sx*1970, sy*850+elem2*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			elseif value2[1] == "Bank" then 
			    local bankmoney = (getElementData(localPlayer, "char:bankmoney") or 0)
			dxDrawText("#FFFFFF"..value2[1]..": " .. bankmoney.."", sx*1970, sy*850+elem2*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)

			else
			dxDrawText("#FFFFFF"..value2[1], sx*1970, sy*850+elem2*(sy*105), sx/2, 0, tocolor(0, 0, 0, 255), sy/1.5, roboto, "center", "center", false, false, false, true)
			end	
	end
	else
			semcelular = false
			inicio = false
			player = false
			dinheiro = false
			servicos = false
			animacoes = false
			semcelulardinheiro = true
			objetos = false
			local r, g, b = 255, 255, 255		
			dxDrawRoundedRectangle(sx*515,sy*300,sx*306,sy*310,tocolor(40 ,40, 40,190), 15)
			dxDrawRectangle(sx*515,sy*320,sx*306,sy*305,tocolor(40 ,40, 40,190))
			dxDrawText("Enteghal Vajh",sx*1350, sy*630, sx/2, 0,tocolor(255,255,255,255),sy/0.8,"pricedown","center", "center",false,false,false,true)
			if not isInSlot(sx*547, sy*500, sx*242, sy*46) then
				dxDrawRectangle(sx*547, sy*500, sx*242, sy*46, tocolor(28, 28, 28, 255))
			else
				dxDrawRectangle(sx*547, sy*500, sx*242, sy*46, tocolor(28, 28, 28, 210))
			end		
			
			if not isInSlot(sx*547, sy*566, sx*242, sy*46) then
				dxDrawRectangle(sx*547, sy*566, sx*242, sy*46, tocolor(28, 28, 28, 255))
			else
				dxDrawRectangle(sx*547, sy*566, sx*242, sy*46, tocolor(28, 28, 28, 210))
			end
			createEditBox("3", 0.379, 0.443, 0.22, 0.06, true, "", false, 7, "default", false, 1, {0, 0, 0, 127 }, true, { 255,255,255, 210 }, sy/2, true, 60, true, "Meghdar Vajh o valor", { 0, 0, 0, 127 }, true, sy/2, "default", true, true, {0, 0, 0}, false) 
			createEditBox("4", 0.379, 0.543, 0.22, 0.06, true, "", false, 7, "default", false, 1, {0, 0, 0, 127 }, true, { 255,255,255, 210 }, sy/2, true, 60, true, "ID", { 0, 0, 0, 127 }, true, sy/2, "default", true, true, {0, 0, 0}, false) 
			dxDrawText("OK",sx*1340, sy*1050, sx/2, 0,tocolor(255,255,255,255),sy/0.7,"default","center", "center",false,false,false,true)
			dxDrawText("Cancel",sx*1340, sy*1175, sx/2, 0,tocolor(255,255,255,255),sy/0.7,"default","center", "center",false,false,false,true)	
			if isInSlot(sx*517, sy*341, sx*302, sy*46) then
			dxDrawText("Meghdar Vajh",sx*1340, sy*530, sx/2, 0,tocolor(255,255,255,255),sy/0.5,"default","center", "center",false,false,false,true)
			end
			if isInSlot(sx*517, sy*416, sx*302, sy*46) then
			dxDrawText("ID",sx*1340, sy*530, sx/2, 0,tocolor(255,255,255,255),sy/0.5,"default","center", "center",false,false,false,true)
			end			
		end
	end
end

local boxMenStats = false

local altura = 0
function teste(button, state, x, y, elementx, elementy, elementz, element)
	if state == "down" and button == "left" and inicio then 
		elem = 0
		for index, value in ipairs (celular_Table) do 
			if (index > nextPage and elem < maxElem) then
				elem = elem + 1
				if isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then 
				if value[1] == "Mojodi" then 
				setElementData(localPlayer, "celular-player", true)
				setElementData(localPlayer, "celular-inicio", false)
				end	
				if value[1] == "Service" then 
				setElementData(localPlayer, "celular-servicos", true)
				setElementData(localPlayer, "celular-inicio", false)
				end	
				if value[1] == "Enteghal Vajh" then 
				setElementData(localPlayer, "celular-dinheiro", true)
				setElementData(localPlayer, "celular-inicio", false)
				changeVisibility("1", true)
				changeVisibility("2", true)
				end
				if value[1] == "Animations" then 
				setElementData(localPlayer, "celular-animacoes", true)
				setElementData(localPlayer, "celular-inicio", false)
			end
			if value[1] == "Object" then 
				setElementData(localPlayer, "celular-objetos", true)
				setElementData(localPlayer, "celular-inicio", false)
			end
			if value[1] == "Revistar Jogador" then 

				local posX1, posY1, posZ1 = getElementPosition(localPlayer)
				for _, player in ipairs(getElementsByType("player")) do
					local posX2, posY2, posZ2 = getElementPosition(player)
					local distance = getDistanceBetweenPoints3D(posX1, posY1, posZ1, posX2, posY2, posZ2)
					if distance <= 1 then
						--if player then
						if player ~= localPlayer then
							if getElementData(localPlayer, "char:adminduty") == 1 or getElementData(localPlayer, "char:dutyfaction") == 20 or getElementData(localPlayer, "char:dutyfaction") == 21 or getElementData(localPlayer, "char:dutyfaction") == 22 or getElementData(localPlayer, "char:dutyfaction") == 23 or getElementData(localPlayer, "char:dutyfaction") == 24 or getElementData(localPlayer, "char:dutyfaction") == 25 or getElementData(localPlayer, "char:dutyfaction") == 26 or getElementData(localPlayer, "char:dutyfaction") == 27 or getElementData(localPlayer, "char:dutyfaction") == 28 or getElementData(localPlayer, "char:dutyfaction") == 29 or getElementData(localPlayer, "char:dutyfaction") == 30 then
				        		outputChatBox(" ", 255, 255, 255, true)	
				     		    outputChatBox(" ", 255, 255, 255, true)	
     						    outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox(" ", 255, 255, 255, true)	
						        outputChatBox("#7cc576      ===== #FFFFFFREVISTANDO O JOGADOR #7cc576=====", 255, 255, 255, true)
						        outputChatBox("#7cc576" .. getPlayerName(player):gsub("_"," ") .. " #ffffffTem em seu bolso #7cc576R$" .. getElementData(player, "char:money") .. " #FFFFFFem dinheiro", 255, 255, 255, true)
    				        		 if exports['san_items']:hasItem(player, 16) then
					            	 outputChatBox("#7cc576#FFFFFFPossui celular: #7cc576Sim", 255, 255, 255, true)
						             else
						             outputChatBox("#FFFFFFPossui celular: #7cc576Não", 255, 255, 255, true)
									 end
									 if exports['san_items']:hasItem(player, 44) then
									 outputChatBox("#7cc576#FFFFFFPossui Deagle: #7cc576Sim", 255, 255, 255, true)
						             else
						             outputChatBox("#FFFFFFPossui Deagle: #7cc576Não", 255, 255, 255, true)
									 end
									 if exports['san_items']:hasItem(player, 52) then
									 outputChatBox("#7cc576#FFFFFFPossui Fall: #7cc576Sim", 255, 255, 255, true)
						             else
						             outputChatBox("#FFFFFFPossui Fall: #7cc576Não", 255, 255, 255, true)
									 end
									 if exports['san_items']:hasItem(player, 51) then
									 outputChatBox("#7cc576#FFFFFFPossui AK-47: #7cc576Sim", 255, 255, 255, true)
						             else
						             outputChatBox("#FFFFFFPossui AK-47: #7cc576Não", 255, 255, 255, true)
									 end
									 if exports['san_items']:hasItem(player, 84) then
									 outputChatBox("#7cc576#FFFFFFPossui Colete: #7cc576Sim", 255, 255, 255, true)
						             else
						             outputChatBox("#FFFFFFPossui Colete: #7cc576Não", 255, 255, 255, true)
									 end
						         return
						     end
  					     end
				     end
				 end
			end
			--[[if value[1] == "loc" then 
			--sendLocalization
            local player = guiGridListGetItemText(gui.grid["sendLoc"], guiGridListGetSelectedItem(gui.grid["sendLoc"]), 1)
			if player ~= "" then
				if triggerServerEvent("sendLocalization", resourceRoot, getPlayerFromPartialName(player)) then
					guiSetEnabled(value[1], false)
					setTimer(guiSetEnabled, 30000, 1, value[1], true)
				end
			else
				outputChatBox("Selecione um jogador", 255, 0, 0)
			end
			end]]
			
		end
	end
end			
				
			elseif state == "down" and button == "left" and semcelular then 
			elem2 = 0
			for index2, value2 in ipairs (celularSEM_Table) do
			if (index2 > nextPage and elem2 < maxElem) then
				elem2 = elem2 + 1			
				if isInSlot(sx*863,sy*405+elem2*(sy*52), sx*245,sy*40) then 
				if value2[1] == "Enteghal Vajh" then 
				setElementData(localPlayer, "semcelular-dinheiro", true)
				setElementData(localPlayer, "celular-inicio", false)
				changeVisibility("3", true)
				changeVisibility("4", true)
			end
		end
	end
end	
				elseif state == "down" and button == "left" and semcelulardinheiro then 
				elem2 = 0	
				if isInSlot(sx*547, sy*566, sx*242, sy*46) then 			
				setElementData(localPlayer, "celular-animacoes", false)
				setElementData(localPlayer, "celular-dinheiro", false)
				setElementData(localPlayer, "semcelular-dinheiro", false)
				setElementData(localPlayer, "celular-servicos", false)
				setElementData(localPlayer, "celular-inicio", false)
				setElementData(localPlayer, "celular-objetos", false)
				changeVisibility("3", false)
				changeVisibility("4", false)
				elseif isInSlot(sx*547, sy*500, sx*242, sy*46) then 
				if getText("3") then
                --if tonumber(getText("3")) < getElementData(localPlayer, "char:money") or tonumber(getText("3")) == getElementData(localPlayer, "char:money") then
				local item = tonumber(getText("3"))
				local targerplayer = tonumber(getText("4")) 
                --triggerServerEvent("EnviarMoney", localPlayer, targerplayer, item)
				triggerServerEvent("MoneyTransfer",localPlayer, targerplayer, item);
				--else
				--outputChatBox("#dc143c[BGOMTA - Banco]: #ffffffVocê não tem dinheiro", 25, 152, 139, true)
                --end
			end
		end	
			elseif state == "down" and button == "left" and servicos then 
			elem = 0
			for index, value in ipairs (celularServicos_Table) do
			if (index > nextPage and elem < maxElem) then
				elem = elem + 1			
				if isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then 
				if value[1] == "Back" then 
				setElementData(localPlayer, "celular-animacoes", false)
				setElementData(localPlayer, "celular-dinheiro", false)
				setElementData(localPlayer, "celular-servicos", false)
				setElementData(localPlayer, "celular-objetos", false)
				setElementData(localPlayer, "celular-inicio", true)
				elseif value[1] == "Police" then
				fac = "Policia"
				guiSetVisible(boxEmergencia, true)
                addEventHandler("onClientRender", root, boxMen)	
				boxMenStats = true	
				showChat(false)
				--guiSetInputEnabled(true)	
                OpenWin()				
				elseif value[1] == "Taxi" then 
				triggerServerEvent('SendMsgToTeamtaxi', localPlayer)
				elseif value[1] == "Medic" then 
				fac = "medic"
				--guiSetInputEnabled(true)
				guiSetVisible(boxEmergencia, true)
				addEventHandler("onClientRender", root, boxMen)
				boxMenStats = true
				showChat(false)
				OpenWin()
				elseif value[1] == "Mechanic" then 
				triggerServerEvent('SendMsgToTeamMecanico', localPlayer)			
				elseif value[1] == "Detran" then
				triggerServerEvent('SendMsgToTeamDetran', localPlayer)		
				elseif value[1] == "STAFF" then 
				triggerServerEvent('SendMsgToTeamstaff', localPlayer)		
			end	
		end
	end
end

			elseif state == "down" and button == "left" and player then 
			elem = 0
			for index, value in ipairs (celularPlayer_Table) do
			if (index > nextPage and elem < maxElem) then
				elem = elem + 1			
				if isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then 
				if value[1] == "Back" then
				setElementData(localPlayer, "celular-player", false)				
				setElementData(localPlayer, "celular-animacoes", false)
				setElementData(localPlayer, "celular-dinheiro", false)
				setElementData(localPlayer, "celular-servicos", false)
				setElementData(localPlayer, "celular-objetos", false)
				setElementData(localPlayer, "celular-inicio", true)
			end	
		end
	end
end


				elseif state == "down" and button == "left" and objetos then 
				elem = 0
				for index, value in ipairs (celularobjetos_Table) do
				if (index > nextPageobjetos and elem < maxElem) then
				elem = elem + 1			
				if isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then 
					if value[1] == "Back" then 
						setElementData(localPlayer, "celular-animacoes", false)
						setElementData(localPlayer, "celular-dinheiro", false)
						setElementData(localPlayer, "celular-servicos", false)
						setElementData(localPlayer, "celular-objetos", false)
						setElementData(localPlayer, "celular-inicio", true)	

				elseif value[1] == "Zabt" then 
				triggerServerEvent("objetomaosom", localPlayer, localPlayer, value[1])
				elseif value[1] == "Gol" then 
				triggerServerEvent("objetomaoflor", localPlayer, localPlayer, value[1])
				elseif value[1] == "Chatr" then 
				triggerServerEvent("objetgchuva", localPlayer, localPlayer, value[1])
				elseif value[1] == "Alicate hidráulico" then 
				if getElementData(localPlayer, "char:dutyfaction") == 16 then
				triggerServerEvent("objetomaocaixa", localPlayer, localPlayer, value[1])
			else
				outputChatBox("#7cc576[IRG ] #bebebeEste item é reservado para o #7cc576Resgate#bebebe.", 255, 255, 255, true)
			end
		end
	end
end	
end


				elseif state == "down" and button == "left" and animacoes then 
				elem = 0
				for index, value in ipairs (celularanimacoes_Table) do
				if (index > nextPageanimacoes and elem < maxElem) then
				elem = elem + 1			
				if isInSlot(sx*863,sy*205+elem*(sy*52), sx*245,sy*40) then 				
				if value[1] == "Taxi" then 
				triggerServerEvent("animarcelular", localPlayer, value[1])
				elseif value[1] == "Stop" then 
				triggerServerEvent("animarcelular", localPlayer, "stopanim")
				elseif value[1] == "Cry" then 
				triggerServerEvent("animarcelular", localPlayer, "cry")
				elseif value[1] == "Aguardando" then 
				triggerServerEvent("animarcelular", localPlayer, "rap")				
				elseif value[1] == "Mirar" then 
				triggerServerEvent("animarcelular", localPlayer, "aim")	
				elseif value[1] == "Fumar" then 
				triggerServerEvent("animarcelular", localPlayer, "smoke")					
				elseif value[1] == "Fumando encostado" then 
				triggerServerEvent("animarcelular", localPlayer, "smokelean")		
				elseif value[1] == "Iniciar corrida" then 
				triggerServerEvent("animarcelular", localPlayer, "startrace")
				elseif value[1] == "What?" then 
				triggerServerEvent("animarcelular", localPlayer, "what")
				elseif value[1] == "Medo" then 
				triggerServerEvent("animarcelular", localPlayer, "cover")
				elseif value[1] == "Pensando" then 
				triggerServerEvent("animarcelular", localPlayer, "think")				
				elseif value[1] == "wait" then 
				triggerServerEvent("animarcelular", localPlayer, "wait")
				elseif value[1] == "Hands-Up" then 
				triggerServerEvent("animarcelular", localPlayer, "handsup")
				elseif value[1] == "Fuck!" then 
				triggerServerEvent("animarcelular", localPlayer, "fu")
				end
			end
		end
	end	
				elseif state == "down" and button == "left" and dinheiro then 
				elem = 0
				for index, value in ipairs (celulardinheiro_Table) do
				if (index > nextPage and elem < maxElem) then
				elem = elem + 1		
				if isInSlot(sx*547, sy*566, sx*242, sy*46) then 			
				setElementData(localPlayer, "celular-animacoes", false)
				setElementData(localPlayer, "celular-dinheiro", false)
				setElementData(localPlayer, "celular-servicos", false)
				setElementData(localPlayer, "celular-objetos", false)
				setElementData(localPlayer, "celular-inicio", true)
				changeVisibility("1", false)
				changeVisibility("2", false)
				elseif isInSlot(sx*547, sy*500, sx*242, sy*46) then 
				if getText("1") then
                --if tonumber(getText("1")) < getElementData(localPlayer, "char:money") or tonumber(getText("1")) == getElementData(localPlayer, "char:money") then
				local item = tonumber(getText("1"))
				local targerplayer = tonumber(getText("2")) 
                --triggerServerEvent("EnviarMoney", localPlayer, item, targerplayer)
				triggerServerEvent("MoneyTransfer",localPlayer, targerplayer, item);
				--else
				--outputChatBox("#dc143c[IRG  - Banco]: #ffffffVocê não tem dinheiro", 25, 152, 139, true)
						--end
					end
				end
			end
		end		
	end
end


function isInSlot( posX, posY, width, height )
  if isCursorShowing( ) then
    local mouseX, mouseY = getCursorPosition( )
    local clientW, clientH = guiGetScreenSize( )
    local mouseX, mouseY = mouseX * clientW, mouseY * clientH
    if ( mouseX > posX and mouseX < ( posX + width ) and mouseY > posY and mouseY < ( posY + height ) ) then
      return true
    end
  end
  return false
end


addEventHandler("onClientKey", root, 
	function (button, press)
		if boxMenStats == true then
			if button == "F1" or button == "F2" or button == "u" or button == "y" or button == "t" or button == "F3" or button == "F4" or button == "F5" or button == "F6" or button == "F7" or button == "F9" or button == "F10" or button == "F11" or button == "F12" or button == "t" or button == "i" or button == "b" then
				cancelEvent()
			end
		end
	end
)

    boxEmergencia = guiCreateEdit(sx*509, sy*439, sx*375, sy*77, "", false)      
	guiSetInputEnabled(false)
function boxMen ()
        dxDrawRectangle(sx*504, sy*393, sx*385, sy*146, tocolor(19, 19, 19, 209), false)
        dxDrawRectangle(sx*504, sy*393, sx*385, sy*23, tocolor(6, 6, 6, 209), false)
        dxDrawText("COPOM ("..fac..")", sx*504, sy*393, sx*889, sy*416, tocolor(254, 254, 254, 143), sx*0.80, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("PRESSIONE 'ENTER' PARA EFETUAR A OCORRENCIA, 'X' PARA FECHAR", sx*504, sy*516, sx*889, sy*539, tocolor(254, 254, 254, 143), sx*0.80, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("ADICIONE UMA DESCRIÇÃO ABAIXO:", sx*504, sy*416, sx*889, sy*439, tocolor(254, 254, 254, 143), sx*0.80, "default-bold", "center", "center", false, false, false, false, false)
end


--boxMenStats = false

--boxEmergencia = guiCreateEdit(sx*306, sy*432, sx*550, sy*250, "", false)    
guiSetVisible(boxEmergencia, false) 
--[[
function boxMen ()
        dxDrawRectangle(sx*300, sy*352, sx*561, sy*303, tocolor(38, 38, 38, 170), false)
        dxDrawText("ADICIONE UMA DESCRIÇÂO ABAIXO PARA CHAMAR a", sx*299, sy*394, sx*1158, sy*417, tocolor(254, 254, 254, 119), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        dxDrawText("PRESSIONE 'ENTER' PARA EFETUAR ESTA CHAMADA", sx*299, sy*672, sx*1158, sy*695, tocolor(254, 254, 254, 119), 1.00, "default-bold", "center", "center", false, false, false, false, false)
end
--]]

bindKey("enter", "down",
function(button, state, x, y, elementx, elementy, elementz, element)
	--if state == "down" and boxMenStats then  
		if boxMenStats then
             getMen = guiGetText (boxEmergencia)
             if (getMen == "") then
			     outputChatBox("#FFA000*IRG  #FFFFFFAdicione um descrição para chamada.", 255,255,255, true)
			     return
			 end 
		         if (fac == "Policia") then
				     triggerServerEvent('SendMsgToTeamPolicia', localPlayer, getMen)
                     fac = nil	
                     boxMenStats = false	
					 showChat(true)
                     removeEventHandler("onClientRender", root, boxMen)		
					 guiSetVisible(boxEmergencia, false) 	
					 
					 --guiSetInputEnabled(false)
				    -- return
		        elseif (fac == "medic") then
				     triggerServerEvent('SendMsgToTeammedic', localPlayer, getMen)
					 fac = nil
                	 boxMenStats = false
                     removeEventHandler("onClientRender", root, boxMen)							 
					 --guiSetInputEnabled(false)
					 guiSetVisible(boxEmergencia, false) 
					 showChat(true)
				   --  return
				 end
			 end
end)

bindKey("x", "down", 
function(button, state, x, y, elementx, elementy, elementz, element)
		if boxMenStats then  
             fac = nil	
             boxMenStats = false	
             removeEventHandler("onClientRender", root, boxMen)	
             guiSetVisible(boxEmergencia, false) 
			 showChat(true)			 
	     return
	 end
end)

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

local open = false
function OpenWin()
	if open == false then
	open = true
	addEventHandler("onClientRender", root, createPanel)
	addEventHandler("onClientKey",root,keyControl)
	addEventHandler("onClientClick", root, teste) 
	inicio = true
	triggerServerEvent("sandroid.startAnimation", resourceRoot)-- adcionar objeto do celular
	setElementData(localPlayer, "celular-inicio", true)

	triggerServerEvent("abrircelular", localPlayer)
	nextPage = 0
	nextPageanimacoes = 0
	changeVisibility("1", false)
	changeVisibility("2", false)
	changeVisibility("3", false)
	changeVisibility("4", false)		
	else
	triggerServerEvent("sandroid.stopAnimation", resourceRoot) --retirar objeto do celular
	removeEventHandler("onClientRender", root, createPanel)
	removeEventHandler("onClientKey",root,keyControl)
	removeEventHandler("onClientClick", root, teste) 
	inicio = false
	open = false
	setElementData(localPlayer, "celular-player", false)
	setElementData(localPlayer, "celular-servicos", false)
	setElementData(localPlayer, "celular-inicio", false)
	setElementData(localPlayer, "semcelular-dinheiro", false)
	setElementData(localPlayer, "celular-dinheiro", false)
	setElementData(localPlayer, "celular-animacoes", false)
	setElementData(localPlayer, "celular-objetos", false)
	changeVisibility("1", false)
	changeVisibility("2", false)
	changeVisibility("3", false)
	changeVisibility("4", false)
	
	semcelular = false
	inicio = false
	player = false
	dinheiro = false
	servicos = false
	animacoes = false
	semcelulardinheiro = false
	objetos = false
			
			
	end 
end
addEvent("Celular", true)
addEventHandler("Celular", root, OpenWin)

--[[

function OpenWin()
	if open == false then
	open = true
	addEventHandler("onClientRender", root, createPanel)
	addEventHandler("onClientKey",root,keyControl)
	inicio = true
	setElementData(localPlayer, "celular", false)
	setElementData(localPlayer, "celular-inicio", true)

	triggerServerEvent("sandroid.startAnimation", resourceRoot)
	nextPage = 0
	nextPageanimacoes = 0
	changeVisibility("1", false)
	changeVisibility("2", false)
	changeVisibility("3", false)
	changeVisibility("4", false)		
	else
	triggerServerEvent("sandroid.stopAnimation", resourceRoot) 
	removeEventHandler("onClientRender", root, createPanel)
	removeEventHandler("onClientKey",root,keyControl)
	inicio = false
	open = false
	setElementData(localPlayer, "celular-player", false)
	setElementData(localPlayer, "celular-servicos", false)
	setElementData(localPlayer, "celular-inicio", false)
	setElementData(localPlayer, "semcelular-dinheiro", false)
	setElementData(localPlayer, "celular-dinheiro", false)
	setElementData(localPlayer, "celular-animacoes", false)
	changeVisibility("1", false)
	changeVisibility("2", false)
	changeVisibility("3", false)
	changeVisibility("4", false)
	end 
end
addEvent("SemCelular", true)
addEventHandler("SemCelular", root, OpenWin)

]]--
	

function dxDrawRoundedRectangle(x, y, rx, ry, color, radius)
    rx = rx - radius * 2
    ry = ry - radius * 2
    x = x + radius
    y = y + radius
    if (rx >= 0) and (ry >= 0) then
        dxDrawRectangle(x, y, rx, ry, color)
        dxDrawRectangle(x, y - radius, rx, radius, color)
        dxDrawRectangle(x, y + ry, rx, radius, color)
        dxDrawRectangle(x - radius, y, radius, ry, color)
        dxDrawRectangle(x + rx, y, radius, ry, color)
        dxDrawCircle(x, y, radius, 180, 270, color, color, 7)
        dxDrawCircle(x + rx, y, radius, 270, 360, color, color, 7)
        dxDrawCircle(x + rx, y + ry, radius, 0, 90, color, color, 7)
        dxDrawCircle(x, y + ry, radius, 90, 180, color, color, 7)
    end
end












local PoliciaMarkers = {}
local Policia = {}
function createPoliciaMarker(player, id, tplayer, x, y, z)
	if isElement(player) then
		
		PoliciaMarkers[id] = createMarker( x , y , z, "checkpoint", 12, 0, 0, 255, 255 )
		Policia[id] = createBlip( x , y , z, 30 )


			local hx,hy,hz = getElementPosition(localPlayer)
			
			exports.san_util:markPlayer(x , y , z)
			
			setElementData(PoliciaMarkers[id], "call:player", tplayer)
			setElementData(PoliciaMarkers[id], "call:id", id)
			setElementData(PoliciaMarkers[id], "call:accepted", player)
	end
end
addEvent("createPoliciaMarker", true)
addEventHandler("createPoliciaMarker", root, createPoliciaMarker)

function emergencyMarker( hitPlayer, matchingDimension )
	if PoliciaMarkers[getElementData(source, "call:id")] and getElementData(source, "call:accepted") == hitPlayer then
		
		local acceptID = getElementData(source, "call:id")
		local tplayer = getElementData(source, "call:player")
		
		if (acceptID) then
			exports.san_hud:dm("Você chegou no chamado " .. acceptID .. " Faça seu serviço.", 255, 200, 0)
			setElementData(tplayer, "call:policia", nil)
			destroyElement(PoliciaMarkers[acceptID])
			destroyElement(Policia[acceptID])
		end	
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), emergencyMarker )




local MedicoMarkers = {}
local medicoblip = {}
function createMedicoMarker(player, id, tplayer, x, y, z)
	if isElement(player) then
		
		MedicoMarkers[id] = createMarker( x , y , z, "checkpoint", 12, 0, 0, 255, 255 )
		medicoblip[id] = createBlip( x , y , z, 21 )


			local hx,hy,hz = getElementPosition(localPlayer)
			exports.san_util:markPlayer(x , y , z)
			--exports["4i20_radarl"]:utvonalTervezes(hx,hy,hz, x , y , z)
			
			setElementData(MedicoMarkers[id], "call:player", tplayer)
			setElementData(MedicoMarkers[id], "call:id", id)
			setElementData(MedicoMarkers[id], "call:accepted", player)
	end
end
addEvent("createMedicoMarker", true)
addEventHandler("createMedicoMarker", root, createMedicoMarker)

function medicomarker( hitPlayer, matchingDimension )
	if MedicoMarkers[getElementData(source, "call:id")] and getElementData(source, "call:accepted") == hitPlayer then
		
		local acceptID = getElementData(source, "call:id")
		local tplayer = getElementData(source, "call:player")
		
		if (acceptID) then
			exports.san_hud:dm("Você chegou no chamado " .. acceptID .. " Faça seu serviço.", 255, 200, 0)
			setElementData(tplayer, "call:medico", nil)
			destroyElement(MedicoMarkers[acceptID])
			destroyElement(medicoblip[acceptID])
		end	
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), medicomarker )




local mecanicoMarkers = {}
local mecanicoblip = {}
function createmecanicoMarker(player, id, tplayer, x, y, z)
	if isElement(player) then
		
		mecanicoMarkers[id] = createMarker( x , y , z, "checkpoint", 12, 0, 0, 255, 255 )
		mecanicoblip[id] = createBlip( x , y , z, 41 )
		setElementData(mecanicoblip[id] ,"blip >> name", "Tamir")
		exports.san_util:markPlayer(x , y , z)


			local hx,hy,hz = getElementPosition(localPlayer)
			--exports["4i20_radarl"]:utvonalTervezes(hx,hy,hz, x , y , z)
			
			setElementData(mecanicoMarkers[id], "call:player", tplayer)
			setElementData(mecanicoMarkers[id], "call:id", id)
			setElementData(mecanicoMarkers[id], "call:accepted", player)
	end
end
addEvent("createMecanicoMarker", true)
addEventHandler("createMecanicoMarker", root, createmecanicoMarker)

function mecanicomarker( hitPlayer, matchingDimension )
	if mecanicoMarkers[getElementData(source, "call:id")] and getElementData(source, "call:accepted") == hitPlayer then
		
		local acceptID = getElementData(source, "call:id")
		local tplayer = getElementData(source, "call:player")
		
		if (acceptID) then
			exports.san_hud:dm("Você chegou no chamado " .. acceptID .. " Faça seu serviço.", 255, 200, 0)
			setElementData(tplayer, "call:mecanico", nil)
			destroyElement(mecanicoMarkers[acceptID])
			destroyElement(mecanicoblip[acceptID])
		end	
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), mecanicomarker )







local taxiMarkers = {}
local taxiblip = {}
function createtaxiMarker(player, id, tplayer, x, y, z)
	if isElement(player) then
		
		taxiMarkers[id] = createMarker( x , y , z, "checkpoint", 12, 0, 0, 255, 255 )
		taxiblip[id] = createBlip( x , y , z, 11 )


			local hx,hy,hz = getElementPosition(localPlayer)
			exports["4i20_radarl"]:utvonalTervezes(hx,hy,hz, x , y , z)
			
			setElementData(taxiMarkers[id], "call:player", tplayer)
			setElementData(taxiMarkers[id], "call:id", id)
			setElementData(taxiMarkers[id], "call:accepted", player)
	end
end
addEvent("createtaxiMarker", true)
addEventHandler("createtaxiMarker", root, createtaxiMarker)

function taximarker( hitPlayer, matchingDimension )
	if taxiMarkers[getElementData(source, "call:id")] and getElementData(source, "call:accepted") == hitPlayer then
		
		local acceptID = getElementData(source, "call:id")
		local tplayer = getElementData(source, "call:player")
		
		if (acceptID) then
			exports.san_hud:dm("Você chegou no chamado " .. acceptID .. " Faça seu serviço.", 255, 200, 0)
			setElementData(tplayer, "call:taxi", nil)
			destroyElement(taxiMarkers[acceptID])
			destroyElement(taxiblip[acceptID])
		end	
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), taximarker )




local detranMarkers = {}
local detranblip = {}
function createdetranMarker(player, id, tplayer, x, y, z)
	if isElement(player) then
		
		detranMarkers[id] = createMarker( x , y , z, "checkpoint", 12, 0, 0, 255, 255 )
		detranblip[id] = createBlip( x , y , z, 11 )


			local hx,hy,hz = getElementPosition(localPlayer)
			exports["4i20_radarl"]:utvonalTervezes(hx,hy,hz, x , y , z)
			
			setElementData(detranMarkers[id], "call:player", tplayer)
			setElementData(detranMarkers[id], "call:id", id)
			setElementData(detranMarkers[id], "call:accepted", player)
	end
end
addEvent("createdetranMarker", true)
addEventHandler("createdetranMarker", root, createdetranMarker)

function detranmarker( hitPlayer, matchingDimension )
	if detranMarkers[getElementData(source, "call:id")] and getElementData(source, "call:accepted") == hitPlayer then
		
		local acceptID = getElementData(source, "call:id")
		local tplayer = getElementData(source, "call:player")
		
		if (acceptID) then
			exports.san_hud:dm("Você chegou no chamado " .. acceptID .. " Faça seu serviço.", 255, 200, 0)
			setElementData(tplayer, "call:detran", nil)
			destroyElement(detranMarkers[acceptID])
			destroyElement(detranblip[acceptID])
		end	
	end
end
addEventHandler ( "onClientMarkerHit", getRootElement(), detranmarker )
















local Font_1 = "default-bold-small" --dxCreateFont("files/font.ttf", 8)
--local Font_2 = dxCreateFont("files/font.ttf", 5)
--local Font_3 = dxCreateFont("files/font.ttf", 7)
--local Font_4 = dxCreateFont("files/font.ttf", 8)
--local Font_5 = dxCreateFont("files/font.ttf", 7)


----------------------------------------------------------------------------------------------------------------------------------------------

-- //#Mensages

mensages = {}
messagetick = 0

function servermessagesCelular(message, type)
	local screenH, screenW = guiGetScreenSize()
	local x, y = (screenH/1366), (screenW/768)
	if not fontScale then fontScale = screenW/40 end
	table.insert(mensages, {message, type or "confirm", getTickCount(), dxGetTextWidth(message, fontScale*0.06, Font_1) + screenH*0.01, 0, 0, 0})
	messagetick = getTickCount()
end
addEvent("servermessagesCelular", true)
addEventHandler("servermessagesCelular", getRootElement(), servermessagesCelular)

function renderMensages()
	local screenH, screenW = guiGetScreenSize()
	local x, y = (screenH/1366), (screenW/768)
	local msgd = mensages
	if #msgd ~= 0 then
		local startY = screenW*0.5
		local i = 1
		repeat
			mData = msgd[i]
			local drawThis = true
			if i~= 1 then
				startY = startY + screenW*0.0425
			end
			if mData[5] == 0 and mData[6] == 0 then
				mData[5] = - mData[4] - screenH*0.015
				mData[6] = startY
				mData[7] = startY
			end
			local tick = getTickCount() - mData[3]
			local posX, posY, alpha
			if tick < 1000 then
				local progress = math.min(tick/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, 0, 0, 0, progress, "Linear")
			elseif tick >= 1000  and tick <= 7000 then
				mData[5] = 0
			elseif tick > 7000 then
				local progress = math.min((tick - 7000)/1000,1)
				mData[5] = interpolateBetween(mData[5], 0, 0, - mData[4] - mData[4] - screenH*0.015, 0, 0, progress, "Linear")
				if progress >= 1 then
					table.remove(msgd, i)
					drawThis = false
					messagetick = getTickCount()
				end
			end
			local globalTick = getTickCount() - messagetick
			if drawThis then
				mData[7] = startY
				mData[6] = interpolateBetween(mData[6], 0, 0, mData[7], 0, 0, math.min(globalTick/1000,1), "Linear")
				posX = mData[5]
				posY = mData[6]
				alpha = 255
				dxDrawRectangle(posX, posY, mData[4], screenW*0.04, tocolor(0, 0, 0, alpha*0.75), true)
				local r, g, b = 0, 255, 0
				if mData[2] == "warning" then
					r, g, b = 255, 0, 0
				end
				dxDrawRectangle(posX + mData[4], posY, screenH*0.010, screenW*0.04, tocolor(r, g, b, alpha*0.85), true)
				dxDrawText(mData[1], posX, posY, posX + mData[4], posY + screenW*0.04, tocolor(255, 255, 255, alpha), fontScale*0.05, Font_1, "center", "center", false, false, true, false, false)
			end
			i = i + 1
		until i > #msgd
		mensages = msgd
	end
end
addEventHandler("onClientRender", getRootElement(), renderMensages)


addCommandHandler("dinheirosujo", function(commandName, targetPlayerNick, amount)
	if getElementData(localPlayer, "loggedin") then
		if not (targetPlayerNick) or not tonumber(amount) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Nome do Jogador / ID] [Valor]", 255, 194, 14, true)
		else
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(localPlayer, targetPlayerNick)
			
			if targetPlayer then
				local x, y, z = getElementPosition(localPlayer)
				local tx, ty, tz = getElementPosition(targetPlayer)
				local amount = math.abs(math.floor((tonumber(amount))))
				
				if localPlayer == targetPlayer then
					outputChatBox("#7cc576[IRG ]: #ffffffVocê não pode transferir dinheiro para si mesmo.", 255, 255, 255, true)
					return
				elseif getDistanceBetweenPoints3D(x, y, z, tx, ty, tz) > 10 then
					outputChatBox("#7cc576[IRG ]: #ffffffO jogador está muito longe.", 255, 255, 255, true)
					return
				elseif amount <= 0 then
					outputChatBox("#7cc576[IRG ]: #ffffffDigite um número inteiro maior que zero!", 255, 255, 255, true)
					return
				elseif amount > (getElementData(localPlayer, "char:moneysujo") or 0) then
					outputChatBox("#7cc576[IRG ]: #ffffffVocê não tem tanto dinheiro.", 255, 255, 255, true)
					return
				elseif isTimer(payTimer) then
					outputChatBox("#7cc576[IRG ]: #ffffffUma transferência já está em andamento.", 255, 255, 255, true)
					return
				end

				outputChatBox("#7cc576[IRG ]: #ffffffEspere um pouco.", 255, 255, 255, true)
				triggerServerEvent("animpassandomoney", localPlayer)

				payTimer = setTimer(function()
					local x, y, z = getElementPosition(localPlayer)
					local tx, ty, tz = getElementPosition(targetPlayer)

					if getDistanceBetweenPoints3D(x, y, z, tx, ty, tz) > 5 then
						outputChatBox("#7cc576[IRG ]: #ffffffVocê estava muito distante.", 255, 255, 255, true)
						return
					elseif amount > getElementData(localPlayer, "char:moneysujo") then
						outputChatBox("#7cc576[IRG ]: #ffffffSeu dinheiro acabou com o tempo.", 255, 255, 255, true)
						return
					end

					outputChatBox("#7cc576[IRG ]: #ffffffVocê passou para #7cc576"..targetPlayerName.."#ffffff, um total de #7cc576R$ "..(amount).."#ffffff de dinheiro sujo.", 255, 255, 255, true)
					triggerServerEvent("server->payMoney", localPlayer, targetPlayer, amount)
				end, 5000, 1)
			end
		end
	end
end)



addEventHandler("onClientResourceStart", resourceRoot, function()
    local txd = engineLoadTXD("files/cellphone.txd")
    engineImportTXD(txd, 330)
    local dff = engineLoadDFF("files/cellphone.dff")
    engineReplaceModel(dff, 330)
end)
