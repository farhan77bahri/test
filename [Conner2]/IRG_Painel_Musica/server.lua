function getPlayerFromID(ID)
return call(getResourceFromName("GameID"), "getPlayerFromID", tonumber(ID))
end

function getPlayerID(player)
return  getElementData(player,"acc:id")
end
local radioList = {}
local antiSpamMusic = {}
addEventHandler ( "onResourceStart", resourceRoot,
	function()
		addCommandHandler(config.changeMusicCmd,changeMusic)
	end
)
addEvent("searchMusics", true)
addEventHandler("searchMusics", resourceRoot,
	function(str)
		str = removeAccents(str):gsub("%s", "%%20")
		fetchRemote("http://api.soundcloud.com/tracks.json?client_id="..config.keySoundCloud.."&q="..str.."&limit="..config.limitMusicSearch,
			function(resposta, erro, player)
				if (resposta ~= "ERROR") and (erro == 0) then
					data = {fromJSON (resposta)}
					triggerClientEvent(player, "getMusics", resourceRoot, data)
				end
			end
		, "", false, client)
	end
)
addEvent("getRadioList", true)
addEventHandler("getRadioList", resourceRoot,
	function()
		if radioList and #radioList > 0 then
			for i,r in ipairs(radioList) do
				if r.artwork2 then
					baixarImagem(r.artwork2,r.id,client)
				end
			end
			triggerClientEvent(client, "refreshRadioList", resourceRoot, radioList)
			triggerClientEvent(client, "startRadioMusic", resourceRoot, radioList[1])
		end
	end
)
function changeMusic(staff)
	if hasObjectPermissionTo(staff, "command.mute", true) then
		if radioList and #radioList > 0 then
			outputChatBox("#FFFFFFO Staff "..getPlayerName(staff).." #000000[#ffffffID:"..(getPlayerID(staff) or "?").."#000000] #FFFFFFPulou A Musica: #000000[#00ff00"..radioList[1].title.."#000000] #ffffff.",root,255,255,255,true)
			changeRadioMusic()
		else
			outputChatBox("#FFFFFFOla "..getPlayerName(staff).." #000000[#ffffffID:"..(getPlayerID(staff) or "?").."#000000] #FFFFFFNão #00ff00Existe #ffffffNenhuma #00ff00Música #ffffffTocando Na #00ff00Rádio #ffffff!",staff,255,0,0,true)
		end
	end
end
function changeRadioMusic()
	if isTimer(walkList) then killTimer(walkList) end
	if walkList2 and isTimer(walkList2) then killTimer(walkList2) end
	setTimer( function(nome)
		if antiSpamMusic[nome] then
			antiSpamMusic[nome] = nil
			outputChatBox("#FFFFFFOla A Musica #000000[#00ff00"..nome.."#000000] #FFFFFFFoi #00ff00Liberada #ffffffPara #00ff00Tocar #ffffffNovamente Na #00ff00Rádio #ffffff!",root,255,255,255,true)
		end
	end, config.timerSpam*60000, 1, radioList[1].title )
	triggerClientEvent(root, "removeArtwork", resourceRoot, radioList[1].id)
	table.remove(radioList,1)
	if radioList[1] then
		triggerClientEvent(root, "refreshRadioList", resourceRoot, radioList)
		triggerClientEvent(root, "startRadioMusic", resourceRoot, radioList[1])
		walkList = setTimer(changeRadioMusic,radioList[1].duration,1)
		if config.limitRadioMusicLenghOn then
			walkList2 = setTimer(changeRadioMusic,config.limitRadioMusicLengh*60000,1)
		end
	else
		triggerClientEvent(root, "refreshRadioList", resourceRoot, radioList)
		triggerClientEvent(root, "stopRadioMusic", resourceRoot)
	end
end
function baixarImagem(link,idmusica,sendto)
	if link then
		fetchRemote(link,
			function(resposta, erro, url, id, send)
				if (resposta ~= "ERROR") and (erro == 0) then
					triggerClientEvent(send, "onClientGotImage", resourceRoot, resposta, url, id)
				end
			end
		, "", false, link, idmusica, sendto)
	end
end
addEvent("addMusicRadio", true)
addEventHandler("addMusicRadio", resourceRoot,
	function(musica)
		if (getElementData(client, "char:money") >= config.priceUseRadio) then
			if not antiSpamMusic[musica.title] then
				antiSpamMusic[musica.title] = true
				--takePlayerMoney(client, config.priceUseRadio)

				setElementData(client, "char:money", getElementData(client, "char:money") - config.priceUseRadio)
				musica.request = getPlayerName(client)
				link = musica.artwork_url or musica.user.avatar_url or false
				link = link:gsub("large", "badge")
				if link then
					musica.artwork2 = link
					baixarImagem(link,musica.id,root)
				end
				table.insert(radioList,musica)
				triggerClientEvent(root, "refreshRadioList", resourceRoot, radioList)
				if #radioList == 1 then
					triggerClientEvent(root, "startRadioMusic", resourceRoot, radioList[1])
					walkList = setTimer(changeRadioMusic,radioList[1].duration,1)
					if config.limitRadioMusicLenghOn then
						walkList2 = setTimer(changeRadioMusic,config.limitRadioMusicLengh*60000,1)
					end
				end
				outputChatBox("#FFFFFFO Player "..getPlayerName(client).." #000000[#ffffffID:"..(getPlayerID(client) or "?").."#000000] #FFFFFFAdicionou A Música #000000[#00ff00"..radioList[#radioList].title.."#000000] #ffffffPara #00ff00Tocar #ffffffNa #00ff00Radio #ffffff.",root,255,255,255,true)
			else
				outputChatBox("#FFFFFFOla "..getPlayerName(client).." #000000[#ffffffID:"..(getPlayerID(client) or "?").."#000000] #FFFFFFEsta #00ff00Música #ffffffJá Foi #00ff00Adicionada #ffffffRecentemente Na #00ff00Rádio #ffffff!",client,255,0,0,true)
			end
		else
			outputChatBox("#FFFFFFOla "..getPlayerName(client).." #000000[#ffffffID:"..(getPlayerID(client) or "?").."#000000] #FFFFFFVocê #00ff00Não #ffffffPossui #000000[#00ff00R$ "..config.priceUseRadio.."#000000] #ffffffPara #00ff00Adicionar #ffffffA #00ff00Música #ffffffNa #00ff00Rádio #ffffff!",client,255,0,0,true)
		end
	end
)
addEvent("setVehRadio", true)
addEventHandler("setVehRadio", resourceRoot,
	function(musica)
		if (getPedOccupiedVehicle(client)) then
			executeCommandHandler ( "setradio", client, "https://api.soundcloud.com/tracks/"..tostring(musica.id).."/stream?client_id="..config.keySoundCloud)
		else
			outputChatBox("#FFFFFFOla "..getPlayerName(client).." #000000[#ffffffID:"..(getPlayerID(client) or "?").."#000000] #FFFFFFVocê #00ff00Não #ffffffPossui Um #00ff00Veículo #ffffff!",client,255,0,0,true)
		end
	end
)
local tableAccents = { ["à"] = "a",["á"] = "a",["â"] = "a",["ã"] = "a",["ä"] = "a",["ç"] = "c",["è"] = "e",["é"] = "e",["ê"] = "e",["ë"] = "e",["ì"] = "i",["í"] = "i",["î"] = "i",["ï"] = "i",["ñ"] = "n",["ò"] = "o",["ó"] = "o", ["ô"] = "o",["õ"] = "o",["ö"] = "o",["ù"] = "u",["ú"] = "u",["û"] = "u",["ü"] = "u",["ý"] = "y",["ÿ"] = "y",["À"] = "A",["Á"] = "A",["Â"] = "A",["Ã"] = "A",["Ä"] = "A",["Ç"] = "C",["È"] = "E",["É"] = "E",["Ê"] = "E",["Ë"] = "E",["Ì"] = "I",["Í"] = "I",["Î"] = "I",["Ï"] = "I",["Ñ"] = "N",["Ò"] = "O",["Ó"] = "O",["Ô"] = "O",["Õ"] = "O",["Ö"] = "O",["Ù"] = "U",["Ú"] = "U",["Û"] = "U",["Ü"] = "U",["Ý"] = "Y" }
function removeAccents(str)
	local noAccentsStr = ""
	for strChar in string.gfind(str, "([%z\1-\127\194-\244][\128-\191]*)") do
		if (tableAccents[strChar] ~= nil) then
			noAccentsStr = noAccentsStr..tableAccents[strChar]
		else
			noAccentsStr = noAccentsStr..strChar
		end
	end
	return noAccentsStr
end