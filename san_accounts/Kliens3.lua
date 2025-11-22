--Scriptet Írta: Csoki
--SanMTA

if fileExists("Kliens.lua") then --Lopás Ellen :)
	fileDelete("Kliens.lua")
end

local monitorSite = {guiGetScreenSize()}
local sx,sy = guiGetScreenSize()
local dim = math.random(1, 10000)
local camID = 0
local lastCamTick = 0
local createdGuis = {}
local data = {}
local panelType = "Nincs"
local showLogin = false
local PanelState = false
local serverColor = "#32CD32"
local nem = nil

local opensansB =  dxCreateFont("files/OpenSansB.ttf",22)
local opensansB2 =  dxCreateFont("files/OpenSansB.ttf",17)
local opensansL =  dxCreateFont("files/OpenSansL.ttf",16)
local opensansL2 =  dxCreateFont("files/OpenSansL.ttf",14)
local opensans = dxCreateFont("files/OpenSans.ttf",15)


local manSkins = {
	2,3
}
local womanSkins = {
	9,10
}


function eletkorCheck(megadott)
	if (18==tonumber(megadott)) or (19==tonumber(megadott)) or (20==tonumber(megadott)) or (21==tonumber(megadott)) or (22==tonumber(megadott)) or (23==tonumber(megadott)) or (24==tonumber(megadott)) or (25==tonumber(megadott)) or (26==tonumber(megadott)) or  (27==tonumber(megadott)) or (28==tonumber(megadott)) or  (29==tonumber(megadott)) or
	(30==tonumber(megadott)) or (31==tonumber(megadott)) or (32==tonumber(megadott)) or (33==tonumber(megadott)) or (34==tonumber(megadott)) or (35==tonumber(megadott))
	or (36==tonumber(megadott)) or  (37==tonumber(megadott)) or (38==tonumber(megadott)) or (39==tonumber(megadott)) or  (40==tonumber(megadott)) or (41==tonumber(megadott)) or (42==tonumber(megadott)) or (43==tonumber(megadott)) or (44==tonumber(megadott)) or (45==tonumber(megadott)) or (46==tonumber(megadott)) or  (47==tonumber(megadott)) or (48==tonumber(megadott)) or (49==tonumber(megadott)) or (50==tonumber(megadott)) or  (51==tonumber(megadott)) or (52==tonumber(megadott)) or (53==tonumber(megadott)) or
	(54==tonumber(megadott)) or (55==tonumber(megadott)) or (56==tonumber(megadott)) or (57==tonumber(megadott)) or  (58==tonumber(megadott)) or  (59==tonumber(megadott)) or
	(60==tonumber(megadott)) then
		return true
	else 
		return false
	end
end

--addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 


function startShowingLoginPanel()
	if (isTransferBoxActive()) then	
		setTimer(startShowingLoginPanel, 1000, 1)
	return end
	triggerServerEvent("showLoginPanelServer", resourceRoot)
end
--addEventHandler("onClientResourceStart", resourceRoot, startShowingLoginPanel)


--function showLoginPanel()

addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), 
function()
	setCameraTarget(localPlayer)
	--setElementData(localPlayer, "banned", false)
	setElementData(localPlayer, "loggedin", false)
	--triggerServerEvent("getPlayerBann",localPlayer)
	setCloudsEnabled ( false )
	showChat(false)
	fadeCamera(false, 1)
	if isElement(zenes) then 
		stopSound(zenes)
	end
	dim = math.random(1, 10000)
	zenes = playSound("san.mp3", false)
	setTimer(function()
		fadeCamera(true, 1)
		removeEventHandler("onClientRender", root, createLogin)
		addEventHandler("onClientRender", root, createLogin)		
		panelType = "login"
		removeEventHandler("onClientPreRender", root, updateCamPosition)
		addEventHandler("onClientPreRender", root, updateCamPosition)		
		lastCamTick = getTickCount () 
		camID = 1
		
		removeEventHandler("onClientClick", root, loginClickFunction)
		addEventHandler("onClientClick", root, loginClickFunction)
		blurShader, blurTec = dxCreateShader("files/BlurShader.fx")
		setElementInterior(localPlayer, 0)
	end, 1000, 1)

	showCursor(true)
	setElementDimension(localPlayer, dim)
	createGui("login")

end)
--addEvent("showLoginPanel", true)
--addEventHandler("showLoginPanel", root, showLoginPanel)

local blurStrength = 10
local myScreenSource = dxCreateScreenSource(monitorSite[1], monitorSite[2])

--[[
local banPanel = false

function playerBan(player, admin, lejar, kezdet, serial, indok, playername, ipadress)

	local bannedBy = getElementData(localPlayer, "ban:bannedBy")
	local Lejar = getElementData(localPlayer, "ban:timeZone")
	local Kezdet = getElementData(localPlayer, "ban:Date")
	local Serial = getElementData(localPlayer, "ban:playerSerial")
	local Indok = getElementData(localPlayer, "ban:reason")
	local Playername = getElementData(localPlayer, "ban:playername")
	local Ipadress = getElementData(localPlayer, "ban:ipadress")
	
	banPanel = true
	addEventHandler("onClientRender", root, banPanelShow)
	panelType = "Nincs"
end
addEvent("playerBan", true)
addEventHandler("playerBan", getRootElement(), playerBan)

function banPanelShow()
	if banPanel then	
		
		blurCreate()
		
		dxDrawRectangle(sx/2-250,sy/2-150,500,300,tocolor(0,0,0,100))
		dxDrawRectangle(sx/2-250,sy/2-153,500,3,tocolor(0,0,0,255))
		dxDrawRectangle(sx/2-250,sy/2+150,500,3,tocolor(0,0,0,255))
		dxDrawRectangle(sx/2-250,sy/2-153,3,306,tocolor(0,0,0,255))
		dxDrawRectangle(sx/2+250,sy/2-153,3,306,tocolor(0,0,0,255))
		
		dxDrawText("#7cc576san MTA #FFFFFFv7.0 [BETA]",0,sy/2-135,sx,sy/2-135,tocolor(255,255,255,255),1.3,"default-bold","center","center",false,false,false,true,true)
		dxDrawText("#FF0000Você esta banido do servidor!",0,sy/2-115,sx,sy/2-115,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2-90,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576Admin: #FFFFFF"..getElementData(localPlayer,"ban:bannedBy"),0,sy/2-80,sx,sy/2-80,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2-60,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576Motivo: #FFFFFF"..getElementData(localPlayer,"ban:reason"),0,sy/2-50,sx,sy/2-50,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2-30,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576tempo: #FFFFFF"..getElementData(localPlayer,"ban:Date"):gsub("-","/"),0,sy/2-20,sx,sy/2-20,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576expira: #FFFFFF"..getElementData(localPlayer,"ban:timeZone"):gsub("-","/"),0,sy/2+10,sx,sy/2+10,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2+30,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576Serial: #FFFFFF"..getElementData(localPlayer,"ban:playerSerial"),0,sy/2+40,sx,sy/2+40,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2+60,500,20,tocolor(0,0,0,200))
		dxDrawText("#7cc576Nome da conta: #FFFFFF"..getElementData(localPlayer,"ban:playername"),0,sy/2+70,sx,sy/2+70,tocolor(255,255,255,255),1.1,"default-bold","center","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-250,sy/2+100,500,50,tocolor(0,0,0,200))
		dxDrawText("Brasil gaming Online",0,sy/2+70,sx,sy/2+180,tocolor(255,255,255,255),1.5,"default-bold","center","center",false,false,false,true,true)
	end
end
]]--

function blurCreate()
    if (blurShader) then
		dxUpdateScreenSource(myScreenSource)
			
		dxSetShaderValue(blurShader, "ScreenSource", myScreenSource);
		dxSetShaderValue(blurShader, "BlurStrength", blurStrength);
		dxSetShaderValue(blurShader, "UVSize", monitorSite[1], monitorSite[2]);

		dxDrawImage(0, 0, monitorSite[1], monitorSite[2], blurShader)
    end
end


function createGui(type)
	if tostring(type) == "destroy" then
		for i = 1, 6 do
			if isElement(createdGuis[i]) then
				destroyElement(createdGuis[i])
			end
		end
		nem = ""
	elseif tostring(type) == "login" then
		user = loadLoginFromXML()
		createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, user, false)
		guiEditSetMaxLength(createdGuis[1], 20)		
		createdGuis[2] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[2], 20)
	elseif tostring(type) == "register" then
		createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[1], 20)		
		createdGuis[2] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[2], 20)		
		createdGuis[4] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[4], 29)	
	elseif tostring(type) == "charCreate" then
		createdGuis[1] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[1], 25)		
		createdGuis[2] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[2], 60)		
		addEventHandler("onClientGUIChanged", createdGuis[1], function()
			if string.find(guiGetText(createdGuis[1]),"_") then
				guiSetText(createdGuis[1],"")
				exports.san_infobox:addNotification("Não use um sinal _ no nome do seu personagem!","error")
			end
			if string.find(guiGetText(createdGuis[1]),"á") or string.find(guiGetText(createdGuis[1]),"é") or string.find(guiGetText(createdGuis[1]),"í") or string.find(guiGetText(createdGuis[1]),"ú") or string.find(guiGetText(createdGuis[1]),"ó") or string.find(guiGetText(createdGuis[1]),"?") or string.find(guiGetText(createdGuis[1]),"Á") or string.find(guiGetText(createdGuis[1]),"É") or string.find(guiGetText(createdGuis[1]),"Í") or string.find(guiGetText(createdGuis[1]),"Ó") or string.find(guiGetText(createdGuis[1]),"?") then
				guiSetText(createdGuis[1],"")
				exports.san_infobox:addNotification("Não use caracteres acentuados no nome do seu personagem.","error")
			end
		end)		
		
		createdGuis[3] = guiCreateEdit(-1000, -1000, 0, 0, "", false)
		guiEditSetMaxLength(createdGuis[3], 2)	
	end
end

function setPlayerPanelState(state)
	panelType = state
end
addEvent("login:setPlayerPanelState", true)
addEventHandler("login:setPlayerPanelState", root, setPlayerPanelState)

function createLogin ()
--if not getElementData(localPlayer, "banned") then
	if panelType == "login" then 
		blurCreate()
		
		dxDrawImage(monitorSite[1]/2 - 460/2, 77, 470, 370, "files/login/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255))
		
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2-1,sy/2-50,sx/2-1,sy/2-50,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2+1,sy/2-50,sx/2+1,sy/2-50,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-50-1,sx/2,sy/2-50-1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-50+1,sx/2,sy/2-50+1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("#FFFFFFsan#FFA600MTA v7.0 [BETA]",sx/2,sy/2-50,sx/2,sy/2-50,tocolor(255,255,255,255),1,opensansB,"center","center",nil,nil,nil,true)
		
		--dxDrawText("#FFFFFFSeja muito bem vindos ao 4i20 Roleplay 2.0\n Crie uma #00FF00conta #FFFFFFe tenha um ótimo Roleplay! :)",sx/2,sy/2+600,sx/2,sy/2-50,tocolor(255,255,255,255),1,opensansB,"center","center",nil,nil,nil,true)


		dxDrawText(guiGetText(createdGuis[1]),sx/2-85,sy/2+7,sx/2-85,sy/2+7,tocolor(255, 255, 255, 255),1, opensansL, "left", "center", false, false, true, true) --Felhasználónév
		dxDrawText(passwordHash(guiGetText(createdGuis[2])),sx/2-85,sy/2+60,sx/2-85,sy/2+60, tocolor(255, 255, 255, 255),1, opensansL, "left", "center", false, false, true, true) --jelszó
		dxDrawImage(5,sy-28,53,23,"files/beta.png")
		dxDrawImage(sx/2-512/2,sy/2-512/2,512,512,"files/login/main.png")

		if isCursorOnBox(sx/2-256+125,sy/2+120,262,30) then
			dxDrawImage(sx/2-512/2,sy/2-512/2,512,512,"files/login/login_active.png")
		end
		if isCursorOnBox(sx/2-256+125,sy/2+165,262,30) then
			dxDrawImage(sx/2-256,sy/2-256,512,512,"files/login/reg_active.png")
		end
	elseif panelType == "register" then 
		blurCreate()
		--dxDrawImage(monitorSite[1]/2 - 200/2, 77, 200, 200, "files/login/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255))
		dxDrawImage(monitorSite[1]/2 - 460/2, 77, 470, 370, "files/login/logo.png", 0, 0, 0, tocolor(255, 255, 255, 255))
		
		
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2-1,sy/2-50,sx/2-1,sy/2-50,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2+1,sy/2-50,sx/2+1,sy/2-50,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-50-1,sx/2,sy/2-50-1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-50+1,sx/2,sy/2-50+1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("#FFFFFFsan#FFA600MTA v7.0 [BETA]",sx/2,sy/2-50,sx/2,sy/2-50,tocolor(255,255,255,255),1,opensansB,"center","center",nil,nil,nil,true)
		
		dxDrawText(guiGetText(createdGuis[1]),sx/2-85,sy/2+7,sx/2-85,sy/2+7,tocolor(255, 255, 255, 255),1, opensansL, "left", "center", false, false, true, true) --Felhasználónév
		dxDrawText(passwordHash(guiGetText(createdGuis[2])),sx/2-85,sy/2+60,sx/2-85,sy/2+60, tocolor(255, 255, 255, 255),1, opensansL, "left", "center", false, false, true, true) --jelszó		
		dxDrawText(passwordHash(guiGetText(createdGuis[4])),sx/2-85,sy/2+105,sx/2-85,sy/2+105, tocolor(255, 255, 255, 255),1, opensansL, "left", "center", false, false, true, true) --e-mail
		
		dxDrawImage(5,sy-28,53,23,"files/beta.png")
		dxDrawImage(sx/2-512/2,sy/2-512/2,512,512,"files/login/register.png")
		if isCursorOnBox(sx/2-256+125,sy/2+165,262,30) then
			dxDrawImage(sx/2-256,sy/2-256,512,512,"files/login/register_active.png")
		end

	elseif panelType == "charCreate" then 
		dxDrawRectangle(sx/2-180,sy/2-200,360,400,tocolor(0,0,0,140))

		--dxDrawText("sanMTA v7.0 [BETA]",sx/2-1,sy/2-220,sx/2-1,sy/2-220,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2+1,sy/2-220,sx/2+1,sy/2-220,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-220-1,sx/2,sy/2-220-1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("sanMTA v7.0 [BETA]",sx/2,sy/2-220+1,sx/2,sy/2-220+1,tocolor(0,0,0,255),1,opensansB,"center","center",nil,nil,nil,false)
		--dxDrawText("#FFFFFFsan#FFA600MTA v7.0 [BETA]",sx/2,sy/2-220,sx/2,sy/2-220,tocolor(255,255,255,255),1,opensansB,"center","center",nil,nil,nil,true)
		
		
		dxDrawRectangle(sx/2-140,sy/2-150,280,30,tocolor(0,0,0,180))
		dxDrawText("Nome do personagem",sx/2-135,sy/2-175,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		dxDrawText(guiGetText(createdGuis[1]),sx/2-135,sy/2-135,sx,sy/2-135,tocolor(255,255,255,255),1,opensansL,"left","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-140,sy/2-75,280,30,tocolor(0,0,0,180))
		dxDrawText("Descreva seu personagem",sx/2-135,sy/2-100,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		dxDrawText(guiGetText(createdGuis[2]),sx/2-135,sy/2-60,sx,sy/2-60,tocolor(255,255,255,255),1,opensansL,"left","center",false,false,false,true,true)
		
		
		dxDrawRectangle(sx/2-140,sy/2,280,30,tocolor(0,0,0,180))
		dxDrawText("Idade",sx/2-135,sy/2-25,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		dxDrawText(guiGetText(createdGuis[3]),sx/2-135,sy/2+15,sx,sy/2+15,tocolor(255,255,255,255),1,opensansL,"left","center",false,false,false,true,true)
		
		dxDrawRectangle(sx/2-140,sy/2+75,30,30,tocolor(255,145,0,180)) --Férfi
		dxDrawRectangle(sx/2-50,sy/2+75,30,30,tocolor(255,145,0,180)) --N?
		dxDrawText("Gênero:",sx/2-135,sy/2+50,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		dxDrawText("Homem",sx/2-105,sy/2+77,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		dxDrawText("Mulher",sx/2-15,sy/2+77,sx,sy,tocolor(255,255,255,255),1,opensansL2,"left")
		
		if nem == "ferfi" then
			dxDrawImage(sx/2-140,sy/2+75,30,30,"files/login/pipa.png")
		elseif nem == "no" then
			dxDrawImage(sx/2-50,sy/2+75,30,30,"files/login/pipa.png")
		end
		if isCursorOnBox(sx/2-140,sy/2+160,280,30) then
			dxDrawRectangle(sx/2-140,sy/2+160,280,30,tocolor(124, 197, 118,180))
		else
			dxDrawRectangle(sx/2-140,sy/2+160,280,30,tocolor(0,0,0,180))
		end
		dxDrawText("Criar um personagem",sx/2,sy/2+175,sx/2,sy/2+175,tocolor(255,255,255,255),1,opensansB2,"center","center",nil,nil,nil,true)
	elseif panelType == "charSpawn" then 
		dxDrawRectangle(sx-470,sy/2-150,270,300,tocolor(0,0,0,180))
		dxDrawText("#FFFFFFBell-Ville #32CD32Roleplay ",sx-470,sy/2-150,sx-200,sy/2-150,tocolor(255,255,255,255),0.8,opensansB2,"center",nil,nil,nil,nil,true)
		for index, value in ipairs (data) do
			dxDrawText(value[1],sx-465,sy/2-120+index*25,sx-200,sy/2-120+index*25, tocolor(255, 255, 255, alphaText),0.9, opensans, "left", "center", false, false, true, true)
		end
		dxDrawText("Pressione ENTER para entrar!",sx-470,sy/2+120,sx-200,sy/2+120,tocolor(255,255,255,255),0.8,opensansB2,"center",nil,nil,nil,nil,true)
	--end
end
end

function passwordHash(password)
    local length = utfLen(password)

    if length > 23 then
        length = 23
    end
    return string.rep("*", length)
end

local elem = 0

function loginClickFunction(button, state, cursorx, cursory)
	if button == "left" and state == "down" then --and not getElementData(localPlayer, "banned") then 
		showLogin = false
		if panelType == "login" then 
			if isCursorOnBox(sx/2-256+125,sy/2-7,262,30) then --Felhasználónév
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end
			end
			if isCursorOnBox(sx/2-256+125,sy/2+40,262,30) then --Jelszó
				if guiEditSetCaretIndex(createdGuis[2], string.len(guiGetText(createdGuis[2]))) then
					guiBringToFront(createdGuis[2])
				end
			end	
			if isCursorOnBox(sx/2-256+125,sy/2+120,262,30) then --Bejelentkezés
				if guiGetText(createdGuis[1]) == "" and guiGetText(createdGuis[2]) == "" then
					exports.san_infobox:addNotification("Campos são obrigatórios!","error")
				else

					if isTimer(timer) then 
						--exports.san_infobox:addNotification("AGUARDE 1 SEGUNDO!","error")
						return end
						timer = setTimer(function() end, 3000, 1)

					triggerServerEvent("onLoginClick", localPlayer, localPlayer, guiGetText(createdGuis[1]), guiGetText(createdGuis[2]))
				end
			end
			if isCursorOnBox(sx/2-256+125,sy/2+165,262,30) then --Regisztráció
				createGui("register")
				panelType = "register"
			end
		elseif panelType == "register" then 
			if PanelState then return end 
			if isCursorOnBox(sx/2-256+125,sy/2-7,262,30) then --Felhasználónév
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end
			end
			if isCursorOnBox(sx/2-256+125,sy/2+40,262,30) then --Jelszó
				if guiEditSetCaretIndex(createdGuis[2], string.len(guiGetText(createdGuis[2]))) then
					guiBringToFront(createdGuis[2])
				end
			end	
			if isCursorOnBox(sx/2-256+125,sy/2+90,262,30) then --e-mail
				if guiEditSetCaretIndex(createdGuis[4], string.len(guiGetText(createdGuis[4]))) then
					guiBringToFront(createdGuis[4])
				end
			end	
			if isCursorOnBox(sx/2-256+125,sy/2+165,262,30) then
				if guiGetText(createdGuis[1]) == "" and guiGetText(createdGuis[2]) == "" and guiGetText(createdGuis[4]) == "" then
					exports.san_infobox:addNotification("Campos são obrigatórios!","error")
				else



					if guiGetText(createdGuis[2]) ~= guiGetText(createdGuis[4]) then
							exports.san_infobox:addNotification("A senha não corresponde com a primeira, confirme a senha novamente","error")
							return
					end


					--if not (string.find(guiGetText(createdGuis[4]), "@") or string.find(guiGetText(createdGuis[4]), ".")) then 
					--	exports.san_infobox:addNotification("Endereço de email incorreto!","error")
					--	return
					--end
					if string.find(guiGetText(createdGuis[1]), " ") or string.find(guiGetText(createdGuis[2]), " ") or string.find(guiGetText(createdGuis[4]), " ") then
							exports.san_infobox:addNotification("Preencha os campos sem espaços.","error")
							return
					end

					if isTimer(timer2) then 
						--exports.san_infobox:addNotification("AGUARDE 1 SEGUNDO!","error")
						return end
					timer2 = setTimer(function() end, 3000, 1)

					triggerServerEvent("onRegisterClick", localPlayer, localPlayer, guiGetText(createdGuis[1]), guiGetText(createdGuis[2])) --, guiGetText(createdGuis[4]))
				end
			end
			bindKey("backspace","down",function()
				createGui("destroy")
				createGui("login")
				panelType = "login"
			end)
		elseif panelType == "charCreate" then
			if isCursorOnBox(sx/2-135,sy/2-150,270,30) then --Karakternév
				if guiEditSetCaretIndex(createdGuis[1], string.len(guiGetText(createdGuis[1]))) then
					guiBringToFront(createdGuis[1])
				end	
			end
			if isCursorOnBox(sx/2-140,sy/2-75,280,30) then --Vizuális leírás
				if guiEditSetCaretIndex(createdGuis[2], string.len(guiGetText(createdGuis[2]))) then
					guiBringToFront(createdGuis[2])
				end	
			end
			if isCursorOnBox(sx/2-140,sy/2,280,30) then --Életkor
				if guiEditSetCaretIndex(createdGuis[3], string.len(guiGetText(createdGuis[3]))) then
					guiBringToFront(createdGuis[3])
				end	
			end
			-- NEM VÁLASZTÁS
			if isCursorOnBox(sx/2-140,sy/2+75,30,30) then
				nem = "ferfi"
			end
			if isCursorOnBox(sx/2-50,sy/2+75,30,30) then
				nem = "no"
			end
			---------------
			if isCursorOnBox(sx/2-140,sy/2+160,280,30) then --Karakter Létrehozás gomb
				if guiGetText(createdGuis[1]) == "" and guiGetText(createdGuis[2]) == "" and guiGetText(createdGuis[3]) == "" then
					exports.san_infobox:addNotification("Os Campos são obrigatórios!","error")
				else
					if nem == "ferfi" then 
						skinID = math.random(1, #manSkins)
					elseif nem == "no" then
						skinID = math.random(1, #womanSkins)
					else 
						exports.san_infobox:addNotification("Selecione o gênero do seu personagem!","error")
						return
					end
					 if string.find(guiGetText(createdGuis[1]), '%d+') then
							exports.san_infobox:addNotification("Não pode ter números no nome do personagem!","error")
						return
					end
					if string.find(guiGetText(createdGuis[1]), "%p+") then
						exports.san_infobox:addNotification("Você não pode ter um personagem especial com o seu nome!","error")
						return
					end
					if not eletkorCheck(guiGetText(createdGuis[3])) then
						guiSetText(createdGuis[3],"")
						exports.san_infobox:addNotification("Infelizmente não aceitamos personagem com menos de 18! (Idade adequada: 18 a 60)","error")
						return
					end
					if isTimer(timer3) then 
						--exports.san_infobox:addNotification("AGUARDE 1 SEGUNDO!","error")
						return end
						timer3 = setTimer(function() end, 3000, 1)
					triggerServerEvent("onCharCreateClick", localPlayer, localPlayer, guiGetText(createdGuis[1]), guiGetText(createdGuis[2]), guiGetText(createdGuis[3]), 170, tostring(nem), skinID)
				end
			end
		end
	end
end

function charSpawnEnter()
	triggerServerEvent("loadCharacter", localPlayer, localPlayer)
	removeEventHandler("onClientRender", root, createLogin)
	removeEventHandler("onClientClick", root, loginClickFunction)
	if isElement(zenes) then 
		stopSound(zenes)
	end

	--[[
		setElementFrozen(localPlayer, true)
		playSound("files/bong.mp3")
		addEventHandler("onClientPreRender",getRootElement(),spawnChar1)
		spawntimer = setTimer(function()
			playSound("files/bong.mp3")
			addEventHandler("onClientPreRender",getRootElement(),spawnChar2)
		end, 1000,1)
		spawntimer1 = setTimer(function()
			playSound("files/bong.mp3")
			addEventHandler("onClientPreRender",getRootElement(),spawnChar3)
		end, 2000,1)
		spawntimer2 = setTimer(function()
			playSound("files/bong.mp3")
			addEventHandler("onClientPreRender",getRootElement(),spawnChar4)
		end, 3000,1)
			spawntimer3 = setTimer(function()
			playSound("files/bong.mp3") 
			finish()
		end, 4000,1)
		]]--
		finish()
end

function checkPlayer(type)
	if type == "charCreate" then 
		createGui("destroy")
		createGui(type)
		Tick = getTickCount()
		panelType = type
		if isElement(ped) then destroyElement(ped) end
		ped = createPed(math.random(#manSkins), 2660.4655761719, -1458.8054199219, 79.38053894043, -65)
		setElementDimension(ped, getElementDimension(localPlayer))
		setCameraMatrix(2664.8759765625, -1456.5216064453, 80.772903442383, 2664.0266113281, -1456.9836425781, 80.517936706543)
		removeEventHandler("onClientPreRender", root, updateCamPosition)
	elseif type == "charSpawn" then 
		createGui("destroy")
		createGui(type)
		Tick = getTickCount()
		panelType = type
		if isElement(ped) then destroyElement(ped) end
		if isElement(peds) then destroyElement(peds) end
		peds = createPed(getElementData(localPlayer, "char:skin"), 382.29190063477, -2028.4780273438, 7.8359375, 90)
		setPedAnimation(peds, "ON_LOOKERS", "wave_loop")
		setElementFrozen(peds,true)
		setElementDimension(peds, getElementDimension(localPlayer))
		setCameraMatrix(376.70678710938, -2028.5461425781, 8.8381004333496, 377.70413208008, -2028.5339355469, 8.7662878036499)
		removeEventHandler("onClientPreRender", root, updateCamPosition)
		data = {
			{"Nome: ".. serverColor .. getElementData(localPlayer,"char:name")},
			{"Conta ID:".. serverColor ..getElementData(localPlayer,"acc:id")},
			{"Minutos jogados: ".. serverColor .. tonumber(getElementData(localPlayer,"char:playedTime"))},
			{"Vida: ".. serverColor .. tonumber(getElementHealth(localPlayer)).."%"},
			{"Colete: ".. serverColor .. tonumber(getPedArmor(localPlayer)).."%"},
			{"Fome: ".. serverColor .. tonumber(getElementData(localPlayer,"char:hunger") or 100).."%"},
			{"Dinheiro: R$: ".. serverColor .. penz_darabolas(tonumber(getElementData(localPlayer,"char:money"))).. ""},
			{"Saldo bancário: R$: ".. serverColor .. penz_darabolas(tonumber(getElementData(localPlayer,"char:bankmoney"))).. ""},
		}
		bindKey("enter","down",charSpawnEnter)
	end
end
addEvent("checkPlayerCharacter", true)
addEventHandler("checkPlayerCharacter", root, checkPlayer)

function penz_darabolas(amount)
  local formatted = amount
  while true do  
    formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1.%2')
    if (k==0) then
      break
    end
  end
  return formatted
end

function dobozbaVan(dX, dY, dSZ, dM, eX, eY)
	if(eX >= dX and eX <= dX+dSZ and eY >= dY and eY <= dY+dM) then
		return true
	else
		return false
	end
end

function isCursorOnBox(xS,yS,wS,hS)
	if(isCursorShowing()) then
		XY = {guiGetScreenSize()}
		local cursorX, cursorY = getCursorPosition()
		cursorX, cursorY = cursorX*XY[1], cursorY*XY[2]
		if(cursorX >= xS and cursorX <= xS+wS and cursorY >= yS and cursorY <= yS+hS) then
			return true
		else
			return false
		end
	end	
end


-- Camera Animação / Animação da camera
local camPos = {}
camPos[1] = {} 
camPos[1]["start"] = {369.75024414063, -2063.095703125, 25.438915252686, 990.40814208984, -1145.4158935547, 50.089214324951}
camPos[1]["end"] = {370.26895141602, -1659.3237304688, 42.344429016113, 370.12683105469, -1658.8999023438, 42.344429016113}
camPos[1]["speed"] = 70000
camPos[1]["type"] = "Linear"


function updateCamPosition ()
	if camPos[camID] then
		local cTick = getTickCount ()
		local delay = cTick - lastCamTick
		local duration = camPos[camID]["speed"]
		local easing = camPos[camID]["type"]
		if duration and easing then
			local progress = delay/duration
			if progress < 1 then
				local cx,cy,cz = interpolateBetween (
					camPos[camID]["start"][1],camPos[camID]["start"][2],camPos[camID]["start"][3],
					camPos[camID]["end"][1],camPos[camID]["end"][2],camPos[camID]["end"][3],
					progress,easing
				)
				local tx,ty,tz = interpolateBetween (
					camPos[camID]["start"][4],camPos[camID]["start"][5],camPos[camID]["start"][6],
					camPos[camID]["end"][4],camPos[camID]["end"][5],camPos[camID]["end"][6],
					progress,easing
				)
				
				setCameraMatrix (cx,cy,cz,tx,ty,tz)
			else
				local nextID = false
				
				while nextID == false do
					local id = camID + 1
					if id ~= camID then
						nextID = id
					end
					if id > # camPos then 
						nextID = 1
					end
				end
				
				camFading = 2
				lastCamTick = getTickCount ()
				camID = nextID
				
				setCameraMatrix (camPos[camID]["start"][1],camPos[camID]["start"][2],camPos[camID]["start"][3],camPos[camID]["start"][4],camPos[camID]["start"][5],camPos[camID]["start"][6])
			end
		end
	end
end

function finish()
--[[
	removeEventHandler("onClientPreRender",getRootElement(),spawnChar1)
	removeEventHandler("onClientPreRender",getRootElement(),spawnChar2)
	removeEventHandler("onClientPreRender",getRootElement(),spawnChar3)
	removeEventHandler("onClientPreRender",getRootElement(),spawnChar4)]]--
	spawnChar5()
	panelType = " "
	showCursor(false)
	showChat(true)
	--triggerServerEvent("playerLoadItemsToServer", localPlayer, localPlayer)
	setElementFrozen(localPlayer,false)
	if not getElementData(localPlayer, "adminjail") == 1 then
		setElementDimension(localPlayer, getElementData(localPlayer, "spawnPos")[5])
		setElementInterior(localPlayer, getElementData(localPlayer, "spawnPos")[4])
		setElementData(localPlayer,"loggedin",true)
	end
	unbindKey("enter","down",charSpawnEnter)
end

--[[
function spawnChar1()
local x,y,z = getElementPosition(localPlayer)
setCameraMatrix(x,y,z+45,x,y,z)
end

function spawnChar2()
local x,y,z = getElementPosition(localPlayer)
setCameraMatrix(x,y,z+25,x,y,z)
end

function spawnChar3()
local x,y,z = getElementPosition(localPlayer)
setCameraMatrix(x,y,z+15,x,y,z)
end

function spawnChar4()
local x,y,z = getElementPosition(localPlayer)
setCameraMatrix(x,y,z+5,x,y,z)
end
]]--

function spawnChar5()
setCameraTarget(localPlayer)
setElementFrozen(localPlayer, false)
end






function loadLoginFromXML()
	local XML = xmlLoadFile ("userdata.xml")
    if not XML then
        XML = xmlCreateFile("userdata.xml", "login")
    end
	
    local usernameNode = xmlFindChild (XML, "username", 0)
    if usernameNode then
        return xmlNodeGetValue(usernameNode)
    else
		return ""
    end
    xmlUnloadFile ( XML )
end

function saveLoginToXML(username)
    local XML = xmlLoadFile ("userdata.xml")
    if not XML then
        XML = xmlCreateFile("userdata.xml", "login")
    end
	if (username ~= "") then
		local usernameNode = xmlFindChild (XML, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(XML, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end
    xmlSaveFile(XML)
    xmlUnloadFile (XML)
end
addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", root, saveLoginToXML)



--[[

function loadLoginFromXML()
	local xml_save_log_File = xmlLoadFile ("userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("userdata.xml", "login")
    end
    local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
    local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
    if usernameNode and passwordNode then
        return xmlNodeGetValue(usernameNode), xmlNodeGetValue(passwordNode)
    else
		return "", ""
    end
    xmlUnloadFile ( xml_save_log_File )
end

function saveLoginToXML(username, password)
    local xml_save_log_File = xmlLoadFile ("userdata.xml")
    if not xml_save_log_File then
        xml_save_log_File = xmlCreateFile("userdata.xml", "login")
    end
	if (username ~= "") then
		local usernameNode = xmlFindChild (xml_save_log_File, "username", 0)
		if not usernameNode then
			usernameNode = xmlCreateChild(xml_save_log_File, "username")
		end
		xmlNodeSetValue (usernameNode, tostring(username))
	end
	if (password ~= "") then
		local passwordNode = xmlFindChild (xml_save_log_File, "password", 0)
		if not passwordNode then
			passwordNode = xmlCreateChild(xml_save_log_File, "password")
		end		
		xmlNodeSetValue (passwordNode, tostring(password))
	end
    xmlSaveFile(xml_save_log_File)
    xmlUnloadFile (xml_save_log_File)
end
addEvent("saveLoginToXML", true)
addEventHandler("saveLoginToXML", getRootElement(), saveLoginToXML)

]]--
