local renderData = {}

local skinID = 25
local panelState = false
local doingDrive = false 

renderData.sWidth, renderData.sHeight = guiGetScreenSize()
renderData.wWidth, renderData.wHeight = renderData.sWidth / 2 - 369.5, renderData.sHeight / 2 - 154.5

local panelFont = dxCreateFont("files/calibri.ttf", 20)

--útvonal
local route = {}
route[1] = { 776.07, -1415.187, 13.152 }
route[2] = { 632.755, -1437.479, 13.454 }	-- 2
route[3] = { 629.996, -1545.864, 14.598 }	-- 3
route[4] = { 590.686, -1721.899, 12.982 }		-- 4
route[5] = { 210.569, -1625.807, 13.554 }		-- 5
route[6] = { 143.413, -1443.272, 31.255 }		-- 6
route[7] = { 446.4, -1232.314, 48.795 }		-- 7
route[8] = { 642.429, -1099.01, 46.47 }	-- 8
route[9] = { 836.564, -872.333, 68.278 }	-- 9
route[10] = { 1132.014, -767.909, 108.296 }	-- 10
route[11] = { 1378.74, -672.383, 93.142 }	-- 11
route[12] = { 1278.377, -564.506, 92.845 }	-- 12
route[13] = { 1586.874, -456.064, 34.927 }	-- 13
route[14] = { 1676.544, -848.696, 58.484 }	-- 14
route[15] = { 1591.132, -1446.932, 28.197 }	-- 15
route[16] = { 1448.498, -2114.549, 12.792 }	-- 16 
route[17] = { 1279.085, -2446.696, 7.59 }	-- 17 
route[18] = { 1063.635, -1971.441, 12.355 }	-- 18
route[19] = { 1011.334, -1792.478, 13.331 }	-- 19
route[20] = { 811.775, -1749.222, 12.794 }	-- 20
route[21] = { 807.019, -1588.771, 12.792 }	-- 21
route[22] = { 791.238, -1498.104, 12.792 }	-- 22
route[23] = { 780.393, -1416.29, 13.535 }
route[24] = { 778.736, -1413.802, 13.53 }	-- 23

renderData.routeCounter = 1


generatedQuestion = false
--jelenlegi kérdés index. 


local questions = {
	--{"Pode usar um farol em vez de uma luz de cruzamento se \num farol pode ofuscar o condutor de um veículo que percorre a via navegável paralela à estrada?", "Igen", "Nem", "Éjszaka", 2, false}, -- 1
	--{"Vezethet-e gépjárművet az a személy, akit a vezetéstől jogerős bírói ítélettel eltiltottak, de \nvezetői engedélyét még nem adta le?", "Nem", "Igen", "Józanul igen", 1, false}, -- 2
	--{"Szabad-e hátramenetet végezni autópályán, illetve autóúton?", "Igen", "Utánfutó nélkül igen", "Nem", 3, false}, -- 3
	--{"Szabad-e elakadés jelzőt használni lakott területen belül?", "Igen", "Indokolt esetben", "Nem", 2, false}, -- 4
	{"Sorat Mojaz Dar Khiaban 1Line Chand Ast?", "30", "60", "90", 2, false}, -- 5
	{"Sorat Mojaz Dar Khiaban 2Line Chand Ast?", "30", "60", "90", 3, false}, -- 6
	{"Sorat Mojaz Dar Otoban Chand Ast", "120", "130", "150", 1, false}, -- 7
	{"Ba Kodam Azole Mitavanid Khodro Ra Roshan Konid ?", "K", "J", "X", 2, false}, -- 8
	{"Ba Kodam Azole Mitavanid Tormoz Dasti Bekeshid?", "Alt", "G", "X", 1, false}, -- 9
	{"Ba Kodam Azole Mitavanid Dar Khodro Ra Ghofl Va Baz Konid?", "U", "J", "K", 3, false}, -- 10
	{"Shoma Bayad Hamishe Az Line Rast Harkekat Konid?", "Bale", "Kheyr","Nemidonam:)" ,1, false}, -- 11
	{"Agar Police Be Shoma Ekhtar Dad Shoma Bayad Chikar Konid?", " Farar Konim", "Ahamit Nadim", "Kheyli Aram Dar Kenar Jade Park Mikonim", 3, false}, -- 12
	--{"Onde você pode sair da estrada?", "acostamento", "Você não pode voltar", "em qualquer lugar", 2, false}, -- 13
	{"Roshan Bodan Cheragh Ha Dar Shab ?", "Ejbari Ast", "Ekhtiari Ast","Khalaf Ghavanin Ast" ,1, false}, -- 14
	{"Hadaghal Fasele Bein Khodro Ha ?", "1metr", "2metr", "3metr", 2, false}, -- 15
} 

addEventHandler("onClientResourceStart", getResourceRootElement(), 
	function() 
		
		local drivingLicensePed = createPed(skinID, 774.02111816406, -1427.978515625, 13.535365104675)
		setPedRotation( drivingLicensePed,  239.39849853516 )
		setElementDimension( drivingLicensePed, 0 )
		setElementInterior( drivingLicensePed , 0 )
		setElementData(drivingLicensePed, "quest:ped", true)
		setElementData(drivingLicensePed, "drivingLicense", true)
		setElementData(drivingLicensePed, "Ped:Name", "Govahi Name")
		setElementFrozen(drivingLicensePed,true)
	end
)

function renderPanel()
	if panelState then

		dxDrawRectangle(renderData.wWidth, renderData.wHeight+30, 739, 250, tocolor(0, 0, 0, 150), false)
		dxDrawRectangle(renderData.wWidth, renderData.wHeight+30, 739, 40, tocolor(0, 0, 0, 200), false)
		dxDrawRectangle(renderData.wWidth + 65, renderData.wHeight + 220, 150, 40, tocolor(124, 197, 118, 150), false)
		dxDrawRectangle(renderData.wWidth + 295, renderData.wHeight + 220, 150, 40, tocolor(124, 197, 118, 150), false)
		dxDrawRectangle(renderData.wWidth + 525, renderData.wHeight + 220, 150, 40, tocolor(124, 197, 118, 150), false)
		dxDrawRectangle(renderData.wWidth + 708, renderData.wHeight - 5, 30, 30, tocolor(215, 85, 85, 150), false)
		

		dxDrawText("IRG Auto-Escola", renderData.wWidth + 372, renderData.wHeight + 32, renderData.wWidth + 372, renderData.wHeight + 17, tocolor(0, 0, 0), 1, panelFont, "center", "top", false, false, true, true)
		dxDrawText("#7cc576IRG #ffffffRoleplay", renderData.wWidth + 370, renderData.wHeight + 30, renderData.wWidth + 370, renderData.wHeight + 15, tocolor(255, 255, 255, 225), 1, panelFont, "center", "top", false, false, true, true)
		dxDrawText("X", renderData.wWidth + 1075, renderData.wHeight - 8, renderData.wWidth + 372, renderData.wHeight + 17, tocolor(255, 255, 255), 1, panelFont, "center", "top", false, false, true, true)
		dxDrawText("Baraye Daryafe Govahi Name $:1.000 Niyaz Darad!\n Hazine Emtehan Eshtebah $: 500!", renderData.wWidth + 371, renderData.wHeight + 281, renderData.wWidth + 371, renderData.wHeight + 16, tocolor(0, 0, 0), 0.6, panelFont, "center", "top", false, false, true, true)
		dxDrawText("Baraye Daryafe Govahi Name $:1.000 Niyaz Darad!\n Hazine Emtehan Eshtebah $: 500!", renderData.wWidth + 370, renderData.wHeight + 280, renderData.wWidth + 370, renderData.wHeight + 15, tocolor(255, 0, 0, 225), 0.6, panelFont, "center", "top", false, false, true, true)

	
	--	dxDrawText("Kérdés: \n"..questions[generatedQuestion][1], renderData.wWidth + 372, renderData.wHeight + 102, renderData.wWidth + 372, renderData.wHeight + 102, tocolor(0, 0, 0), 0.6, panelFont, "center", "top", false, false, true)
		dxDrawText("#FFA700Soal Ha: \n#ffffff"..questions[generatedQuestion][1], renderData.wWidth + 370, renderData.wHeight + 100, renderData.wWidth + 370, renderData.wHeight + 100, tocolor(255, 255, 255, 225), 0.6, panelFont, "center", "top", false, false, true, true)
		
		dxDrawText(questions[generatedQuestion][2], renderData.wWidth + 142, renderData.wHeight + 232, renderData.wWidth + 142, renderData.wHeight + 232, tocolor(0, 0, 0), 0.5, panelFont, "center", "top", false, false, true)
		dxDrawText(questions[generatedQuestion][2], renderData.wWidth + 140, renderData.wHeight + 230, renderData.wWidth + 140, renderData.wHeight + 230, tocolor(255, 255, 255, 225), 0.5, panelFont, "center", "top", false, false, true)
	
		dxDrawText(questions[generatedQuestion][3], renderData.wWidth + 372, renderData.wHeight + 232, renderData.wWidth + 372, renderData.wHeight + 232, tocolor(0, 0, 0), 0.5, panelFont, "center", "top", false, false, true)
		dxDrawText(questions[generatedQuestion][3], renderData.wWidth + 370, renderData.wHeight + 230, renderData.wWidth + 370, renderData.wHeight + 230, tocolor(255, 255, 255, 225), 0.5, panelFont, "center", "top", false, false, true)
		
		dxDrawText(questions[generatedQuestion][4], renderData.wWidth + 602, renderData.wHeight + 232, renderData.wWidth + 602, renderData.wHeight + 232, tocolor(0, 0, 0), 0.5, panelFont, "center", "top", false, false, true)
		dxDrawText(questions[generatedQuestion][4], renderData.wWidth + 600, renderData.wHeight + 230, renderData.wWidth + 600, renderData.wHeight + 230, tocolor(255, 255, 255, 225), 0.5, panelFont, "center", "top", false, false, true)
		
	end 
end

local startedName = false
addEventHandler("onClientClick", getRootElement(), 
	function(button, state, x, y, wx, wy, wz, element) 
		if button and state and state == "down" and isElement(element) and getElementData(element, "drivingLicense") and not panelState and not doingDrive then

			--if getElementData(localPlayer, "license.car") == 1 then exports['san_info']:createDebugNotification("Você já tem uma licença!", 1) return end

			if exports.san_items:hasItem(localPlayer,28) then exports.san_infobox:addNotification(localPlayer,"Shoma Ghablan Govahi Name Darid!", "info") return end


				if getElementData(localPlayer, "char:money") >= 1 then
					addEventHandler("onClientRender", getRootElement(), renderPanel)
					panelState = true 
					generateQuestion()
					exports.san_info:addNotification("Vajh Dar Payane Azmon Az Shoma Kasr Mishavad!", "info")
					exports.san_infobox:addNotification(localPlayer,"Be Soalat Pasokh Dahid!", "info")
					--startedName = getElementData(localPlayer, "char:Name")
					startedName = getPlayerName(localPlayer)
				else 
					exports.san_infobox:addNotification(localPlayer,"Shoma Vahj Kafi Nadarid!", "info")
				end

		end 

		if button and state == "down" and panelState then
			if x >= renderData.wWidth + 40 and x <= renderData.wWidth + 250 then
				if y >= renderData.wHeight + 220 and y <= renderData.wHeight + 271 then
					processAnswering(1)
				end 
			end 

			if x >= renderData.wWidth + 270 and x <= renderData.wWidth + 480 then
				if y >= renderData.wHeight + 220 and y <= renderData.wHeight + 271 then
					processAnswering(2)
				end 
			end 

			if x >= renderData.wWidth + 500 and x <= renderData.wWidth + 710 then
				if y >= renderData.wHeight + 220 and y <= renderData.wHeight + 271 then
					processAnswering(3)
				end 
			end 

			if x >= renderData.wWidth + 708 and x <= renderData.wWidth + 800 then
				if y >= renderData.wHeight + 15 and y <= renderData.wHeight + 55 then
					closePanel()
				end 
			end 
		end 
	end 

)

oldBlip = false
currentMarker = 1

function nextMarker()

	currentMarker = currentMarker + 1
	for k, v in pairs(getElementsByType("marker")) do 
		if getElementData(v, "license") then
			destroyElement(v)
		end 
	end

	for k, v in pairs(getElementsByType("blip")) do 
		if getElementData(v, "license") then
			destroyElement(v)
		end 
	end


	if currentMarker < 24 then
		local startMarker = createMarker(route[currentMarker][1], route[currentMarker][2], route[currentMarker][3], "checkpoint", 4, 124, 197, 118, 255)
--		triggerServerEvent("setaInfor", root, localPlayer, route[currentMarker][1], route[currentMarker][2], route[currentMarker][3])
		local oldBlip = createBlip(route[currentMarker][1], route[currentMarker][2], route[currentMarker][3], 0, 2, 255, 0, 255, 255) -- 54, 1
		setElementData(startMarker, "license", true)
		setElementData(startMarker, "name", "Checkpoint")
		setElementData(oldBlip, "license", true)

		addEventHandler("onClientMarkerHit", startMarker, 
			function(hitPlayer)
				if hitPlayer == localPlayer then 
					nextMarker()
					playSoundFrontEnd(12)
				end 
			end
		)
	else 
		finishLicense()
	end
end

local characters = {"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y"}
function createNewKey(size)
	local code = math.random(100, 500)
	for i = 1, size do
		a = math.random(1,#characters)
		x=string.upper(characters[a])
		code = code .. x
	end
	return code
end

local monthDays = {
	[1] = 31, -- jan
	[2] = 28, -- feb
	[3] = 31, -- márc
	[4] = 30, -- ápr
	[5] = 31, -- máj
	[6] = 30, -- jún
	[7] = 31, -- júl
	[8] = 31, -- aug
	[9] = 30, -- szept
	[10] = 31, -- okt
	[11] = 30, -- nov
	[12] = 31, -- dec
}



function generateDate(year,month,day)
	local realTime = getRealTime()
	local year, month, day = year or realTime.year + 1900, month or realTime.month + 1, day or realTime.monthday
	if day+28 > monthDays[month] then
		if month+1 > 12 then
			year = year + 1
			month = month - 11
		else
			month = month + 1
		end
	else
		day = day + 28
	end
	if day > monthDays[month] then
		day = monthDays[month]
	elseif month > 12 then
		month = 12
	end
	if month < 10 then
		month = "0"..month
	end
	if day < 10 then
		day = "0"..day
	end
	return year.."."..month.."."..day.."."
end


function finishLicense()
	triggerServerEvent("finishLicense", getRootElement(), localPlayer)
	exports.san_infobox:addNotification(localPlayer,"Shoma Ba Moafaghiyat Govahi Name Daryaft Kardid.", "info")
	currentMarker = 1
	renderData.routeCounter = 1
	generatedQuestion = false	
	setElementData(localPlayer, "license.car", 1)

	triggerServerEvent("giveJogsi",localPlayer,localPlayer,getPlayerName(localPlayer):gsub("_"," "),createNewKey(4),getElementModel(localPlayer),generateDate())


	doPay(2)

	for k, v in pairs(getElementsByType("blip")) do
		if getElementData(v, "license") then
			destroyElement(v)
		end 
	end 

	for k, v in pairs(getElementsByType("marker")) do
		if getElementData(v, "license") then
			destroyElement(v)
		end 
	end
	


	exports['san_items']:giveItem(source, 54, 1, 1, 1, false)


end

local counter = 0
function generateQuestion()
	if panelState then
		
		counter = counter + 1
		
		if counter < 10 then
			repeat
				generatedQuestion = math.random(10)
			until not questions[generatedQuestion][12]		
		else 

		end 
	end 
end

local totalPoints = 0

function processAnswering(number)
	if panelState and number then
		if tonumber(number) == tonumber(questions[generatedQuestion][5]) then
			totalPoints = totalPoints + 10
		--	playSoundFrontEnd(40)	
		--else 
		--	playSoundFrontEnd(4)		
		end 
		--outputChatBox(totalPoints)
		questions[generatedQuestion][8] = true
		if counter < 10 then
			generateQuestion()
		else 
			
			if totalPoints >= 50 then
				if totalPoints >= 100 then
					exports.san_infobox:addNotification(localPlayer,"Azmon Ra Ghabol Shodi!", "success")
				else
					exports.san_infobox:addNotification(localPlayer,"Azmon Ra Ghabol Shodi!", "info")
				end
				exports.san_info:addNotification("Be Mahale Mark Shode Berid Va Azmon Shahri Ra Shoro Konid!", "info")
				local startingMarker = createMarker(route[1][1], route[1][2], route[1][3], "checkpoint", 4, 255, 0, 0, 255)
				local startingBlip = createBlip(route[1][1], route[1][2], route[1][3], 0, 2, 255, 0, 255, 255) -- 54, 1
				setElementData(startingMarker, "license", true)
				setElementData(startingMarker, "name", "Checkpoint")
				setElementData(startingBlip, "license", true)
				doPay(1)
				removeEventHandler("onClientRender", getRootElement(), renderPanel)
				totalPoints = 0
				panelState = false
				doingDrive = true

				addEventHandler("onClientMarkerHit", startingMarker, 
					function(hitPlayer)
						if hitPlayer == localPlayer then
							triggerServerEvent("createLicenseVehicle", getRootElement(), localPlayer)
							nextMarker()
						end
					end 
				)
		else
				exports.san_infobox:addNotification(localPlayer,"Motasefam,Nemitoni Dobare Emtehan Koni!", "info")
				removeEventHandler("onClientRender", getRootElement(), renderPanel)
				totalPoints = 0
				panelState = false
				doingDrive = false
			end 
		end 
	end
end

function doPay(num)
	if num then
		if num == 1 then
			
			if getElementData(localPlayer, "char:money") >= 1 then
				setElementData(localPlayer, "char:money", getElementData(localPlayer, "char:money") - 1)
			else 
			--	exports.san_info:addNotification("Nincs elég pénzed.", "error")
				exports.san_infobox:addNotification(localPlayer,"Vajh Kafi Nadari!", "error")
			end 

		elseif num == 2 then
			
			if getElementData(localPlayer, "char:money") >= 1 then
				setElementData(localPlayer, "char:money", getElementData(localPlayer, "char:money") - 1)
			else 
				--exports.san_info:addNotification("Nincs elég pénzed.", "error")
				exports.san_infobox:addNotification(localPlayer,"Vajh Kafi Nadari!", "error")
			end			
		end 
	end 
end 

function closePanel()
	if panelState then
		panelState = false
		removeEventHandler("onClientRender", getRootElement(), renderPanel)
		currentMarker = 1
		renderData.routeCounter = 1
		generatedQuestion = false
		counter = 0

		
		local questions = {
			--{"Pode usar um farol em vez de uma luz de cruzamento se \num farol pode ofuscar o condutor de um veículo que percorre a via navegável paralela à estrada?", "Igen", "Nem", "Éjszaka", 2, false}, -- 1
			--{"Vezethet-e gépjárművet az a személy, akit a vezetéstől jogerős bírói ítélettel eltiltottak, de \nvezetői engedélyét még nem adta le?", "Nem", "Igen", "Józanul igen", 1, false}, -- 2
			--{"Szabad-e hátramenetet végezni autópályán, illetve autóúton?", "Igen", "Utánfutó nélkül igen", "Nem", 3, false}, -- 3
			--{"Szabad-e elakadés jelzőt használni lakott területen belül?", "Igen", "Indokolt esetben", "Nem", 2, false}, -- 4
			{"Você pode andar pelo túnel como um pedestre?", "Não", "Sim", "Sim durante o dia", 1, false}, -- 5
			{"Você precisa marcar a carga que está sobre o veículo?", "Sim, em qualquer caso", "A mais de 40 cm", "Apenas no escuro", 1, false}, -- 6
			{"É obrigatório cumprir as instruções da polícia?", "Não", "Sim", "Onde apropriado, não", 2, false}, -- 7
			{"Você pode andar com seu carro se detectar uma falha no motor?", "Sim", "Se sim, sim", "não", 3, false}, -- 8
			{"É prioridade para um pedestre que passa pela área designada?", "Sim", "Não", "Se você vem de um emprego, não", 1, false}, -- 9
			{"Você deve usar um sinal de direção quando for fazer a estrada à esquerda e à direita?", "Não", "Sim", "a mesma coisa", 2, false}, -- 10
			{"Você pode dar um sinal sonoro para indicar sua intenção de escapar?", "Se for policia, sim", "Sim", "Não", 3, false}, -- 11
			{"O que fazer se você ver um homem deitado na beira da estrada?", "ajudar", "Continuar", "Chamar socorro", 1, false}, -- 12
			--{"Onde você pode sair da estrada?", "acostamento", "Você não pode voltar", "em qualquer lugar", 2, false}, -- 13
			{"Você pode forçar alguém a parar de frear?", "Não", "Sim", "Sim, Se você for policial", 1, false}, -- 14
			{"É um dever usar o cinto de segurança?", "Apenas em uma área residencial", "Sim, Se você ver um policial", "Sim", 3, false}, -- 15
		} 

	end 
end