

function spawn2(player)
spawn(player)
end

function spawn(player)


	--local rnd = {

    --            {1188.2130126953, -1337.1224365234, 13.5703125},

	--}
	setPlayerVoiceIgnoreFrom ( player, player)

	local empty = exports.bgo_voice:getNextEmptyChannel() 
	exports.bgo_voice:setPlayerChannel(player, empty)  

	setElementData(player, 'PlayerCaido', false)
	setElementData(player, "char:money", getElementData(player, "char:money") - (math.floor(getElementData(player, "char:money")/2)))
	

       -- local xn, yn, zn = unpack(rnd[math.random(#rnd)])
		spawnPlayer(player, 1183.6442871094, -1329.2287597656, 13.9, 0, getElementModel(player), 0, 0)
		
		if exports['san_items']:hasItemS(player, 38) then 
		exports['san_items']:takePlayerItemToID(source, 38, 0)
		end
		if exports['san_items']:hasItemS(player, 32) then 
		exports['san_items']:takePlayerItemToID(player, 32, 0)
		end
		if exports['san_items']:hasItemS(player, 64) then 
		exports['san_items']:takePlayerItemToID(player, 64, 0)
		end
		if exports['san_items']:hasItemS(player, 125) then 
		exports['san_items']:takePlayerItemToID(player, 125, 0)
		end
		if exports['san_items']:hasItemS(player, 84) then 
		exports['san_items']:takePlayerItemToID(player, 84, 0)
		end
		if exports['san_items']:hasItemS(player, 52) then 
		exports['san_items']:takePlayerItemToID(player, 52, 0)
		end
		if exports['san_items']:hasItemS(player, 50) then 
		exports['san_items']:takePlayerItemToID(player, 50, 0)
		end
		if exports['san_items']:hasItemS(player, 49) then 
		exports['san_items']:takePlayerItemToID(player, 49, 0)
		end
		if exports['san_items']:hasItemS(player, 46) then 
		exports['san_items']:takePlayerItemToID(player, 46, 0)
		end
		if exports['san_items']:hasItemS(player, 51) then 
			exports['san_items']:takePlayerItemToID(player, 51, 0)
			end
			if exports['san_items']:hasItemS(player, 53) then 
				exports['san_items']:takePlayerItemToID(player, 53, 0)
				end
				if exports['san_items']:hasItemS(player, 44) then 
					exports['san_items']:takePlayerItemToID(player, 44, 0)
					end		

	--fadeCamera( player, true)
	--setCameraTarget(player,player)
end



--[[
addEventHandler("onPlayerWasted", root,
	function()
		--setTimer(spawn, 5000, 1, source)

		--triggerClientEvent(source, "startDx", root)
		setTimer(triggerClientEvent, 5000, 1, source, "startDx", root)
		
	end
)
]]--




--[[

addEventHandler("onPlayerWasted", root,
	function()
				

		if exports['san_items']:hasItemS(source, 38) then 
			exports['san_items']:takePlayerItemToID(source, 38, 0)
			end
			if exports['san_items']:hasItemS(source, 32) then 
			exports['san_items']:takePlayerItemToID(source, 32, 0)
			end
			if exports['san_items']:hasItemS(source, 64) then 
			exports['san_items']:takePlayerItemToID(source, 64, 0)
			end
			if exports['san_items']:hasItemS(source, 84) then 
			exports['san_items']:takePlayerItemToID(source, 84, 0)
			end
			if exports['san_items']:hasItemS(source, 52) then 
			exports['san_items']:takePlayerItemToID(source, 52, 0)
			end
			if exports['san_items']:hasItemS(source, 125) then 
			exports['san_items']:takePlayerItemToID(source, 125, 0)
			end
			if exports['san_items']:hasItemS(source, 128) then 
			exports['san_items']:takePlayerItemToID(source, 128, 0)
			end
			if exports['san_items']:hasItemS(source, 45) then 
			exports['san_items']:takePlayerItemToID(source, 45, 0)
			end
			if exports['san_items']:hasItemS(source, 68) then 
			exports['san_items']:takePlayerItemToID(source, 68, 0)
			end
			if exports['san_items']:hasItemS(source, 36) then 
			exports['san_items']:takePlayerItemToID(source, 36, 0)
			end
			if exports['san_items']:hasItemS(source, 39) then 
			exports['san_items']:takePlayerItemToID(source, 39, 0)
			end
			if exports['san_items']:hasItemS(source, 103) then 
			exports['san_items']:takePlayerItemToID(source, 103, 0)
			end
			if exports['san_items']:hasItemS(source, 50) then 
			exports['san_items']:takePlayerItemToID(source, 50, 0)
			end
			if exports['san_items']:hasItemS(source, 49) then 
			exports['san_items']:takePlayerItemToID(source, 49, 0)
			end
			if exports['san_items']:hasItemS(source, 46) then 
			exports['san_items']:takePlayerItemToID(source, 46, 0)
			end
			if exports['san_items']:hasItemS(source, 51) then 
				exports['san_items']:takePlayerItemToID(source, 51, 0)
			end
			if exports['san_items']:hasItemS(source, 53) then 
					exports['san_items']:takePlayerItemToID(source, 53, 0)
			end
			if exports['san_items']:hasItemS(source, 44) then 
				exports['san_items']:takePlayerItemToID(source, 44, 0)
			end	

	end
)



]]



addEvent("Select:Lv", true)
addEventHandler("Select:Lv", root,
function (thePlayer)

					
	setPlayerVoiceIgnoreFrom ( thePlayer, thePlayer)

	local empty = exports.bgo_voice:getNextEmptyChannel() 
	exports.bgo_voice:setPlayerChannel(thePlayer, empty)  

	setElementData(thePlayer, 'PlayerCaido', false)
	setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - (math.floor(getElementData(thePlayer, "char:money")/2)))
	
	if exports['san_items']:hasItemS(thePlayer, 38) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 38, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 32) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 32, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 64) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 64, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 125) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 125, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 84) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 84, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 52) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 52, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 50) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 50, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 49) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 49, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 46) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 46, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 51) then 
			exports['san_items']:takePlayerItemToID(thePlayer, 51, 0)
			end
			if exports['san_items']:hasItemS(thePlayer, 53) then 
				exports['san_items']:takePlayerItemToID(thePlayer, 53, 0)
				end
				if exports['san_items']:hasItemS(thePlayer, 44) then 
					exports['san_items']:takePlayerItemToID(thePlayer, 44, 0)
					end		



     fadeCamera(thePlayer, false, 1, 0, 0, 0)
     setTimer(fadeCamera, 2000, 1, thePlayer, true, 1)
	 --setTimer(setElementPosition, 2000, 1, thePlayer, 1605.649, 1819.616, 10.828)
	 

	 setTimer(spawnPlayer, 2000, 1, thePlayer, 1605.649, 1819.616, 10.828, 0, getElementModel(thePlayer), 0, 0)

	--spawnPlayer(player, xn, yn, zn+1, 0, getElementModel(player), 0, 0)


	 setTimer(setCameraTarget, 2000, 1, thePlayer)
	 setTimer(setElementRotation, 2000, 1, thePlayer, -0, 0, 0.644)
end) 

addEvent("Select:Sf", true)
addEventHandler("Select:Sf", root,
function (thePlayer)
			
	setPlayerVoiceIgnoreFrom ( thePlayer, thePlayer)

	local empty = exports.bgo_voice:getNextEmptyChannel() 
	exports.bgo_voice:setPlayerChannel(thePlayer, empty)  

	setElementData(thePlayer, 'PlayerCaido', false)
	setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - (math.floor(getElementData(thePlayer, "char:money")/2)))
	
	if exports['san_items']:hasItemS(thePlayer, 38) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 38, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 32) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 32, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 64) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 64, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 125) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 125, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 84) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 84, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 52) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 52, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 50) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 50, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 49) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 49, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 46) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 46, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 51) then 
			exports['san_items']:takePlayerItemToID(thePlayer, 51, 0)
			end
			if exports['san_items']:hasItemS(thePlayer, 53) then 
				exports['san_items']:takePlayerItemToID(thePlayer, 53, 0)
				end
				if exports['san_items']:hasItemS(thePlayer, 44) then 
					exports['san_items']:takePlayerItemToID(thePlayer, 44, 0)
					end		

     fadeCamera(thePlayer, false, 1, 0, 0, 0)
     setTimer(fadeCamera, 2000, 1, thePlayer, true, 1)
	 --setTimer(setElementPosition, 2000, 1, thePlayer, -1978.581, 885.357, 45.203)
	 
	 setTimer(spawnPlayer, 2000, 1, thePlayer, -1978.581, 885.357, 45.203, 0, getElementModel(thePlayer), 0, 0)


	 setTimer(setCameraTarget, 2000, 1, thePlayer)
	 setTimer(setElementRotation, 2000, 1, thePlayer, -0, 0, 266.633)
end) 

addEvent("Select:Ls", true)
addEventHandler("Select:Ls", root,
function (thePlayer)

			
	setPlayerVoiceIgnoreFrom ( thePlayer, thePlayer)

	local empty = exports.bgo_voice:getNextEmptyChannel() 
	exports.bgo_voice:setPlayerChannel(thePlayer, empty)  

	setElementData(thePlayer, 'PlayerCaido', false)
	setElementData(thePlayer, "char:money", getElementData(thePlayer, "char:money") - (math.floor(getElementData(thePlayer, "char:money")/2)))
	
	if exports['san_items']:hasItemS(thePlayer, 38) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 38, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 32) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 32, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 64) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 64, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 125) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 125, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 84) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 84, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 52) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 52, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 50) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 50, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 49) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 49, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 46) then 
		exports['san_items']:takePlayerItemToID(thePlayer, 46, 0)
		end
		if exports['san_items']:hasItemS(thePlayer, 51) then 
			exports['san_items']:takePlayerItemToID(thePlayer, 51, 0)
			end
			if exports['san_items']:hasItemS(thePlayer, 53) then 
				exports['san_items']:takePlayerItemToID(thePlayer, 53, 0)
				end
				if exports['san_items']:hasItemS(thePlayer, 44) then 
					exports['san_items']:takePlayerItemToID(thePlayer, 44, 0)
					end			

     fadeCamera(thePlayer, false, 1, 0, 0, 0)
     setTimer(fadeCamera, 2000, 1, thePlayer, true, 1)
	 --setTimer(setElementPosition, 2000, 1, thePlayer, 1183.6442871094, -1329.2287597656, 13.9)
	 
	 setTimer(spawnPlayer, 2000, 1, thePlayer, 1183.6442871094, -1329.2287597656, 13.9, 0, getElementModel(thePlayer), 0, 0)


	 setTimer(setCameraTarget, 2000, 1, thePlayer)
	 setTimer(setElementRotation, 2000, 1, thePlayer, -0, 0, 266.633)
end) 