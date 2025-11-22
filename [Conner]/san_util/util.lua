----------------------------------------->>
-- GTI: Grand Theft International Network
-- Date: 15 Dec 2013
-- Resource: GTIutil/util.lua
-- Type: Client Side
-- Author: JT Pennington (JTPenn)
----------------------------------------->>

-- Find Player
--------------->>



function findPlayer(player)
    if (player and type(player) == "string") then
        local playerElement = getPlayerFromName(player)
        if (playerElement) then return playerElement end
        local playersCounted = 0
        local player = string.lower(player)
        local spl = split(player, string.byte("["))
        if (spl) then
            player = table.concat(spl, ";")
        end
        for k, v in pairs(getElementsByType("player")) do
            local name = string.lower(getPlayerName(v))
            local spl = split(name, string.byte("["))
            if (spl) then
                name = table.concat(spl, ";")
            end
            if (string.find(name, player)) then
                playerElement = v
                playersCounted = playersCounted + 1
            end
        end
        if (playerElement and playersCounted == 1) then
            return playerElement
        end
        return false
    else
        return false
    end
end

-- Find Rotation
----------------->>

function findRotation(x1,y1,x2,y2)
	local t = -math.deg(math.atan2(x2-x1,y2-y1))
	if t < 0 then t = t + 360 end
	return t
end

-- Generate Password
--------------------->>

local alphabet = {
	"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",
	"a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z", -- Index: 52
	"1", "2", "3", "4", "5", "6", "7", "8", "9", "0", -- Index: 62
	"~", "`", "!", "@", "#", "$", "%", "^", "&", "*", "(", ")", "-", "_", "=", "+", "[", "{", "]", "}", "\\", "|", ":", ";", "'", "\"",
	",", "<", ".", ">", "/", "?", -- Index: 94
}

function generatePassword(length, numbers, symbols)
	if (type(length) ~= "number") then return false end
	
	local password = {}
	for i=1,length do
		-- Pick a character
		local range = math.random(52)
		if (numbers and not symbols) then range = math.random(62) end
		if (numbers and symbols) then range = math.random(94) end
		if (not numbers and symbols) then 
			local letter_or_symbol = math.random()
			if (letter_or_symbol < (52 / (52+34))) then
				range = math.random(52)
			else
				range = math.random(63,94)
			end
		end
		
		table.insert(password, alphabet[range])
	end
	password = table.concat(password, "")
	return password
end	

-- Get Distance Between Elements
--------------------------------->>

function getDistanceBetweenElements2D(element1, element2)
	if (not isElement(element1) or not isElement(element2)) then return false end
	local x1,y1,z1 = getElementPosition(element1)
	local x2,y2,z2 = getElementPosition(element2)
	return getDistanceBetweenPoints2D(x1, y1, x2, y2)
end

function getDistanceBetweenElements3D(element1, element2)
	if (not isElement(element1) or not isElement(element2)) then return false end
	local x1,y1,z1 = getElementPosition(element1)
	local x2,y2,z2 = getElementPosition(element2)
	return getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2)
end

-- Get Element Speed
--------------------->>

function getElementSpeed(element, unit)
	if (not isElement(element)) then return false end
	if (not unit) then unit = "mph" end
	local x,y,z = getElementVelocity(element)
	if (unit == "mph") then
		return (x^2 + y^2 + z^2) ^ 0.5 * 111.847
	else
		return (x^2 + y^2 + z^2) ^ 0.5 * 180
	end
end

-- Random Names
---------------->>

local randomNamesList = {
	"Lucia Tate", "Allen Edwards", "Joe Phillips", "John Frank", "Mario Erickson", "Leland Mann", "Kirk Wells", "Lila Mason", "Ruby Mendoza",
	"Alberta Mills", "Erika Diaz", "Janis Allen", "Paulette Gibbs", "Lillie Vargas", "Eunice Blake", "Rafael Figueroa", "Amy Bryan",
	"Stewart Holt", "Margie Hawkins", "Larry Holloway", "Florence Turner", "Christian Watkins", "Marjorie Thomas", "Joy Patton",
	"Janet Ruiz", "Jessie Bell", "Aubrey Boyd", "Brendan Roberts", "Eleanor Gregory", "Kellie Spencer", "Judy Shelton", "Lynda Ingram",
	"Deborah Singleton", "Robyn Lawson", "Josefina Brewer", "Olive Stevens", "Verna Beck", "Antoinette Todd", "Sheldon Cortez",
	"Lowell Glover", "Gerald Romero", "Jane Strickland", "Rodney Henry", "Shane Lewis", "Alfred Barnes", "Kurt Bates", "Rudy Hunter",
	"Javier Payne", "Kristine Mendez", "Ron Hayes", "Ralph Scott", "Jesse Morris", "James Ross", "Lawrence Murphy", "Larry Parker",
	"Roger Green", "Patrick Hernandez", "Diana Jenkins", "Henry Kelly", "Julia Turner", "Nicholas Jones", "Beverly Williams",
	"Jean Gonzalez", "Evelyn Long", "Jimmy Stewart", "Andrew Simmons", "Jeffrey Bennett", "Cheryl Henderson", "Martin Rivera",
	"Brian Johnson", "Gloria Taylor", "Christina Garcia", "Wanda Russell", "Carol Anderson", "Sandra Smith", "Rebecca Brown", "Jane Young",
	"Laura Campbell", "Kathryn Gonzales", "Peter Washington", "Deborah Clark", "Victor Wood", "Raymond Roberts", "Phyllis Hill",
	"Andrea Torres", "Howard Jackson", "Mildred Cox", "Margaret Walker", "Louise Thompson", "Roy Miller", "Juan Adams", "Philip Howard",
	"Lillian Rogers", "Albert Wilson", "Angela Perry", "Ruby Griffin", "Marilyn Diaz", "Irene Harris", "Bobby Perez", "Mark Bryant",
	"Denise Price", "Kathleen Bell", "Samuel James", "Arthur Edwards", "Frank Alexander", "Phillip Cook", "Jacqueline Evans",
	"Melissa Martin", "Alice Robinson", "Gerald Butler", "Janet Brooks", "Heather Thomas", "Eric Watson", "Billy Patterson",
	"Steven Mitchell", "Joshua Wright", "Dennis Bailey", "Adam Baker", "Kevin Nelson", "Steve Powell", "Willie Lee", "Jack Allen",
	"Kimberly Coleman", "Susan Phillips", "Christine Hall", "Wayne Hughes", "Thomas Gray", "Ashley Sanders", "Stephen Rodriguez",
	"Janice Richardson", "Debra King", "Joyce Davis", "Kelly Martinez", "Craig Morgan", "Daniel Lopez", "Joan Cooper", "Gary Moore",
	"Sara Sanchez", "Joseph White", "Annie Ward", "Martha Flores", "Johnny Carter", "Norma Collins", "Eugene Foster", "Carl Reed",
	"Donna Peterson", "Paul Ramirez", "Diane Barnes", "Earl Lewis", "Dianne Feinstein", "Barbara Boxer", "Harry Reid", "Dean Heller",
}

function getGenericName()
	return randomNamesList[math.random(#randomNamesList)]
end

-- Month Number to Text
------------------------>>

local monthTable = {"January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"}
function getMonthName(month, digits)
	if (not monthTable[month]) then return end
	local month = monthTable[month]
	if (digits) then
		month = string.sub(month, 1, digits)
	end
	return month
end

-- Get Ped Weapons
------------------->>

function getPedWeapons(ped)
	local playerWeapons = {}
	if ped and isElement(ped) and getElementType(ped) == "ped" or getElementType(ped) == "player" then
		for i=0,12 do
			local wep = getPedWeapon(ped,i)
			if wep and wep ~= 0 then
				table.insert(playerWeapons,wep)
			end
		end
	else
		return false
	end
	return playerWeapons
end

-- Team
-------->>

function isPlayerInTeam(player, teamName)
	if (not isElement(player) or getElementType(player) ~= "player") then return false end
	local team = getPlayerTeam(player)
	if (not team) then return false end
	local team = getTeamName(team)
	if (team ~= teamName) then return false end
	return true
end

-- Get Players In Dimension
---------------------------->>

function getPlayersInDimension(dim)
	local dim = tonumber(dim)
	local dimTable = {}
	for i, players in pairs (getElementsByType("player")) do
		local dimension = getElementDimension(players)
		if dimension == dim then
			table.insert(dimTable, players)
			return dimTable
		else
			return false
		end
		local dimTable = {}
	end
end

-- RGB to Hex
-------------->>

function RGBToHex(red, green, blue, alpha)
	if((red < 0 or red > 255 or green < 0 or green > 255 or blue < 0 or blue > 255) or (alpha and (alpha < 0 or alpha > 255))) then
		return nil
	end
	if(alpha) then
		return string.format("#%.2X%.2X%.2X%.2X", red,green,blue,alpha)
	else
		return string.format("#%.2X%.2X%.2X", red,green,blue)
	end
end

-- tocomma
----------->>

function tocomma(number)
	while true do
		number, k = string.gsub(number, "^(-?%d+)(%d%d%d)", '%1,%2')
		if (k==0) then
			break
		end
	end
	return number
end

-- To Date
----------->>

function todate(timestamp)
	local year = math.floor(timestamp/31557600)+1970
	local isLeapYear = false
	if ((year % 4 == 0 and year % 100 ~= 0) or (year % 400 == 0)) then
		isLeapYear = true
	end

	local daysLeft = math.floor((timestamp-((year-1970)*31557600))/86400)+1
	local month = 1
	if (daysLeft <= 31) then
		month = 1
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if ((daysLeft <= 28) or (isLeapYear and daysLeft <= 29)) then
		month = 2
		return daysLeft, month, year
	end
	if (not isLeapYear) then
		daysLeft = daysLeft - 28 else daysLeft = daysLeft - 29 end
	if (daysLeft <= 31) then
		month = 3
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 4
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 5
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 6
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 7
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 31) then
		month = 8
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 9
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	if (daysLeft <= 31) then
		month = 10
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 31
	if (daysLeft <= 30) then
		month = 11
		return daysLeft, month, year
	end
	daysLeft = daysLeft - 30
	month = 12
	if (daysLeft > 31) then daysLeft = 31 end
	return daysLeft, month, year
end

-- To Time
----------->>

function totime(timestamp)
	local timestamp = timestamp - (math.floor(timestamp/86400) * 86400)
	local hours = math.floor(timestamp/3600)
	timestamp = timestamp - (math.floor(timestamp/3600) * 3600)
	local mins = math.floor(timestamp/60)
	local secs = timestamp - (math.floor(timestamp/60) * 60)
	return hours, mins, secs
end

-- Converting a Absolute Screen Value to Relative
function aToR( X, Y, sX, sY)
	local sW, sH = guiGetScreenSize()
	local xd = X/resX or X
	local yd = Y/resY or Y
	local xsd = sX/resX or sX
	local ysd = sY/resY or sY
	return xd*sW, yd*sH, xsd*sW, ysd*sH
end

--Set player a ghost!
function setPlayerGhost(player,state)
	if (not player or not (isElement(player)) or not (getElementType(player) == "player")) then return false end
	if (not type(state) == "boolean") then return false end
	
	if state then
		setElementAlpha(player,100)
	else
		setElementAlpha(player,255)
	end
	
	for k,v in ipairs(getElementsByType("player")) do
		setElementCollidableWith(player,v,not state)
	end
end
addEvent("GTIutil:setPlayerGhost",true)
addEventHandler("GTIutil:setPlayerGhost",root,setPlayerGhost)















































function convertSecsToTime2(seconds)
		local hours = 0
		local minutes = 0
		local secs = 0
		local theseconds = seconds
		if theseconds >= 60*60 then
			hours = math.floor(theseconds / (60*60))
			theseconds = theseconds - ((60*60)*hours)
		end
		if theseconds >= 60 then
			minutes = math.floor(theseconds / (60))
			theseconds = theseconds - ((60)*minutes)
		end
		if theseconds >= 1 then
			secs = theseconds
		end
		if minutes < 10 then
		minutes = "0"..minutes
		end
		if secs < 10 then
		secs = "0"..secs
		end
	return minutes,secs
end




function findRotation2(x1,y1,z1,x2,y2,z2)
  local t = -math.deg(math.atan2(x2-x1,y2-y1))
  if t < 0 then t = t + 360 end
  local roty = 90+(math.deg(math.asin((z2 - z1) / getDistanceBetweenPoints3D(x1, y1, z1, x2, y2, z2))))
  return roty,t-90
end





function unmark(player)
cancelRender()
end
addEvent("unmark",true)
addEventHandler("unmark",root,unmark)



function markPlayer(x, y, z)
		lx,ly,lz = x, y, z
		if lx and ly and not isElement(Arrow) then
			playert = playe
			Bliploc = createBlip(lx,ly,lz,41)
			local rx,ry,rz = getElementPosition(localPlayer)
			Arrow = createObject(1318,rx,ry,rz)
			setElementCollisionsEnabled(Arrow,false)
			addEventHandler("onClientPreRender", getRootElement(), ArrowRender)
			if not isTimer(ETATimer) then
				ETATimer = setTimer(ETA,750,0)
			end
		end
end
addEvent("markPlayer",true)
addEventHandler("markPlayer",root,markPlayer)


function cancelRender()
	if isElement(Bliploc) then destroyElement(Bliploc) end
	if isElement(Arrow) then destroyElement(Arrow) end
end
addCommandHandler("pg",cancelRender)

function gpspos(cmd, x,y,z)
	if isNumber(x) and isNumber(x) and isNumber(z) then 
		markPlayer(x,y,z)
	end
end
addCommandHandler("gps",gpspos)



function ArrowRender()
	if playert then
		if not isElement(playert) then cancelRender() return end
		lx,ly,lz = getElementPosition(playert)
	end
	if getPedOccupiedVehicle(localPlayer) then

	if (getElementModel(getPedOccupiedVehicle(localPlayer)) == 408) then
		tx,ty,tz = getElementPosition(getPedOccupiedVehicle(localPlayer))
		local roty,rotz = findRotation2(tx,ty,tz,lx,ly,lz)
		setElementPosition(Arrow, tx, ty, tz+2.5)
		setElementRotation(Arrow, 0, roty, rotz)
		else
		tx,ty,tz = getElementPosition(getPedOccupiedVehicle(localPlayer))
		local roty,rotz = findRotation2(tx,ty,tz,lx,ly,lz)
		setElementPosition(Arrow, tx, ty, tz+1.5)
		setElementRotation(Arrow, 0, roty, rotz)
	end
	else
		tx,ty,tz = getElementPosition(localPlayer)
		local roty,rotz = findRotation2(tx,ty,tz,lx,ly,lz)
		setElementPosition(Arrow, tx, ty, tz+1.15)
		setElementRotation(Arrow, 0, roty, rotz)
	end
		if getDistanceBetweenPoints3D(tx,ty,tz,lx,ly,lz) < 5 then 
		cancelRender()
		--exports.san_hud:dm("You've arrived at your destination!", 255, 255, 0)
	end
end

function cancelRender()
	removeEventHandler("onClientPreRender", getRootElement(), ArrowRender)
	if isTimer(ETATimer) then
	killTimer(ETATimer,750,0)
	exports.san_hud:drawStat("Tempo de chegada", "", "", 255, 200, 0)
	end
	if isElement(Bliploc) then destroyElement(Bliploc) end
	if isElement(Arrow) then destroyElement(Arrow) end
	Bliploc = nil
	lx,ly,lz = nil
	end

function ETA()
	if getPedOccupiedVehicle(localPlayer) then
		speedx, speedy, speedz = getElementVelocity ( getPedOccupiedVehicle(localPlayer) )
	else
		speedx, speedy, speedz = getElementVelocity ( localPlayer )
end
	local actualspeed = (speedx^2 + speedy^2 + speedz^2)^(0.5) 
	local kmh = actualspeed * 180
	local rx,ry,rz = getElementPosition(localPlayer)
	local dist = (getDistanceBetweenPoints3D(rx,ry,rz,lx,ly,lz)/1000)
	local seconds = tonumber(math.floor((dist/kmh)*60*60))
	local mins,secds = convertSecsToTime2(seconds)
	if mins == "00" and secds == "00" then
		exports.san_hud:drawStat("Tempo de chegada", "Tempo de chegada", "N/A", 255, 200, 0)
	else
		exports.san_hud:drawStat("Tempo de chegada", "Tempo de chegada", mins..":"..secds, 255, 200, 0)
	end
end



local camera = true
addEventHandler ("onClientPlayerWeaponFire", root, 
   function (weapon, endX, endY, endZ, hitElement, startX, startY, startZ)
	if weapon == 33 or weapon == 34 then return end
	    if weapon == 24  then
	        if camera == true then
	  
	        setPedCameraRotation(source, 0.6 - getPedCameraRotation(source))
	        camera = false
	        else
	        setPedCameraRotation(source, -0.6  - getPedCameraRotation(source))
	        camera = true
			end
	    elseif weapon == 31  then
	        if camera == true then
	  
	        setPedCameraRotation(source, 0.2 - getPedCameraRotation(source))
	        camera = false
	        else
	        setPedCameraRotation(source, -0.2  - getPedCameraRotation(source))
	        camera = true
		
	    end
		elseif weapon == 30 then
	        if camera == true then
	  
	        setPedCameraRotation(source, 0.6 - getPedCameraRotation(source))
	        camera = false
	        else
	        setPedCameraRotation(source, -0.6  - getPedCameraRotation(source))
	        camera = true
		
	    end
		
	    
   
   end
end
)



function shakeCamera(weapon)
	x,y,z = getPedBonePosition ( getLocalPlayer(), 26 )
	if weapon == 22  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 24  then
	createExplosion ( x,y,z + 10,12,false,0.2,false)
	elseif weapon == 25  then
	createExplosion ( x,y,z + 10,12,false,0.4,false)
	elseif weapon == 26  then
	createExplosion ( x,y,z + 10,12,false,0.5,false)
	elseif weapon == 27  then
	createExplosion ( x,y,z + 10,12,false,0.4,false)
	elseif weapon == 28  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 29  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 30  then
	createExplosion ( x,y,z+10,12,false,0.1,false)
	elseif weapon == 31  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 32  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 33  then
	createExplosion ( x,y,z + 10,12,false,0.1,false)
	elseif weapon == 38  then
	createExplosion ( x,y,z + 10,12,false,0.5,false)
	end
	end
	addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), shakeCamera )








function showTeamFunction ()
	if getElementData(localPlayer, "acc:admin") >= 9 then
	local theTeam = getTeamFromName ( "Policia" )
	if ( theTeam ) then
			local players = getPlayersInTeam ( theTeam ) 

			for playerKey, playerValue in ipairs ( players ) do
					outputChatBox (" "..getPlayerName(playerValue).." ID: "..getElementData(playerValue, "char:id"), 255,255,255, true )
			end
	end
end
end
addCommandHandler ( "policialista", showTeamFunction )



function showTeamFunction ()
	if getElementData(localPlayer, "acc:admin") >= 9 then
	local theTeam = getTeamFromName ( "Samu" )
	if ( theTeam ) then
			local players = getPlayersInTeam ( theTeam ) 

			for playerKey, playerValue in ipairs ( players ) do
					outputChatBox (" "..getPlayerName(playerValue).." ID: "..getElementData(playerValue, "char:id"), 255,255,255, true )
			end
	end
end
end
addCommandHandler ( "samulista", showTeamFunction )

function showTeamFunction ()
	if getElementData(localPlayer, "acc:admin") >= 9 then
	local theTeam = getTeamFromName ( "Detran" )
	if ( theTeam ) then
			local players = getPlayersInTeam ( theTeam ) 

			for playerKey, playerValue in ipairs ( players ) do
					outputChatBox (" "..getPlayerName(playerValue).." ID: "..getElementData(playerValue, "char:id"), 255,255,255, true )
			end
	end
end
end
addCommandHandler ( "detranlista", showTeamFunction )


function showTeamFunction ()
	if getElementData(localPlayer, "acc:admin") >= 9 then
	local theTeam = getTeamFromName ( "Mecanico" )
	if ( theTeam ) then
			local players = getPlayersInTeam ( theTeam ) 

			for playerKey, playerValue in ipairs ( players ) do
					outputChatBox (" "..getPlayerName(playerValue).." ID: "..getElementData(playerValue, "char:id"), 255,255,255, true )
			end
	end
end
end
addCommandHandler ( "meclista", showTeamFunction )