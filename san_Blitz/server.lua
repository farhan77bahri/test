local serverObject = {}
local maxBlitz = 1000

addEvent("createObjectToServer", true)
addEventHandler("createObjectToServer", root, function (player, objectID, x, y, z, rot)
	local id = 0
	for i = 1, maxBlitz do 
		if (serverObject[i] == nil) then 
			serverObject[i] = createObject(objectID, x, y, z-0.21, 0, 0, rot)
			setElementInterior ( serverObject[i], getElementInterior ( player ) )
			setElementDimension ( serverObject[i], getElementDimension ( player ) )
			setElementData(serverObject[i], "object:name", i)
			setElementData(serverObject[i], "object:create", getElementData(player, "char:name"))
			id = i
			break
		end
	end
	if not (id == 0) then
		outputChatBox("#E9D460[IRG- Blitz]#ffffff Você acaba de criar um objeto de blitz ID: #E9D460" .. id.. "#ffffff.", player, 0, 255, 0, true)
	else
		outputChatBox("#D24D57[IRG- Blitz]#ffffff Objeto com id desconhecido!.", player, 0, 255, 0, true)
	end
end)



function getNearbyBlitzs(thePlayer, commandName)

		if getElementData(thePlayer, "char:dutyfaction") >= 1 and getElementData(thePlayer, "char:dutyfaction") <= 15 or getElementData(thePlayer, "char:adminduty") == 1 then--getElementData(thePlayer, "acc:admin") >= 1




		local posX, posY, posZ = getElementPosition(thePlayer)
		outputChatBox(" ", thePlayer, 255, 126, 0)
		local found = false
		
		for i = 1, maxBlitz do
			if not (serverObject[i]==nil) then
				local x, y, z = getElementPosition(serverObject[i])
				local distance = getDistanceBetweenPoints3D(posX, posY, posZ, x, y, z)
				if (distance<=2) then
					outputChatBox("#E9D460[IRG- RBS]#ffffff Este objeto possui o ID: #E9D460 ".. i .."#ffffff.", thePlayer, 0, 255, 0, true)
					found = true
				end
			end
		end
		
		if not (found) then
			outputChatBox("#D24D57[IRG- RBS]#ffffff Não tem objetos para saber o ID.", thePlayer, 0, 255, 0, true)
		end
	end
end
addCommandHandler("nearbyrbs", getNearbyBlitzs, false, false)

function removeBlitz(thePlayer, commandName, id)

	if getElementData(thePlayer, "char:dutyfaction") >= 1 and getElementData(thePlayer, "char:dutyfaction") <= 15 or getElementData(thePlayer, "char:adminduty") == 1 then

		if not (id) then
			outputChatBox("#7cc576[IRG- Ajuda]: #ffffff/"..commandName.. " [ID do objeto]", thePlayer, 255, 255, 255, true)
		else
			id = tonumber(id)
			if (serverObject[id]==nil) then
				outputChatBox("#D24D57[IRG- RBS]:#ffffff Este objeto não possui este id - use /idb para saber o ID.", thePlayer, 0, 255, 0, true)
			else
				local object = serverObject[id]
				
				destroyElement(object)
				serverObject[id] = nil
				outputChatBox("#E9D460[IRG- RBS]:#ffffff você removeu o objeto ID: #E9D460 ".. id .."#ffffff.", thePlayer, 0, 255, 0, true)
			end
		end
	end
end
addCommandHandler("delrbs", removeBlitz, false, false)
addCommandHandler("delblitz", removeBlitz, false, false)

function removeAllBlitzs(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >= 1 then
		for i = 1, maxBlitz do
			if not (serverObject[i]==nil) then
				local object = serverObject[i]	
				destroyElement(object)
			end
		end
		serverObject = { }
		outputChatBox("#E9D460[IRG- RBS]#ffffff Você removeu todas as blitz do servidor!.", thePlayer, 0, 255, 0, true)
		outputAdminMessage("#ffffffFoi removido todas as blitz do servidor pelo admin: #7cc576" .. getElementData(thePlayer, "char:anick") or "" .. "#ffffff.")
	end
end
addCommandHandler("delrbsall", removeAllBlitzs, false, false)
addCommandHandler("delallBlitzs", removeAllBlitzs, false, false)

function outputAdminMessage(msg)
	for k,v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin")) >= 1 then
			outputChatBox("#D24D57[Admin Log RBS]: ".. msg,v,255,255,255,true)
		end
	end
end