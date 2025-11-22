----------- By Thunderking -----------
----------- Thunderking Always Is Here -----------
local paintballm = createMarker(2687.515625, -1687.8159179688, 8.4482593536377, "cylinder", 1.6 ,0 , 246, 255, 255)
--setElementInterior ( paintballm, 3 )
--setElementDimension ( paintballm, 1261 )


local paintball = nil --matchi vojood nadare
local pbEnter = nil --default
local pbgetgun = nil --guni entekhab nashode
local winner = {}

function panelepbbazkon( hitElement, matchingDimension )
	if getElementData(hitElement, "loggedin")  then
	triggerClientEvent("PaintBallRoBazKon", hitElement, hitElement)
	end
end
addEventHandler( "onMarkerHit", paintballm, panelepbbazkon )

function hudoff ()
	for _,p in ipairs (getElementsByType("player")) do
			setPlayerHudComponentVisible ( p, "radar", false )
	end
end
addEventHandler ( "onResourceStart", getRootElement(), hudoff )

function topaintballbegaraft()
	if getElementData(source, "inpaintball") == true then
		setPedAnimation(source, CRACK, crckdethl, 7000, true)
		fadeCamera(source, false, 1)
		setTimer(paintballspawn, 2000, 1, source)
		for i = 115, 116 do
			while exports['san_items']:takePlayerItemToID(root, i) do			
			end
		end		
	end
end
addEventHandler("onPlayerWasted", root, topaintballbegaraft)

function paintballspawn(thePlayer)
	if getElementData(thePlayer, "inpaintball") == true then
		fadeCamera(thePlayer, true, 1)
		local skin = getElementModel(thePlayer)
		spawnPlayer(thePlayer, 0, 0, 0)
		setElementModel(thePlayer,skin)	 		
		if pbgetgun == 24 then
			local gunid = 24
			local gunname = getWeaponNameFromID(gunid)
			local tir = 1000
			--exports.global:giveItem(thePlayer, 115, gunid..":"..gunname.."::")
			--exports.global:giveItem(thePlayer, 116, gunid..":"..tir..":Ammo for "..gunname)
		elseif pbgetgun == 31 then
			local gunid = 31
			local gunname = getWeaponNameFromID(gunid)
			local tir = 1000
			--exports.global:giveItem(thePlayer, 115, gunid..":"..gunname.."::")
			--exports.global:giveItem(thePlayer, 116, gunid..":"..tir..":Ammo for "..gunname)
		elseif pbgetgun == 33 then
			local gunid = 33
			local gunname = getWeaponNameFromID(gunid)
			local tir = 1000
			--exports.global:giveItem(thePlayer, 115, gunid..":"..gunname.."::")
			--exports.global:giveItem(thePlayer, 116, gunid..":"..tir..":Ammo for "..gunname)
			--exports['san_items']:giveItem(player, 4, 1, 1, 1, true)
		end
			if paintball == 1 then
				local spawn = math.random(1,8)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, 1733.966796875 ,-1644.375 ,20.230115890503)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, 1703.626953125 ,-1669.88671875 ,20.21875)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, 1720.322265625 ,-1672.53515625 ,27.205966949463)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, 1733.91796875 ,-1645.9658203125 ,27.237691879272)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, 1713.20703125 ,-1643.46484375 ,27.203363418579)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, 1710.2685546875 ,-1667.5703125 ,23.701574325562)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, 1725.4453125 ,-1640.435546875 ,23.70903968811)
					setElementInterior ( thePlayer, 18 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, 1733.703125 ,-1660.0546875 ,23.71771812439)
					setElementInterior ( thePlayer, 18)
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 2 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -731.6025390625 ,1553.6220703125 ,39.68741607666)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -736.326171875 ,1515.525390625 ,38.678886413574)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -884.052734375 ,1520.419921875 ,25.9140625)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -903.1484375 ,1586.0390625 ,28.304349899292)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -821.7841796875 ,1631.666015625 ,27.1171875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -822.0859375 ,1556.55078125 ,30.665143966675)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -809.7548828125 ,1477.181640625 ,26.018333435059)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -790.5498046875 ,1422.4384765625 ,13.9453125)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -723.1728515625 ,1431.916015625 ,18.4765625)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -777.4091796875 ,1556.6259765625 ,27.1171875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -739.408203125 ,1633.47265625 ,27.15140914917)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -858.234375 ,1547.5126953125 ,23.22846031189)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -875.21875 ,1641.654296875 ,26.995388031006)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -800.9580078125 ,1511.8486328125 ,21.66835975647)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -839.494140625 ,1408.5146484375 ,13.609375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 3 then
				local spawn = math.random(1,10)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -1668.5048828125 ,-2312.08984375 ,46.898502349854)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -1768.111328125 ,-2176.1025390625 ,66.970527648926)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -1537.361328125 ,-2131.6474609375 ,12.66272354126)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -1448.8564453125 ,-2210.1201171875 ,16.320384979248)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -1492.765625 ,-2154.9794921875 ,2.7282676696777)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -1618.2255859375 ,-2289.3828125 ,46.271259307861)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -1580.3115234375 ,-2256.029296875 ,18.831583023071)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -1685.03515625 ,-2292.7236328125 ,41.977180480957)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -1667.3125 ,-2121.0107421875 ,36.849578857422)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -1644.4912109375 ,-2295.9267578125 ,60.808563232422)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 4 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, -2371.6220703125 ,1551.27734375 ,2.1171875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, -2428.4228515625 ,1547.904296875 ,2.1171875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, -2384.47265625 ,1542.5185546875 ,10.828125)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, -2466.486328125 ,1537.2998046875 ,23.6640625)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, -2477.8818359375 ,1547.3662109375 ,23.6484375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, -2477.8818359375 ,1547.3662109375 ,23.6484375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, -2473.466796875 ,1551.99609375 ,33.234375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, -2311.849609375 ,1543.0810546875 ,18.7734375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, -2345.75 ,1548.41015625 ,26.046875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, -2377.7060546875 ,1551.5908203125 ,31.859375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, -2416.18359375 ,1542.7763671875 ,31.859375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, -2455.390625 ,1556.572265625 ,28.953125)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, -2389.193359375 ,1548.96484375 ,26.046875)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, -2443.314453125 ,1530.427734375 ,20.234375)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, -2367.15625 ,1533.541015625 ,17.328125)
					setElementInterior ( thePlayer, 0 )
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 5 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, 2572.4248046875 ,-1284.6162109375 ,1031.421875)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, 2540.25390625 ,-1283.55859375 ,1031.421875)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, 2553.537109375 ,-1303.203125 ,1031.421875	)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, 2570.44140625 ,-1284.4521484375 ,1037.7734375)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, 2580.3818359375 ,-1289.9560546875 ,1044.125)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, 2564.9501953125 ,-1301.7783203125 ,1044.125)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, 2537.3916015625 ,-1281.515625 ,1044.125)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, 2565.6025390625 ,-1305.810546875 ,1048.2890625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, 2525.0859375 ,-1282.583984375 ,1048.2890625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, 2519.900390625 ,-1287.2333984375 ,1054.640625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, 2531.26953125 ,-1304.4091796875 ,1054.640625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, 2561.666015625 ,-1303.6611328125 ,1054.640625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, 2574.2119140625 ,-1284.427734375 ,1054.640625)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, 2580.6259765625 ,-1284.1357421875 ,1065.3582763672)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, 2551.380859375 ,-1295.236328125 ,1060.984375)
					setElementInterior ( thePlayer, 2 )
					setElementDimension ( thePlayer, 2 )
				end
			elseif paintball == 6 then
				local spawn = math.random(1,15)
				if tonumber(spawn) == 1 then
					setElementPosition (thePlayer, 2227.02734375 ,-1149.375 ,1025.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 2 then
					setElementPosition (thePlayer, 2227.58203125 ,-1153.7294921875 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 3 then
					setElementPosition (thePlayer, 2246.80859375 ,-1161.7021484375 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 4 then
					setElementPosition (thePlayer, 2229.546875 ,-1173.5634765625 ,1030.4410400391)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 5 then
					setElementPosition (thePlayer, 2245.080078125 ,-1191.201171875 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 6 then
					setElementPosition (thePlayer, 2240.830078125 ,-1192.587890625 ,1033.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 7 then
					setElementPosition (thePlayer, 2230.85546875 ,-1178.4189453125 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 8 then
					setElementPosition (thePlayer, 2203.0927734375 ,-1196.310546875 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 9 then
					setElementPosition (thePlayer, 2187.7021484375 ,-1184.6748046875 ,1029.796875)
					setElementInterior ( thePlayer, 15)
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 10 then
					setElementPosition (thePlayer, 2186.591796875 ,-1181.6669921875 ,1033.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 11 then
					setElementPosition (thePlayer, 2202.5458984375 ,-1170.6884765625 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 12 then
					setElementPosition (thePlayer, 2186.212890625 ,-1153.037109375 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 13 then
					setElementPosition (thePlayer, 2196.4931640625 ,-1141.3330078125 ,1029.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 14 then
					setElementPosition (thePlayer, 2196.515625 ,-1146.6591796875 ,1033.796875)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				elseif tonumber(spawn) == 15 then
					setElementPosition (thePlayer, 2202.66796875 ,-1163.2470703125 ,1030.3966064453)
					setElementInterior ( thePlayer, 15 )
					setElementDimension ( thePlayer, 2 )
				end
			else
				setElementPosition (thePlayer, 824.3408203125 ,3.3056640625 ,1004.1796875)
				setElementInterior ( thePlayer, 3 )
				setElementDimension (thePlayer, 1261 )
			end
	end
end

--[[function killpaintball ( ammo, attacker, weapon, bodypart )
	if bodypart == 9 then
		outputChatBox("headkhord", source)
	end
	if getElementData(source, "inpaintball") == true then
		if ( attacker ) then
			local score = getElementData(attacker,"paintscore")
			setElementData(attacker,"paintscore",tonumber(score)+1)
			setElementData(source,"paintballkills",0)
			local killesh = getElementData(attacker,"paintballkills")
			setElementData(attacker,"paintballkills",tonumber(killesh)+1)
			if bodypart == 9 then
				local score = getElementData(attacker,"paintscore")
				setElementData(attacker,"paintscore",tonumber(score)+1)
				setElementData(source,"paintballkills",0)
				local killesh = getElementData(attacker,"paintballkills")
				setElementData(attacker,"paintballkills",tonumber(killesh)+1)
			end			
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), killpaintball )]]

function joinButtonClicked(root)
	local money = getElementData(root, "char:money")
	if paintball ~= nil then
		if money < 10000 then
			exports.san_infobox:addNotification(root, "Shoma 10K braye Join Paintball Nadarid Nadarid", "error" )
			return
		end		
		if	pbEnter == true then
			setElementData(root, "inpaintball", true,false)
			setElementData(root,"paintscore",0)
			--setElementData(root, "char:money", getElementData(root, "char:money") + 10000)
			setElementData(root, "char:money", getElementData(root, "char:money") + 10000)
			for i = 115, 116 do
				while exports['san_items']:takePlayerItemToID(root, i)do
				
				end
			end	
			paintballspawn(root)
			setElementFrozen(root, true)			
			toggleAllControls ( root, false, true, false)
			exports.san_infobox:addNotification(root, "Shoma Be In Match Join Shodid Ta Shoroe Match Sabor Bashi!" , "success" )
			setElementData(root, "paintballkills", 0, false)		
		else
			exports.san_infobox:addNotification(root, "In Match Baste Shode Va Emkane Join Nist!", "error")
		end
	else
		exports.san_infobox:addNotification(root, "Darhale Hazer Matchi Sakhte Nashode Ast!", "error" )
	end
end
addEvent("onClientClickedJoin",true)
addEventHandler("onClientClickedJoin", root,joinButtonClicked)

function sefrkon ( )
	for _,p in ipairs (getElementsByType("player")) do
		--if getElementData(p, "loggedIn") == true then	
			setElementData(p, "paintscore", nil)
		--end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), sefrkon )

function createButtonClicked(root)
	local money = getElementData(root, "char:money")
	if paintball == nil then
		if money < 10000 then
			exports.san_infobox:addNotification(root, "Shoma 10K braye Sakhte Paintball Nadarid Nadarid", "error" )
			return
		end	
		if getElementData(root, "pbMap") > 0 then
			if getElementData(root, "pbGunSet") > 0 then	
				setElementData(root, "inpaintball", true, false)
				paintball = tonumber(getElementData(root, "pbMap"))
				pbgetgun = tonumber(getElementData(root, "pbGunSet"))
				setElementData(root, "char:money", getElementData(root, "char:money") + 10000)
				pbEnter = true
				for i = 115, 116 do
					while exports['san_items']:takePlayerItemToID(root, i)do
					end
				end	
				paintballspawn(root)
				setElementFrozen(root, true)
				exports.san_infobox:addNotification(root, "Shoma Ba Movafaqiat Create Match Kardid!", "success" )
				setElementData(root, "pbMap", nil)
				setElementData(root, "pbGunSet", nil)
				setElementData(root, "paintballkills", 0, false)
				setElementData(root,"paintscore",0)
				toggleAllControls ( root, false, true, false)
				triggerClientEvent("pbForceClose", root, root)
				setTimer(
				function ()
					for _,p in ipairs (getElementsByType("player")) do		
						if getElementData(p, "inpaintball") == true then													
							exports.san_infobox:addNotification(p, "Match PaintBall Shoro Shod!", "success" )
							setElementFrozen(p, false)
							toggleAllControls ( p, true )	
						end
					end
					pbEnter = nil
					setTimer(
						function ()
							--[[winnersname = nil
							winnerscore = 0
							pbmoney = 0
							for k, player in ipairs(getElementsByType("player")) do
								if getElementData(player, "inpaintball") == true then
									--local name = getPlayerFromName(player)
									local score = getElementData(player,"paintscore")
									outputChatBox(" Scores :"..score, root)
								end
							end]]
							for _,p in ipairs (getElementsByType("player")) do
								if getElementData(p, "inpaintball") == true then
									setElementData(p, "inpaintball", nil, false)
									setElementData(p, "paintballkills", nil, false)
									setElementData(p, "paintscore", 0)
									setElementPosition (p, 824.3408203125 ,3.3056640625 ,1004.1796875)
									setElementInterior ( p, 3 )
									setElementDimension ( p, 63 )
									for i = 115, 116 do
										while exports['san_items']:takeItem(p, i) do
										end
									end												
									setPedHeadless(p, false)
									--exports.san_infobox:addNotification(p, "Winner In Match "..winnersname.." Ba Tedad "..winnerscore.." Kill Ast!", "info")
									--if getPlayerName(p) == winnersname then
									--	exports.global:giveMoney(p, pbmoney)
									--end
								end
							end
							paintball = nil
							pbgetgun = nil
							pbEnter = nil
					end, 600000, 1)
				end, 30000, 1)
			else
				exports.san_infobox:addNotification(root, "Lotfan Gun Ra Moshakhas Konid!" , "error")
			end
		else
			exports.san_infobox:addNotification(root, "Lotfan Map Ra Moshakhas Konid!" , "error")
		end	
	else
		exports.san_infobox:addNotification(root, "Darhal Hazer Yek Match Vojood Darad!" , "error")
	end
end
addEvent("onClientClickedCreate",true)
addEventHandler("onClientClickedCreate", root,createButtonClicked)

--[[
rootElement = getRootElement()
local seriallist = {
["970CD3F7B16A81312BF86EEC0EB72DE4"] = true, 
}

addCommandHandler("aae",
function (thePlayer)
local theSerial = getPlayerSerial( thePlayer )
	if seriallist[theSerial] then
		triggerClientEvent(thePlayer,"show_editor",thePlayer)
	else 
		outputChatBox("",thePlayer,255,0,0)
	end
end)

function getScriptEnd(file)
  local tmp, endPos = fileGetPos(file)
  while not fileIsEOF(file) do    
  fileRead(file, 500)                      
  end
  endPos = fileGetPos(file)
  fileSetPos(file, tmp)
  return endPos
end

function getResNameFromPath(path)
  if (type(path) ~= "string") then return "" end
  local sep1, sep = path:find("\\") or 0
  local sep2 = path:find("/") or 0
  if (sep1 > sep2) then sep = sep1 else sep = sep2 end
  if (sep == 0) then return path end
  return path:sub(1, sep-1), path:sub(sep+1, path:len())
end

function reload_script(client, path)
    triggerClientEvent(client, "return_message", client, "Warning: Script reloaded!", 255, 140, 0)
    local file = fileOpen(":"..path, true)
	if (file) then
	local text = fileRead(file, getScriptEnd(file))
	triggerClientEvent(client, "return_script_open", client, text)
    fileClose(file)
	end
end
addEvent("reload_script", true)
addEventHandler("reload_script", rootElement, reload_script)
 
function save_script(client, path, text)
  local resName = getResNameFromPath(path)
  local file = fileCreate(":"..path, resName)
  if (file) then
    fileWrite(file, text)
	fileClose(file)
    triggerClientEvent(client, "return_message", client, "Information: Script Saved!", 0, 255, 0)  	
  if (resName) and get("restart_resource") == "true" then restartResource(getResourceFromName(resName)) end
  else
    triggerClientEvent(client, "return_message", client, "Error: Couldn't save the script!", 255, 0, 0)
  end
end
addEvent("save_script", true)
addEventHandler("save_script", rootElement, save_script)
 
function open_script(client, path)
  triggerClientEvent(client, "return_message", client, "Information: Script is loading...", 0, 255, 0)
  local file = fileOpen(":"..path, true)
  if (file) then
    local text = fileRead(file, getScriptEnd(file))
    triggerClientEvent(client, "return_message", client, "Information: Script loaded!", 0, 255, 0)
	triggerClientEvent(client, "return_script_open", client, text)
    fileClose(file)
  else
    triggerClientEvent(client, "return_message", client, "Error: Script couldn't be loaded!", 255, 0, 0)
  end    
end
addEvent("open_script", true) 
addEventHandler("open_script", rootElement, open_script)

function getAllResources(client)
	local resources = getResources()
	for i,v in ipairs(resources) do
		local name = getResourceName(v)
		triggerClientEvent(client,"return_resources",client,name)
	end
end
addEvent("get_resources", true) 
addEventHandler("get_resources", rootElement, getAllResources)

function getResourceContent(client,resName)
	if getResourceFromName(resName) then
		local file = xmlLoadFile(":"..resName.."/meta.xml")
		local child = xmlNodeGetChildren(file)
		for i,v in ipairs(child) do
			if xmlNodeGetName(v) == "script" then
			local src = xmlNodeGetAttribute(v,"src")
			triggerClientEvent(client,"return_content",client,src)
			end
		end
		xmlUnloadFile(file)
	end
end
addEvent("get_content", true) 
addEventHandler("get_content", rootElement, getResourceContent)

function open_script_browser(client, resName, scriptName)
  triggerClientEvent(client, "return_message", client, "Information: Script is loading...", 0, 255, 0)
  local file = fileOpen(":"..resName.."/"..scriptName,true)
  if (file) then
    local text = fileRead(file, getScriptEnd(file))
    triggerClientEvent(client, "return_message", client, "Information: Script loaded!", 0, 255, 0)
	triggerClientEvent(client, "return_script_open", client, text)
    fileClose(file)
	outputDebugString(getPlayerName(client) .." opened resource ".. resName .." and script ".. scriptName .."!")
  else
    triggerClientEvent(client, "return_message", client, "Error: Script couldn't be loaded!", 255, 0, 0)
  end    
end
addEvent("open_script_browser", true) 
addEventHandler("open_script_browser", rootElement, open_script_browser)

function create_resource(client,resourceName,name,author,description,version,type,clientSide,serverSide)
if not getResourceFromName(tostring(resourceName)) then
local resource = createResource ( tostring(resourceName) )
if ( resource ) then
outputChatBox("Resource ".. tostring(resourceName) .." created!",client,0,255,0)
setResourceInfo ( resource, "name", tostring(name) )
setResourceInfo ( resource, "author", tostring(author) )
setResourceInfo ( resource, "description", tostring(description) )
setResourceInfo ( resource, "version", tostring(version) )
setResourceInfo ( resource, "type", tostring(type) )
if clientSide == "" then
clientSide = "client"
end
if serverSide == "" then
serverSide = "server"
end
local meta = xmlLoadFile( ":"..getResourceName(resource).."/meta.xml" )
if meta then
local client_root = xmlCreateChild (meta,"script")
local server_root = xmlCreateChild (meta,"script")
xmlNodeSetAttribute(client_root, "src", tostring(clientSide) .. ".lua")
xmlNodeSetAttribute(client_root, "type", "client")
xmlNodeSetAttribute(server_root, "src", tostring(serverSide) .. ".lua")
xmlNodeSetAttribute(server_root, "type", "server")
xmlSaveFile(meta)
xmlUnloadFile(meta)
file_client = fileCreate(":".. getResourceName(resource) .."/"..tostring(clientSide)..".lua", resName)
file_server = fileCreate(":".. getResourceName(resource) .."/"..tostring(serverSide)..".lua", resName)
fileClose(file_client)
fileClose(file_server)
end
end
end
end
addEvent("create_resource", true) 
addEventHandler("create_resource", rootElement, create_resource)

-------------------------------------------------------------------------------------------------


function restartSingleResource(thePlayer, commandName, resourceName)
local theSerial = getPlayerSerial( thePlayer )
	if seriallist[theSerial] then
		if not (resourceName) then
			outputChatBox("SYNTAX: /restartres [Resource Name]", thePlayer, 255, 194, 14)
		else
			local theResource = getResourceFromName(tostring(resourceName))
			local username = getElementData(thePlayer, "account:username")
			if (theResource) then
				setTimer(function ()
					if getResourceState(theResource) == "running" then
						restartResource(theResource)
						outputChatBox("Resource " .. resourceName .. " was restarted.", thePlayer, 0, 255, 0)
					elseif getResourceState(theResource) == "loaded" then
						startResource(theResource, true)
						outputChatBox("Resource " .. resourceName .. " was started.", thePlayer, 0, 255, 0)
					elseif getResourceState(theResource) == "failed to load" then
						outputChatBox("Resource " .. resourceName .. " could not be loaded (" .. getResourceLoadFailureReason(theResource) .. ")", thePlayer, 255, 0, 0)
					else
						outputChatBox("Resource " .. resourceName .. " could not be started (" .. getResourceState(theResource) .. ")", thePlayer, 255, 0, 0)
					end
				end, delayTime, 1)
			else
				outputChatBox("Resource not found.", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("srestart", restartSingleResource)

function stopSingleResource(thePlayer, commandName, resourceName)
local theSerial = getPlayerSerial( thePlayer )
	if seriallist[theSerial] then
		if not (resourceName) then
			outputChatBox("SYNTAX: /stopres [Resource Name]", thePlayer, 255, 194, 14)
		else
			local theResource = getResourceFromName(tostring(resourceName))
			if (theResource) then
				if stopResource(theResource) then
					outputChatBox("Resource " .. resourceName .. " was stopped.", thePlayer, 0, 255, 0)
				else
					outputChatBox("Couldn't stop Resource " .. resourceName .. ".", thePlayer, 255, 0, 0)
				end
			else
				outputChatBox("Resource not found.", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("sstop", stopSingleResource)

function startSingleResource(thePlayer, commandName, resourceName)
local theSerial = getPlayerSerial( thePlayer )
	if seriallist[theSerial] then
		if not (resourceName) then
			outputChatBox("SYNTAX: /startres [Resource Name]", thePlayer, 255, 194, 14)
		else
			local theResource = getResourceFromName(tostring(resourceName))
			if (theResource) then
				if getResourceState(theResource) == "running" then
					outputChatBox("Resource " .. resourceName .. " is already started.", thePlayer, 0, 255, 0)
				elseif getResourceState(theResource) == "loaded" then
					startResource(theResource, true)
					outputChatBox("Resource " .. resourceName .. " was started.", thePlayer, 0, 255, 0)
				elseif getResourceState(theResource) == "failed to load" then
					outputChatBox("Resource " .. resourceName .. " could not be loaded (" .. getResourceLoadFailureReason(theResource) .. ")", thePlayer, 255, 0, 0)
				else
					outputChatBox("Resource " .. resourceName .. " could not be started (" .. getResourceState(theResource) .. ")", thePlayer, 255, 0, 0)
				end
			else
				outputChatBox("Resource not found.", thePlayer, 255, 0, 0)
			end
		end
	end
end
addCommandHandler("sstart", startSingleResource)]]
----------- By Thunderking -----------
----------- Thunderking Always Is Here -----------