-- Feito Por CantZ
--[[
addEventHandler("onClientRender", getRootElement(),
	function()
	if not getElementData(localPlayer,"loggedin") then return end
		local avatar = (localPlayer:getData("conta.Avatar") or 0)
		local NomeCompleto = getElementData(localPlayer,"char:name") or "No-Name"
	    local Emprego = getElementData(localPlayer,"job") or "Bikar"
	    local time = getRealTime()
	    local hours = time.hour
	    local minutes = time.minute
		KepAlpha = KepAlpha + 0.5 
        if KepAlpha >= 150 then 
        KepAlpha = 20
        end
        local seconds = getTickCount() / 1600
        local angle = math.sin(seconds) * 10
       -- dxDrawImage(screenW * 0.4239, screenH * -0.0391, screenW * 0.1530, screenH * 0.2305, "files/logo.png", angle, 0, -40, tocolor(80, 0, 0, KepAlpha), false)
		--dxDrawRectangleBorde(widgetsHud.menu["posX"], widgetsHud.menu["posY"], widgetsHud.menu["posW"], widgetsHud.menu["posH"], tocolor(31,31,31,220))
		dxDrawRectangleBorde(widgetsHud.menuNome["posX"], widgetsHud.menuNome["posY"], widgetsHud.menuNome["posW"], widgetsHud.menuNome["posH"], tocolor(31,31,31,220))
		dxDrawText(NomeCompleto.." | JOB: "..Emprego, widgetsHud.txtNome["posX"], widgetsHud.txtNome["posY"], widgetsHud.txtNome["posW"], widgetsHud.txtNome["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
	--	dxDrawText("Time: "..hours..":"..minutes, widgetsHud.txtHora["posX"] - 30, widgetsHud.txtHora["posY"], widgetsHud.txtHora["posW"], widgetsHud.txtHora["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
       ]]
	   --[[ local money = getElementData(localPlayer,"char:money")
		--convertNumber(getPlayerMoney(getLocalPlayer()))
		local M = dxGetTextWidth(money, 0.90, font, true)
		dxDrawRectangleBorde(widgetsHud.bgMoney["posX"], widgetsHud.bgMoney["posY"], widgetsHud.bgMoney["posW"]/70+30+10+M, widgetsHud.bgMoney["posH"], tocolor(31,31,31,220))
        dxDrawImage(widgetsHud.imgHora["posX"], widgetsHud.imgHora["posY"], widgetsHud.imgHora["posW"], widgetsHud.imgHora["posH"], "files/clock.png")
		local bank = convertNumber((localPlayer:getData("char:bankMoney") or 0))
		local B = dxGetTextWidth(bank, 0.90, font, true)
		dxDrawRectangleBorde(widgetsHud.bgBank["posX"], widgetsHud.bgBank["posY"], widgetsHud.bgBank["posW"]/70+30+10+B, widgetsHud.bgBank["posH"], tocolor(31,31,31,220))
-- DINHEIRO / BANCO
		dxDrawImage(widgetsHud.coinImg["posX"], widgetsHud.coinImg["posY"], widgetsHud.coinImg["posW"], widgetsHud.coinImg["posH"], "files/coin.png")
		dxDrawImage(widgetsHud.bankImg["posX"], widgetsHud.bankImg["posY"], widgetsHud.bankImg["posW"], widgetsHud.bankImg["posH"], "files/bank.png")
		dxDrawText(money, widgetsHud.txtMoney["posX"], widgetsHud.txtMoney["posY"], widgetsHud.txtMoney["posW"], widgetsHud.txtMoney["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
		dxDrawText(bank, widgetsHud.txtBank["posX"], widgetsHud.txtBank["posY"], widgetsHud.txtBank["posW"], widgetsHud.txtBank["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)

-- ID / NOME / LEVEL
	    local ID = getElementData(localPlayer,"acc:id") or "N/A"
        local Level = getElementData(localPlayer,"char:onlineTime") or 0
        dxDrawRectangleBorde(widgetsHud.bgID["posX"], widgetsHud.bgID["posY"], widgetsHud.bgID["posW"], widgetsHud.bgID["posH"], tocolor(31,31,31,220))
        dxDrawRectangleBorde(widgetsHud.bgLevel["posX"], widgetsHud.bgLevel["posY"], widgetsHud.bgLevel["posW"], widgetsHud.bgLevel["posH"], tocolor(31,31,31,220))
        dxDrawText(ID, widgetsHud.txtID["posX"], widgetsHud.txtID["posY"], widgetsHud.txtID["posW"], widgetsHud.txtID["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
		dxDrawText(Level, widgetsHud.txtLevel["posX"], widgetsHud.txtLevel["posY"], widgetsHud.txtLevel["posW"], widgetsHud.txtLevel["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
        dxDrawImage(widgetsHud.imgID["posX"], widgetsHud.imgID["posY"], widgetsHud.imgID["posW"], widgetsHud.imgID["posH"], "files/ID.png")
        dxDrawImage(widgetsHud.imgLevel["posX"], widgetsHud.imgLevel["posY"], widgetsHud.imgLevel["posW"], widgetsHud.imgLevel["posH"], "files/level.png")

-- FOME / SEDE / PROCURADO
        local Fome = getElementData(localPlayer,"AirNewSCR_Fome") or 100
        local Sede = getElementData(localPlayer,"AirNewSCR_Sede") or 100
        local Wanted = getPlayerWantedLevel(getLocalPlayer())
        dxDrawRectangleBorde(widgetsHud.bgFome["posX"], widgetsHud.bgFome["posY"], widgetsHud.bgFome["posW"], widgetsHud.bgFome["posH"], tocolor(31,31,31,220))
        dxDrawRectangleBorde(widgetsHud.bgSede["posX"], widgetsHud.bgSede["posY"], widgetsHud.bgSede["posW"], widgetsHud.bgSede["posH"], tocolor(31,31,31,220))
		dxDrawText(Fome.."%", widgetsHud.txtFome["posX"], widgetsHud.txtFome["posY"], widgetsHud.txtFome["posW"], widgetsHud.txtFome["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
		dxDrawText(Sede.."%", widgetsHud.txtSede["posX"], widgetsHud.txtSede["posY"], widgetsHud.txtSede["posW"], widgetsHud.txtSede["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
        dxDrawImage(widgetsHud.imgFome["posX"], widgetsHud.imgFome["posY"], widgetsHud.imgFome["posW"], widgetsHud.imgFome["posH"], "files/burguer.png")
        dxDrawImage(widgetsHud.imgSede["posX"], widgetsHud.imgSede["posY"], widgetsHud.imgSede["posW"], widgetsHud.imgSede["posH"], "files/agua.png")

        if Wanted > 0 then
        dxDrawRectangleBorde(widgetsHud.bgProcurado["posX"], widgetsHud.bgProcurado["posY"], widgetsHud.bgProcurado["posW"], widgetsHud.bgProcurado["posH"], tocolor(31,31,31,220))
        dxDrawImage(widgetsHud.imgProcurado["posX"], widgetsHud.imgProcurado["posY"], widgetsHud.imgProcurado["posW"], widgetsHud.imgProcurado["posH"], "files/star.png")
        dxDrawText(Wanted, widgetsHud.txtProcurado["posX"], widgetsHud.txtProcurado["posY"], widgetsHud.txtProcurado["posW"], widgetsHud.txtProcurado["posH"], tocolor(255, 255, 255, 255), 1.00, font, "left", "center", false, false, false, false, false)
        else
        --dxDrawText("✪ ZONA LESTE ROLEPLAY ✪", 1078, 172, 1362, 176, tocolor(255, 255, 255, 255), 1.00, "default-bold", "center", "center", false, false, false, false, false)
        end

-- OUTRAS FUNÇÕES!
		ShaiderRectangleMenu(widgetsHud.vidaBg["posX"], widgetsHud.vidaBg["posY"], widgetsHud.vidaBg["posW"], widgetsHud.vidaBg["posH"], tocolor(31,31,31,220))
		ShaiderRectangleMenu(widgetsHud.coleteBg["posX"], widgetsHud.coleteBg["posY"], widgetsHud.coleteBg["posW"], widgetsHud.coleteBg["posH"], tocolor(31,31,31,220))

-- VIDA / COLETE
		local heath = tonumber(getElementHealth(localPlayer))
		ShaiderRectangleMenu(widgetsHud.vida["posX"], widgetsHud.vida["posY"], widgetsHud.vida["posW"]/100*heath, widgetsHud.vida["posH"], tocolor(255,84,84,220))
		local armor = tonumber(getPedArmor(localPlayer))
		ShaiderRectangleMenu(widgetsHud.colete["posX"], widgetsHud.colete["posY"], widgetsHud.colete["posW"]/100*armor, widgetsHud.colete["posH"], tocolor(0,165,220,220))

		dxDrawImage(widgetsHud.iconBg["posX"], widgetsHud.iconBg["posY"], widgetsHud.iconBg["posW"], widgetsHud.iconBg["posH"], "files/ibg.png")

		dxDrawImage(widgetsHud.avatar["posX"], widgetsHud.avatar["posY"], widgetsHud.avatar["posW"], widgetsHud.avatar["posH"], "files/avatars/"..avatar..".png")
	]]
	--end
--)