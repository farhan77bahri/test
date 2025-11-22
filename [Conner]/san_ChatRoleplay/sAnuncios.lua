FILTROSChat = {}

function Olx (thePlayer, commandName, ...)
if not getElementData(thePlayer, "loggedin") then return end
local text = { ... }
local olxMessage = table.concat( text, " " )




local id = getElementData(thePlayer, "acc:id")
if not olxMessage then
 outputChatBox("#FFA000OLX INFO* #FFFFFFPara usar o sistema OLX Utilize", thePlayer,255,255,255, true)
 outputChatBox("#FFA000COMANDO* #FFFFFF/olx *seu produto* *valor*", thePlayer,255,255,255, true)
		 else
			if not ... then
			outputChatBox("#FFA000OLX INFO* #FFFFFFInforme o produto", thePlayer,255,255,255, true)
				else
			if getElementData (thePlayer, "OLXChat", true) then outputChatBox ('#FFA000IRG* #FFFFFFAguarde 1 Minuto para Anunciar algo na OLX!',thePlayer,255,255,255,true) return end
			local Money = 15
			local money2 = getElementData(thePlayer, "char:money")
			
			if getElementData(thePlayer, "acc:aseged") >= 1 then
				outputChatBox("#00FF26☑ OLX PREMIUM ☑ #FFA000"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."("..id..") #FFFFFFAnunciou: #FFA000"..olxMessage:gsub("#%x%x%x%x%x%x", "").."", root, 255,255,255, true)
				outputChatBox("#00E6FF❝ Não foi cobrado nada para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
				outputServerLog ( "OLX "..getPlayerName(thePlayer).." Anunciou na OLX: "..olxMessage)
				setElementData (thePlayer, "OLXChat",false)
				theTimer = setTimer (setElementData, 5000, 1, thePlayer, "OLXChat", false)
			
			elseif money2 >= Money then
				setElementData(thePlayer, "char:money", money2 - Money)
				outputChatBox("#00FF26☑ OLX ☑ #FFA000"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."("..id..") #FFFFFFAnunciou: #FFA000"..olxMessage:gsub("#%x%x%x%x%x%x", "").."", root, 255,255,255, true)
				outputChatBox("#00E6FF❝ Foi cobrado "..Money.." para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
				outputServerLog ( "OLX "..getPlayerName(thePlayer).." Anunciou na OLX: "..olxMessage)
				setElementData (thePlayer, "OLXChat",true)
				theTimer = setTimer (setElementData, 60000, 1, thePlayer, "OLXChat", false)
			else
				outputChatBox("#00E6FF❝ Você não tem dinheiro para enviar mensagem no chat", thePlayer, 255,255,255, true)	
			end
		end
	end
end
addCommandHandler("olx", Olx)
--[[
setTimer(function()
	outputChatBox(" ", root)
end, 5000, 0)]]


function Twitter (thePlayer, commandName, ...)
if not getElementData(thePlayer, "loggedin") then return end
local twitterWords = { ... }
local twitterMessage = table.concat( twitterWords, " " )
local id = getElementData(thePlayer, "acc:id")
if not twitterMessage then
 outputChatBox("#0000FFTWITTER* #FFFFFFPara usar o sistema OLX Utilize", thePlayer,255,255,255, true)
 outputChatBox("#0000FFCOMANDO* #FFFFFF/twitter *seu comentário*", thePlayer,255,255,255, true)
     else
       if not twitterMessage == " " then
	      outputChatBox("#0000FFTWITTER* #FFFFFFDIGITE UM COMENTÁRIO", thePlayer,255,255,255, true)
	        else
			if getElementData (thePlayer, "Chat", true) then outputChatBox ('#FFA000IRG* #FFFFFFAguarde 20 Segundos para Twittar!',thePlayer,255,255,255,true) return end

			local Money = 15
			local money2 = getElementData(thePlayer, "char:money")
			
			if getElementData(thePlayer, "acc:aseged") >= 1 then
			outputChatBox("#01B7FF✉ Twitter ✉#FFFFFF "..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."("..id.."): #01B7FF"..twitterMessage, root, 255,255,255, true)
			outputChatBox("#00E6FF❝ Não foi cobrado nada para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
			outputServerLog ( "Twitter "..getPlayerName(thePlayer).." Twittou: "..twitterMessage)
			setElementData (thePlayer, "Chat",true)
			setTimer (setElementData, 5000, 1, thePlayer, "Chat", false)
			
			elseif money2 >= Money then
			setElementData(thePlayer, "char:money", money2 - Money)
			outputChatBox("#01B7FF✉ Twitter ✉#FFFFFF "..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."("..id.."): #01B7FF"..twitterMessage, root, 255,255,255, true)
			outputChatBox("#00E6FF❝ Foi cobrado "..Money.." para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
			outputServerLog ( "Twitter "..getPlayerName(thePlayer).." Twittou: "..twitterMessage)
			setElementData (thePlayer, "Chat",true)
			setTimer (setElementData, 20000, 1, thePlayer, "Chat", false)
			else
			outputChatBox("#00E6FF❝ Você não tem dinheiro para enviar mensagem no chat", thePlayer, 255,255,255, true)	
			end
	    end
	end
end
addCommandHandler("twt", Twitter)


function ForadoRP (thePlayer, commandName, ...)
if not getElementData(thePlayer, "loggedin") then return end
local frWords = { ... }
local frMessage = table.concat( frWords, " " )
local id = getElementData(thePlayer, "acc:id")

	if not frMessage == " " then
		outputChatBox("#0000FFFora do RP* #FFFFFFDIGITE UM COMENTÁRIO", thePlayer,255,255,255, true)
		else
		if getElementData (thePlayer, "FRChat", true) then 
			 outputChatBox ('#FFA000IRG* #FFFFFFAguarde 20 Segundos para falar novamente!',thePlayer,255,255,255,true)
		return
		end

		local Money = 15
		local money2 = getElementData(thePlayer, "char:money")
		
		if getElementData(thePlayer, "acc:aseged") == 1 then
			outputServerLog ( "FR [FORA DO RP] "..getPlayerName(thePlayer).." Falou: "..frMessage)
			outputChatBox("#00E6FF❝ Fora do RP ❝ #ffffffVIP #00ff00"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."#00E6FF("..id..")#00ff00: #ffffff"..frMessage, root, 255,255,255, true)
			outputChatBox("#00E6FF❝ Não foi cobrado nada para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
			setElementData (thePlayer, "FRChat",true)
			theTimer = setTimer (setElementData, 5000, 1, thePlayer, "FRChat", false)
			
		elseif getElementData(thePlayer, "acc:aseged") == 2 then
			outputServerLog ( "FR [FORA DO RP] "..getPlayerName(thePlayer).." Falou: "..frMessage)
			outputChatBox("#00E6FF❝ Fora do RP ❝ #ffffffCOLABORADOR(A) #00ff00"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."#00E6FF("..id..")#00ff00: #ffffff"..frMessage, root, 255,255,255, true)
			outputChatBox("#00E6FF❝ Não foi cobrado nada para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
			setElementData (thePlayer, "FRChat",true)
			theTimer = setTimer (setElementData, 5000, 1, thePlayer, "FRChat", false)
		
		elseif money2 >= Money then
			setElementData(thePlayer, "char:money", money2 - Money)
			outputServerLog ( "FR [FORA DO RP] "..getPlayerName(thePlayer).." Falou: "..frMessage)
			outputChatBox("#00E6FF❝ Fora do RP ❝ #00ff00"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."#00E6FF("..id..")#00ff00: #ffffff"..frMessage, root, 255,255,255, true)
			outputChatBox("#00E6FF❝ Foi cobrado "..Money.." para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
			setElementData (thePlayer, "FRChat",true)
			theTimer = setTimer (setElementData, 20000, 1, thePlayer, "FRChat", false)
		else
			outputChatBox("#00E6FF❝ Você não tem dinheiro para enviar mensagem no chat", thePlayer, 255,255,255, true)	
		end
	end
end
addCommandHandler("fr", ForadoRP)

function Admin (thePlayer, commandName, ...)
if getElementData(thePlayer, "char:adminduty") == 1 then
     local adminChat = { ... }
     local adminMessage = table.concat( adminChat, " " )
     local id = getElementData(thePlayer, "acc:id")
	 outputServerLog ( "Administração Chat "..getPlayerName(thePlayer).." Falou: "..adminMessage)
	 outputChatBox(" ", root, 255,255,255, true)
	 outputChatBox("#FFA000[ADMINISTRAÇÂO] #FFFFFF"..getPlayerName(thePlayer):gsub("#%x%x%x%x%x%x", "").."#FFA000("..id..")#00ff00: #FFA000"..adminMessage, root, 255,255,255, true)
	 end
end
addCommandHandler("aviso", Admin)

function infoS (mens)
if not getElementData(source, "loggedin") then return end
local frMessage = table.concat({ mens }, " " )
     cancelEvent()
    --[[ outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)
	 outputChatBox(" ", source, 255,255,255, true)]]
    -- outputChatBox("#FFA000*IRG INFO #FFFFFFOs chats foram alterados.", source, 255,255,255, true)
    -- outputChatBox("#01B7FF*TWITTER #FFFFFF/twt", source, 255,255,255, true)
    -- outputChatBox("#FFA000*FORA DO RP #FFFFFF/fr", source, 255,255,255, true)
    -- outputChatBox("#bbbbbb*ANONIMOS #FFFFFF/@", source, 255,255,255, true)
    -- outputChatBox("#FFA000*OLX #FFFFFF/olx", source, 255,255,255, true)
end
addEventHandler("onPlayerChat", root, infoS)


function Anonymous (thePlayer, commandName, ...)
if not getElementData(thePlayer, "loggedin") then return end
local anonymosWords = { ... }
local anonymosMessage = table.concat( anonymosWords, " " )
if not anonymosMessage then
 outputChatBox("#bebebe[ANONIMO]* #FFFFFFPara usar o sistema FR Utilize", thePlayer,255,255,255, true)
 outputChatBox("#0000FFCOMANDO* #FFFFFF/@ *seu comentário*", thePlayer,255,255,255, true)
     else
       if not anonymosMessage == " " then
	      outputChatBox("#bebebe[ANONIMO]* #FFFFFFDIGITE UM COMENTÁRIO", thePlayer,255,255,255, true)
	        else
				if getElementData (thePlayer, "ANYChat", true) then outputChatBox ('#FFA000IRG* #FFFFFFAguarde 1 minuto para falar no /@ novamente!',thePlayer,255,255,255,true) return end
				
				local Money = 25
				local money2 = getElementData(thePlayer, "char:money")
				
				if getElementData(thePlayer, "acc:aseged") >= 1 then
				outputChatBox("#FFFFFFMensagem Anonima: #bebebe"..anonymosMessage, root, 255,255,255, true)
				outputChatBox("#00E6FF❝ Não foi cobrado nada para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
				exports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(thePlayer) .. "(" .. getElementData(thePlayer, "playerid") .. ") #ffffffusou o /@ com a mensagem: #00ff00 "..anonymosMessage)

				outputServerLog ( "Mensagem Anonima de "..getPlayerName(thePlayer).." Falou: "..anonymosMessage)
				setElementData (thePlayer, "ANYChat",true)
				setTimer (setElementData, 5000, 1, thePlayer, "ANYChat", false)
				
				elseif money2 >= Money then
				setElementData(thePlayer, "char:money", money2 - Money)

				outputChatBox("#FFFFFFMensagem Anonima: #bebebe"..anonymosMessage, root, 255,255,255, true)
				outputChatBox("#00E6FF❝ Foi cobrado "..Money.." para enviar a mensagem no chat", thePlayer, 255,255,255, true)	
				exports.san_admin:outputAdminMessage("#7cc576" .. getPlayerName(thePlayer) .. "(" .. getElementData(thePlayer, "playerid") .. ") #ffffffusou o /@ com a mensagem: #00ff00 "..anonymosMessage)

				outputServerLog ( "Mensagem Anonima de "..getPlayerName(thePlayer).." Falou: "..anonymosMessage)
				setElementData (thePlayer, "ANYChat",true)
				setTimer (setElementData, 60000, 1, thePlayer, "ANYChat", false)
			else
				outputChatBox("#00E6FF❝ Você não tem dinheiro para enviar mensagem no chat", thePlayer, 255,255,255, true)	
			end
	    end
    end
end
addCommandHandler("@", Anonymous)



function convertTime(ms)
	local min = math.floor ( ms/60000 )
	local sec = math.floor( (ms/1000)%60 )
	return min, sec
end
