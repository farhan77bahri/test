

addEvent("onClientSyncVOZ", true )
addEventHandler("onClientSyncVOZ", root,
    function()
--setPedAnimation(thePlayer, "ped", "factalk", -1, true, true, false )

	--setPedAnimation(source, "GHANDS", "gsign2LH", 0, true, false, false)

	setPedAnimation(source, "GHANDS", "gsign1", 0, true, false, false)
	setTimer ( setPedAnimationProgress, 100, 1, source, "gsign1", 1.46)
	setTimer ( setPedAnimationSpeed, 100, 1, source, "gsign1", 0)




--	setTimer ( setPedAnimationProgress, 100, 1, source, "gsign2LH", 1.16)
--	setTimer ( setPedAnimationSpeed, 100, 1, source, "gsign2LH", 0)
	
    end
)


addEvent("onClientSyncVOZparar", true )
addEventHandler("onClientSyncVOZparar", root,
    function()
		--setTimer ( setPedAnimationSpeed, 50, 1, source, "gsign2LH", 1.0)
		--setTimer ( setPedAnimationProgress, 100, 1, source, "gsign2LH", 0.5)
		setTimer ( setPedAnimation, 100, 1, source,  "GHANDS", "gsign2", 5000, false, false, false)
		setTimer ( setPedAnimation, 250, 1, source)
		
    end
)



addEvent("onClientDesmaiarON", true )
addEventHandler("onClientDesmaiarON", root,
    function()
		setPedAnimation(source, "KNIFE", "KILL_Knife_Ped_Die", -1, false, true, false)
    end
)




addEvent("onClientAssobiarON", true )
addEventHandler("onClientAssobiarON", root,
	function()
		

		local xp, yp, zp = getElementPosition(source)
		local int = getElementInterior(source)
		local dim = getElementDimension(source)
		triggerClientEvent(root, "syncSongassobiar", source, xp, yp, zp, int, dim)



		setPedAnimation(source, "GANGS", "smkcig_prtl", 0, true, false, false)
		setTimer ( setPedAnimationSpeed, 100, 1, source, "smkcig_prtl", 0)
		setTimer ( setPedAnimationProgress, 100, 1, source, "smkcig_prtl", 1.36)

		setTimer ( setPedAnimation, 700, 1, source, "GhANDS", "gsign2LH", 5000, false, false, false)
		--setTimer ( setPedAnimation, 2000, 1, source,  "GHANDS", "gsign2", 5000, false, false, false)
		setTimer ( setPedAnimation, 2500, 1, source)


    end
)





addEvent("onClientAnimCall", true )
addEventHandler("onClientAnimCall", root,
	function()
		setPedAnimation(source, "GANGS", "smkcig_prtl", 0, true, false, false)
		setTimer ( setPedAnimationSpeed, 100, 1, source, "smkcig_prtl", 0)
		setTimer ( setPedAnimationProgress, 100, 1, source, "smkcig_prtl", 1.36)
    end
)







addEvent("removerarma", true )
addEventHandler("removerarma", root,
    function()
		takeWeapon( source, 22 )
		toggleControl (source, "fire", true )
		toggleControl (source, "action", true ) 
	--	triggerClientEvent(getRootElement(), "removeWeaponStickerC", getRootElement(), source)
    end
)

addEvent("dararma", true )
addEventHandler("dararma", root,
	function()
		giveWeapon (source,22,1, true )
		toggleControl (source, "action", false ) 
		toggleControl (source, "fire", false )
		--triggerClientEvent(getRootElement(), "setWeaponStickerC", getRootElement(), source, colt45, glock1)
		--local weapon = givePedWeapon (source,22,1, true )
		--setElementAlpha(weapon, 0) 
    end
)




addCommandHandler('cmedic',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "acc:admin") >= 9 then
		

		if getElementData(thePlayer, "inCall") then

			setElementData(thePlayer, "inCall", false) 

			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				--setPlayerVoiceBroadcastTo( thePlayer, root  )
				--exports.san_voice:setPlayerChannel (thePlayer, 0)

				local empty = exports.san_voice:getNextEmptyChannel() 
				exports.san_voice:setPlayerChannel(thePlayer, empty)  
			 	setPlayerVoiceBroadcastTo( thePlayer, root  )



				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Bimarestan Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
		--if tonumber(canal) > 5 and tonumber(canal) < 12 then
				setElementData(thePlayer, "inCall", true) 

				--setPlayerVoiceIgnoreFrom ( thePlayer, root)
				--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				exports.san_voice:setPlayerChannel ( thePlayer, 230 )

				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio Bimarestan Shodid ! Baraye Khoroj Dobare Type Konid /medic  ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 6 a 11 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)

addCommandHandler('cgov',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 7 or getElementData(thePlayer, "acc:admin") >= 9 then
		

		if getElementData(thePlayer, "inCall") then

			setElementData(thePlayer, "inCall", false) 

			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				--setPlayerVoiceBroadcastTo( thePlayer, root  )
				--exports.san_voice:setPlayerChannel (thePlayer, 0)

				local empty = exports.san_voice:getNextEmptyChannel() 
				exports.san_voice:setPlayerChannel(thePlayer, empty)  
			 	setPlayerVoiceBroadcastTo( thePlayer, root  )



				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Dadgostari Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
		--if tonumber(canal) > 5 and tonumber(canal) < 12 then
				setElementData(thePlayer, "inCall", true) 

				--setPlayerVoiceIgnoreFrom ( thePlayer, root)
				--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				
				s.san_voice:setPlayerChannel ( thePlayer, 220 )

				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio Dadgostari Shodid ! Baraye Khoroj Dobare Type Konid /cgov  ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 6 a 11 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)


addCommandHandler('bisim',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 1 or getElementData(thePlayer, "acc:admin") >= 9 then


		if getElementData(thePlayer, "inCall") then
			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)


			--exports.san_voice:setPlayerChannel (thePlayer, 0)

			local empty = exports.san_voice:getNextEmptyChannel() 
	   		exports.san_voice:setPlayerChannel(thePlayer, empty)  
	   

			setPlayerVoiceBroadcastTo( thePlayer, root  )


			setElementData(thePlayer, "inCall", false) 
			outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Police Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
		--if tonumber(canal) > 1 and tonumber(canal) < 6 then
				exports.san_voice:setPlayerChannel ( thePlayer, 100 )
				setElementData(thePlayer, "inCall", true)  
				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio Police Shodid ! Baraye Khoroj Dobare Type Konid /police ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 1 a 5 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)

addCommandHandler('nopo',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 13 or getElementData(thePlayer, "acc:admin") >= 9 then


		if getElementData(thePlayer, "inCall") then
			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)


			--exports.san_voice:setPlayerChannel (thePlayer, 0)

			local empty = exports.san_voice:getNextEmptyChannel() 
	   		exports.san_voice:setPlayerChannel(thePlayer, empty)  
	   

			setPlayerVoiceBroadcastTo( thePlayer, root  )


			setElementData(thePlayer, "inCall", false) 
			outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Police Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
		--if tonumber(canal) > 1 and tonumber(canal) < 6 then
				exports.san_voice:setPlayerChannel ( thePlayer, 120 )
				setElementData(thePlayer, "inCall", true)  
				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio Police Shodid ! Baraye Khoroj Dobare Type Konid /police ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 1 a 5 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)

addCommandHandler('mafiaa',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 22 or getElementData(thePlayer, "acc:admin") >= 9 then


		if getElementData(thePlayer, "inCall") then
			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)


			--exports.san_voice:setPlayerChannel (thePlayer, 0)

			local empty = exports.san_voice:getNextEmptyChannel() 
	   		exports.san_voice:setPlayerChannel(thePlayer, empty)  
	   

			setPlayerVoiceBroadcastTo( thePlayer, root  )


			setElementData(thePlayer, "inCall", false) 
			outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Mafia Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
		--if tonumber(canal) > 1 and tonumber(canal) < 6 then
				exports.san_voice:setPlayerChannel ( thePlayer, 130 )
				setElementData(thePlayer, "inCall", true)  
				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio mafia Shodid ! Baraye Khoroj Dobare Type Konid /mafia ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 1 a 5 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)



local vehicles = getElementsByType("player")
for i,v in ipairs(vehicles) do
	setElementData(v, "call:selling", false)
end





addCommandHandler('radio',
function(thePlayer, commandName)
	if getElementData(thePlayer, "char:dutyfaction") == 4 or getElementData(thePlayer, "acc:admin") >= 9 then
		
  

	   	if getElementData(thePlayer, "inCall") then

			setElementData(thePlayer, "inCall", false) 

			--setPlayerVoiceIgnoreFrom ( thePlayer, root)
			--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				--setPlayerVoiceBroadcastTo( thePlayer, root  )
				exports.san_voice:setPlayerChannel (thePlayer, 150)

				local empty = exports.san_voice:getNextEmptyChannel() 
				exports.san_voice:setPlayerChannel(thePlayer, empty)  
			 	setPlayerVoiceBroadcastTo( thePlayer, root  )



				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Radio Bimarestan Ra Tark Kardid!", thePlayer, 255, 0, 0, true )
		else
	 	--if tonumber(canal) > 5 and tonumber(canal) < 12 then
				setElementData(thePlayer, "inCall", true) 

				--setPlayerVoiceIgnoreFrom ( thePlayer, root)
				--setPlayerVoiceIgnoreFrom ( thePlayer, nil)

				exports.san_voice:setPlayerChannel ( thePlayer, 300 )

				outputChatBox ( "#7cc576[Bisim]:#ffffffShoma Vared Radio Bimarestan Shodid ! Baraye Khoroj Dobare Type Konid /Zradio  ", thePlayer, 255, 0, 0, true )
		--else
		--		setElementData(thePlayer, "inCall", false) 
		--		exports.san_voice:setPlayerChannel ( thePlayer, nil )
		--		outputChatBox ( "#7cc576[CALL]:#ffffffVocê precisa escolher o canal entre 6 a 11 para conectar", thePlayer, 255, 0, 0, true ) 
		--		end
			end
		end
	end
)






function adasVeteli(thePlayer, commandName, targetPlayer)
	if not (targetPlayer) then
		outputChatBox("#7cc576[#00C957C#FFFFFFR#FF0000P]:#ffffff /" .. commandName .." [Name / ID]", thePlayer, 255, 255, 255, true)
	else
		if getElementData(thePlayer, "call:selling") then outputChatBox("#dc143c[#00C957C#FFFFFFR#FF0000P]:#ffffffIn Player Ghablan Makani Baraye Paziresh Darad.", thePlayer, 255, 255, 255, true) return end
		
		local targetPlayer, targetPlayerName = exports.btc_core:findPlayer(thePlayer, targetPlayer)
		if targetPlayer then
		if thePlayer == targetPlayer then outputChatBox("#dc143c[#00C957C#FFFFFFR#FF0000P]:#ffffffShoma Nmitavanid Khod Ra Seda Konid", thePlayer, 255, 255, 255, true) return end

		if getElementData(targetPlayer, "call:LOC") == true then 
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			outputChatBox(" ", thePlayer, 255, 255, 255, true)
			outputChatBox("#1E8BC3[Location]:#ffffffIn Sakhs Dar Hale Hazer Ba Yek Makan Dar Entezar Ast!", thePlayer, 255, 255, 255, true)
		return 
		end


		sendAjanlat(thePlayer, targetPlayer)
		
		else
		outputChatBox("#1E8BC3[Location]:#ffffffIn Player Dar Sahr Nist", thePlayer, 255, 255, 255, true)
		end
		end
end
addCommandHandler("loca", adasVeteli, false, false)

function sendAjanlat(thePlayer, targetPlayer)
if isElement(thePlayer) and isElement(targetPlayer) then
	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	outputChatBox(" ", thePlayer, 255, 255, 255, true)
	outputChatBox("#1E8BC3[Location]:#ffffff Shoma Makan Ra Ersal Kardid " .. getPlayerName(targetPlayer):gsub("_"," ") .. "", thePlayer, 255, 255, 255, true)

	outputChatBox(" ", targetPlayer, 255, 255, 255, true)
	outputChatBox(" ", targetPlayer, 255, 255, 255, true)
	outputChatBox(" ", targetPlayer, 255, 255, 255, true)
	outputChatBox(" ", targetPlayer, 255, 255, 255, true)
	outputChatBox("#1E8BC3[Location]:#ffffff " .. getPlayerName(thePlayer):gsub("_"," ") .. " Baraye Shoma Yek Makan Ra Ersal Kard", targetPlayer, 255, 255, 255, true)
	outputChatBox("#1E8BC3[Location]:#ffffff Baraye Paziresh Type Konid : #7cc576/accept#ffffff.", targetPlayer, 255, 255, 255, true)
	outputChatBox("#1E8BC3[Location]:#ffffff Baraye Rad Kardan Type Konid : #dc143c/reject#ffffff.", targetPlayer, 255, 255, 255, true)

	setElementData(targetPlayer, "call:LOC", true)

	setElementData(targetPlayer, "call:accept", 1)
	setElementData(thePlayer, "call:selling", 1)
	setElementData(targetPlayer, "call:tplayer", thePlayer)	
	

end
end

function elfogad(source, cmd)
if getElementData(source, "call:accept") == 1 then

		local tplayer = getElementData(source, "call:tplayer")
		outputChatBox(" ", source, 255, 255, 255, true)
		outputChatBox(" ", source, 255, 255, 255, true)
		outputChatBox(" ", source, 255, 255, 255, true)
		outputChatBox(" ", source, 255, 255, 255, true)
		outputChatBox("#1e8bc3[Location]:#ffffff Shoma Makan Ra Paziroftid", source, 255, 255, 255, true)


		outputChatBox(" ", getElementData(source, "call:tplayer"), 255, 255, 255, true)
		outputChatBox(" ", getElementData(source, "call:tplayer"), 255, 255, 255, true)
		outputChatBox(" ", getElementData(source, "call:tplayer"), 255, 255, 255, true)
		outputChatBox(" ", getElementData(source, "call:tplayer"), 255, 255, 255, true)
		outputChatBox("#1e8bc3[Location]:#ffffff Moghiyat Makani Shoma Ra Paziroft", getElementData(source, "call:tplayer"), 255, 255, 255, true)

		setElementData(source, "call:accept", false)
		local oldCash = getElementData(source, "char:money") or 0
		setElementData(source, "char:money", oldCash - math.random(100,500))
		setElementData(tplayer, "call:selling", false)


		setElementData(source, "call:accept", false)
		setElementData(source, "call:tplayer", false)
		setElementData(source, "call:selling", false)
		setElementData(source, "call:tplayer", false)
		setElementData(source, "call:LOC", false)

		local x, y, z = getElementPosition(tplayer)
		triggerClientEvent(source, "localizar", source, x, y, z)



			
			
			
end
end
addCommandHandler("accept", elfogad, false, false)

function decline(source, cmd)
	local tplayer = getElementData(source, "call:tplayer")
if getElementData(source, "call:accept") == 1 then
setElementData(source, "call:accept", false)
setElementData(tplayer, "call:selling", false)
setElementData(source, "call:tplayer", false)

setElementData(source, "call:LOC", false)

outputChatBox(" ", source, 255, 255, 255, true)
outputChatBox(" ", source, 255, 255, 255, true)
outputChatBox(" ", source, 255, 255, 255, true)
outputChatBox(" ", source, 255, 255, 255, true)

outputChatBox("#1e8bc3[Location]:#ffffff Shoma Makan Ra Rad Kardid", source, 255, 255, 255, true)

outputChatBox(" ", tplayer, 255, 255, 255, true)
outputChatBox(" ", tplayer, 255, 255, 255, true)
outputChatBox(" ", tplayer, 255, 255, 255, true)
outputChatBox(" ", tplayer, 255, 255, 255, true)
outputChatBox("#1e8bc3[Location]:#ffffff Moghiyat Makani Shoma Ra Rad Kard.", tplayer, 255, 255, 255, true)
end
end
addCommandHandler("reject", decline, false, false)



addCommandHandler('dcall',
function(thePlayer, commandName)
		local tplayer = getElementData(thePlayer, "call:tplayer")
		if getElementData(thePlayer, "inCall2") == true then

		setElementData(thePlayer, "call:accept", false)
		setElementData(thePlayer, "call:tplayer", false)
		setElementData(thePlayer, "call:selling", false)
		setElementData(thePlayer, "call:tplayer", false)
		setElementData(thePlayer, "inCall", false) 
		setElementData(thePlayer, "inCall2", false)  
		exports.san_voice:setPlayerChannel ( thePlayer, 0 )
		setPlayerVoiceBroadcastTo( thePlayer, nil  )
		outputChatBox ( " ", thePlayer, 255, 0, 0, true )
		outputChatBox ( " ", thePlayer, 255, 0, 0, true )
		outputChatBox ( " ", thePlayer, 255, 0, 0, true )
		outputChatBox ( " ", thePlayer, 255, 0, 0, true )
		outputChatBox ( " ", thePlayer, 255, 0, 0, true )

		outputChatBox ( "#7cc576[CALL]:#ffffffMokalemeh Telefoni Tamam Shod ", thePlayer, 255, 0, 0, true )

		if tplayer then
			outputChatBox ( "#7cc576[CALL]:#ffffffTamas Ba Player Tamam Shod "..getPlayerName(tplayer).." ", thePlayer, 255, 0, 0, true )
			setElementData(tplayer, "call:accept", false)
			setElementData(tplayer, "call:tplayer", false)
			setElementData(tplayer, "call:selling", false)
			setElementData(tplayer, "call:tplayer", false)
			setElementData(tplayer, "inCall", false) 
			setElementData(tplayer, "inCall2", false)  
			exports.san_voice:setPlayerChannel ( tplayer, 0 )
			setPlayerVoiceBroadcastTo( tplayer, nil  )
			outputChatBox ( " ", tplayer, 255, 0, 0, true )
			outputChatBox ( " ", tplayer, 255, 0, 0, true )
			outputChatBox ( " ", tplayer, 255, 0, 0, true )
			outputChatBox ( " ", tplayer, 255, 0, 0, true )
			outputChatBox ( " ", tplayer, 255, 0, 0, true )
			outputChatBox ( "#7cc576[CALL]:#ffffffPlayer Ha "..getPlayerName(thePlayer).." Tamas Khod Ra Ghat Kard ", tplayer, 255, 0, 0, true )
		end
		
			

		else
		outputChatBox ( "#7cc576[CALL]:#ffffffShoma Ba Kasi Dar Tamas Nistid!", thePlayer, 255, 0, 0, true )
end
end
)
