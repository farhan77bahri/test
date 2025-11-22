local dutyBlip = {}

--[[
CORPS:

BAEP
PMERJ
BOPE
PF/POLICIA FEDERAL
RADIO PATRULHA
ROTA
Exercito Brasileiro
PMPR
FT
BpChq
============================================================

FACS:

ADA
BASTARDOS INGLORIUS
COMANDO VERMELHO
FAMILIA DO NORTE
MOTO CLUBE
PCC
grove
ballas
vagos
Odr
-]]

function createDutyPickup()

	local dutyplaces = {
		--x,y,z,int,dim

		{1888.2950439453, -1646.904296875, 16.034629821777,0,0}, -- Polícia 1 / Baep
	    {-1103.2280273438, -1063.2227783203, 129.26875305176, 0, 0}, -- Polícia 2 / BOPE/PMERJ
		{1650.8244628906, -1334.2229003906, 17.55536460876,0,0}, -- Polícia 3 / PF/Federal
		{-1588.5653076172, 675.55639648438, 15.355365753174,0,0}, -- Polícia 4 / RADIO PATRULHA
		{-2134.9604492188, -856.50073242188, 32.293983459473,0,0}, -- Polícia 5 / ROTA
		{224.29125976563, 1902.5748291016, 21.655364990234,0,0}, -- Polícia 6 / Exercito Brasileiro
		{1412.2702636719, -1698.7316894531, 19.888145446777,0,0}, -- Polícia 7 / Ministerio
		{1608.3552246094, 676.40875244141, 10.8203125,0,0}, -- Polícia 8 / PMSC
		{-2739.8942871094, 619.91540527344, 34.455368041992,0,0},-- Polícia 9 / Força Tatica
		{1011.2772827148, -308.75909423828, 74.706253051758,0,0},-- Polícia 10 / 
		{29.835773468018, 274.68493652344, 8.055365562439,0,0},-- Polícia 11 / Bope
		{1535.7843017578, -1365.3182373047, 329.4609375,0,0}, -- Polícia 12 / 
		{1531.8968505859, -1360.2768554688, 329.45346069336,0,0}, -- Polícia 13 / 
		{1531.4315185547, -1354.5277099609, 329.45346069336,0,0}, -- Polícia 14 / 
		{1534.552734375, -1349.9310302734, 329.45327758789,0,0}, -- Polícia 15 / 
		{2022.2239990234, -1404.7644042969, 17.181009292603,0,0}, -- samu
		--{382.1389465332, -1798.7170410156, 7.8808903694153,0,0}, -- Mecânico 
		{1537.2578125, -2251.6613769531, 13.586245536804,0,0}, -- Detran 
	
		
		--148.03395080566, 1372.5938720703, 1088.36718755
--		{1262.9912109375, -1676.8151855469, 13.88413143158,0,0}, -- Taxi
		{148.03395080566, 1372.5938720703, 1088.36718755,5,1949}, -- Gang 20 / Comando Vermelho
		{2349.2326660156, -1172.1025390625, 1027.9833984375,5,0}, -- Gang 21 / Milicia
		{145.63832092285, 1386.7072753906, 1088.3671875,5,0}, -- Gang 22 / mafia
		{-292.53802490234, 1480.9765625, 1088.875,15,0}, -- Gang 23 / ADA
		{3858.1730957031, -1177.5607910156, 3.6210470199585,0,0}, -- Gang 24 / MOTO CLUBE
		{-71.640396118164, 1366.3354492188, 1080.2185058594,6,0}, -- Gang 25 / PCC
		{2261.3835449219, -1223.5716552734, 1049.0234375,10,0}, --Gang 26 / Grove
		{2357.9658203125, -1135.1115722656, 1050.875,8,0},  -- Gang 27
		{-52.342887878418, 1404.3405761719, 1084.4370117188,8,0},  -- Gang 28 Vagos	
		{1278.3172607422, -785.76452636719, 1089.9375,5,0},  -- Gang 29/club96	
		{2742.9562988281, -2280.6169433594, 1.7553654909134,0,0},  -- Gang 30	
		{382.42471313477, -1812.1385498047, 11.409193992615,0,0},  -- mechanic
		{334.92794799805, -1483.1379394531, 36.03906,0,0}  -- Corporação 31 / Medicos

	}
	
	
	--[[mafia = createPickup (148.03395080566, 1372.5938720703, 1088.36718755, 3, 1275)
	setElementDimension(mafia, 1949)
    setElementInterior(mafia, 5)]]


local dutyPickup = {}
	
	for k, v in ipairs(dutyplaces) do
		dutyBlip[k] = createPickup (dutyplaces[k][1], dutyplaces[k][2], dutyplaces[k][3], 3, 1275)
		setElementInterior(dutyBlip[k], dutyplaces[k][4])
		setElementDimension(dutyBlip[k], dutyplaces[k][5])
	end

end
addEventHandler("onClientResourceStart", getResourceRootElement(), createDutyPickup)

local factionNames = {
	[1]="Recruta",
	[2]="Soldado",
	[3]="Cabo",
	[4]="3° Sargento",
	[5]="2° Sargento",
	[6]="1° Sargento",
	[7]="Sub Tenente",
	[8]="2° Tenente",
	[9]="1° Tenente",
	[10]="Capitão",
	[11]="Major",
	[12]="Tenente - Coronel",
	[13]="Coronel",
	[14]="Sub Comandante",
	[15]="Comandante",
}


function seurankPolicia(groupID)
	local rank = exports.san_dashboard:getPlayerRankInFaction(groupID)
	local nome = exports.san_dashboard:getFactionName(groupID)
	
	setElementData(localPlayer, "job", " "..nome.." - "..factionNames[rank] )
	--setElementData(localPlayer, "job", "MAFIA")
end
addEvent("seurankPolicia", true)
addEventHandler("seurankPolicia", getRootElement(), seurankPolicia)



local factionNames6 = {
	[1]="Agente 3 Classe",
	[2]="Agente 2 Classe",
	[3]="Agente 1 Classe",
	[4]="Agente de Pericia",
	[5]="Agente Administrativo",
	[6]="Perito Criminal",
	[7]="Perito Investigativo",
	[8]="Papiloscopista",
	[9]="Capitão",
	[10]="Major",
	[11]="Delegado",
	[12]="Delegado Federal",
	[13]="Delegado Geral",
	[14]="Diretor Federal",
	[15]="Diretor Geral",
}


function seurankPF(groupID)
	local rank = exports.san_dashboard:getPlayerRankInFaction(groupID)
	local nome = exports.san_dashboard:getFactionName(groupID)
	
	setElementData(localPlayer, "job", " "..nome.." - "..factionNames6[rank] )
end
addEvent("seurankF", true)
addEventHandler("seurankF", getRootElement(), seurankPF)





local factionNames2 = {-- Comando Vermelho
	[1]="Fogueteiro",
	[2]="Olheiro",
	[3]="Avião",
	[4]="Vapor",
	[5]="Soldado",
	[6]="Gerente da boca",
	[7]="Gerente Geral",
	[8]="Braço esquerdo",
	[9]="Braço direito",
	[10]="Sub Patrão",
	[11]="Patrão",
	[12]="",
	[13]="",
	[14]="",
	[15]="Patrão",
}


function seurankGS(groupID)
	local rank = exports.san_dashboard:getPlayerRankInFaction(groupID)
	local nome = exports.san_dashboard:getFactionName(groupID)
	setElementData(localPlayer, "job", "MAFIA")
	--setElementData(localPlayer, "job", " "..nome.." - "..factionNames2[rank] )
end
addEvent("seurankG", true)
addEventHandler("seurankG", getRootElement(), seurankGS)

local factionNames3 = {
	[1]="Pretendente",
	[2]="Meio Escudo",
	[3]="Escudo Fechado",
	[4]="Tesoureiro",
	[5]="Secretário",
	[6]="Capitão De Estrada",
	[7]="Vice-Presidente",
	[8]="Presidente",
	[9]="",
	[10]="",
	[11]="",
	[12]="",
	[13]="",
	[14]="",
	[15]="",
}


function seurankMC(groupID)
	local rank = exports.san_dashboard:getPlayerRankInFaction(groupID)
	local nome = exports.san_dashboard:getFactionName(groupID)
	
	setElementData(localPlayer, "job", " "..nome.." - "..factionNames3[rank] )
end
addEvent("seurankM", true)
addEventHandler("seurankM", getRootElement(), seurankMC)



local cargosNomeSamu = {-- Cargos do Samu
	[1]="Estagiario",
	[2]="Estagiario Maior",
	[3]="Aux Socorrista",
	[4]="Primeiro Socorrista",
	[5]="Condutor Brigadista",
	[6]="Medico Brigadista",
	[7]="Condutor Socorrista",
	[8]="Sub-Oficial",
	[9]="Oficial Brigadista",
	[10]="Sub-Comandante",
	[11]="Comandante",
	[12]="Comandante Geral",
	[13]="",
	[14]="",
	[15]="",
}


function cargoSamu(groupID)
	local rank = exports.san_dashboard:getPlayerRankInFaction(groupID)
	local nome = exports.san_dashboard:getFactionName(groupID)
	
---	setElementData(localPlayer, "job", " "..nome.." - "..cargosNomeSamu[rank] )
    setElementData(localPlayer, "job", "Medic")
end
addEvent("cargoSamu", true)
addEventHandler("cargoSamu", getRootElement(), cargoSamu)




function playGovSound()

	local sound = playSound("files/gov.mp3")
	setSoundVolume(sound, 0.5)

end
addEvent("playGovSound", true)
addEventHandler("playGovSound", getRootElement(), playGovSound)




function isInSlot(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(dobozbaVan(xS,yS,wS,hS, cursorX, cursorY)) then
			return true
		else
			return false
		end
	end	
end


function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end



function showHealthPanel(player, state)
	if state == 1 then
		addEventHandler("onClientRender", root, renderHealthPanel)
		showingHealth = true
		showCursor(true)
		
	else
		removeEventHandler("onClientRender", root, renderHealthPanel)
		showingHealth = false
			showCursor(false)

	end
end
addEvent("showHealthPanel", true)
addEventHandler("showHealthPanel", getRootElement(), showHealthPanel)

local monitorSize = {guiGetScreenSize()}
local panelSize = {400, 200}
local panelX, panelY = monitorSize[1]/2-panelSize[1]/2, monitorSize[2]/2-panelSize[2]/2
local cost = 200
local buttons = {{"OK"}, {"Close"}}
local font = "default-bold" 
function renderHealthPanel()
	if showingHealth then		
		
		dxDrawRectangle(panelX, panelY, panelSize[1], panelSize[2], tocolor(0, 0, 0, 180))
		dxDrawRectangle(panelX, panelY, panelSize[1], 25, tocolor(0, 0, 0, 230))
		
		dxDrawText("#7cc576IRAN-GAMING Roleplay - #ffffffHospital", panelX+400/2, panelY+12.5, panelX+400/2, panelY+12.5, tocolor(0, 0, 0, 230), 1, font, "center", "center", false, false, true, true)
		dxDrawText("#ffffffBaraye Khob Shodan Halet Click Kon #7cc576Darman#ffffff\nHazine #7cc576R$: " .. cost .. "#ffffff.", panelX+400/2, panelY+50, panelX+400/2, panelY+50, tocolor(0, 0, 0, 230), 1.0, font, "center", "center", false, false, true, true)
		
		for k, v in ipairs(buttons) do
			
			if isInSlot(panelX-175+(k*200), panelY+130, 150, 50) then
				dxDrawRectangle(panelX-175+(k*200), panelY+130, 150, 50, tocolor(0, 174, 235, 230))
			else
				dxDrawRectangle(panelX-175+(k*200), panelY+130, 150, 50, tocolor(0, 0, 0, 230))
			end
			
			dxDrawText(v[1],panelX-301+(k*200)+400/2, panelY+153, panelX-302+(k*200)+400/2, panelY+153, tocolor(255, 255, 255, 230), 1.0, font, "center", "center", false, false, true, true)
		end
	end
end

addEventHandler("onClientClick", root,
	function(button, state, absoluteX, absoluteY, worldX, worldY, worldZ, clickedElement)
		
		if button == "left" and state == "down" and showingHealth then
			
			for k, v in ipairs(buttons) do
			
				if dobozbaVan(panelX-175+(k*200), panelY+130, 150, 50, absoluteX, absoluteY) then
					if v[1] == "Close" then	
						showHealthPanel(localPlayer, 2)
					elseif v[1] == "OK" then
						triggerServerEvent("gyogyitPlayer", localPlayer, localPlayer)
						showHealthPanel(localPlayer, 2)
					end
				end
			
			end
		
	
		end
	
	end
)

--[[
function dutyPlayer ()

if isElementWithinColShape(localPlayer, Baep) and getElementDimension(localPlayer) == getElementDimension(Baep) then

triggerServerEvent("dutyPlayers", localPlayer)


end
end]]









--triggerServerEvent("setGroupBalance", localPlayer, groupId, after)


local dutyTexture = dxCreateTexture("files/duty.png")
local boundColor = tocolor(7, 112, 196, 75)

local boundRadius = 0.5
local dutyLocations = {
    {x = 380.9764, y = -1812.2947, z = 11.4078},  -- Mechanic
    {x = 1886.4490, y = -1646.9308, z = 16.0399}, -- LSPD
    {x = 333.7357, y = -1484.3223, z = 36.0391},  -- Medic
    {x = 1645.3843, y = -1324.1428, z = 25.5515}  -- Justice
}

addEventHandler("onClientRender", getRootElement(),
    function()
        for _, location in ipairs(dutyLocations) do
            -- رسم خط و بافت
            dxDrawMaterialLine3D(location.x, location.y, location.z + 0.5, location.x, location.y, location.z - 0.5, dutyTexture, 1, tocolor(50, 179, 239, 255))

            -- رسم مستطیل‌ها در زوایای مختلف
            for j = -0.5, 0.5, 0.5 do
                local z = location.z + j
                dxDrawLine3D(location.x - boundRadius, location.y - boundRadius, z, location.x + boundRadius, location.y - boundRadius, z, boundColor, 2)
                dxDrawLine3D(location.x - boundRadius, location.y + boundRadius, z, location.x + boundRadius, location.y + boundRadius, z, boundColor, 2)
                dxDrawLine3D(location.x - boundRadius, location.y - boundRadius, z, location.x - boundRadius, location.y + boundRadius, z, boundColor, 2)
                dxDrawLine3D(location.x + boundRadius, location.y - boundRadius, z, location.x + boundRadius, location.y + boundRadius, z, boundColor, 2)
            end
        end
    end
)
local renderDistance = 100  -- فاصله رندر
addEventHandler("onClientRender", getRootElement(),
    function()
        local localX, localY, localZ = getElementPosition(localPlayer)

        for _, location in ipairs(dutyLocations) do
            local distance = getDistanceBetweenPoints3D(localX, localY, localZ, location.x, location.y, location.z)
            if distance <= renderDistance then
                -- رسم بافت و خطوط فقط در صورت نزدیک بودن
                dxDrawMaterialLine3D(location.x, location.y, location.z + 0.5, location.x, location.y, location.z - 0.5, dutyTexture, 1, tocolor(50, 179, 239, 255))
                for j = -0.5, 0.5, 0.5 do
                    local z = location.z + j
                    dxDrawLine3D(location.x - boundRadius, location.y - boundRadius, z, location.x + boundRadius, location.y - boundRadius, z, boundColor, 2)
                    dxDrawLine3D(location.x - boundRadius, location.y + boundRadius, z, location.x + boundRadius, location.y + boundRadius, z, boundColor, 2)
                    dxDrawLine3D(location.x - boundRadius, location.y - boundRadius, z, location.x - boundRadius, location.y + boundRadius, z, boundColor, 2)
                    dxDrawLine3D(location.x + boundRadius, location.y - boundRadius, z, location.x + boundRadius, location.y + boundRadius, z, boundColor, 2)
                end
            end
        end
    end
)
addEventHandler("onClientResourceStop", resourceRoot, 
    function()
        if isElement(dutyTexture) then
            destroyElement(dutyTexture)
        end
    end
)





local maxDistance = 10 -- حداکثر فاصله‌ای که متن نمایش داده می‌شود

addEventHandler("onClientRender", root,
    function()
        local localX, localY, localZ = getElementPosition(localPlayer)

        for _, location in ipairs(dutyLocations) do
            local distance = getDistanceBetweenPoints3D(localX, localY, localZ, location.x, location.y, location.z)

            if distance <= maxDistance then -- اگر بازیکن در فاصله مجاز باشد
                local screenX, screenY = getScreenFromWorldPosition(location.x, location.y, location.z + 1, 0.5, true)

                if screenX and screenY then
                    local displayText = location.text or "Unknown Duty Location"
                    dxDrawText(
                        "Az [E] Baraye Duty Estefadeh Konid " , 
                        screenX - 100, screenY - 15, screenX + 100, screenY + 15, 
                        tocolor(255, 255, 255), 2, "default-bold", "center", "center"
                    )
                end
            end
        end
    end
)

