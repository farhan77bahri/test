function getPlayerFromID(ID)
return call(getResourceFromName("GameID"), "getPlayerFromID", tonumber(ID))
end

function getPlayerID(player)
return  getElementData(player,"acc:id")
end
local sx, sy = guiGetScreenSize()
local size = {700, 500}
local x, y = (sx/2 - size[1]/2), (sy/2 - size[2]/2)
local radio = 1
local menuSelected = nil
local tocando = false
local tocar = {}
local playList = {}
local artworks = {}
local listFrame = {}
local alert = {}
gui = {
    edit = {},
    label = {},
	staticimage = {},
	scrollpane = {}
}
addEventHandler( "onClientResourceStart", resourceRoot,
	function( )
		gui.staticimage[1] = guiCreateStaticImage ( x, y, size[1], size[2], "Imagens/transparent.png", false, false )
		guiSetVisible(gui.staticimage[1],false)
		gui.staticimage[2] = guiCreateStaticImage ( 0, 0, size[1], 25, "Imagens/transparent.png", false, gui.staticimage[1], "ff0000" )
		addEventHandler("onClientGUIMouseDown", gui.staticimage[2], mouseDown, false)
		gui.staticimage[3] = guiCreateStaticImage ( size[1]-10-10, 7.5, 10, 10, "Imagens/close.png", false, gui.staticimage[2], "FFFFFF" )
		gui.label[1] = guiCreateLabel ( 10, 0, size[1]-20, 25, "", false, gui.staticimage[2] )
		guiSetFont ( gui.label[1], "default-bold-small" )
		guiSetEnabled ( gui.label[1], false )
		guiLabelSetVerticalAlign ( gui.label[1], "center" )
		guiLabelSetHorizontalAlign( gui.label[1],"left")
		guiLabelSetColor ( gui.label[1], 200, 200, 200 )
		gui.staticimage[4] = guiCreateStaticImage ( 0, 25, size[1], 35, "Imagens/transparent.png", false, gui.staticimage[1], "444444" )
		gui.staticimage[5] = guiCreateStaticImage ( 0, 60, 350, 5, "Imagens/transparent.png", false, gui.staticimage[1], "ff0000" )
		gui.staticimage[6] = guiCreateStaticImage ( 350, 60, 350, 5, "Imagens/transparent.png", false, gui.staticimage[1], "444444" )
		gui.label[2] = guiCreateLabel ( 0, 0, 350, 35, "Local", false, gui.staticimage[4] )
		menuSelected = gui.label[2]
		gui.label[3] = guiCreateLabel ( 350, 0, 350, 35, "Rádio", false, gui.staticimage[4] )
		for _,lbl in ipairs( {gui.label[2], gui.label[3]} ) do
			guiSetFont ( lbl, "sans" )
			guiLabelSetVerticalAlign ( lbl, "center" )
			guiLabelSetHorizontalAlign( lbl,"center")
			guiLabelSetColor ( lbl, 255, 255, 255 )
		end
		gui.staticimage[7] = guiCreateStaticImage ( 0, 65, size[1], 435, "Imagens/transparent.png", false, gui.staticimage[1] )
		gui.staticimage[8] = guiCreateStaticImage ( 0, 65, size[1], 435, "Imagens/transparent.png", false, gui.staticimage[1] )
		guiSetVisible ( gui.staticimage[8], false )
			gui.staticimage[9] = guiCreateStaticImage ( 0, 0, size[1], 40, "Imagens/transparent.png", false, gui.staticimage[7], "5e5e5e" )
			gui.edit[1] = guiCreateEdit ( 10, 9, 650, 18, "Buscar...", false, gui.staticimage[9] )
			addEventHandler("onClientGUIFocus", gui.edit[1], focusEditbox, false)
			addEventHandler("onClientGUIBlur", gui.edit[1], blurEditbox, false)
			gui.staticimage[10] = guiCreateStaticImage ( 670, 12, 16, 16, "Imagens/search.png", false, gui.staticimage[9], "FFFFFF" )
			gui.scrollpane[1] = guiCreateScrollPane( 0, 40, 700, 340, false, gui.staticimage[7])
			guiSetEnabled(ScrollPane[gui.scrollpane[1]].scroll.scrollbg,false)
			noResults(gui.scrollpane[1])
			gui.staticimage[11] = guiCreateStaticImage ( 0, 380, 700, 55, "Imagens/transparent.png", false, gui.staticimage[7], "444444" )
			guiSetEnabled ( gui.staticimage[11], false )
			guiSetAlpha(gui.staticimage[11], 0.5)
			gui.staticimage[12] = guiCreateStaticImage ( 20, 14.5, 26, 26, "Imagens/back.png", false, gui.staticimage[11] )
			gui.staticimage[13] = guiCreateStaticImage ( 62, 11.5, 32, 32, "Imagens/play.png", false, gui.staticimage[11] )
			gui.staticimage[14] = guiCreateStaticImage ( 114, 14.5, 26, 26, "Imagens/next.png", false, gui.staticimage[11] )
			gui.label[5] = guiCreateLabel ( 150, 17.5, 40, 20, "00:00", false, gui.staticimage[11])
			gui.label[6] = guiCreateLabel ( 510, 17.5, 40, 20, "00:00", false, gui.staticimage[11])
			for _,lbl in ipairs( {gui.label[4], gui.label[5], gui.label[6]} ) do
				guiSetEnabled ( lbl, false )
				guiLabelSetVerticalAlign ( lbl, "center" )
				guiLabelSetHorizontalAlign( lbl,"center")
			end
			gui.staticimage[15] = guiCreateStaticImage ( 200, 23.5, 300, 8, "Imagens/transparent.png", false, gui.staticimage[11], "FFFFFF" )
			gui.staticimage[16] = guiCreateStaticImage ( 200, 23.5, 0, 8, "Imagens/transparent.png", false, gui.staticimage[11], "a3a3a3" )
			gui.staticimage[17] = guiCreateStaticImage ( 560, 17.5, 20, 20, "Imagens/volume.png", false, gui.staticimage[11] )
			gui.staticimage[18] = guiCreateStaticImage ( 586, 18, 12, 12, "Imagens/add.png", false, gui.staticimage[11] )
			gui.staticimage[19] = guiCreateStaticImage ( 585, 30, 14, 14, "Imagens/subtract.png", false, gui.staticimage[11] )
			gui.staticimage[20] = guiCreateStaticImage ( 610, 13, 32, 32, "Imagens/car.png", false, gui.staticimage[11] )
		--	gui.staticimage[21] = guiCreateStaticImage ( 650, 11, 30, 30, "Imagens/radio.png", false, gui.staticimage[11] )
			if (not config.btnAddMusicVeh) then guiSetEnabled(gui.staticimage[20],false) end
			if (not config.btnAddMusicRadio) then guiSetEnabled(gui.staticimage[21],false) end
			gui.scrollpane[2] = guiCreateScrollPane( 0, 0, 700, 435, false, gui.staticimage[8])
			guiSetEnabled(ScrollPane[gui.scrollpane[2]].scroll.scrollbg,false)
			noResults(gui.scrollpane[2])
		alert.wnd = guiCreateStaticImage ( sx/2-400/2, sy/2-170/2, 400, 170, "Imagens/transparent.png", false, false, "5e5e5e" )
		guiSetVisible(alert.wnd,false)
		guiCreateStaticImage ( 180, 10, 30, 30, "Imagens/radio.png", false, alert.wnd )
		alert.lbl1 = guiCreateLabel ( 0, 45, 400, 35, "Você deseja adicionar a seguinte música na rádio por $"..convertNumber(config.priceUseRadio).." ?\n(TODOS IRÃO ESCUTÁ-LA)", false, alert.wnd)
		alert.lbl2 = guiCreateLabel ( 0, 80, 400, 35, "", false, alert.wnd)
		guiSetFont ( alert.lbl2, "sans" )
		alert.confirm = guiCreateStaticImage ( 40, 130, 150, 30, "Imagens/transparent.png", false, alert.wnd )
		guiSetProperty ( alert.confirm, "ImageColours", "tl:8019c609 tr:8019c609 bl:8019c609  br:8019c609" )
		alert.lbl3 = guiCreateLabel ( 0, 0, 1, 1, "CONFIRMAR", true, alert.confirm)
		alert.recuse = guiCreateStaticImage ( 220, 130, 150, 30, "Imagens/transparent.png", false, alert.wnd )
		guiSetProperty ( alert.recuse, "ImageColours", "tl:80ff2d2d tr:80ff2d2d bl:80ff2d2d  br:80ff2d2d" )
		alert.lbl4 = guiCreateLabel ( 0, 0, 1, 1, "RECUSAR", true, alert.recuse)
		for _,lbl in ipairs({alert.lbl1,alert.lbl2,alert.lbl3,alert.lbl4}) do
			guiLabelSetVerticalAlign ( lbl, "center" )
			guiLabelSetHorizontalAlign( lbl,"center", true)
			guiSetEnabled ( lbl, false )
		end
		bindKey(config.btnOpen, "down", open)
		addCommandHandler(config.toggleRadioCmd, toggleRadio)
		
	end
)
addEvent( "getMusics", true )
addEventHandler( "getMusics", resourceRoot,
	function(musicas)
		listFrame = {}
		playList = musicas
		for _,elements in ipairs(getElementChildren(gui.scrollpane[1])) do destroyElement(elements) end
		guiScrollPaneSetVerticalScrollPosition ( gui.scrollpane[1], 0 )
		guiSetPosition ( ScrollPane[gui.scrollpane[1]].scroll.scroll, 2, 3, false )
		guiSetEnabled(ScrollPane[gui.scrollpane[1]].scroll.scrollbg,false)
		if #musicas > 8 then guiSetEnabled(ScrollPane[gui.scrollpane[1]].scroll.scrollbg,true) end
		if not musicas or #musicas == 0 then noResults(gui.scrollpane[1]) end
		local posy = 0
		local cor = "FFFFFF"
		for index,musica in ipairs(musicas) do
			local frame = guiCreateStaticImage (0, posy, 700, 40, "Imagens/transparent.png", false, gui.scrollpane[1], cor )
			posy = posy + 40
			if cor == "FFFFFF" then cor = "f2f2f2" else cor = "FFFFFF" end
			local titulo = guiCreateLabel ( 20, 10, 500, 20, musica.title, false, frame )
			local duracao = guiCreateLabel ( 640, 10, 500, 20, milToMin(musica.duration), false, frame )
			for _, lbl in ipairs({titulo,duracao}) do
				--guiSetFont ( lbl, "sans" )
				guiSetEnabled ( lbl, false )
				guiLabelSetVerticalAlign ( lbl, "center" )
				guiLabelSetColor (lbl, 130, 130, 130 )
			end
			musica.idmusica = index
			tocar[frame] = musica
			table.insert(listFrame,index,frame)
		end
	end
)
addEvent("refreshRadioList",true)
addEventHandler( "refreshRadioList", resourceRoot,
    function(radioList)
		artworks = {}
		for _,elements in ipairs(getElementChildren(gui.scrollpane[2])) do destroyElement(elements) end
		guiSetEnabled(ScrollPane[gui.scrollpane[2]].scroll.scrollbg,false)
		if #radioList > 7 then guiSetEnabled(ScrollPane[gui.scrollpane[2]].scroll.scrollbg,true) end
		if not radioList or #radioList == 0 then noResults(gui.scrollpane[2]) end
		local posy = 0
		local cor = "FFFFFF"
		for i,radio in ipairs(radioList) do
			local frame
			if i == 1 then
				frame = guiCreateStaticImage (0, posy, 700, 60, "Imagens/transparent.png", false, gui.scrollpane[2], "d1d1d1" )
			else
				frame = guiCreateStaticImage (0, posy, 700, 60, "Imagens/transparent.png", false, gui.scrollpane[2], cor )
			end
			if cor == "FFFFFF" then cor = "f2f2f2" else cor = "FFFFFF" end
			
			lbl1 = guiCreateLabel ( 20, 0, 20, 60, i, false, frame)
			local img
			if (fileExists("Simagens/"..radio.id..".jpg")) then
				img = guiCreateStaticImage ( 60, 6.5, 47, 47, "Simagens/"..radio.id..".jpg", false, frame )
			else
				img = guiCreateStaticImage ( 60, 6.5, 47, 47, "Simagens/sem_imagem.jpg", false, frame )
			end
			table.insert(artworks,{img = img, id = radio.id})
			lbl2 = guiCreateLabel ( 117, 7, 543, 16, radio.title, false, frame)
			lbl3 = guiCreateLabel ( 117, 23, 543, 15, "Duração: "..milToMin(radio.duration), false, frame)
			lbl4 = guiCreateLabel ( 117, 38, 543, 15, "Requerente: "..radio.request:gsub("#%x%x%x%x%x%x", ""), false, frame)
			for _,lbl in ipairs({lbl1,lbl2,lbl3,lbl4}) do
				guiLabelSetColor (lbl, 130,130,130 )
				guiLabelSetVerticalAlign ( lbl, "center" )
				if (lbl == lbl1) then
					guiSetFont ( lbl, "clear-normal" )
					guiLabelSetHorizontalAlign( lbl,"center")
				elseif (lbl == lbl2) then
					guiSetFont ( lbl, "sans" )
				end
			end
			posy = posy + 60
		end
    end
)
function noResults(scrollpane)
	local frame = guiCreateStaticImage (0, 0, 700, 40, "Imagens/transparent.png", false, scrollpane, "FFFFFF" )
	guiSetEnabled ( frame, false )
	local lbl = guiCreateLabel ( 0, 0, 700, 40, "Nenhum resultado foi encontrado!", false, frame )
	guiSetFont ( lbl, "sans" )
	guiLabelSetVerticalAlign ( lbl, "center" )
	guiLabelSetHorizontalAlign( lbl,"center")
	guiLabelSetColor (lbl, 130, 130, 130 )
end
function focusEditbox() if (guiGetText(source) == "Buscar...") then guiSetText(source, "") end end
function blurEditbox() if (guiGetText(source) == "") then guiSetText(source,"Buscar...") end end
function setMusica(idmusica)
	local cor = "FFFFFF"
	for id,frame in ipairs(listFrame) do
		if (id == idmusica) then
			guiStaticImageSetColor (frame, "d1d1d1")
		else
			guiStaticImageSetColor (frame, cor)
		end
		if cor == "FFFFFF" then cor = "f2f2f2" else cor = "FFFFFF" end
	end
	guiSetEnabled ( gui.staticimage[11], true )
	guiSetAlpha(gui.staticimage[11], 1)
	if isElement(som) then destroyElement(som) end
	guiSetText(gui.label[1],playList[idmusica].title)
	guiStaticImageLoadImage ( gui.staticimage[13], "Imagens/pause.png" )
	som = playSound ( "https://api.soundcloud.com/tracks/"..tostring(playList[idmusica].id).."/stream?client_id="..config.keySoundCloud )
	setSoundVolume(som, 1)
	addEventHandler ( "onClientSoundStopped", som, finishMusica, false)
end
function finishMusica(reason)
	if (reason == "finished") then
		tocando = tocando+1
		setMusica(tocando)
	end
end
function open( )
	if (guiGetVisible( gui.staticimage[1] )) then
		guiSetVisible( gui.staticimage[1], false )
		showCursor( false )
		removeEventHandler("onClientRender", root, updatePlayer)
	else
		guiSetInputMode("no_binds_when_editing")
		guiSetVisible( gui.staticimage[1], true )
		showCursor( true )
		addEventHandler("onClientRender", root, updatePlayer)
	end
end
function toggleRadio()
	if (radio == 1) then
		radio = 0
		outputChatBox("#FFFFFFOla A #00ff00Musica #ffffffFoi #00ff00Desativada #ffffff.",255,255,255,true)
	else
		radio = 1
		outputChatBox("#FFFFFFOla A #00ff00Musica #ffffffFoi #00ff00Ativada #ffffff.",255,255,255,true)
	end
	if isElement(gsom) then setSoundVolume(gsom,radio) end
end
addEventHandler( "onClientResourceStop", resourceRoot,
	function()
		if (artworks and #artworks > 0) then
			for _,values in ipairs(artworks) do
				local name = "Simagens/"..values.id..".jpg"
				if fileExists(name) then fileDelete(name) end
			end
		end
	end
)
addEventHandler( "onClientResourceStart", resourceRoot,
	function()
		triggerServerEvent ( "getRadioList", resourceRoot )
	end
)
addEvent( "removeArtwork", true )
addEventHandler( "removeArtwork", resourceRoot,
    function( id )
		local name = "Simagens/"..id..".jpg"
		if fileExists(name) then fileDelete(name) end
    end
)
addEvent( "onClientGotImage", true )
addEventHandler( "onClientGotImage", resourceRoot,
    function( pixels, url, id )
		local name = "Simagens/"..id..".jpg"
		if fileExists(name) then fileDelete(name) end
		local file = fileCreate(name) 
		fileWrite(file, pixels) 
		fileClose(file)
		for _,values in ipairs(artworks) do
			if values.id == id then
				guiStaticImageLoadImage ( values.img, "Simagens/"..id..".jpg" )
				break
			end
		end
    end
)
addEventHandler( "onClientGUIAccepted", resourceRoot,
    function( editBox )
		if (editBox == gui.edit[1]) then
			triggerServerEvent ( "searchMusics", resourceRoot, guiGetText(editBox) )
		end
    end
)
addEventHandler( "onClientMouseWheel", resourceRoot,
    function ( up_down )
		if (tocar[source]) then
			if up_down == 1 then
				guiScrollPaneSetVerticalScrollPosition( gui.scrollpane[1], guiScrollPaneGetVerticalScrollPosition(gui.scrollpane[1])-5 )
			else
				guiScrollPaneSetVerticalScrollPosition( gui.scrollpane[1], guiScrollPaneGetVerticalScrollPosition(gui.scrollpane[1])+5 )
			end
		end
    end
)
addEventHandler ( "onClientGUIClick", resourceRoot,
	function(btn)
		if (btn ~= "left") then return end
		if (tocar[source]) then
			tocando = tocar[source].idmusica
			setMusica(tocando)
		elseif (source == gui.staticimage[14]) then
			if not playList or #playList == 0 then return end
			if (tocando+1 > #playList) then tocando = 1
			else tocando = tocando+1
			end
			setMusica(tocando)
		elseif (source == gui.staticimage[12]) then
			if not playList or #playList == 0 then return end
			if (tocando-1 < 1) then tocando = #playList
			else tocando = tocando-1
			end
			setMusica(tocando)
		elseif (source == gui.staticimage[10]) then
			triggerServerEvent ( "searchMusics", resourceRoot, guiGetText(gui.edit[1]) )
		elseif (source == gui.staticimage[13]) then
			if isElement(som) then
				if (not isSoundPaused(som)) then
					setSoundPaused(som,true)
					guiStaticImageLoadImage ( gui.staticimage[13], "Imagens/play.png" )
				else
					setSoundPaused(som,false)
					guiStaticImageLoadImage ( gui.staticimage[13], "Imagens/pause.png" )
				end
			end
		elseif (source == gui.label[2] or source == gui.label[3]) then
			menuSelected = source
			if (source == gui.label[2]) then
				guiStaticImageSetColor (gui.staticimage[6], "444444")
				guiSetVisible(gui.staticimage[7],true)
				guiSetVisible(gui.staticimage[8],false)
			else
				guiStaticImageSetColor (gui.staticimage[5], "444444")
				guiSetVisible(gui.staticimage[7],false)
				guiSetVisible(gui.staticimage[8],true)
			end
		elseif (source == gui.staticimage[18]) then
			if isElement(som) then
				local volume = getSoundVolume(som)
				if (volume < 1) then
					setSoundVolume ( som, getSoundVolume(som)+0.2 )
				end
			end
		elseif (source == gui.staticimage[19]) then
			if isElement(som) then
				local volume = getSoundVolume(som)
				if (volume > 0) then
					setSoundVolume ( som, getSoundVolume(som)-0.2 )
				end
			end

			--[[
		elseif (source == gui.staticimage[21]) then
			guiSetEnabled(gui.staticimage[1],false)
			guiSetVisible(alert.wnd,true)
			guiBringToFront (alert.wnd)
			guiSetText(alert.lbl2,playList[tocando].title)
		elseif (source == alert.confirm) then
			guiSetEnabled(gui.staticimage[1],true)
			if (playList[tocando]) then
				guiSetVisible(alert.wnd,false)
				triggerServerEvent ( "addMusicRadio", resourceRoot, playList[tocando] )
			end
]]--

		elseif (source == alert.recuse) then
			guiSetEnabled(gui.staticimage[1],true)
			guiSetVisible(alert.wnd,false)
		elseif (source == gui.staticimage[3]) then
			guiSetVisible( gui.staticimage[1], false )
			showCursor( false )
			removeEventHandler("onClientRender", root, updatePlayer)
		elseif (source == gui.staticimage[20]) then
			if (playList[tocando]) then
				triggerServerEvent ( "setVehRadio", resourceRoot, playList[tocando] )
			end
		end
	end
)
addEventHandler( "onClientMouseEnter", resourceRoot, 
	function()
		if (source == gui.label[2]) then
			guiStaticImageSetColor (gui.staticimage[5], "ff0000")
		elseif (source == gui.label[3]) then
			guiStaticImageSetColor (gui.staticimage[6], "ff0000")
		elseif (source == gui.staticimage[3] or source == gui.staticimage[10] or source == gui.staticimage[18] or source == gui.staticimage[19] or source == gui.staticimage[20] or source == gui.staticimage[21]) then
			guiStaticImageSetColor (source, "ff0000")
		elseif (source == gui.staticimage[12] or source == gui.staticimage[13] or source == gui.staticimage[14] or source == alert.confirm or source == alert.recuse) then
			guiSetAlpha(source, 0.5)
		end
	end
)
addEventHandler( "onClientMouseLeave", resourceRoot, 
	function()
		if (source == gui.label[2] and menuSelected ~= source) then
			guiStaticImageSetColor (gui.staticimage[5], "444444")
		elseif (source == gui.label[3] and menuSelected ~= source) then
			guiStaticImageSetColor (gui.staticimage[6], "444444")
		elseif (source == gui.staticimage[3] or source == gui.staticimage[10] or source == gui.staticimage[18] or source == gui.staticimage[19] or source == gui.staticimage[20] or source == gui.staticimage[21]) then
			guiStaticImageSetColor (source, "FFFFFF")
		elseif (source == gui.staticimage[12] or source == gui.staticimage[13] or source == gui.staticimage[14] or source == alert.confirm or source == alert.recuse) then
			guiSetAlpha(source, 1)
		end
	end
)
function updatePlayer()
	if isElement(som) and getSoundPosition(som) > 0 and getSoundLength(som) > 0 then 
		guiSetText ( gui.label[5], milToMin(getSoundPosition(som)*1000) )
		guiSetText ( gui.label[6], milToMin(getSoundLength(som)*1000) )
		if (tonumber(getSoundLength(som)) and tonumber(getSoundPosition(som))) then
			guiSetSize ( gui.staticimage[16], (getSoundPosition(som)*300)/getSoundLength(som) or 1, 8,false )
		end
	end
end
addEvent("startRadioMusic",true)
addEventHandler( "startRadioMusic", resourceRoot,
    function(list)
		if not radio then return end
		if isElement(gsom) then destroyElement(gsom) end
		dxInfos = list
		gsom = playSound ( "https://api.soundcloud.com/tracks/"..tostring(list.id).."/stream?client_id="..config.keySoundCloud )
		setSoundVolume(gsom,radio)
    end
)
function drawRadio()
	if isElement(gsom) and getSoundPosition(gsom) > 0 and getSoundLength(gsom) > 0 and getSoundVolume(gsom) > 0 then 
		dxDrawRectangle ( (sx/2)-200, sy-60, 400, 60, tocolor ( 94, 94, 94, 255 ) )
		dxDrawRectangle ( (sx/2)-200+60, sy-60, 340, 30, tocolor ( 76, 76, 76, 255 ) )
		dxDrawImage( (sx/2)-200, sy-60, 60, 60, "Simagens/sem_imagem.jpg" )
		if (fileExists("Simagens/"..dxInfos.id..".jpg")) then
			dxDrawImage( (sx/2)-200, sy-60, 60, 60, "Simagens/"..dxInfos.id..".jpg" )
		end
		dxDrawText ( dxInfos.title, (sx/2)-200+65, sy-60, (sx/2)-200+395, sy-60+30, tocolor ( 255, 255, 255, 255 ), 1.1, "arial", "left", "center", true)
		dxDrawText ( dxInfos.request, (sx/2)-200+65, sy-60+30, (sx/2)-200+395, sy-60+50, tocolor ( 255, 255, 255, 255 ), 0.9, "arial", "left", "bottom", false, true, false, true)
		dxDrawText ( milToMin(getSoundPosition(gsom)*1000).." / "..milToMin(dxInfos.duration), (sx/2)-200+65, sy-60+30, (sx/2)-200+395, sy-60+50, tocolor ( 255, 255, 255, 255 ), 0.9, "arial", "right", "bottom", false, true)
		dxDrawRectangle ( (sx/2)-200+60, sy-5, 340, 5, tocolor ( 68, 68, 68, 255 ) )
		dxDrawRectangle ( (sx/2)-200+60, sy-5, (getSoundPosition(gsom)*340)/getSoundLength(gsom), 5, tocolor ( 255, 0, 0 ) )
	end
end
addEventHandler("onClientRender", root, drawRadio)
addEvent("stopRadioMusic",true)
addEventHandler( "stopRadioMusic", resourceRoot,
    function()
		if isElement(gsom) then destroyElement(gsom) end
    end
)
function milToMin(value)
	seconds = math.floor(value/1000)
	local results = {}
	local sec = ( seconds %60 )
	local min = math.floor ( ( seconds % 3600 ) /60 )
	local hou = math.floor ( ( seconds % 86400 ) /3600 )
	if hou > 0 then
		return string.format("%01d:%02d:%02d", hou, min, sec)
	else
		return string.format("%02d:%02d", min, sec)
	end
end
function convertNumber ( number )  
	local formatted = number  
	while true do      
		formatted, k = string.gsub(formatted, "^(-?%d+)(%d%d%d)", '%1,%2')    
		if ( k==0 ) then      
			break   
		end  
	end  
	return formatted
end