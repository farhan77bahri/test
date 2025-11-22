local con = exports.san_mysql:getConnection()

local time= getRealTime()
local hour = time.hour
local minute = time.minute
local sec = time.second

local rovid = "#7cc576[IRG]:#FFFFFF"
local info = "#7cc576[IRG - Informasion]:#ffffff "
local error = "#dc143c[IRG - error]:#ffffffs "

function findVehicle(id)
	for k,v in ipairs(getElementsByType("vehicle")) do
		local vid = tonumber(getElementData(v, "veh:id")) or -1
		if vid == tonumber(id) then
			return v
		end
	end
	return nil
end
---------------------------------------------



--------------------------------------

function findJobVehicle(id)
	for k,v in ipairs(getElementsByType("vehicle")) do
		local vid = tonumber(getElementData(v, "veh:jobid")) or -1
		if vid == tonumber(id) then
			return v
		end
	end
	return nil
end

local getPlayerAdminName = function(p)
	local name = tostring(getElementData(p, "char:name")) or ""
	return name
end

SeriasQueNaoPodemSerBanidos = { 
["567853835BFBE048C3A55AFD7F414374"] = true, --Conner
--["80257342C0CAF8AB6F11695B623BD3A1"] = true --Melo
} 
  
  
function announceBan( theBan ) 
    if getElementType( source ) then --Check if a player banned the IP/Serial 
        if SeriasQueNaoPodemSerBanidos[getBanSerial(theBan)] then 
            outputChatBox("[IRG - MTA] In Serial Ghabele Ban Nist.", source, 255, 255, 255, true )
            removeBan(theBan) 
        end 
    end 
end 
  
addEventHandler( "onBan", root, announceBan ) 

xana = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true --Xana
}

function xana1(thePlayer, cmd) 
	if xana[getPlayerSerial(thePlayer)] then
		setElementModel(thePlayer, 56)
	end
end  
addCommandHandler("xana", xana1, false, false)

function xana2(thePlayer, cmd) 
	if xana[getPlayerSerial(thePlayer)] then
		setElementModel(thePlayer, 69)
	end
end  
addCommandHandler("xana2", xana2, false, false)


chaves = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true --Chaves
}

function chaves1(thePlayer, cmd) 
	if chaves[getPlayerSerial(thePlayer)] then
		setElementModel(thePlayer, 143)
	end
end  
addCommandHandler("chaves", chaves1, false, false)

rafa1 = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true --Rafa
}

function rafa(thePlayer, cmd) 
	if rafa1[getPlayerSerial(thePlayer)] then
		setElementModel(thePlayer, 38)
	end
end  
addCommandHandler("raffa", rafa, false, false)

calango1 = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true --Calango
}

function calango(thePlayer, cmd) 
	if calango1[getPlayerSerial(thePlayer)] then
		setElementModel(thePlayer, 264)
	end
end  
addCommandHandler("kalango", calango, false, false)

fundadores = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true, --Conner
    --["80257342C0CAF8AB6F11695B623BD3A1"]=true --Melo
}

addCommandHandler("vehhh", 
	function (thePlayer, cmd, ID) 
	if fundadores[getPlayerSerial(thePlayer)] then
        local x, y, z = getElementPosition(thePlayer) 

		local pos = toJSON({x,y,z, 0 ,0})
				
		local insterT = dbQuery(con, "INSERT INTO vehicle SET pos=?,model=?,owner=?,color=?, fuel=100", 
			pos,ID,getElementData(thePlayer,"acc:id"),toJSON({255, 255, 255, 0, 0, 0}), 10)

		local QueryEredmeny, _, Beszurid = dbPoll(insterT, -1)
		if QueryEredmeny then
			exports["san_vehicle"]:addVehicle(getElementData(thePlayer,"acc:id"), tonumber(ID), x, y, z, Beszurid, 255, 255, 255)
		end
        end  
end
) 

addCommandHandler("dinheirotodos",
	function(thePlayer, commandName, amount)
		if getElementData(thePlayer, "acc:admin") >= 8 then
			for k,v in ipairs(getElementsByType("player")) do
			    setElementData(v, "char:money", getElementData(v, "char:money") + amount)
				outputChatBox("", v, 255, 255, 255, true)
				outputChatBox("", v, 255, 255, 255, true)
				outputChatBox("#7cc576[Presente - IRG]: " .. getPlayerName(thePlayer):gsub("_"," ") .. "#ffffff deu #7cc576R$ "..amount.."#ffffff para todos.", v, 255, 255, 255, true)
			end
		end
	end
)

addCommandHandler("devmode",
    function(thePlayer)
	if getElementData(thePlayer, "acc:admin") >= 8 then
        setDevelopmentMode(true)
    end
end
)

function auncuff(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
			
				if getElementData(targetPlayer, "char.Cuffed") == 1 then
					setElementData(targetPlayer, "char.Cuffed", 0)
					setElementFrozen(targetPlayer, false)
					toggleControl(targetPlayer,'previous_weapon',true)
					toggleControl(targetPlayer,'fire',true)
					toggleControl(targetPlayer,'aim_weapon',true)
					toggleAllControls(targetPlayer, true, true, true)
					outputChatBox(info .. "Você algemou com sucesso o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#fffffff.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#fffffff ele algemou você.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff ele algemou o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff.")
				else
					outputChatBox(error .. "O jogador não é treinado.", thePlayer, 255 ,255, 255, true)
				end
			else
				outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("auncuff", auncuff, false, false)



function warn(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 12 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			 if (targetPlayer) then
			 if getElementData (targetPlayer, "char:farhan") >= 3 then
              outputChatBox("3 Warn Darad", thePlayer, 255, 255, 255, true)
             end
			 end
			 
			   --[[ local admin = getElementData(targetPlayer, "acc:admin") or 0
				admin = admin - 1
			    setElementData (targetPlayer, "acc:admin", admin) 
				setElementData (targetPlayer, "char:farhan", 0)
			    outputChatBox("Shoma Rank Down Shodi", targetPlayer, 255, 255, 255, true)
			 end
			 end
			]]
			if (targetPlayer) then
			 if getElementData (targetPlayer, "char:farhan") <= 2 then
			        local farhan = getElementData(targetPlayer, "char:farhan") or 0
					farhan = farhan + 1
					setElementData(targetPlayer, "char:farhan", farhan)
					dbExec(con, "UPDATE characters SET farhan=? WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'", farhan)
				--if getElementData(targetPlayer, "char.Cuffed") == 1 then
					--[[setElementData(targetPlayer, "char:farhan", 1)
					setElementFrozen(targetPlayer, false)
					toggleControl(targetPlayer,'previous_weapon',true)
					toggleControl(targetPlayer,'fire',true)
					toggleControl(targetPlayer,'aim_weapon',true)
					toggleAllControls(targetPlayer, true, true, true)
					outputChatBox(info .. "Você algemou com sucesso o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#fffffff.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#fffffff ele algemou você.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff ele algemou o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff.")
				--else]]
					outputChatBox("#fff000[IRG-MTA] #ffffffWarn Daryaft Kard", thePlayer, 255 ,255, 255, true)
					outputChatBox("#fff000[IRG-MTA] #ffffffTedad Warn Player ( ".. farhan .. " )", thePlayer, 255 ,255, 255, true)
					outputChatBox("#fff000[IRG-MTA] #ffffffWarn Daryaft Kardi", targetPlayer, 255 ,255, 255, true)
					outputChatBox("#fff000[IRG-MTA] #ffffffTedad Warn Shoma ( ".. farhan.. " )", targetPlayer, 255 ,255, 255, true)
				--end
			
			end
			 end
		end
	end
end
addCommandHandler("warn", warn, false, false)



function loc(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			 if (targetPlayer) then
			 local x, y = getElementPosition(thePlayer)
	        local loc = getZoneName(x, y)
	        local city = getZoneName(x, y, z, true)
	        outputChatBox("Shoma Location Khod Ra Baraye "..getPlayerName(targetPlayer)" Ersal Kardi.", thePlayer, 255, 255, 255)
	        outputChatBox(getPlayerName(thePlayer).." Location Khod Ra Baraye Shoma Ersal Kard. "..loc.." ("..city..")", targetPlayer, 255, 255, 255)
	
	       -- blip =  createBlipAttachedTo(thePlayer, 41)
			
			blip = exports["irg_radar"]:createStayBlip("LSPD",createBlip (thePlayer,0,0,2,255,0,0,255,0,0),0,"police_hq",24,24,255, 255, 255)
	        --setElementVisibleTo(blip, thePlayer, false) 
	        --setElementVisibleTo(blip, targetPlayer, false)
			setElementVisibleTo(blip, root, false)
			setElementVisibleTo(blip, targetPlayer, true)
	
	        timer = setTimer(function(b)
		     if isElement(b) then
			  destroyElement(b) 
		     end
	        end, 120000, 1, blip)
			 
			 
			 
			 
			 
			 
			 end
		end
	end
end
addCommandHandler("aloc", loc, false, false)

addEventHandler("onPlayerQuit", root,function()
	if timer then
		if isTimer(timer) then
			killTimer(timer)
		end
		timer = nil
	end
	if blip then
		if isElement(blip) then
			destroyElement(blip)
		end
		blip = nil
	end
end)


function delwarn(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
	
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
			  
			 
			 
			--if getElementData (targetPlayer, "char:farhan") >= 1 then return end
			        local farhan = getElementData(targetPlayer, "char:farhan") or 0
					farhan = farhan - 1
					setElementData(targetPlayer, "char:farhan", farhan)
					dbExec(con, "UPDATE characters SET farhan=? WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'", farhan)
				--if getElementData(targetPlayer, "char.Cuffed") == 1 then
					--[[setElementData(targetPlayer, "char:farhan", 1)
					setElementFrozen(targetPlayer, false)
					toggleControl(targetPlayer,'previous_weapon',true)
					toggleControl(targetPlayer,'fire',true)
					toggleControl(targetPlayer,'aim_weapon',true)
					toggleAllControls(targetPlayer, true, true, true)
					outputChatBox(info .. "Você algemou com sucesso o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#fffffff.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#fffffff ele algemou você.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff ele algemou o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff.")
				--else]]
					outputChatBox( "#fff000[IRG-MTA] #ffffff1 Warn Player Pak Shod", thePlayer, 255 ,255, 255, true)
					outputChatBox( "#fff000[IRG-MTA] #ffffffTedad Warn Player ( ".. farhan .. " )", thePlayer, 255 ,255, 255, true)
					outputChatBox( "#fff000[IRG-MTA] #ffffff1 Warn Shoma Pak Shod", targetPlayer, 255 ,255, 255, true)
					outputChatBox( "#fff000[IRG-MTA] #ffffffTedad Warn Shoma ( ".. farhan.. " )", targetPlayer, 255 ,255, 255, true)
				--end
				
			else
				outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true)
			end
		end
	end
	
end
addCommandHandler("delwarn", delwarn, false, false)

import2 = { 
    ["567853835BFBE048C3A55AFD7F414374"]=true
}
function anick ( thePlayer, commandName, who )
	if getElementData( thePlayer, "acc:admin" ) >= 1 then
		 if not ( who ) then
			  outputChatBox ( "#7cc576[Use]:#ffffff /" .. commandName .. "[ID]", thePlayer, 255, 0, 0, true )
		 else 
				 local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, who)
				 
				
				
				 if ( targetPlayer ) then
				 
				
			
				
					 x, y, z = getElementPosition ( targetPlayer )
					 skin = getElementModel ( targetPlayer )
					 playerTeam = getPlayerTeam ( targetPlayer ) 
					 
					 dim = getElementDimension ( targetPlayer )
					 int = getElementInterior ( targetPlayer )
					 
					 
					 
					 setElementDimension ( targetPlayer, dim )
					 setElementInterior ( targetPlayer, int )
					 setElementData(targetPlayer , 'char:hunger' , 100)
					 setElementData(targetPlayer , 'char:thirst' , 100)
					 setElementData(targetPlayer, "stamina", 100)
					 
					 outputChatBox(info .. "#7cc576"..getPlayerAdminName(thePlayer).." #ffffffShoma Ro Respawn Kard.", targetPlayer,0,0,0,true)
					 exports.irg_logs:createLog("RESPAWN",getPlayerAdminName(thePlayer,true).." Respawn Kard " ..targetPlayerName:gsub("_"," ").." Ra ",thePlayer,targetPlayer);
					 exports["log"]:sendDiscordMessage("```Admin "..getPlayerAdminName(thePlayer,true).." Respawn Kard "..targetPlayerName:gsub("_"," ").." Ra ``` ")
					 outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Az Respawn Estefade Kard #fff000#fff000Target: #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff.")
                     if isPedInVehicle(targetPlayer) then
                        setElementHealth(targetPlayer, 100)
						return end
					 exports["san_items"]:deleteItemById(targetPlayer, 283, false)
					 exports["san_items"]:deleteItemById(targetPlayer, 284, false)
					 exports["san_items"]:deleteItemById(targetPlayer, 285, false)
					 exports["san_items"]:deleteItemById(targetPlayer, 286, false)
					 spawnPlayer ( targetPlayer, x, y, z+2, 0, skin, 0, 0, playerTeam )
					 triggerClientEvent(targetPlayer, "stopDeadTime", targetPlayer)
					 setElementData(targetPlayer, "playerFallen", false)
					 
			 end
			 
		 end
	 end
 end
 addCommandHandler ( "respawn", anick )



function reloadacl(source, command)
	if getElementData(source, "acc:admin") >= 14 then
		local reload = aclReload()
		if (reload) then
			outputAdminMessage("#7cc576" .. getPlayerAdminName(source) .. "#ffffff recarregou o ACL.")
		else
			outputChatBox("ERRO.", source)
		end
	end
end
addCommandHandler("reloadacl", reloadacl, false, false)

addEvent("setElementPosition",true)
addEventHandler("setElementPosition",getRootElement(),
	function(element,x,y,z,int,dim,rx,ry,rz)
		setElementPosition(element,x,y,z)
		setElementInterior(element,int)
		setElementDimension(element,dim)
		setElementRotation(element,rx,ry,rz)
	end
)







function adminDuty(player)
    if getElementData(player, "acc:admin") >= 1 then
        local isOnDuty = getElementData(player, "char:adminduty") == 1

        if not isOnDuty then
            -- فعال‌سازی حالت ادمین
            setElementData(player, "char:oldName", getPlayerName(player))
            setPlayerName(player, getPlayerAdminName(player))
            setElementData(player, "char:adminduty", 1)
            setElementData(player, "job", "STAFF IRAN-GAMING")

            exports["a_infobox"]:addBox(root, "admin", "Admin " .. getPlayerName(player) .. " Duty Kard")
            exports.irg_logs:createLog("ADUTY", getPlayerAdminName(player, true) .. " Duty Kard.", player)

            -- اطلاع‌رسانی به ادمین‌های سطح بالا
            for _, admin in ipairs(getElementsByType("player")) do
                if isElement(admin) and getElementData(admin, "loggedin") and tonumber(getElementData(admin, "acc:admin") or 0) == 10 then
                    outputChatBox("#7cc576[IRG - LOG]:#ffffff " .. getPlayerName(player) .. " Az CMD /aduty Estefadeh Kard", admin, 255, 255, 255, true)
                end
            end

            -- تایمر ثبت زمان
            local dutyTimer = setTimer(function()
                if isElement(player) and getElementData(player, "char:adminduty") == 1 then
                    local adutyTime = (getElementData(player, "aduty:time") or 0) + 1
                    setElementData(player, "aduty:time", adutyTime)
                    dbExec(con, "UPDATE characters SET adutyTime=? WHERE id=?", adutyTime, getElementData(player, "char:id"))
                end
            end, 60000, 0)
            setElementData(player, "aduty:timer", dutyTimer)

        else
            -- غیرفعال‌سازی حالت ادمین
            setPlayerName(player, getElementData(player, "char:oldName"))
            setElementData(player, "char:adminduty", 0)
            setElementData(player, "job", "Bikar")
            setElementModel(player, getElementData(player, "char:skin"))
            exports["a_infobox"]:addBox(root, "admin", "Admin " .. getPlayerName(player) .. " Off Duty Kard")
            exports.irg_logs:createLog("OFFDUTY", getPlayerAdminName(player, true) .. " Off Duty Kard.", player)

            -- اطلاع‌رسانی به ادمین‌های سطح بالا
            for _, admin in ipairs(getElementsByType("player")) do
                if isElement(admin) and getElementData(admin, "loggedin") and tonumber(getElementData(admin, "acc:admin") or 0) == 10 then
                    outputChatBox("#7cc576[IRG - LOG]:#ffffff " .. getPlayerName(player) .. " Az CMD /adminduty para sair de Staff", admin, 255, 255, 255, true)
                end
            end
        end

        -- تغییر مدل بر اساس سطح ادمین
        if getElementData(player, "char:adminduty") == 1 then
            local adminLevel = tonumber(getElementData(player, "acc:admin"))
            local skinMap = {
                [1] = 100, [2] = 101, [3] = 102, [4] = 103,
                [5] = 104, [6] = 105, [7] = 106, [8] = 107,
                [9] = 108, [10] = 109, [11] = 110, [12] = 111,
                [13] = 112, [14] = 306
            }
            local model = skinMap[adminLevel] or getElementData(player, "char:skin")
            setElementModel(player, model)
        end
    end
end

-- دستورات پشتیبانی‌شده
local commands = { "adminduty", "aduty", "modoadmin", "entrarstaff", "modostaff" }
for _, cmd in ipairs(commands) do
    addCommandHandler(cmd, adminDuty, false, false)
end





addEvent("outputAdminMessage",true)
addEventHandler("outputAdminMessage",getRootElement(),
	function(msg)
		for k,v in ipairs(getElementsByType("player")) do
			if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) >= 7 then
				outputChatBox("#7cc576[IRG - LOG]:#ffffff ".. msg,v,255,255,255,true)
			end
		end
end)


addEvent("outputAdminMessage1",true)
addEventHandler("outputAdminMessage1",getRootElement(),
	function(msg)
		for k,v in ipairs(getElementsByType("player")) do
			if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) >= 1 then
				outputChatBox("#ff0000[New Player]:#ffffff ".. msg,v,255,255,255,true)
			end
		end
end)

function outputDeveloperMessage(msg)
	for k, v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v, "acc:admin") or 0) >= 7 then
			outputChatBox("#7cc576[IRG - DevLOG]#ffffff " ..msg, v,255, 255, 255, true)
		end
	end
end


function outputAdminMessage(msg)
	for k,v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) >= 7 then
			outputChatBox("#7cc576[IRG - LOG]:#ffffff ".. msg,v,255,255,255,true)
		end
	end
end

function outputAdminMessage1(msg)
	for k,v in ipairs(getElementsByType("player")) do
		if (msg) and isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) >= 7 then
			outputChatBox("#ff0000[New Player]:#ffffff ".. msg,v,255,255,255,true)
			triggerClientEvent(v, "privatUzenetErkezett1", v)
		end
	end
end

addCommandHandler("freeze",
    function(playerSource, cmd, player)
        if tonumber(getElementData(playerSource, "acc:admin")) >= 3 then
            if player then
                local targetPlayer, targetPlayerName = exports["san_core"]:findPlayer(playerSource, player)
                if targetPlayer then
                    local veh = getPedOccupiedVehicle(targetPlayer)
                    if veh then
                        setElementFrozen(veh, true)
                        toggleAllControls(targetPlayer, false, true, false)
                    else
                        setElementFrozen(targetPlayer, true)
                        setPedWeaponSlot(targetPlayer, 0)
                        setElementData(targetPlayer, "freeze", 1)
                    end

                    -- Payamha
                    local adminName = getPlayerAdminName(playerSource)
                    local targetNameFormatted = targetPlayerName:gsub("_", " ")
                    outputChatBox(info .. "#7cc576" .. adminName .. " #ffffffShoma Ra Freeze Kard.", targetPlayer, 0, 0, 0, true)
                    outputChatBox("#ffffffBazikon #7cc576" .. targetNameFormatted .. " #ffffff Freeze Shod.", playerSource, 255, 255, 255, true)
                    outputAdminMessage("#7cc576" .. adminName .. "#ffffff Freeze Kard #7cc576" .. targetNameFormatted .. "#ffffff.")

                    -- Log
                    exports.irg_logs:createLog("Freeze", adminName .. " Freeze Kard " .. targetNameFormatted .. " Ra ", playerSource, targetPlayer)
                else
                    outputChatBox(error .. "Player Dar Shahr Nist!.", playerSource, 255, 255, 255, true)
                end
            else
                outputChatBox("#7cc576use:#ffffff /" .. cmd .. " [Name / ID] ", playerSource, 166, 196, 103, true)
            end
        else
            outputChatBox("#ff0000Shoma Dastresi Kafi Baraye In Command Ra Nadarin!", playerSource, 255, 0, 0, true)
        end
    end
)

addCommandHandler("unfreeze",
    function(playerSource, cmd, player)
        if tonumber(getElementData(playerSource, "acc:admin")) >= 3 then
            if player then
                local targetPlayer, targetPlayerName = exports["san_core"]:findPlayer(playerSource, player)
                if targetPlayer then
                    local veh = getPedOccupiedVehicle(targetPlayer)
                    if veh then
                        setElementFrozen(veh, false)
                        toggleAllControls(targetPlayer, true, true, true)
                    else
                        setElementFrozen(targetPlayer, false)
                        setElementData(targetPlayer, "freeze", 0)
                    end

                    -- Payamha
                    local adminName = getPlayerAdminName(playerSource)
                    local targetNameFormatted = targetPlayerName:gsub("_", " ")
                    outputChatBox(info .. "#7cc576" .. adminName .. " #ffffffShoma Ra UnFreeze Kard.", targetPlayer, 0, 0, 0, true)
                    outputChatBox("#ffffffBazikon #7cc576" .. targetNameFormatted .. " #ffffff UnFreeze Shod.", playerSource, 255, 255, 255, true)
                    outputAdminMessage("#7cc576" .. adminName .. "#ffffff UnFreeze Kard #7cc576" .. targetNameFormatted .. "#ffffff.")

                    -- Log
                    exports.irg_logs:createLog("UnFreeze", adminName .. " UnFreeze Kard " .. targetNameFormatted .. " Ra ", playerSource, targetPlayer)
                else
                    outputChatBox(error .. "Player Dar Shahr Nist!.", playerSource, 255, 255, 255, true)
                end
            else
                outputChatBox("#7cc576Use:#ffffff /" .. cmd .. " [Name / ID] ", playerSource, 166, 196, 103, true)
            end
        else
            outputChatBox("#ff0000Shoma Dastresi Kafi Baraye In Command Ra Nadarin!", playerSource, 255, 0, 0, true)
        end
    end
)



enabledSerials = { --COLABORADOR SERIAL-OK
    ["567853835BFBE048C3A55AFD7F414374"]=true, --Conner
    --["80257342C0CAF8AB6F11695B623BD3A1"]=true --Melo
}


cmdList = {
    ["shutdown"]=true,
    ["register"]=true,
    ["msg"]=true,
    ["login"]=true,
    ["restart"]=true,
    ["start"]=true,
	["stop"]=true,
	["logout"]=true,
    ["refresh"]=true,
    ["aexec"]=true,
    ["refreshall"]=true,
    ["debugscript"]=true,
}

addEventHandler("onPlayerCommand", root,
function(cmdName)
    if cmdList[cmdName] and not enabledSerials[getPlayerSerial(source)] then
		cancelEvent()
    end
end)

addCommandHandler("asay",
	function(playerSource, cmd, ...)
		if (tonumber(getElementData(playerSource, "acc:admin")) >= 12) then
			if getElementData(playerSource,"loggedin") then
				if not (...) then
					outputChatBox("#7cc576Use:#ffffff /" .. cmd .. " [texto]",playerSource, 255, 194, 14, true)
				else
				--local playerName = getPlayerName(thePlayer):gsub("_", " ")
					local msg = table.concat({...}, " ")
					outputChatBox(" ",getRootElement(),255,255,255,true)
					outputChatBox("#dc143c[Mensagem Staff]: #FF8C00" .. getPlayerAdminLevel(playerSource) .. " #7cc576".. getPlayerAdminName(playerSource) .."#ffffff: ".. msg,getRootElement(),255,255,255,true)
					triggerClientEvent(root, "asaySound", root)
				end
			end
		end
	end
)
--[[
setTimer(
    function()
        for _, player in ipairs(getElementsByType("player"))do -- Loop thru every player
			if (getPlayerIdleTime(player) > 600000) then -- Player hasn't moved for 300,000ms (5 minutes)
				if (tonumber(getElementData(player, "acc:admin")) >= 3) then return end
                kickPlayer(player, "Ficou AFK por 10 minutos sinto muito :/") -- Kick the idling player
			end
        end
    end,
30000, 0) ]]



-- RECON
addCommandHandler("ffrecon",
	function(thePlayer, commandName, targetPlayer)
		if (tonumber(getElementData(thePlayer, "acc:admin")) >= 10) then
			if not (targetPlayer) then
				local rx = getElementData(thePlayer, "reconx")
				local ry = getElementData(thePlayer, "recony")
				local rz = getElementData(thePlayer, "reconz")
				local reconrot = getElementData(thePlayer, "reconrot")
				local recondimension = getElementData(thePlayer, "recondimension")
				local reconinterior = getElementData(thePlayer, "reconinterior")
				
				if not (rx) or not (ry) or not (rz) or not (reconrot) or not (recondimension) or not (reconinterior) then
						outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID]",thePlayer, 255, 194, 14, true)
				else
					detachElements(thePlayer)
				
					setElementPosition(thePlayer, rx, ry, rz)
					setPedRotation(thePlayer, reconrot)
					setElementDimension(thePlayer, recondimension)
					setElementInterior(thePlayer, reconinterior)
					setCameraInterior(thePlayer, reconinterior)
					
					setElementData(thePlayer, "reconx", nil)
					setElementData(thePlayer, "recony", nil, false)
					setElementData(thePlayer, "reconz", nil, false)
					setElementData(thePlayer, "reconrot", nil, false)
					setCameraTarget(thePlayer, thePlayer)
					setElementAlpha(thePlayer, 255)
					setElementData(thePlayer, "invisible", false)
				end
			else
				local targetPlayer, targetPlayerName =  exports["san_core"]:findPlayer(thePlayer, targetPlayer)
				
				if targetPlayer then
					local logged = getElementData(targetPlayer, "loggedin")
					
					if (logged==0) then
						outputChatBox("#7cc576[IRG]:#ffffff Jogador não logado.", thePlayer, 210, 77, 87)
					else
						setElementAlpha(thePlayer, 0)
						
						if ( not getElementData(thePlayer, "reconx") or getElementData(thePlayer, "reconx") == true ) and not getElementData(thePlayer, "recony") then
							local x, y, z = getElementPosition(thePlayer)
							local rot = getPedRotation(thePlayer)
							local dimension = getElementDimension(thePlayer)
							local interior = getElementInterior(thePlayer)
							setElementData(thePlayer, "reconx", x)
							setElementData(thePlayer, "recony", y, false)
							setElementData(thePlayer, "reconz", z, false)
							setElementData(thePlayer, "reconrot", rot, false)
							setElementData(thePlayer, "recondimension", dimension, false)
							setElementData(thePlayer, "reconinterior", interior, false)
						end
						setPedWeaponSlot(thePlayer, 0)
						
						local playerdimension = getElementDimension(targetPlayer)
						local playerinterior = getElementInterior(targetPlayer)
						
						setElementDimension(thePlayer, playerdimension)
						setElementInterior(thePlayer, playerinterior)
						setCameraInterior(thePlayer, playerinterior)
						
						local x, y, z = getElementPosition(targetPlayer)
						setElementPosition(thePlayer, x - 10, y - 10, z - 5)
						local success = attachElements(thePlayer, targetPlayer, -10, -10, -5)
						if not (success) then
							success = attachElements(thePlayer, targetPlayer, -5, -5, -5)
							if not (success) then
								success = attachElements(thePlayer, targetPlayer, 5, 5, -5)
							end
						end
						
						if not (success) then
							outputChatBox("#7cc576[IRG]: #ffffffNão foi possível dar tp ao player.", thePlayer, 210, 77, 87, true)
						else
							setCameraTarget(thePlayer, targetPlayer)
							setElementData(thePlayer, "invisible", true)
						end
					end
				end
			end
		end
	end
)

addCommandHandler("recon",
	function(thePlayer, commandName, targetPlayer)
		if (tonumber(getElementData(thePlayer, "acc:admin")) >= 3) then
			if not (targetPlayer) then
				local rx = getElementData(thePlayer, "reconx")
				local ry = getElementData(thePlayer, "recony")
				local rz = getElementData(thePlayer, "reconz")
				local reconrot = getElementData(thePlayer, "reconrot")
				local recondimension = getElementData(thePlayer, "recondimension")
				local reconinterior = getElementData(thePlayer, "reconinterior")
				
				if not (rx) or not (ry) or not (rz) or not (reconrot) or not (recondimension) or not (reconinterior) then
						outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID]",thePlayer, 255, 194, 14, true)
				else
					detachElements(thePlayer)
				
					setElementPosition(thePlayer, rx, ry, rz)
					setPedRotation(thePlayer, reconrot)
					setElementDimension(thePlayer, recondimension)
					setElementInterior(thePlayer, reconinterior)
					setCameraInterior(thePlayer, reconinterior)
					
					setElementData(thePlayer, "reconx", nil)
					setElementData(thePlayer, "recony", nil, false)
					setElementData(thePlayer, "reconz", nil, false)
					setElementData(thePlayer, "reconrot", nil, false)
					setCameraTarget(thePlayer, thePlayer)
					setElementAlpha(thePlayer, 255)
					setElementData(thePlayer, "invisible", false)
					outputChatBox("#D64541[Spec]#ffffff parou de ver.", thePlayer,  255, 194, 14,true)
												
				end
			else
				local targetPlayer, targetPlayerName =  exports["san_core"]:findPlayer(thePlayer, targetPlayer)
							local sourceAdminLVL = getElementData( thePlayer , "acc:admin") or 0
				local targetAdminLVL = getElementData( targetPlayer , "acc:admin") or 0
				if sourceAdminLVL <= targetAdminLVL then
					outputChatBox(error .. "Nmitoni Ro Rank Bala Recon Beshi!.", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Mikhast Ro Shoma Recon Beshe!", targetPlayer, 255, 255, 255, true)
					return false
					end
				if targetPlayer then
					local logged = getElementData(targetPlayer, "loggedin")
					
			
					
					
					
					
					
					
					
					if (logged==0) then
					
					
						outputChatBox("#D64541[Recon]#ffffffRecon Shoro Shod.", thePlayer, 210, 77, 87)
					else
						setElementAlpha(thePlayer, 0)
						
						if ( not getElementData(thePlayer, "reconx") or getElementData(thePlayer, "reconx") == true ) and not getElementData(thePlayer, "recony") then
							local x, y, z = getElementPosition(thePlayer)
							local rot = getPedRotation(thePlayer)
							local dimension = getElementDimension(thePlayer)
							local interior = getElementInterior(thePlayer)
							setElementData(thePlayer, "reconx", x)
							setElementData(thePlayer, "recony", y, false)
							setElementData(thePlayer, "reconz", z, false)
							setElementData(thePlayer, "reconrot", rot, false)
							setElementData(thePlayer, "recondimension", dimension, false)
							setElementData(thePlayer, "reconinterior", interior, false)
						end
						setPedWeaponSlot(thePlayer, 0)
						
						local playerdimension = getElementDimension(targetPlayer)
						local playerinterior = getElementInterior(targetPlayer)
						
						setElementDimension(thePlayer, playerdimension)
						setElementInterior(thePlayer, playerinterior)
						setCameraInterior(thePlayer, playerinterior)


						for k,v in ipairs(getElementsByType("player")) do
							if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) == 14 then
								outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(thePlayer).." Az CMD /spec para espectar "..targetPlayerName.." ",v,255,255,255,true)
								exports.irg_logs:createLog("RECON",getPlayerAdminName(thePlayer,true).." Recon Kard Ro " ..targetPlayerName:gsub("_"," ").." ",thePlayer,targetPlayer);
							end
						end
						
						local x, y, z = getElementPosition(targetPlayer)
						setElementPosition(thePlayer, x - 10, y - 10, z - 5)
						local success = attachElements(thePlayer, targetPlayer, -10, -10, -5)
						if not (success) then
							success = attachElements(thePlayer, targetPlayer, -5, -5, -5)
							if not (success) then
								success = attachElements(thePlayer, targetPlayer, 5, 5, -5)
							end
						end
						
						if not (success) then
							outputChatBox("#D64541[Spec] #ffffffNão foi possível conectar ao player.", thePlayer, 210, 77, 87, true)
						else
							setCameraTarget(thePlayer, targetPlayer)

							
							for i, v in ipairs(getElementsByType("player")) do
								if tonumber(getElementData(v, "acc:admin") or 0) >= 9 and getElementData(v, "loggedin") then
									if getPlayerName(thePlayer) ~= getPlayerName(v) then
										outputChatBox("#D64541[Spec]#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff Observando #7cc576" .. getPlayerName(targetPlayer) .. "#ffffff.", v, 255, 255, 255, true)
									end
								end
							end
							

							setElementData(thePlayer, "invisible", true)
							outputChatBox("#D64541[Spec]#ffffff observando #7cc576" .. string.gsub(targetPlayerName, "_", " ") .. "#ffffff.", thePlayer,  255, 194, 14,true)
						end
					end
				end
			end
		end
	end
)

function StopRecon(thePlayer, commandName, targetPlayer)
	if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
		local rx = getElementData(thePlayer, "reconx")
		local ry = getElementData(thePlayer, "recony")
		local rz = getElementData(thePlayer, "reconz")
		local reconrot = getElementData(thePlayer, "reconrot")
		local recondimension = getElementData(thePlayer, "recondimension")
		local reconinterior = getElementData(thePlayer, "reconinterior")
		local Rotation = getPedRotation(thePlayer)
		
		detachElements(thePlayer)
		setCameraTarget(thePlayer, thePlayer)
		setElementAlpha(thePlayer, 255)
		
		if rx and ry and rz then
			setElementPosition(thePlayer, rx, ry, rz)
			if reconrot then
				setPedRotation(thePlayer, Rotation)
			end
			
			if recondimension then
				setElementDimension(thePlayer, recondimension)
			end
			
			if reconinterior then
				setElementInterior(thePlayer, reconinterior)
				setCameraInterior(thePlayer, reconinterior)
			end
		end
		
		setElementData(thePlayer, "reconx", nil)
		setElementData(thePlayer, "recony", nil, false)
		setElementData(thePlayer, "reconz", nil, false)
		setElementData(thePlayer, "reconrot", nil, false)
		outputChatBox("#7cc576[IRG] #ffffffRecon desativado com sucesso.", thePlayer,  255, 194, 14,true)
	end
end
addCommandHandler("pararspec", StopRecon, false, false)
----


-- /unflip
function unflipCar(thePlayer, commandName, targetPlayer)
	if (tonumber(getElementData(thePlayer, "acc:admin")) >= 1) then
		if not targetPlayer then
			if not (isPedInVehicle(thePlayer)) then
				outputChatBox(error .. "Shoma Dakhele Vasile Naghliye Nisti.", thePlayer,210, 77, 87, true)
			else
				local veh = getPedOccupiedVehicle(thePlayer)
				local rx, ry, rz = getVehicleRotation(veh)
				setVehicleRotation(veh, 0, 0, 0)
				outputChatBox(info .. "Shoma Vasile Naghliye Ra Unflip Kardi.", thePlayer, 0, 255, 0, true)
			end
		else
			local targetPlayer,targetPlayerName =  exports["san_core"]:findPlayer(thePlayer, targetPlayer)
			if targetPlayer then
				local logged = getElementData(targetPlayer, "loggedin")
				local username = getPlayerName(thePlayer):gsub("_"," ")
				
				if (not logged) then
					outputChatBox("#7cc576[IRG]:#ffffff Player Dar Shahr Nist.", thePlayer, 255, 0, 0, true)
				else
					local pveh = getPedOccupiedVehicle(targetPlayer)
					if pveh then
						local rx, ry, rz = getVehicleRotation(pveh)
						setVehicleRotation(pveh, 0, 0, 0)
						outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Vasile Naghliye Shoma Ra unflip Kard.", targetPlayer,  255, 194, 14,true)
						outputChatBox(info .. "Vasile Naghliye #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Ra unflip Kard.", thePlayer,  255, 194, 14,true)
					else
						outputChatBox(error .. "" ..targetPlayerName:gsub("_"," ") .. "#ffffffDar Vasile Naghliye Nist.", thePlayer, 210, 77, 87, true)
					end
				end
			end
		end
	end
end
addCommandHandler("unflip", unflipCar, false, false)


function playerquit(reason) 
	local pX,pY,pZ = getElementPosition(source)
	for k,v in ipairs(getElementsByType("player")) do
		vX,vY,vZ = getElementPosition(v)
		local dist = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
		local interior = getElementInterior(source)
		local dimension = getElementDimension(source)			
		local interior1 = getElementInterior(v)
		local dimension1 = getElementDimension(v)
		if dist <= 30 and interior == interior1 and dimension == dimension1 then
			local name = getPlayerName(source) 
			local id = getElementData(source, "char:id") 
			if reason == "Quit" then 
				outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox("#00ff00[IRG - JOINQUIT] #ffffff"..name.." #7cc576ID: " .. id .. " #ffffffAz Shahr Kharej Shod(Quit)",v, 255,255,255,true) 
				elseif (reason == "Kicked" ) then 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox("#00ff00[IRG - JOINQUIT] #ffffff"..name.." #7cc576ID: " .. id .. "  #ffffffAz Shahr Kick Shod",v, 255,255,255,true) 
				elseif (reason == "Banned" ) then 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox("#00ff00[IRG - JOINQUIT] #ffffff"..name.." #7cc576ID: " .. id .. " #ffffffBan Shod",v, 255,255,255,true) 
				elseif (reason == "Timed out") then 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
					outputChatBox(" ",v, 255,255,255,true) 
				outputChatBox("#00ff00[IRG - JOINQUIT] #ffffff"..name.." #7cc576ID: " .. id .. " #ffffffAz Shahr Kharej Shod (Moshkel Net)",v, 255,255,255,true) 
			end 
		end
	end
end 
addEventHandler("onPlayerQuit",root,playerquit) 


addCommandHandler("vehinfo",
    function(playerSource, cmd)
        if tonumber(getElementData(playerSource, "acc:admin")) >= 8 then
            local pX, pY, pZ = getElementPosition(playerSource)
            local interior = getElementInterior(playerSource)
            local dimension = getElementDimension(playerSource)

            for _, vehicle in ipairs(getElementsByType("vehicle")) do
                local vX, vY, vZ = getElementPosition(vehicle)
                local dist = getDistanceBetweenPoints3D(pX, pY, pZ, vX, vY, vZ)

                if dist <= 15 and interior == getElementInterior(vehicle) and dimension == getElementDimension(vehicle) then
                    local id = getElementData(vehicle, "veh:id") or "Na-Maloom"
                    local owner = getElementData(vehicle, "veh:owner") or "Na-Maloom"
                    local oname = getElementData(vehicle, "veh:oname") or "Na-Maloom"
                    local vehicleName = getVehicleName(vehicle)

                    -- Payam
                    outputChatBox("#7cc576[IRG - Vehicle]#ffffff Name: #7cc576" .. vehicleName ..
                                  " #7cc576| #ffffffID:#7cc576" .. id .. 
                                  " | #ffffffOwner: #7cc576" .. oname, playerSource, 255, 255, 255, true)
                end
            end
        else
            outputChatBox("#ff0000Shoma Dastresi Kafi Baraye In Command Ra Nadarin!", playerSource, 255, 0, 0, true)
        end
    end
)


function getElementDataPlayerByAccountID(owner,elementDataName)
	for k,v in ipairs(getElementsByType("player")) do
		if getElementData(v,"acc:id") == owner then
			return getElementData(v,elementDataName)
		else
			return "n/a"
		end
	end
end

function toggleInvisibility(thePlayer)
	if (tonumber(getElementData(thePlayer, "acc:admin")) >= 3) then
		local enabled = getElementData(thePlayer, "invisible")
		if (enabled == true) then
			setElementAlpha(thePlayer, 255)
			setElementData(thePlayer, "reconx", false)
			--outputChatBox(info .. "Você está visível.", thePlayer, 255, 0, 0,true)
			setElementData(thePlayer, "invisible", false)
		elseif (enabled == false or enabled == nil) then
			setElementAlpha(thePlayer, 0)
			setElementData(thePlayer, "reconx", true)
			--outputChatBox(info .. "Você está invisível", thePlayer, 0, 255, 0,true)
			setElementData(thePlayer, "invisible", true)
		else
			outputChatBox("Desligue a TV de Admin primeiro.", thePlayer, 255, 0, 0)
		end
	end
end
addCommandHandler("invisivel", toggleInvisibility)
addCommandHandler("inv", toggleInvisibility)

addCommandHandler("akick",
    function(player, cmd, target, ...)
        if getElementData(player, "acc:admin") >= 8 then
            if not target or not (...) then
                outputChatBox("#7cc576Use:#ffffff /" .. cmd .. " [Name / ID] [Reason]", player, 255, 194, 14, true)
            else
                local targetPlayer, targetPlayerName = exports["san_core"]:findPlayer(player, target)
                local reason = table.concat({...}, " ")

                if targetPlayer then
                    -- Check if the target has a higher admin level
                    if (getElementData(targetPlayer, "acc:admin") or 0) > getElementData(player, "acc:admin") then
                        outputChatBox(error .. "Shoma Nemitavanid " .. targetPlayerName:gsub("_", " ") .. " Ra Kick Konid.", player, 255, 255, 255, true)
                        return
                    end

                    -- Kick the player with a delay
                    local kick = setTimer(function()
                        kickPlayer(targetPlayer, getPlayerAdminName(player), reason)
                    end, 1000, 1)

                    if kick then
                        exports.irg_logs:createLog("KICK", getPlayerAdminName(player, true) .. " Kick Kard " .. targetPlayerName:gsub("_", " ") .. ".", player, targetPlayer)
                        exports.san_kickban:showBoxS(root,
                            getPlayerAdminName(player) .. " Kick Kard " .. targetPlayerName:gsub("_", " "),
                            "Reason: " .. reason, "kick"
                        )
                    else
                        outputChatBox(error .. "Error. Ba Developer Tamas Begirid!", player, 255, 255, 255, true)
                    end
                else
                    outputChatBox(error .. "Player Dar Shahr Nist!.", player, 255, 255, 255, true)
                end
            end
        else
            outputChatBox("#ff0000Shoma Dastresi Kafi Baraye In Command Ra Nadarin!", player, 255, 0, 0, true)
        end
    end
)


function banPlayer(thePlayer, commandName, targetPlayer, ido, ...)
    if getElementData(thePlayer, "acc:admin") >= 14 or import2[getPlayerSerial(thePlayer)] then
        if not (targetPlayer) or not (ido) or not (...) then
            outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [0 = Perma | 1 = 5 Years | 2+ = X Hours] [Reason]", thePlayer, 255, 255, 255, true)
        else
            local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
            local ido = tonumber(ido)
            local reason = table.concat({...}, " ")

            if tonumber(getElementData(targetPlayer, "acc:admin") or 0) > tonumber(getElementData(thePlayer, "acc:admin") or 0) then
                outputChatBox(error .. "Shoma Dastresi Baraye In Command Ra Nadarin!", thePlayer, 255, 255, 255, true)
                return
            end

            if ido == 0 then
                -- Permanent Ban
                local sql = dbExec(con, "INSERT INTO bans SET accountID=?, bannedBy=?, timeZone=NOW() + INTERVAL 15 YEAR, Date=NOW(), playerSerial=?, reason=?, playername=?, ipadress=?, status=?", 
                    getElementData(targetPlayer, "acc:id"), getPlayerAdminName(thePlayer), getPlayerSerial(targetPlayer), reason, getElementData(targetPlayer,"acc:name"), getPlayerIP(targetPlayer), 1)
                if (sql) then
                    exports.san_kickban:showBoxS(root, getPlayerAdminName(thePlayer) .. "#ffffff Perma Ban Kard #fff000Target: " .. targetPlayerName:gsub("_", " ") .. "", "Reason: " .. reason, "ban")
                    setTimer(function()
                        kickPlayer(targetPlayer, getPlayerAdminName(thePlayer), "Shoma Permanent Ban Shodid!")
                    end, 500, 1)
                end
            elseif ido == 1 then
                -- 5 Year Ban
                local sql = dbExec(con, "INSERT INTO bans SET accountID=?, bannedBy=?, timeZone=NOW() + INTERVAL 5 YEAR, Date=NOW(), playerSerial=?, reason=?, playername=?, ipadress=?, status=?", 
                    getElementData(targetPlayer, "acc:id"), getPlayerAdminName(thePlayer), getPlayerSerial(targetPlayer), reason, getElementData(targetPlayer,"acc:name"), getPlayerIP(targetPlayer), 1)
                if (sql) then
                    exports.san_kickban:showBoxS(root, getPlayerAdminName(thePlayer) .. "#ffffff Ban Kard (5 Years) #fff000Target: " .. targetPlayerName:gsub("_", " ") .. "", "Reason: " .. reason, "ban")
                    setTimer(function()
                        kickPlayer(targetPlayer, getPlayerAdminName(thePlayer), "Shoma 5 Sale Ban Shodid!")
                    end, 500, 1)
                end
            elseif ido > 1 then
                -- Hour-based Ban
                local sql = dbExec(con, "INSERT INTO bans SET accountID=?, bannedBy=?, timeZone=NOW() + INTERVAL " .. ido .. " HOUR, Date=NOW(), playerSerial=?, reason=?, playername=?, ipadress=?, status=?", 
                    getElementData(targetPlayer, "acc:id"), getPlayerAdminName(thePlayer), getPlayerSerial(targetPlayer), reason, getElementData(targetPlayer,"acc:name"), getPlayerIP(targetPlayer), 1)
                if (sql) then
                    exports.san_kickban:showBoxS(root, getPlayerAdminName(thePlayer) .. "#ffffff Ban Kard #fff000Target: " .. targetPlayerName:gsub("_", " ") .. "", "Reason: " .. reason, "ban")
                    setTimer(function()
                        kickPlayer(targetPlayer, getPlayerAdminName(thePlayer), "Shoma Az Server Ban Shodid!")
                    end, 500, 1)
                end
            else
                outputChatBox(error .. "Error: IDO Eshtebah Ast!", thePlayer, 255, 255, 255, true)
            end
        end
    end
end
addCommandHandler("ban", banPlayer, false, false)


function oBan(thePlayer, commandName, targetPlayer, ido, ...)
	if tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 2 then
	
		if not (targetPlayer) or not (ido) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Teljes_nev] [0 = 15év | 1 = 5év | 1> = X óra] [Indok]", thePlayer ,255, 255, 255, true)
		else
		
			local targetPlayer = targetPlayer:gsub("_", " ")
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")
			
			if targetPlayer then
				local qh = dbQuery(con, "SELECT * FROM characters WHERE charname='" .. targetPlayer .. "'")
				local result, num = dbPoll ( qh, -1 )
 
				if num == 0 then outputChatBox("#dc143c[Hiba]:#ffffff Não há tal resultado.", thePlayer, 255, 255, 255, true) return end
				if result then
					for _, row in ipairs ( result ) do
					
						id = tonumber(row["id"])
						accountid = tonumber(row["account"])
					
					end
					
					if (accountid) then
						local qh2 = dbQuery(con, "SELECT * FROM accounts WHERE id='" .. accountid .. "'")
						local result2 = dbPoll ( qh2, -1 )
						if result2 then
							for _2, row2 in ipairs ( result2 ) do
							
								admin = tonumber(row2["admin"])
								serial = row2["mtaserial"]
								ip = row2["ip"]
								username = row2["username"]
							
							end
							
							if (admin) > (getElementData(thePlayer, "acc:admin")) then
								outputChatBox(error .. "Você não tem autoridade para completar ".. targetPlayer .. " jogador. Código de erro: OBANAD", thePlayer, 255, 255, 255, true)
								return
							end
							
							if ido >= 0 then
							
								if ido == 0 then
									timeSave = "NOW() + INTERVAL 15 YEAR"
								elseif ido == 1 then
									timeSave = "NOW() + INTERVAL 5 YEAR"
								elseif ido > 1 then
									timeSave = "NOW() + INTERVAL " .. ido .. " HOUR"
								end
								
								local banSave = dbExec(con, "INSERT INTO bans SET accountID=?, bannedBy=?, timeZone=" .. timeSave .. ", Date=NOW(), playerSerial=?, reason=?, playername=?, ipadress=?, status=?", accountid, getPlayerAdminName(thePlayer), serial, reason, targetPlayer, ip, 1)
								local oldBan = dbExec(con, "INSERT INTO oldbans SET accountID=?, bannedBy=?, banEnd=" .. timeSave .. ", banStart=NOW(), playerSerial=?, reason=?, playername=?, ipadress=?, status=?", accountid, getPlayerAdminName(thePlayer), serial, reason, targetPlayer, ip, 2)
								if (banSave) then
								--	 exports.mta_notifications:createNotification(root, "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff kitiltotta a szerverről #7cc576" .. targetPlayer .. "#ffffff játékost.\n#7cc576Indok:#ffffff " .. reason, 6)
									dbFree(qh)
									dbFree(qh2)
								else
									outputChatBox(error .. "A proibição do jogador não teve sucesso.", thePlayer, 255, 255, 255, true)
								end
							end
						end
					end
				else
					outputChatBox(error .. "Nenhum resultado encontrado.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end
--addCommandHandler("oban", oBan, false, false)

function unBanPlayer(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 14 or import2[getPlayerSerial(thePlayer)] then
		
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name completo]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer = targetPlayer:gsub("_", " ")
			
			if (targetPlayer) then
			
				local qh = dbQuery(con, "SELECT * FROM bans WHERE playername='" .. targetPlayer.. "'")
				local result, num = dbPoll ( qh, -1 )
				
				if result and num>0 then
					for _, row in ipairs( result ) do
					
						accountid = tonumber(row["accountID"])
						bannedBy = row["bannedBy"]
						status = tonumber(row["status"])
					
					end
					
					if (accountid) then
						
						if getElementData(thePlayer, "acc:admin") < 6 then 
							if getPlayerAdminName(thePlayer) == bannedBy then
								local unban = dbExec(con, "DELETE FROM bans WHERE accountID=" .. accountid .. "")
								local oldBan = dbExec(con, "UPDATE oldbans SET status=? WHERE accountID=" .. accountid .. "", 1)
								if (unban) then
									outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Desbaniu " .. targetPlayer .. " banimento.")
								else
									outputChatBox(error .. "Não é possível Desbanir o player.", thePlayer, 255, 255, 255, true)
								end
							else
								outputChatBox(error .. "Você não tem permissão para Desbanir o jogador.", thePlayer, 255, 255, 255, true)
								return
							end
						else
							local unban = dbExec(con, "DELETE FROM bans WHERE accountID=" .. accountid .. "")
							local oldBan = dbExec(con, "UPDATE oldbans SET status=? WHERE accountID=" .. accountid .. "", 1)
							if (unban) then
								outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Desbaniu " .. targetPlayer .. " banimento.")
							else
								outputChatBox(error .. "Não é possível Desbanir o player.", thePlayer, 255, 255, 255, true)
							end
						end
					else
						outputChatBox(error .. "Nenhum resultado encontrado.", thePlayer, 255, 255, 255, true)
					end
					dbFree(qh)
				else
					outputChatBox(error .. "Nenhum resultado encontrado.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end
addCommandHandler("unban", unBanPlayer, false, false)
----------------------------------------------------------------------------------------------------------------------------------------
-- /setadminnick, /setadminlevel, /sethelperlevel -- ADMINISZTRÁTOR, ADMINSEGÉD KEZELÉSI PARANCSOK
----------------------------------------------------------------------------------------------------------------------------------------

function setAdminNick(thePlayer, commandName, target, name)
    if getElementData(thePlayer, "acc:admin") > 12 then
        if not (target) or not (name) then
            outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Player Name / ID] [New Admin Name]", thePlayer, 255, 255, 255, true)
        else
            local targetPlayer, targetPlayerName = exports["san_core"]:findPlayer(thePlayer, target)
            local adminName = table.concat({name}, " ")
            local theName = getPlayerAdminName(thePlayer) or ""
            local targetOldName = getPlayerAdminName(targetPlayer) or ""
            
            if not getElementData(targetPlayer, "loggedin") then return end

            if targetPlayer then
                -- Update admin name in database
                local sql = dbExec(con, "UPDATE characters SET anick='" .. adminName .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
                
                if sql then
                    setElementData(targetPlayer, "char:anick", adminName)
                    outputChatBox("#7cc576[IRG]: " .. theName .. "#ffffff Admin Name " .. targetOldName .. " Ra Taghir Dad. #7cc576(" .. targetOldName .. " >> " .. adminName .. ")", root, 255, 255, 255, true)
                else
                    outputChatBox("#ff0000Error: Admin Name Ra Nemishavad Update Kard!", thePlayer, 255, 0, 0, true)
                end
            end
        end
    else
        outputChatBox("#ff0000Shoma Dastresi Kafi Baraye In Command Ra Nadarin!", thePlayer, 255, 0, 0, true)
    end
end

addCommandHandler("setanick", setAdminNick, false, false)
addCommandHandler("setaname", setAdminNick, false, false)


function setAdminLevel(thePlayer, commandName, targetPlayerInput, rankInput)
    -- Barresi mojavez dastrasi modir
    if getElementData(thePlayer, "acc:admin") < 13 and not enabledSerials[getPlayerSerial(thePlayer)] then
        return
    end

    -- Barresi voroodi hay zaroori
    if not targetPlayerInput or not rankInput then
        outputChatBox("#7cc576use: #ffffff/" .. commandName .. " [Name / ID] [Level]", thePlayer, 255, 255, 255, true)
        return
    end

    -- Peida kardan bazikon hadaf
    local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayerInput)
    local rank = tonumber(rankInput)

    if not targetPlayer or not rank then
        outputChatBox("#7cc576Bazikon ya rotbe vared shode sahih nist.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Etebar sanji rotbe
    if rank < 0 or rank > 10 then
        outputChatBox("#7cc576Rotbe admin faghat bein 0 ta 10 ast.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Barresi vaziat login bazikon hadaf
    if not getElementData(targetPlayer, "loggedin") then
        outputChatBox("#7cc576Bazikon hadaf login nashode ast.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Gereftane rotbe ghabli
    local oldRank = getElementData(targetPlayer, "acc:admin")

    -- Barresi dastresi modir baraye taghir rotbe
    if rank < 7 and getElementData(targetPlayer, "acc:admin") >= 8 and getElementData(thePlayer, "acc:admin") < 10 and not enabledSerials[getPlayerSerial(thePlayer)] then
        outputChatBox("#7cc576Shoma mojavez taghir rotbe in bazikon nistid.", thePlayer, 255, 255, 255, true)
        return
    end

    if rank >= 7 and getElementData(thePlayer, "acc:admin") < 10 and not enabledSerials[getPlayerSerial(thePlayer)] then
        outputChatBox("#7cc576Shoma mojavez taghir rotbe bala tar az 7 nistid.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Be rooz resani database
    local sql = dbExec(con, "UPDATE accounts SET admin='" .. rank .. "' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")

    if not sql then
        outputChatBox("#7cc576Khatayi dar zakhire rotbe admin pish amad.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Taghir rotbe admin dar system
    setElementData(targetPlayer, "acc:admin", rank)
    outputChatBox("#7cc576" .. getPlayerAdminName(thePlayer) .. " rotbe admin " .. getPlayerAdminName(targetPlayer) .. " ra taghir dad. (" .. oldRank .. " >> " .. rank .. ")", root, 255, 255, 255, true)

    -- Dar soorat rotbe 0, hazf modiriat
    if rank == 0 then
        setElementData(targetPlayer, "char:aduty", 0)
        dbExec(con, "UPDATE characters SET adminduty='0' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
    end
end

addCommandHandler("setalevel", setAdminLevel, false, false)


function setHelperLevel(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 14 then
	
		if not (targetPlayer) or not (level) then
			if getElementData(thePlayer, "acc:admin") >= 8 then
				outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [0 = Retirar | 1 = Vip | 2 = Colaborador", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [0 = Retirar | 1 = Vip | 2 = Colaborador]", thePlayer, 255, 255, 255, true)
			end
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local level = tonumber(level)
			local oldLevel = getElementData(targetPlayer, "acc:aseged")
			
			if not getElementData(targetPlayer, "loggedin") then return end
			
			local admin = getPlayerAdminName(thePlayer)
			local adminID = getElementData(thePlayer, "acc:id")
			local targetID = getElementData(targetPlayer, "acc:id")
			local targetN = targetPlayerName
			
			if level < 0 or level > 2 then
				outputChatBox(error .. "Os níveis de Vip estão entre 0 e 2.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if level == 0 then
				if oldLevel == 2 then
					if getElementData(thePlayer, "acc:admin") >= 8 then
						local sql = dbExec(con, "UPDATE accounts SET aseged='" .. level .. "' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")
						if (sql) then
							outputChatBox("#FF00FF[IRG Premium]  #ffffffO jogador(a) #FF00FF" .. targetPlayerName:gsub("_", " ") .. "#ffffff não é mas um Jogador #FF00FFVip#ffffff.", root, 255, 255, 255, true)
							setElementData(targetPlayer, "acc:aseged", level)
						else
							outputChatBox(error .. "Não foi possível alterar o nível de administrador do jogador.", thePlayer, 255, 255, 255, true)

						end
					else
						outputChatBox(error .. "Você não tem autoridade para levar o nível de administrador do jogador.", thePlayer, 255, 255, 255, true)
					end
				else
					local sql = dbExec(con, "UPDATE accounts SET aseged='" .. level .. "' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")
					if (sql) then
						outputChatBox("#FF00FF[IRG Premium] #ffffffO jogador(a) #FF00FF" .. targetPlayerName:gsub("_", " ") .. "#ffffff Não é mas um Jogador #FF00FFVip#ffffff.", root, 255, 255, 255, true)
						setElementData(targetPlayer, "acc:aseged", level)
					else
						outputChatBox(error .. "Não foi possível alterar o nível de administrador do jogador.", thePlayer, 255, 255, 255, true)
					end
				end
			elseif level == 1 then
				if oldLevel == 2 then
					if getElementData(thePlayer, "acc:admin") >= 8 then
						local sql = dbExec(con, "UPDATE accounts SET aseged='" .. level .. "' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")
						if (sql) then
							outputChatBox("#FF00FF[IRG Premium]  #ffffffO jogador(a) #FF00FF" .. targetPlayerName:gsub("_", " ") .. "#ffffff Virou um(a) #FF00FFVip#ffffff.", root, 255, 255, 255, true)
							setElementData(targetPlayer, "acc:aseged", level)
							dbExec(con, "UPDATE accounts SET aseged='0' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")
						else
							outputChatBox(error .. "Não foi possível alterar o nível de Vip do jogador.", thePlayer, 255, 255, 255, true)
						end
					else
						outputChatBox(error .. "Você não tem autoridade para elevar o nível de Vip do jogador.", thePlayer, 255, 255, 255, true)

					end
				else
					outputChatBox("#FF00FF[IRG Premium] #ffffffO jogador(a) #FF00FF" .. targetPlayerName:gsub("_", " ") .. "#ffffff Virou um(a) #FF00FFVip#ffffff.", root, 255, 255, 255, true)
					setElementData(targetPlayer, "acc:aseged", level)
				end
			elseif level == 2 then
				if getElementData(thePlayer, "acc:admin") >= 7 then
					local sql = dbExec(con, "UPDATE accounts SET aseged='" .. level .. "' WHERE id='" .. getElementData(targetPlayer, "acc:id") .. "'")
					if (sql) then
						outputChatBox("#FF00FF[IRG Premium] #ffffffO jogador(a) #FF00FF" .. targetPlayerName:gsub("_", " ") .. "#ffffff Virou um(a) #FF00FFColaborador Vip#ffffff.", root, 255, 255, 255, true)
						setElementData(targetPlayer, "acc:aseged", level)
					else
						outputChatBox(error .. "Não foi possível alterar o nível de administrador do jogador.", thePlayer, 255, 255, 255, true)
					end
				else
					outputChatBox(error .. "Você não tem autoridade para alterar o nível de administração do jogador para 2.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end
addCommandHandler("sethlevel", setHelperLevel, false, false)

function privateMessage(thePlayer, commandName, targetPlayerInput, ...)
    -- Barresi inke bazikon login ast ya kheyr
    if not getElementData(thePlayer, "loggedin") then
        outputChatBox("Nao permitido", thePlayer)
        return
    end

    -- Barresi voroodi hay zaroori
    if not targetPlayerInput or not (...) then
        outputChatBox("#7cc576use: #ffffff/" .. commandName .. " [Name / ID] [message]", thePlayer, 255, 255, 255, true)
        return
    end

    -- Peida kardan bazikon hadaf
    local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayerInput)
    if not targetPlayer then
        outputChatBox("#ff9000[PM]#ffffff Bazikon hadaf peida nashod.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Etebar sanji PM
    if getElementData(targetPlayer, "pmbloq") then
        outputChatBox("#ff9000[PM]#ffffff PM in bazikon ghofl shode ast.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Mohasebe message va etelaate bazikonan
    local message = table.concat({...}, " ")
    local playerName = getPlayerName(thePlayer):gsub("_", " ")
    local targetName = targetPlayerName:gsub("_", " ")
    local playerID = getElementData(thePlayer, "playerid")
    local targetID = getElementData(targetPlayer, "playerid")

    -- PM be bazikonan
    outputChatBox("#ff9000[PM - Ersal shode]#ffffff " .. targetName .. " (#ffffff" .. targetID .. "):#ff9000 " .. message, thePlayer, 255, 255, 255, true)
    outputChatBox("#ff9000[PM - Baraye shoma]#ffffff " .. playerName .. " (#ffffff" .. playerID .. "):#ff9000 " .. message, targetPlayer, 255, 255, 255, true)

    -- Event haye marbot be client
    triggerClientEvent(thePlayer, "enter", thePlayer)
    triggerClientEvent(targetPlayer, "privatUzenetErkezett", targetPlayer)
end
addCommandHandler("pm", privateMessage, false, false)



function bloquearpm(thePlayer)
	if not getElementData(thePlayer, "loggedin") then
		outputChatBox("não permitido", thePlayer)
		return
	end
	
	if getElementData(thePlayer, "pmbloq") == false then
		outputChatBox("#ff9000[PM]#ffffff PM BLOQUEADO.", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "pmbloq", true)
	
	elseif getElementData(thePlayer, "pmbloq") == true then
		outputChatBox("#ff9000[PM]#ffffff PM DESBLOQUEADO.", thePlayer, 255, 255, 255, true)
		setElementData(thePlayer, "pmbloq", false)

	end	
end
addCommandHandler("bloquearpm", bloquearpm, false, false)
addCommandHandler("bloqpm", bloquearpm, false, false)

function desbloquearpm(thePlayer, commandName, targetPlayer)
	local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 7 then
		if not (targetPlayer) then
				outputChatBox("#7cc576HUse: #ffffff/" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
			else
			if getElementData(targetPlayer, "pmbloq") == false then
				outputChatBox("#ff9000[PM]#ffffff PM do jogador(a) #ff9000".. getPlayerName(targetPlayer) .. "#ffffff bloqueado.", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff9000[PM]#ffffff O Administrador #ff9000".. getPlayerName(thePlayer) .. " #ffffffbloqueou o seu Pm.", targetPlayer, 255, 255, 255, true)
				setElementData(targetPlayer, "pmbloq", true)
	
			elseif getElementData(targetPlayer, "pmbloq") == true then
				outputChatBox("#ff9000[PM]#ffffff PM do jogador(a) #ff9000".. getPlayerName(targetPlayer) .. " #ffffffdesbloqueado.", thePlayer, 255, 255, 255, true)
				outputChatBox("#ff9000[PM]#ffffff O Administrador #ff9000".. getPlayerName(thePlayer) .. " #ffffffdesbloqueou o seu Pm.", targetPlayer, 255, 255, 255, true)
				setElementData(targetPlayer, "pmbloq", false)
			end	
		end
	end
end
addCommandHandler("desbloquearpm", desbloquearpm, false, false)



function valasz(thePlayer, commandName, targetPlayer, ...)
	if getElementData(thePlayer, "acc:admin") >= 1 then
	
		if not (targetPlayer) or not (...) then
			outputChatBox("#7cc576HUse: #ffffff/" .. commandName .. " [Name / ID] [mensagem]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local message = table.concat({...}, " ")
			local adminName = getPlayerAdminName(thePlayer)
			
			if (targetPlayer) then
			
				if getElementData(thePlayer, "acc:admin") > 0 then
					outputChatBox("#ff9000[ajudar]#ffffff " .. getPlayerAdminName(thePlayer) .. " (#ffffff" .. getElementData(thePlayer, "playerid") .. "#ffffff):#ffffff " .. message, targetPlayer, 255, 255, 255, true)
					outputChatBox("#ff9000[ajudar => #ffffff" .. targetPlayerName:gsub("_", " ") .. " (#ffffff" .. getElementData(targetPlayer, "playerid") .. "#ffffff)#ff9000]:#ffffff " .. message, thePlayer, 255, 255, 255, true)
					
					
					for k, v in ipairs(getElementsByType("player")) do
						if tonumber(getElementData(v, "acc:admin") or 0) >= 1 and getElementData(v, "loggedin") then
							if getElementData(v, "status:togva") == false then
								outputChatBox("#D64541[assistência] #7cc576"..getPlayerAdminName(thePlayer) .. "#ffffff válaszolt #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff játékosnak.", v, 255, 255, 255, true)
								outputChatBox("#D64541[assistência] #7cc576Szöveg: #ffffff" .. message, v, 255, 255, 255, true)
							end
						end
					end
					
					triggerClientEvent(thePlayer, "enter", thePlayer)
				elseif getElementData(thePlayer, "acc:aseged") > 0 then
					outputChatBox("#ff9000[ajudar]#ffffff " .. getPlayerName(thePlayer):gsub("_", " ") .. " (#ffffff" .. getElementData(thePlayer, "playerid") .. "#ffffff):#ffffff " .. message, targetPlayer, 255, 255, 255, true)
					outputChatBox("#ff9000[ajudar => " .. targetPlayerName:gsub("_", " ") .. " (#ffffff" .. getElementData(targetPlayer, "playerid") .. "#ffffff)#ff9000]:#ffffff " .. message, thePlayer, 255, 255, 255, true)
					
					for k, v in ipairs(getElementsByType("player")) do
						if tonumber(getElementData(v, "acc:admin") or 0) >= 1 and getElementData(v, "loggedin") then
							if not getElementData(v, "status:togva") then
								outputChatBox("#D64541[assistência] #7cc576"..getPlayerName(thePlayer):gsub("_"," ") .. "#ffffff resposta #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff játékosnak.", v, 255, 255, 255, true)
								outputChatBox("#D64541[assistência] #7cc576Szöveg: #ffffff" .. message, v, 255, 255, 255, true)
							end
						end
					end
					
					triggerClientEvent(thePlayer, "enter", thePlayer)
				end
			end
		end
	end
end
--addCommandHandler("vá", valasz, false, false)

function togValaszolasok(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >= 8 then
	
		local allapot = getElementData(thePlayer, "status:togva")
		
		if allapot == false then
			outputChatBox("Você desligou o #7cc576/vá#ffffff Lista de Comandos.", thePlayer, 255, 255, 255, true)
			setElementData(thePlayer, "status:togva", 1)
		else
			outputChatBox("Você ligou o #7cc576/vá#ffffff Lista de Comandos.", thePlayer, 255, 255, 255, true)
			setElementData(thePlayer, "status:togva", false)
		end
	end
end
addCommandHandler("togvá", togValaszolasok, false, false)

-----------------------------[SET COLOR]---------------------------------
function setColor(player, commandName, r1, g1, b1, r2, g2, b2)
    -- Barresi dastresi admin
    if getElementData(player, "acc:admin") > 8 then

        -- Barresi voroodi hay zaroori
        if not (r1) or not (g1) or not (b1) then
            outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [R] [G] [B]", player, 255, 255, 255, true)
            return
        end

        -- Peida kardan vasile naqliye dar hal estefade
        local veh = getPedOccupiedVehicle(player)
        if veh then
            local r1, g1, b1 = tonumber(r1), tonumber(g1), tonumber(b1)
            local r2, g2, b2 = tonumber(r2) or 0, tonumber(g2) or 0, tonumber(b2) or 0

            -- Taghir rang vasile naqliye
            local colorSet = setVehicleColor(veh, r1, g1, b1, r2, g2, b2)
            local sql = dbQuery(con, "UPDATE vehicle SET color=? WHERE id=?", toJSON({r1, g1, b1, r2, g2, b2}), getElementData(veh, "veh:id"))
            dbFree(sql)

            -- Barresi natije
            if colorSet and sql then
                outputChatBox("#7cc576Shoma be movafaghiat rang vasile naqliye ra taghir dadid.", player, 255, 255, 255, true)
                outputAdminMessage(getPlayerAdminName(player) .. " rang " .. getVehicleName(veh) .. " ra taghir dad. (ID: " .. getElementData(veh, "veh:id") .. ")")
            else
                outputChatBox("#ff0000Nemisha rang vasile ra taghir dad.", player, 255, 194, 14, true)
            end
        else
            outputChatBox("#ff0000Shoma bayad dar yek vasile naqliye bashid.", player, 255, 194, 14, true)
        end
    else
        outputChatBox("#ff0000Shoma mojavez estefade az in dastoor nistid.", player, 255, 194, 14, true)
    end
end
addCommandHandler("setcolor", setColor, false, false)


----------------------------------------------------------------------------------------------------------------------------------------
-- /ir, /trazer, /irv, /trazerv, /repararv, /setgasolina, /setvida, /setcolete, /setfome, /setskin, /setdim, /setint, /setvehint, /setvehdim, /ajail, /unjail -- ADMINISZTRÁTORI PARANCSOK
----------------------------------------------------------------------------------------------------------------------------------------

local pendingRequests = {} -- Table to store pending teleport requests

function gotoPlayer(thePlayer, commandName, targetPlayerInput)
    -- Barresi dastresi admin
    if getElementData(thePlayer, "acc:admin") < 1 then
        return
    end

    -- Barresi voroodi zaroori
    if not targetPlayerInput then
        outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
        return
    end

    -- Peida kardan bazikon hadaf
    local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayerInput)
    if not targetPlayer or not getElementData(targetPlayer, "loggedin") then
        outputChatBox("#ff0000Player dar shahr nist!", thePlayer, 255, 255, 255, true)
        return
    end

    -- Barresi level admin
    local sourceAdminLVL = getElementData(thePlayer, "acc:admin") or 0
    local targetAdminLVL = getElementData(targetPlayer, "acc:admin") or 0

    if sourceAdminLVL <= targetAdminLVL then
        -- Permission request
        pendingRequests[targetPlayer] = thePlayer
        outputChatBox("#ff9000" .. getPlayerName(thePlayer) .. " mikhad ro shoma teleport kone! Bezanid /ok ta ejaze bedid.", targetPlayer, 255, 255, 255, true)
        outputChatBox("#ff9000Darkhaste shoma ersal shod, montazer bashid ta target ejaze bede.", thePlayer, 255, 255, 255, true)
        return
    end

    -- Mohasebe teleport
    performTeleport(thePlayer, targetPlayer)
end

function performTeleport(thePlayer, targetPlayer)
    local x, y, z = getElementPosition(targetPlayer)
    local veh = getPedOccupiedVehicle(thePlayer)
    local teleport = false

    if veh then
        teleport = setElementPosition(veh, x, y + 1, z)
    else
        teleport = setElementPosition(thePlayer, x, y + 1, z)
    end

    if teleport then
        setElementInterior(thePlayer, getElementInterior(targetPlayer))
        setElementDimension(thePlayer, getElementDimension(targetPlayer))
        outputChatBox("#ffffffShoma teleport kardi ro #7cc576" .. getPlayerName(targetPlayer):gsub("_", " ") .. "#ffffff.", thePlayer, 255, 255, 255, true)
        outputChatBox("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff teleport kard ro shoma.", targetPlayer, 255, 255, 255, true)

        -- Log baraye admins
        exports.irg_logs:createLog("GOTO", getPlayerAdminName(thePlayer, true) .. " teleport kard ro " .. getPlayerName(targetPlayer):gsub("_", " "), thePlayer, targetPlayer)
        for _, v in ipairs(getElementsByType("player")) do
            if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v, "acc:admin") or 0) == 10 then
                outputChatBox("#7cc576[IRG - LOG]:#ffffff " .. getPlayerName(thePlayer) .. " az CMD /goto estefadeh kard #fff000Target: " .. getPlayerName(targetPlayer), v, 255, 255, 255, true)
            end
        end
    else
        outputChatBox("#ff0000Shoma nemitooni ro player teleport koni!", thePlayer, 255, 255, 255, true)
    end
end

function approveTeleport(targetPlayer)
    local requester = pendingRequests[targetPlayer]
    if not requester or not isElement(requester) then
        outputChatBox("#ff0000Hich darkhasti baraye shoma mojood nist.", targetPlayer, 255, 255, 255, true)
        return
    end

    pendingRequests[targetPlayer] = nil
    performTeleport(requester, targetPlayer)
end
addCommandHandler("ok", approveTeleport)

addCommandHandler("goto", gotoPlayer, false, false)


function SgotoPlayer(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 14 or import2[getPlayerSerial(thePlayer)]then
		
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local x, y, z = getElementPosition(targetPlayer)
			local veh = getPedOccupiedVehicle(thePlayer)
			
			if getElementData(targetPlayer, "loggedin") then
			
				if isPedInVehicle(thePlayer) then
					teleport = setElementPosition(veh, x, y+1, z)
				else
					teleport = setElementPosition(thePlayer, x, y+1, z)
				end
				
				if (teleport) then
					setElementInterior(thePlayer, getElementInterior(targetPlayer))
					setElementDimension(thePlayer, getElementDimension(targetPlayer))
					outputChatBox("#ffffffVocê se teleportou com sucesso #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff jogador. #dc143c(Secret)", thePlayer, 255, 255, 255, true)
					--outputAdminMessage("#7cc576"..getPlayerAdminName(thePlayer) .. "#ffffff secretamente deportado " .. targetPlayerName:gsub("_"," ") .. " jogador.")
					--outputChatBox(" #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff teleportado para você.", targetPlayer, 255, 255, 255, true)
				else
					outputChatBox(error .. "Shoma Nemitoni Ro Player Teleport Koni!.", thePlayer, 255, 255, 255, true)
				end
			else
				outputChatBox(error .. "Player Dar Shahr Nist.", thePlayer ,255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("go", SgotoPlayer, false, false)

function getPlayerHere(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >=1 then
	
		
		if not (targetPlayer) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local x, y, z = getElementPosition(thePlayer)
			
			if getElementData(targetPlayer, "loggedin") == true then
		
		
			local sourceAdminLVL = getElementData( thePlayer , "acc:admin") or 0
				local targetAdminLVL = getElementData( targetPlayer , "acc:admin") or 0
				if sourceAdminLVL <= targetAdminLVL then
					outputChatBox(error .. "Nmitoni Rank Bala GetHere Kuni!", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Mikhast Shoma Ro Gethere Kone!", targetPlayer, 255, 255, 255, true)
					return false
				
				
				end
			
		
		
		
		
		
		
		
		
		
		
		
			
				if getElementData(targetPlayer, "adminjail") == 1 and getElementData(thePlayer, "acc:admin") < 9 then
					outputChatBox(error .. "Player Dar Jail Ast.", thePlayer, 255, 255, 255, true)
					return
				end
				
				if isPedInVehicle(targetPlayer) then
					local veh = getPedOccupiedVehicle(targetPlayer)
					teleport = setElementPosition(veh, x, y+1, z)
				else
					teleport = setElementPosition(targetPlayer, x, y+1, z)
				end
			
			
			
			
			
			
			
			
			
			
				if (teleport) then
			
	
				
				
					setElementInterior(targetPlayer, getElementInterior(thePlayer))
					setElementDimension(targetPlayer, getElementDimension(thePlayer))
					outputChatBox("Shoma #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Ra Pish Khod Teleport Kardi.", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Shoma Ro Pish Khod Get Dad.", targetPlayer, 255, 255, 255, true)
					exports.irg_logs:createLog("GETHERE",getPlayerAdminName(thePlayer,true).." Get Here Kard " ..targetPlayerName:gsub("_"," ").." Ra",thePlayer,targetPlayer);


					
for k,v in ipairs(getElementsByType("player")) do
	if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) == 14 then
	outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(thePlayer).." Az CMD /gethere Estefadeh Kard #fff000Target: "..targetPlayerName.." ",v,255,255,255,true)
end
end


				else
					outputChatBox(error .. "Natonesti Player Ra Pish Khodet Biyari.", thePlayer, 255, 255, 255, true)		
				end
			else
				outputChatBox(error .. "Player Dar Shahr Nist.", thePlayer ,255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("gethere", getPlayerHere, false, false)

function gotoCar(thePlayer, commandName, id)
	if getElementData(thePlayer, "acc:admin") >= 2 then
		
		if not (id) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [ID do veículo]", thePlayer, 255, 255, 255, true)
		else
			
			local veh = findVehicle(id)
			local x, y, z = getElementPosition(veh)
			
			if not veh then
				outputChatBox(error .. "ID do veículo incorreto.", thePlayer, 255, 255, 255, true)
				return
			end
			
			local teleport = setElementPosition(thePlayer, x+2, y+2, z)
			local int = getElementInterior(veh)
			local dim = getElementDimension(veh)
			if getElementDimension(veh) >= 100000 then return end
			
			if (teleport) then
				setElementInterior(thePlayer, int)
				setElementDimension(thePlayer, dim)
				outputChatBox(rovid.." #ffffffVocê conseguiu transportar o veículo com sucesso. (ID: #7cc576" .. id .. "#ffffff)", thePlayer, 255, 255, 255, true)

				for k,v in ipairs(getElementsByType("player")) do
					if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) == 10 then
					outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(thePlayer).." Az CMD /irveiculo para ir até o veiculo "..id.." ",v,255,255,255,true)
				end
			end

			else
				outputChatBox(error .. "Incapaz de se teletransportar para o veículo.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("gotocar", gotoCar, false, false)
addCommandHandler("irveiculo", gotoCar, false, false)


function getCar(thePlayer, commandName, id)
	if getElementData(thePlayer, "acc:admin") >= 3 then
		
		if not (id) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [ID do veículo]", thePlayer, 255, 255, 255, true)
		else
			
			local veh = findVehicle(id)
			
			if not veh then
				outputChatBox(error .. "ID do veículo incorreto.", thePlayer, 255, 255, 255, true)
				return
			end
			
			local x, y, z = getElementPosition(thePlayer)
			local int = getElementInterior(thePlayer)
			local dim = getElementDimension(thePlayer)
			if getElementDimension(veh) >= 100000 then return end
			local teleport = setElementPosition(veh, x+2, y+2, z+1)
			
			if (teleport) then
				setElementInterior(veh, int)
				setElementDimension(veh, dim)
				outputChatBox(rovid.." #ffffffO veículo foi teleportado com sucesso para você. (ID: #7cc576" .. id .. "#ffffff)", thePlayer, 255, 255, 255, true)


			for k,v in ipairs(getElementsByType("player")) do
					if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) == 10 then
					outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(thePlayer).." Az CMD /trazerveiculo para puxar o veiculo "..id.." ",v,255,255,255,true)
				end
			end


			else
				outputChatBox(error .. "Falha ao teletransportar o veículo para si mesmo. Código de erro GETCAR 1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("getcar", getCar, false, false)
addCommandHandler("getveh", getCar, false, false)
addCommandHandler("trazerveiculo", getCar, false, false)

addCommandHandler( "gotopos", 
    function( player, commandName, x, y, z ) 
		if getElementData(player, "acc:admin") >= 8 then
        setElementPosition( player, x, y, z ) -- teleport player to the centre of SA 
    end 
end
) 

function fixPlayerVehicle(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >=1 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local adminduty = getElementData(thePlayer, "char:adminduty")
			local alevel = getElementData(thePlayer, "acc:admin")
			local veh = getPedOccupiedVehicle(targetPlayer)
			
				if not targetPlayer or not getElementData(targetPlayer, "loggedin") then return end
			
			if veh then
				if (adminduty) == 0 then
					if (alevel) >= 6 then
						fixVehicle(veh)
       					setVehicleDamageProof (veh, false ) 
						triggerClientEvent(root, "setvehicleCompVisible", root, targetPlayer)
						outputChatBox("#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff Vasile Naghliye Shoma Ra Tamir Kard. ", targetPlayer, 255, 255, 255, true)
						outputChatBox(rovid.." Vasile Naghliye #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff Fix Shod.", thePlayer, 255, 255, 255, true)
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Tamir Kard Vasile Naghliye #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Ra")
					else
						--outputChatBox(error .. "Shoma Nemitoni Az CMD F", thePlayer, 255, 255, 255, true)
					end
				else
					triggerClientEvent(root, "setvehicleCompVisible", root, targetPlayer)
					fixVehicle(veh)
				      setVehicleDamageProof (veh, false ) 
					outputChatBox("#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff Vasile Naghliye Shoma Ra Tamir Kard. ", targetPlayer, 255, 255, 255, true)
					outputChatBox(rovid .." Consertado com sucesso #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff veículo.", thePlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff reparado #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff veículo.")
				    exports.irg_logs:createLog("FixVeh",getPlayerAdminName(thePlayer,true).." Mashin " ..targetPlayerName:gsub("_"," ").." Ra Fix Kard ",thePlayer,targetPlayer);
				end
			else
				--outputChatBox(error .. "O jogador não está no veículo.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("fixveh", fixPlayerVehicle, false, false)
addCommandHandler("fix", fixPlayerVehicle, false, false)

function setVehicleHealth(thePlayer, commandName, targetPlayer, health)
	if getElementData(thePlayer, "acc:admin") >= 13 then

		if not (targetPlayer) or not (health) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [Nível]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local health = tonumber(health)
			local veh = getPedOccupiedVehicle(targetPlayer)
			
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			if health < 0 or health > 1000 then
				outputChatBox(error .. "O nível só pode estar entre 0 e 1000.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if getElementData(thePlayer, "acc:admin") < 9 and getElementData(thePlayer, "char:adminduty") == 0 then
				outputChatBox(error .. "Você não tem autoridade para alterar o status do veículo de um jogador fora do jogo.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if not (veh) then
				outputChatBox(error .. "O jogador não está no veículo.", thePlayer, 255, 255, 255, true)
			else
				local sql = dbExec(con, "UPDATE vehicle SET hp='" .. health .. "' WHERE id='" .. getElementData(veh, "veh:id") .. "'")
				if (sql) then
					setElementHealth(veh, health)
					outputChatBox("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou a condição do seu veículo. (" .. health .. ")", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudado #3399FF" .. targetPlayerName:gsub("_"," ") .. " #ffffffo estado do seu veículo. #7cc576F(" .. health .. ")")
				else
					outputChatBox(error .. "Não foi possível alterar o status dos veículos do jogador.", thePlayer, 255, 255, 255, true)
				end
			end
		end
	end
end
addCommandHandler("sethpveh", setVehicleHealth, false, false)

function fuelPlayerVehicle(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >=8 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc586Use: #ffffff/" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local adminduty = getElementData(thePlayer, "char:adminduty")
			local alevel = getElementData(thePlayer, "acc:admin")
			local veh = getPedOccupiedVehicle(targetPlayer)
			
				if not getElementData(targetPlayer, "loggedin") then return end
				if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			if isPedInVehicle(targetPlayer) then
			
				if (adminduty) == 0 then
					if (alevel) >= 6 then
						setElementData(veh, "veh:fuel", 100)
						outputChatBox("#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff abasteceu seu veículo. ", targetPlayer, 255, 255, 255, true)
						outputChatBox("Você abasteceu #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff veículo.", thePlayer, 255, 255, 255, true)
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff abasteceu #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffveículo.")
					else
						outputChatBox(error .. "Você não tem permissão para fechar o veículo fora da admissão.", thePlayer, 255, 255, 255, true)
					end
				else
					setElementData(veh, "veh:fuel", 100)
					outputChatBox("#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff abasteceu seu veículo. ", targetPlayer, 255, 255, 255, true)
					outputChatBox("Você abasteceu #7cc576" .. targetPlayerName:gsub("_", " ") .. "#ffffff veículo.", thePlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff abasteceu #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff veículo")
				end
				
			else
				outputChatBox(error .. "O jogador não está no veículo.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("fuelveh", fuelPlayerVehicle, false, false)

function setPlayerHealth(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 3 then

		if not (targetPlayer) or not (level) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Amount]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			
								local sourceAdminLVL = getElementData( thePlayer , "acc:admin") or 0
				local targetAdminLVL = getElementData( targetPlayer , "acc:admin") or 0
				if sourceAdminLVL < targetAdminLVL then
					outputChatBox(error .. "Nmitoni Rank Bala Meghdar HP Taghir Bdi!.", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Mikhast HP Shoma Ro Taghir Bde!", targetPlayer, 255, 255, 255, true)
					return false
					end
			
			
			
			
			local level = tonumber(level)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			
			if (level) < 0 or (level) > 100 then
				outputChatBox(error .. "Faghat Meghdar 0 Ta 100!", thePlayer, 255, 255, 255, true)
				return false
			end
			
			local setHealth = setElementHealth(targetPlayer, level)
			
			if (setHealth) then
			    setElementData(targetPlayer, "playerFallen", false)
				triggerClientEvent(targetPlayer, "stopDeadTime", targetPlayer)
				outputChatBox(info .. "Shoma HP #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffRa Taghir Dadi.#ffffff Amount: (" .. level .. ")", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Meghdar HP Ra Taghir Dad. #fff000Target: #7cc576" .. targetPlayerName:gsub("_"," ") .. "   #000fffMeghdar: #ffffff(" .. level .. ")")
				exports.irg_logs:createLog("SETHP",getPlayerAdminName(thePlayer,true).." Taghir Dad HP " ..targetPlayerName:gsub("_"," ").." Ra Be ("..level.."%"..")",thePlayer,targetPlayer);
				
			else
				outputChatBox(error .. "Shoma Nemitavanid Sathe HP " .. targetPlayerName:gsub("_"," ") .. "Taghir Dahid", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("sethp", setPlayerHealth, false, false)

function setPlayerLevel(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 14 then



		if not (targetPlayer) or not (level) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Valor]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
		
			local level = tonumber(level)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			
			
		
			
			
			
			
			
			if (level) < 0 or (level) > 100 then
				outputChatBox(error .. "Faghat Meghdar 0 Ta 100.", thePlayer, 255, 255, 255, true)
				return false
			end
			
			local setLevel = setElementData(targetPlayer, "Sys:Level", level)
			
			if (setLevel) then
				outputChatBox(info .. "Shoma Level #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Ra Taghir Dadi.#fff000Level: (" .. level .. ")", thePlayer, 255, 255, 255, true)
				--outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff alterou o level de #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffpara: (" .. level .. ")")
			else
				outputChatBox(error .. "Shoma Nemitoni Level " .. targetPlayerName:gsub("_"," ") .. "Taghir Bedi!", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setlevel", setPlayerLevel, false, false)

function setPlayerArmorLevel(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 9 then

		if not (targetPlayer) or not (level) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Nível de armadura]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local level = tonumber(level)	
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end			
			
			
			if (level) > 100 then
				outputChatBox(error .. "Faghat Meghdar 0 Ta 100.", thePlayer, 255, 255, 255, true)
				return false
			end
			
			local setArmor = setPedArmor(targetPlayer, level)
			
			if (setArmor) then
				outputChatBox(info .. "Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff nível de armadura. (" .. level .. ")", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudado #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff nível de armadura. (" .. level .. ")")
			else
				outputChatBox(error .. "Não foi possível alterar " .. targetPlayerName:gsub("_"," ") .. " páncél szintjét. Hibakód: SARMOR1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setarmor", setPlayerArmorLevel, false, false)

function setPlayerHungerLevel(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 2 then

		if not (targetPlayer) or not (level) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Fome]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local level = tonumber(level)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end			
			
			
			if (level) > 100 then
				outputChatBox(error .. "Faghat Meghdar 0 Ta 100.", thePlayer, 255, 255, 255, true)
				return false
			end
			
			local setHunger = setElementData(targetPlayer, "char:hunger", level)
			
			if (setHunger) then
				outputChatBox(info .. "Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff níveis de fome. (" .. level .. ")", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffffmudado #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff níveis de fome. (" .. level .. ")")
			else
				outputChatBox(error .. "Não foi possível alterar " .. targetPlayerName:gsub("_"," ") .. " éhségszintjét. Hibakód: SHUNGER1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setfood", setPlayerHungerLevel, false, false)

function setName(thePlayer, commandName, targetPlayer, ...)
	if getElementData(thePlayer, "acc:admin") >= 10 then
	
		if not (targetPlayer) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Novo Name]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local newName = table.concat({...}, "_")
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
				if not getElementData(targetPlayer, "loggedin") then return end
			
			local qh = dbQuery(con, "SELECT * FROM characters WHERE charname='" .. newName:gsub("_", " ") .. "'")
			local result, num = dbPoll(qh, -1)
			if num>0 then
				outputChatBox(error .. "Este Name já está em uso.", thePlayer, 255, 255, 255, true)
				return
			end
			
			local sql = dbExec(con, "UPDATE characters SET charname='" .. newName:gsub("_"," ") .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
			
			
			if (sql) then
				outputChatBox(info .. "Você mudou com sucesso " .. targetPlayerName:gsub("_"," ") .. " Name. (" .. newName .. ")", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffpara #7cc576(" .. newName .. ")")
				setPlayerName(targetPlayer, newName)
				local newNameS = newName:gsub("_"," ")
				setElementData(targetPlayer, "char:charname", newName)
				setElementData(targetPlayer, "char:name", newNameS)
				setElementData(targetPlayer, "char:oldName", newName)
			else
			
			end
		end
	end
end
addCommandHandler("changename", setName, false, false)

function setElementModelfunction(thePlayer, commandName, targetPlayer, skin)
	if getElementData(thePlayer, "acc:admin") >= 4 then
		
		if not (targetPlayer) or not (skin) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [ID da skin]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local skin = tonumber(skin)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			if getElementModel(targetPlayer) == skin then
				outputChatBox(error .. "O jogador já tem essa skin.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if setElementModel(targetPlayer, skin) then
				outputChatBox("Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Skin.", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudado #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffSkin.#ffffff (" .. skin .. ")")
				--dbExec(con, "UPDATE characters SET skin = ? WHERE ID = ?",skin,getElementData(targetPlayer, "acc:id"))
			else
				outputChatBox(error .. "Não foi possível alterar #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Skin. O código de erro: SSKIN1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setpskin", setElementModelfunction, false, false)



function setElementModelfunction(thePlayer, commandName, targetPlayer, skin)
	if getElementData(thePlayer, "acc:admin") >= 6 then
		
		if not (targetPlayer) or not (skin) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [ID da skin]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local skin = tonumber(skin)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			local skinset = getElementData(thePlayer,skin)
			if getElementModel(targetPlayer) == skin then
				
				outputChatBox(error .. "O jogador já tem essa skin.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if setElementModel(targetPlayer, skin) then
				setElementData(thePlayer,"char:skin",skin)
				outputChatBox("Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Skin.", thePlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudado #7cc576" .. targetPlayerName:gsub("_"," ") .. " #ffffffSkin.#ffffff (" .. skin .. ")")
				dbExec(con, "UPDATE characters SET skin = ? WHERE ID = ?",skin,getElementData(targetPlayer, "acc:id"))
			else
				outputChatBox(error .. "Não foi possível alterar #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Skin. O código de erro: SSKIN1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setffskin", setElementModelfunction, false, false)


function setDim(thePlayer, commandName, targetPlayer, value)
	if getElementData(thePlayer, "acc:admin") >= 14 then
	
		if not (targetPlayer) or not (value) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [ID da dimensão]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local dim = tonumber(value)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
		
			if setElementDimension(targetPlayer, dim) then
				outputChatBox(info .. "Você mudou com sucesso " .. targetPlayerName:gsub("_"," ") .. " dimensão. (" .. dim .. ")", thePlayer, 255, 255, 255, true)
				outputChatBox(" #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou sua dimensão. (" .. dim .. ")", targetPlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setdim", setDim, false, false)

function setInt(thePlayer, commandName, targetPlayer, value)
	if getElementData(thePlayer, "acc:admin") >= 14 then
	
		if not (targetPlayer) or not (value) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [ID da dimensão]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local value = tonumber(value)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
		
			if setElementInterior(targetPlayer, value) then
				outputChatBox(info .. "Você mudou com sucesso " .. targetPlayerName:gsub("_"," ") .. " interior. (" .. value .. ")", thePlayer, 255, 255, 255, true)
  				outputChatBox(" #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou o interior. (" .. value .. ")", targetPlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setint", setInt, false, false)

function setVehDim(thePlayer, commandName, id, value)
	if getElementData(thePlayer, "acc:admin") >=8 then
	
		if not (id) or not (value) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [ID] [Dimension ID]", thePlayer, 255, 255, 255, true)
		else
		
			local veh = findVehicle(id)
			local dim = tonumber(value)
		
			if setElementDimension(veh, dim) then
				outputChatBox(info .. "Você mudou com sucesso " .. id .. " dimensão. (" .. dim .. ")", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setvehdim", setVehDim, false, false)

function setVehInt(thePlayer, commandName, id, value)
	if getElementData(thePlayer, "acc:admin") >=8 then
	
		if not (id) or not (value) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [ID] [Dimension ID]", thePlayer, 255, 255, 255, true)
		else
		
			local veh = findVehicle(id)
			local dim = tonumber(value)
		
			if setElementInterior(veh, dim) then
				outputChatBox(info .. "Você mudou com sucesso " .. id .. " interior. (" .. dim .. ")", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setvehint", setVehInt, false, false)

function setVehInt(thePlayer, commandName, targetPlayer, value)
	if getElementData(thePlayer, "acc:admin") >=8 then
	
		if not (targetPlayer) or not (value) then
			outputChatBox("#7cc576User:#ffffff /" .. commandName .. " [Név / ID] [Dimension ID]", thePlayer, 255, 255, 255, true)
		else
		
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local value = tonumber(value)
		
			if setElementInterior(targetPlayer, value) then
				outputChatBox(info .. "Você mudou com sucesso " .. targetPlayerName:gsub("_"," ") .. " interior. (" .. value .. ")", thePlayer, 255, 255, 255, true)
				outputChatBox(" #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou o interior.(" .. value .. ")", targetPlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setvehint", setInt, false, false)

function adminJail(thePlayer, commandName, targetPlayer, ido, ...)
	if getElementData(thePlayer, "acc:admin") >= 8 then
	
		if not (targetPlayer) or not (ido) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [Minuto] [Dalil]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")
			
				if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
				if not getElementData(targetPlayer, "loggedin") then return end
			
			if (ido) <= 0 then
				outputChatBox(error .. "Minutos não são permitidos em 0.", thePlayer ,255, 255, 255, true)
				return
			elseif (ido) > 120 and getElementData(thePlayer, "acc:admin") < 2 then
				outputChatBox(error .. "Você não tem autoridade para compartilhar mais de 120 minutos de admin.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 300 and getElementData(thePlayer, "acc:admin") < 3 then
				outputChatBox(error .. "Você não tem autoridade para compartilhar mais de 300 minutos de admin.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 400 and getElementData(thePlayer, "acc:admin") < 4 then
				outputChatBox(error .. "Você não tem autoridade para compartilhar mais de 400 minutos de admini.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 500 and getElementData(thePlayer, "acc:admin") < 5 then
				outputChatBox(error .. "Você não tem autoridade para compartilhar mais de 400 minutos de admin.", thePlayer, 255, 255, 255, true)
				return			
			elseif (ido) > 600 and getElementData(thePlayer, "acc:admin") < 6 then
				outputChatBox(error .. "Você não tem permissão para compartilhar administradores por mais de 600 minutos.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if not (targetPlayer) then
				return
			end
			
			--közbe
				if getElementData(targetPlayer, "adminjail") == 1 then
					outputChatBox(error .. "O jogador já está na Prisão Admin.", thePlayer, 255, 255, 255, true)
					outputChatBox("Se você quiser atualizar a penalidade, primeiro pegue-a#7cc576/unjail#ffffff e tente novamente.", thePlayer, 255, 255, 255, true)
					return
				end
			
				outputChatBox("#dc143c[AdminJail]:#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff Jail Kard #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Ra #ffffff#1a75ff" .. ido .. "#ffffff Daghighe.", root ,255, 255, 255, true)
				outputChatBox("#dc143c[AdminJail]:#7cc576 Dalil:#ffffff " .. reason, root ,255, 255, 255, true)
				--outputChatBox("#ffffffA use o comando # 7cc576 / Prison Time # ffffff para recuperar seu prêmio restante.", targetPlayer, 255, 255, 255, true)

				local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
				local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
				
				if isTimer(theTimerCheck) then
					killTimer(theTimerCheck)
				end
				
				if isTimer(theTimerCheck2) then
					killTimer(theTimerCheck2)
				end
				
				if isPedInVehicle(targetPlayer) then
					removePedFromVehicle(targetPlayer)
				end
				
				fadeCamera(targetPlayer, false, 1.0)
				showChat(targetPlayer, false)
				setElementFrozen(targetPlayer, true)
				if isPedInVehicle(targetPlayer) then
					toggleAllControls(targetPlayer, false, false, false)
				end
				
				setTimer(function()
					triggerClientEvent(targetPlayer, "triggerAdminjail", targetPlayer, thePlayer, reason, ido, 1, false)
				end, 500, 1)
				
				setTimer( function()
					local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
					local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
					local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
					local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
					local setPosition = setElementPosition(targetPlayer, 198.0009765625, 175.1279296875, 1003.0234375)
					local setInterior = setElementInterior(targetPlayer, 3)
					local setDimension = setElementDimension(targetPlayer, 132+getElementData(targetPlayer, "acc:id"))
					
					local adminjailed = setElementData(targetPlayer, "adminjail", 1)
					local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
					local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
					local admin = setElementData(targetPlayer, "adminjail:admin", getPlayerAdminName(thePlayer))
					local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", getPlayerSerial(thePlayer))
				end, 1500, 1)
								
				setTimer(function()
					fadeCamera(targetPlayer, true, 2.5)
					setElementFrozen(targetPlayer, false)
					toggleAllControls(targetPlayer, true, true, true)
					showChat(targetPlayer, true)
				end, 7500, 1)
			
				local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 1, reason, ido, ido, getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer))
				local ajailMentes = dbExec(con, "INSERT INTO adminjails SET jailed_player = ?, jailed_playerSerial = ?, jailed_accountID = ?, jailed_admin = ?, jailed_adminSerial = ?, jailed_reason = ?, jailed_ido = ?, jailed_idopont=CURDATE(), jailed_idopontora=CURTIME()", targetPlayerName:gsub("_"," "), getPlayerSerial(targetPlayer), getElementData(targetPlayer, "acc:id"),getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer), reason, ido)
		end
	end
end
addCommandHandler("ajail", adminJail, false, false)


function offlineAdminJail(thePlayer, commandName, targetPlayer, ido, ...)
	if getElementData(thePlayer, "acc:admin") >= 3 then
	
		if not (targetPlayer) or not (ido) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [ID] [Minuto] [Motivo]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer = targetPlayer:gsub("_"," ")
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")
			local charid = false
			
			local sql = dbQuery(con, "SELECT * FROM characters WHERE charname='" .. targetPlayer .. "' LIMIT 1")
			local result = dbPoll(sql, -1)
			
			if result then
				for _, row in ipairs(result) do
					
					charid = row["id"]
					
				end
				
				local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. charid .. "'", 1, reason, ido, ido, getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer))
				local ajailMentes = dbExec(con, "INSERT INTO adminjails SET jailed_player = ?, jailed_playerSerial = ?, jailed_accountID = ?, jailed_admin = ?, jailed_adminSerial = ?, jailed_reason = ?, jailed_ido = ?, jailed_idopont=CURDATE(), jailed_idopontora=CURTIME()", targetPlayer, charid, charid, getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer), reason, ido)
			
				if sql then
					outputChatBox("#dc143c[Offline - AdminJail]:#ffffff #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff prendeu #7cc576" .. targetPlayer .. "#ffffff Por #1a75ff" .. ido .. "#ffffff Minutos.", root ,255, 255, 255, true)
					outputChatBox("#dc143c[Offline - AdminJail]:#ffffff #7cc576Motivo: #ffffff" .. reason, root ,255, 255, 255, true)
				end
			else
				outputChatBox(error .. "Nenhum resultado encontrado", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("oajail", offlineAdminJail, false, false)

function idoTelikLe(targetPlayer)
	if isElement(targetPlayer) and (getElementType(targetPlayer) == "player") then
		
		local idoTelik = tonumber(getElementData(targetPlayer, "idoTelik")) or false
		local idoLetelt = tonumber(getElementData(targetPlayer, "idoLetelt")) or false
		
		if (idoTelik) and (idoLetelt) then
			setElementData(targetPlayer, "idoTelik", idoTelik-1)
			setElementData(targetPlayer, "idoLetelt", idoLetelt+1)
			--outputChatBox(idoTelik .. " van hátra | " ..  idoLetelt .. " letelt | " .. getPlayerName(targetPlayer)) --IDG, eltávolítható
			local sql = dbExec(con, "UPDATE characters SET adminjail_idoTelik = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", idoTelik)

		
			if (idoTelik) <= 1 then

				outputChatBox(info .. "Sua sentença expirou.", targetPlayer, 255, 255, 255, true)
				
				--outputAdminMessage(getPlayerName(targetPlayer):gsub("_"," ") .. " adminjailje lejárt. [CHECK]") --IDG, eltávolítható
				
				local theTimer = getElementData(targetPlayer, "adminjail:theTimer")
				
				if not (theTimer) then
					return false
				end
				
				killTimer(theTimer)
				setElementData(targetPlayer, "adminjail:theTimer", false)

				
				local adminjailed = setElementData(targetPlayer, "adminjail", false)
				local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
				local alapido = setElementData(targetPlayer, "adminjail:ido", false)
				local admin = setElementData(targetPlayer, "adminjail:admin", false)
				local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
				
				--sql
				local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
				local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
				local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
				
				--pos
				local setPosition = setElementPosition(targetPlayer, 1514.2734375, -1585.375, 13.546875)
				local setInterior = setElementInterior(targetPlayer, 0)
				local setDimension = setElementDimension(targetPlayer, 0)
			end
		end
	end
end

function unJail(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 8 then
	
		if not (targetPlayer) then
			outputChatBox("#7cc576Use#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true) return end
			
			if getElementData(targetPlayer, "adminjail") == 1 then
			
				local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
				local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")

				if getElementData(targetPlayer, "adminjail:admin") == getPlayerAdminName(thePlayer) then
						
						if isTimer(theTimerCheck) then
							killTimer(theTimerCheck)
							setElementData(targetPlayer, "adminjail:theTimer", false)
						end
						if isTimer(theTimerCheck2) then
							killTimer(theTimerCheck2)
							setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
						end
						
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff unjail Kard " .. getPlayerName(targetPlayer) .." Ra.") --VOCÊ ESTÁ PROCURANDO E FAZENDO TODAS AS FAIXAS DE UNJAILT
						outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Shoma Ro unjail Kard. ", targetPlayer ,255, 255, 255, true)
								
						local adminjailed = setElementData(targetPlayer, "adminjail", false)
						local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
						local alapido = setElementData(targetPlayer, "adminjail:ido", false)
						local admin = setElementData(targetPlayer, "adminjail:admin", false)
						local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
						
						--sql
						local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
						
						local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
						local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
						
						--pos
						local setPosition = setElementPosition(targetPlayer, 1514.2734375, -1585.375, 13.546875)
						local setInterior = setElementInterior(targetPlayer, 0)
						local setDimension = setElementDimension(targetPlayer, 0)
				else
					if getElementData(thePlayer, "acc:admin") >= 6 then
						
						local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
						local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
						
						if isElement(theTimerCheck) then
							killTimer(theTimerCheck)
							setElementData(targetPlayer, "adminjail:theTimer", false)
						end
						if isElement(theTimerCheck2) then
							killTimer(theTimerCheck2)
							setElementData(targetPlayer, "adminjail:theTimerAccounts", false)
						end
						
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff unjail Kard " .. getPlayerName(targetPlayer) .." Ra.") --MARAD ÉS FIXELNI AZ EGÉSZ UNJAILT RANGOKRA
						outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Shoma Ro unjail Kard. ", targetPlayer ,255, 255, 255, true)
				
						
						local adminjailed = setElementData(targetPlayer, "adminjail", false)
						local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", false)
						local alapido = setElementData(targetPlayer, "adminjail:ido", false)
						local admin = setElementData(targetPlayer, "adminjail:admin", false)
						local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", false)
						
						--sql
						local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 0, false, false, false, false, false)
						
						local idoTelikVege = setElementData(targetPlayer, "idoTelik", false)
						local idoLeteltVege = setElementData(targetPlayer, "idoLetelt", false)
						
						--pos
						local setPosition = setElementPosition(targetPlayer, 1514.2734375, -1585.375, 13.546875)
						local setInterior = setElementInterior(targetPlayer, 0)
						local setDimension = setElementDimension(targetPlayer, 0)
					else
						outputChatBox(error .. "Você não tem permissão para remover o player do adminjail.", thePlayer, 255, 255, 255, true)
					end
				end
			else
				outputChatBox(error .. "" .. targetPlayerName:gsub("_"," ") .. " não no adminjail.", thePlayer ,255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("unjail", unJail, false, false)

function getJailedPlayers(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
	
		
		
		if (targetPlayer) then
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if getElementData(targetPlayer, "adminjail") == 1 then
				local admin = getElementData(targetPlayer, "adminjail:admin")
				local ido = getElementData(targetPlayer, "adminjail:ido")
				local reason = getElementData(targetPlayer, "adminjail:reason")
				local letelt = getElementData(targetPlayer, "idoLetelt")
				local hatravan = getElementData(targetPlayer, "idoTelik")
				
				outputChatBox("============== Consultando jogadores presos =================", thePlayer, 200, 200, 200, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: preso: #7cc576" .. admin .. "#ffffff, minuto: #7cc576" .. ido .. " minuto", thePlayer, 255, 255, 255, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: Motivo: #7cc576" .. reason .. "", thePlayer, 255, 255, 255, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: Expira: #7cc576" .. letelt .. " minuto#ffffff, Está de volta: #7cc576" .. hatravan .. " minuto", thePlayer, 255, 255, 255, true)
				outputChatBox(" ", thePlayer, 200, 200, 200, true)
			else
				outputChatBox(error .. "O jogador não está na prisão admin.", thePlayer, 255, 255, 255, true)
			end
			if getElementData(targetPlayer, "jailed") == 1 then
				local admin = getElementData(targetPlayer, "jailed:player")
				local ido = getElementData(targetPlayer, "jailed:ido")
				local reason = getElementData(targetPlayer, "jailed:reason")
				local letelt = getElementData(targetPlayer, "jailed:idoLetelt")
				local hatravan = getElementData(targetPlayer, "jailed:idoTelik")
				
				outputChatBox("============== Interrogatório de jogadores detidos =================", thePlayer, 200, 200, 200, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: Ele foi detido: #7cc576" .. admin .. "#ffffff, minuto: #7cc576" .. ido .. " minuto", thePlayer, 255, 255, 255, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: Motivo: #7cc576" .. reason .. "", thePlayer, 255, 255, 255, true)
				outputChatBox("#7cc576" .. getPlayerName(targetPlayer):gsub("_"," ") .. " #00B6FF(" .. getElementData(targetPlayer, "playerid") .. ")#ffffff: Expira: #7cc576" .. letelt .. " minuto#ffffff, Está de volta: #7cc576" .. hatravan .. " minuto", thePlayer, 255, 255, 255, true)
				outputChatBox(" ", thePlayer, 200, 200, 200, true)
			else
				outputChatBox(error .. "O jogador não está detido.", thePlayer, 255, 255, 255, true)
			end
		else
			count = 0
			count2 = 0
			for k, v in ipairs(getElementsByType("player")) do
				if getElementData(v, "adminjail") == 1 then
					
					local admin = getElementData(v, "adminjail:admin")
					local ido = getElementData(v, "adminjail:ido")
					local reason = getElementData(v, "adminjail:reason")
					local letelt = getElementData(v, "idoLetelt")
					local hatravan = getElementData(v, "idoTelik")
					
					outputChatBox("============== Consultando jogadores presos =================", thePlayer, 200, 200, 200, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: preso: #7cc576" .. admin .. "#ffffff, minuto: #7cc576" .. ido .. " minuto", thePlayer, 255, 255, 255, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: Motivo: #7cc576" .. reason .. "", thePlayer, 255, 255, 255, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: Expira: #7cc576" .. letelt .. " minuto#ffffff, Está de volta: #7cc576" .. hatravan .. " minuto", thePlayer, 255, 255, 255, true)
					outputChatBox("   ", thePlayer, 200, 200, 200, true)
					count = count + 1
				end
				if getElementData(v, "jailed") == 1 then
					outputChatBox("============== Interrogatório de jogadores detidos =================", thePlayer, 200, 200, 200, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: Ele foi detido: #7cc576" .. getElementData(v, "jailed:player") .. "#ffffff, minuto: #7cc576" .. getElementData(v, "jailed:ido") .. " minuto", thePlayer, 255, 255, 255, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: Motivo: #7cc576" .. getElementData(v, "jailed:reason") .. "", thePlayer, 255, 255, 255, true)
					outputChatBox("#7cc576" .. getPlayerName(v):gsub("_"," ") .. " #00B6FF(" .. getElementData(v, "playerid") .. ")#ffffff: Expira: #7cc576" .. getElementData(v, "jailed:idoLetelt") .. " minuto#ffffff, Está de volta: #7cc576" .. getElementData(v, "jailed:idoTelik") .. " minuto", thePlayer, 255, 255, 255, true)
					outputChatBox("   ", thePlayer, 200, 200, 200, true)
					count2 = count2 + 1
				end
			end
			
			if count == 0 and count2 == 0 then
				outputChatBox(info .. "Ninguém está na prisão admin", thePlayer, 255, 255, 255, true)
			else
				outputChatBox("tudo #dc143c" .. count .. "#ffffff você tem jogadores na prisão admin e #dc143c" .. count2 .. "#ffffff jogador está sob custódia.", thePlayer, 255, 255, 255, true)
			end
			
		end
	end
end
addCommandHandler("jailed", getJailedPlayers, false, false)

function bortonIdo(thePlayer, commandName)
	if getElementData(thePlayer, "adminjail") == 1 then
		
		local admin = getElementData(thePlayer, "adminjail:admin")
		local ido = getElementData(thePlayer, "adminjail:ido")
		local reason = getElementData(thePlayer, "adminjail:reason")
		local letelt = getElementData(thePlayer, "idoLetelt")
		local hatravan = getElementData(thePlayer, "idoTelik")
		
		outputChatBox("#dc143c[Jail - Moshakhasat]:#ffffff Admin: #7cc576" .. admin .. "#ffffff  Shoma Ra #7cc576" .. ido .. " Daghighe #ffffffJail Kard#ffffff.", thePlayer, 255, 255, 255, true)
		outputChatBox("#dc143c[Jail - Moshakhasat]:#ffffff Dalil: #7cc576" .. reason, thePlayer, 255, 255, 255, true)
		outputChatBox("#dc143c[Jail - Moshakhasat]:#ffffff Zamane Azadi: #7cc576" .. hatravan .. " Daghighe#ffffff, TimeOut: #7cc576" .. letelt .. " Daghighe", thePlayer, 255, 255, 255, true)
	else
		outputChatBox(error .. "Você não está preso!", thePlayer, 255, 255, 255, true)
	end
end
addCommandHandler("tempo", bortonIdo, false, false)

----------------------------------------------------------------------------------------------------------------------------------------
-- /a, /as -- ADMINISZTRÁTOR, ADMINSEGÉD CHAT PARANCSOK
----------------------------------------------------------------------------------------------------------------------------------------

addCommandHandler("a",
	function(player,_,...)
		if getElementData(player,"loggedin") then
		if tonumber(getElementData(player, "acc:admin") or 0) >= 1 then
			local message = table.concat({...}, " ")
			local szintpername = getPlayerAdminLevel(player)
			if ... and message then
				for k,v in ipairs(getElementsByType("player")) do
					if tonumber(getElementData(v, "acc:admin") or 0) >= 1 then
						outputChatBox("#7cc576[AdminChat]: #FFFFFF(".. szintpername .. ")  #7cc576" .. getPlayerAdminName(player) .. ":#FFFFFF "..message,v,255,255,255,true)
					end
				end
			else
				outputChatBox("#7cc576Use: #ffffff/a [texto]",player, 255, 194, 14, true)
			end
		end	
	end
	end
)

addCommandHandler("as",
	function(player,_,...)
		if getElementData(player,"loggedin") then
		if tonumber(getElementData(player, "acc:admin")) >= 1 or tonumber(getElementData(player, "acc:admin")) >= 1 then
			local message = table.concat({...}, " ")
			if ... and message then
				for k,v in ipairs(getElementsByType("player")) do
					if tonumber(getElementData(v, "acc:admin") or 0) >= 1 or tonumber(getElementData(v, "acc:admin") or 0) >= 1 then
						if getElementData(player,"acc:admin") >= 1 then
							name = getPlayerName(player):gsub("_"," ")
							szintpername = getPlayerAdminLevel(player)
						elseif getElementData(player,"acc:admin") >= 1 then
							name = getPlayerAdminName(player)
							szintpername = getPlayerAdminLevel(player)
						end
						outputChatBox("#7cc576[Adminsan Chat]: #FFFFFF("..szintpername .. ")  #7cc576" .. name .. ":#FFFFFF "..message,v,255,255,255,true)
					end
				end
			else
				outputChatBox("#7cc576Use:#ffffff /as [texto]",player, 255, 194, 14, true)
			end
		end	
	end
	end
)



























function player_Wasted ( ammo, attacker, weapon, bodypart )
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	
	if minutes < 10 then
		minutes = "0" .. minutes
	end
	if hours < 10 then
		hours = "0" .. hours
	end
	local killog
	if (attacker) then
	
		if (getElementType(attacker) == "player") then 
			killog = "[" .. hours .. ":" .. minutes .. "] ".. getPlayerName(attacker):gsub("_"," ")   .. " Be Ghatl Resand " .. getPlayerName(source):gsub("_"," ") .. ""
		elseif (getElementType(attacker) == "vehicle") then
			killog = "[" .. hours .. ":" .. minutes .. "] " .. getPlayerName(getVehicleController(attacker)):gsub("_"," ") .. " Farar Kard " .. getPlayerName(source):gsub("_"," ") .. "."
		end
	else
		killog = "[" .. hours .. ":" .. minutes .. "] " .. getPlayerName(source):gsub("_", " ") .. " Mord!."
		--triggerClientEvent(source, "stopDeadTime", source)
	end
	
	for k, v in ipairs(getElementsByType("player")) do
		if tonumber(getElementData(v, "acc:admin") or 0) >= 1 and getElementData(v, "loggedin") then
			outputChatBox("*KILL LOG*".. killog, v, 220, 220, 220, true)
		end
	end
end
addEventHandler ( "onPlayerWasted", getRootElement(), player_Wasted )







----------------------------------------------------------------------------------------------------------------------------------------
-- /setpp -- KÜLÖNRANGI PARANCS
----------------------------------------------------------------------------------------------------------------------------------------

function setPP(thePlayer, commandName, targetPlayer, status, pp)
	if getElementData(thePlayer, "acc:admin") >= 14 then
		
		if not (targetPlayer) or not (status) or not (pp) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID] [1 = Setar | 2 = Juntar | 3 = Remover] [Meghdar]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Não existe esse jogador.", thePlayer, 255, 255, 255, true) return end
			local status = tonumber(status)
			local pp = tonumber(pp)
			if pp < 0 then outputChatBox(error .. "Precisa ser acima de 0.", thePlayer, 255, 255, 255, true) return end
			
				if not getElementData(targetPlayer, "loggedin") then return end
			
			if (status) > 3 or (status) < 1 then
				--outputChatBox(error .. "A végrehajtási kódok csak 1 és 3 között vannak", thePlayer, 255, 255, 255, true)
				return
			end
				
			local oldPP = getElementData(targetPlayer, "char:pp") or 0

			if (status) == 1 then
				local sql = dbExec(con, "UPDATE characters SET premiumpont='" .. pp .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você configurou com sucesso o dinheiro vip do jogador #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff para. (" .. pp ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudou o dinheiro vip do jogador #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff para . #ff9000(" .. pp .. ")")
					setElementData(targetPlayer, "char:pp", pp)	
				end
			elseif (status) == 2 then
				local sql = dbExec(con, "UPDATE characters SET premiumpont='".. getElementData(targetPlayer, "char:pp") + pp .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você mudou com sucesso o dinheiro vip do jogador: #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff para . (" .. oldPP .. " >> " .. oldPP + pp ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage(getPlayerAdminName(thePlayer) .. " mudou o dinheiro vip do jogador " .. targetPlayerName:gsub("_"," ") .. " para . (" .. oldPP .. " >> " .. oldPP + pp .. ")")
					setElementData(targetPlayer, "char:pp", oldPP + pp)				
				end
			elseif (status) == 3 then
				local sql = dbExec(con, "UPDATE characters SET premiumpont='".. getElementData(targetPlayer, "char:pp") - pp .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você mudou com sucesso o dinheiro vip do jogador #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff para. (" .. oldPP .. " >> " .. oldPP - pp ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage(getPlayerAdminName(thePlayer) .. " mudou o dinheiro vip do jogador " .. targetPlayerName:gsub("_"," ") .. " para. (" .. oldPP .. " >> " .. oldPP - pp .. ")")
					setElementData(targetPlayer, "char:pp", oldPP - pp)				
				end
			end
		end
	end
end
addCommandHandler("settvip", setPP, false, false)






----------------------------------------------------------------------------------------------------------------------------------------
-- /setmoney -- EGYÉB PARANCSOK
----------------------------------------------------------------------------------------------------------------------------------------


function setMoney(thePlayer, commandName, targetPlayer, status, cash)
	if getElementData(thePlayer, "acc:admin") >= 12 or import2[getPlayerSerial(thePlayer)] then
		
		if not (targetPlayer) or not (status) or not (cash) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name do Jogador / ID] [1 = Setar | 2 = Juntar | 3 = Remover] [Valor]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Jogador não encontrado.", thePlayer, 255, 255, 255, true) return end
			local status = tonumber(status)
			local cash = tonumber(cash)
			if cash < 0 then outputChatBox(error .. "O valor deve estar acima de 0.", thePlayer, 255, 255, 255, true) return end
			
			if not getElementData(targetPlayer, "loggedin") then return end
			
			if (status) > 3 or (status) < 1 then
				outputChatBox(error .. "Os códigos de execução são apenas entre 1 e 3", thePlayer, 255, 255, 255, true)
				return
			end
				
			local oldCash = getElementData(targetPlayer, "char:money") or 0
			
			if (status) == 1 then
				local sql = dbExec(con, "UPDATE characters SET money='" .. cash .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você configurou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff seu dinheiro. (" .. cash ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudado " .. targetPlayerName:gsub("_"," ") .. " dinheiro do jogador. (" .. cash .. ")")
					setElementData(targetPlayer, "char:money", cash)	
				end
			elseif (status) == 2 then
				local sql = dbExec(con, "UPDATE characters SET money='".. getElementData(targetPlayer, "char:money") + cash .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash + cash ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudado " .. targetPlayerName:gsub("_"," ") .. " dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash + cash .. ")")
					setElementData(targetPlayer, "char:money", oldCash + cash)				
				end
			elseif (status) == 3 then
				local sql = dbExec(con, "UPDATE characters SET money='".. getElementData(targetPlayer, "char:money") - cash .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				if (sql) then
					outputChatBox(info .. "Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash - cash ..")", thePlayer, 255, 255, 255, true)
					outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudado " .. targetPlayerName:gsub("_"," ") .. " dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash - cash .. ")")
					setElementData(targetPlayer, "char:money", oldCash - cash)				
				end
			end
		end
	end
end
addCommandHandler("money", setMoney, false, false)

function setMoneysujo(thePlayer, commandName, targetPlayer, status, cash)
	if getElementData(thePlayer, "acc:admin") >= 14 then
		
		if not (targetPlayer) or not (status) or not (cash) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name do Jogador / ID] [1 = Setar | 2 = Juntar | 3 = Remover] [Valor]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Jogador não encontrado.", thePlayer, 255, 255, 255, true) return end
			local status = tonumber(status)
			local cash = tonumber(cash)
			if cash < 0 then outputChatBox(error .. "O valor deve estar acima de 0.", thePlayer, 255, 255, 255, true) return end
			
			if not getElementData(targetPlayer, "loggedin") then return end
			
			if (status) > 3 or (status) < 1 then
				outputChatBox(error .. "Os códigos de execução são apenas entre 1 e 3", thePlayer, 255, 255, 255, true)
				return
			end
				
			local oldCash = getElementData(targetPlayer, "char:moneysujo") or 0
			
			if (status) == 1 then
				outputChatBox(info .. "Você setou com sucesso o dinheiro de #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff para. (" .. cash ..")", thePlayer, 255, 255, 255, true)
				outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudado " .. targetPlayerName:gsub("_"," ") .. " dinheiro do jogador. (" .. cash .. ")")
				setElementData(targetPlayer, "char:moneysujo", cash)	
			elseif (status) == 2 then
				outputChatBox(info .. "Você adcionou para #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff. (" .. oldCash .. " >> " .. oldCash + cash ..")", thePlayer, 255, 255, 255, true)
				outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff adcionou Estefadeh Kard #fff000Target: " .. targetPlayerName:gsub("_"," ") .. ". (" .. oldCash .. " >> " .. oldCash + cash .. ")")
				setElementData(targetPlayer, "char:moneysujo", oldCash + cash)				
			elseif (status) == 3 then
				outputChatBox(info .. "Você mudou com sucesso #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash - cash ..")", thePlayer, 255, 255, 255, true)
				outputDeveloperMessage("#7cc576".. getPlayerAdminName(thePlayer) .. "#ffffff mudado " .. targetPlayerName:gsub("_"," ") .. " dinheiro do jogador. (" .. oldCash .. " >> " .. oldCash - cash .. ")")
				setElementData(targetPlayer, "char:moneysujo", oldCash - cash)				
			end
		end
	end
end
addCommandHandler("setpp", setMoneysujo, false, false)


function rtcPlayer(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >=9 then
	
	local px, py, pz = getElementPosition(thePlayer)
	
	for k, v in ipairs(getElementsByType("player")) do 
		vx, vy, vz = getElementPosition(v)
		local dist = getDistanceBetweenPoints3D ( px, py, pz, vx, vy, vz )
		if dist <= 3 then
			if v ~= thePlayer then
			setElementDimension(v , 9999)
			setElementInterior(v , 6)
		end
	end
	end
	outputChatBox("#D64541TESTE MENSAGEM", thePlayer, 255, 255, 255, true)
	end
end
--addCommandHandler("setpd", rtcPlayer, false, false)




function rtcVehicle(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >=9 then
	
	local px, py, pz = getElementPosition(thePlayer)
	
	for k, v in ipairs(getElementsByType("vehicle")) do 
		vx, vy, vz = getElementPosition(v)
		local dist = getDistanceBetweenPoints3D ( px, py, pz, vx, vy, vz )
		local int, dim = getElementInterior(thePlayer), getElementDimension(thePlayer)
		local tint, tdim = getElementInterior(v), getElementDimension(v)
		if dist <= 3 and int == tint and dim == tdim then
		
			local vehicleQ = dbQuery(con,"SELECT * FROM vehicle WHERE id='" .. getElementData(v, "veh:id") .. "'")
			local vehicleH,vehszam = dbPoll(vehicleQ,-1)
			if #vehicleH > 0 then
				for k1,v1 in ipairs(vehicleH) do
					pos = fromJSON(v1["pos"])
					setElementPosition(v, pos[1], pos[2], pos[3])
					setElementInterior(v, pos[4] or 0)
					setElementDimension(v, pos[5] or 0)
					setElementRotation(v, 0, 0, pos[6] or 0)
					setElementData(v, "veh:fuel", 100)
					fixVehicle(v)
					setVehicleLocked(v, true)
					setElementData(v, "veh:light", false)
					setVehicleOverrideLights(v, 1)
					setElementData(v, "veh:motor", false)
					--outputChatBox("#D64541[RTC]#ffffff Sikeresen RTC-zted a(z) ID: ".. getElementData(v, "veh:id") .. " járművet.", thePlayer, 255, 255, 255, true)
				
					--adminlog
					--for k3, v3 in ipairs(getElementsByType("player")) do
					--	if tonumber(getElementData(v3, "acc:admin") or 0) >= 1 and getElementData(v3, "loggedin") then
					--		if getPlayerName(thePlayer) == getPlayerName(v3) then
					--		else
								--outputChatBox("#D64541[RTC]#ffffff #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff respawnolta a(z) ID: " .. getElementData(v, "veh:id") .. " járművet.", v3, 255, 255, 255, true)
					--		end
					--	end
					--end
					
				end
			end
		end
	end
		
	
	end
end
addCommandHandler("rtc", rtcVehicle, false, false)


function rtcVehicle2(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >=2 then
	
	
	local px, py, pz = getElementPosition(thePlayer)
	
	for k, v in ipairs(getElementsByType("vehicle")) do 
	
				
		vx, vy, vz = getElementPosition(v)
		local dist = getDistanceBetweenPoints3D ( px, py, pz, vx, vy, vz )
		if dist <= 5 then
		
			local vehicleQ = dbQuery(con,"SELECT * FROM vehicle WHERE id='" .. getElementData(v, "veh:id") .. "'")
			local vehicleH,vehszam = dbPoll(vehicleQ,-1)
			if vehicleH then
			
				for k1,v1 in ipairs(vehicleH) do
				
				for index, value in ipairs(getElementsByType("player")) do
				inVehicle = getPedOccupiedVehicle(value)
				if inVehicle and inVehicle == v then 
					removePedFromVehicle(value)
					local x, y, z = getElementPosition(value)
					setElementPosition(value, x, y+1, z)
				end
				end
			    
				
					setElementDimension(v, 2)
					local x, y, z =  -2319.1916503906, -1637.2742919922, 483.703125
				
					setElementPosition(v, x, y, z)
					setVehicleRespawnPosition(v, x, y, z, 0, 0, 0)
					dbExec(con, "UPDATE vehicle SET interior='0', dimension='2', pos='" .. toJSON({x, y, z, 0, 2, 0}) .. "' WHERE id='" .. getElementData(v, "veh:id") .. "'")
					
					--adminlog
					for k3, v3 in ipairs(getElementsByType("player")) do
						if tonumber(getElementData(v3, "acc:admin") or 0) >= 1 and getElementData(v3, "loggedin") then
							if getPlayerName(thePlayer) == getPlayerName(v3) then
							else
								outputChatBox("#D64541[RTC2]#ffffff #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff áthelyezte a(z) ID: " .. getElementData(v, "veh:id") .. " járművet.", v3, 255, 255, 255, true)
							end
						end
					end
					
				end
			end
		end
	end
	end
	
	
end
addCommandHandler("resveh", rtcVehicle2, false, false)

function delJobVehicles(thePlayer)
	if getElementData(thePlayer, "acc:admin") < 6 then return end

	for key, value in ipairs(getElementsByType("vehicle")) do
		local px, py, pz = getElementPosition(thePlayer)
		local px2, py2, pz2 = getElementPosition(value)
		if getDistanceBetweenPoints3D(px, py, pz, px2, py2, pz2) <= 5 then
			if getElementData(value, "veh:id") or 0 < 0 then
				setElementDimension(value, 2)
			end
		end
	end
end
addCommandHandler("delvperto1", delJobVehicles, false, false)

function fly(thePlayer, commandName)
	if (getElementData(thePlayer, "acc:admin")) >= 1 and getElementData(thePlayer, "char:adminduty") == 1 or getElementData(thePlayer, "acc:admin") >= 13 or import2[getPlayerSerial(thePlayer)] then
		triggerClientEvent(thePlayer, "onClientFlyToggle", thePlayer)
		
	end
end
addCommandHandler("fly", fly, false, false)
addCommandHandler("voar", fly, false, false)

function getPlayerLevel(player, cmd, target)
	if not target then
		outputChatBox("#7cc576Use: #ffffff/"..cmd.." [Name / ID]", player, 0, 0, 0, true)
		return
	end
	
	local target, targetName = exports["san_core"]:findPlayer(player, target)
	if not target then
		outputChatBox(error.."Player Dar Shahr Nist! ou logado.", player, 0, 0, 0, true)
		return
	else
		outputChatBox(info..targetName:gsub("_", " ").." níveis: #7cc576"..exports["san_score"]:getLevel(target), player, 0, 0, 0, true)
	end
end
--addCommandHandler("lvl", getPlayerLevel)

function getPlayerOldcarID(player)
	if not getElementData(player, "oldcarID") then
		outputChatBox(error.."Még nem ültél járműben.", player, 0, 0, 0, true)
	else
		outputChatBox(info.."Utolsó kocsi ID-je: #7cc576"..getElementData(player, "oldcarID"), player, 0, 0, 0, true)
	end
end
addCommandHandler("oldcar", getPlayerOldcarID)

function getPlayerID(player, cmd, target)
	if not target then
		outputChatBox("#7cc576Use: #ffffff/"..cmd.." [Name / ID]", player, 0, 0, 0, true)
		return
	end
	
	local target, targetName = exports["san_core"]:findPlayer(player, target)
	if not target then
		return
	else
		outputChatBox(info..targetName:gsub("_", " ").. " ID: #7cc576"..getElementData(target, "playerid"), player, 0, 0, 0, true)
	end
end
addCommandHandler("id", getPlayerID)
-- Adminoknak /STATS LEKÉRÉSE

function getPlayerStats(thePlayer, commandName, targetPlayer)
	if tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 1 then
		
		if targetPlayer then
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then
				outputChatBox("#dc143c[IRG]:#ffffff Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true)
				return
			end
			showingPlayer = targetPlayer
		else
			showingPlayer = thePlayer
		end

		
for k,v in ipairs(getElementsByType("player")) do
	if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:admin") or 0) == 8 then
	outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(thePlayer).." Az CMD /status Estefadeh Kard #fff000Target: "..getPlayerName(showingPlayer).." ",v,255,255,255,true)
end
end


		triggerClientEvent(thePlayer, "onStatsCreate", thePlayer, showingPlayer)
	end
end
addCommandHandler("status", getPlayerStats, false, false)

function giveLicenses(thePlayer, commandName, targetPlayer, licensz)
	if getElementData(thePlayer, "acc:admin") >= 5 then
		
		if not (targetPlayer) or not (licensz) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name / ID] [1 = licença | 2 = Porte de armas]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Não existem tais jogadores.", thePlayer, 255, 255, 255, true) return end
			local licensz = tonumber(licensz)
				if not getElementData(targetPlayer, "loggedin") then return end
			
			if licensz > 2 or licensz <= 0 then
				outputChatBox(error .. "As licenças só podem ser 1 e 2.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if (licensz) == 1 then
				setElementData(targetPlayer, "char:drivingLicense", 1)
				 license = toJSON({1,getElementData(targetPlayer, "char:fegyverengedely")})
				 sql = dbExec(con, "UPDATE characters SET License='".. license .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				
				if (sql) then
					outputChatBox(info .. "Sikeresen adtál jogosítványt #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff játékosnak.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff adott neked jogosítványt.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff adott " .. targetPlayerName:gsub("_"," ") .. " játékosnak jogosítványt.")
				else
					outputChatBox(error .. "Nem sikerült jogosítványt adni a játékosnak. Hibakód: GIVELICENSES1", thePlayer, 255, 255, 255, true)
				end
			elseif (licensz) == 2 then
				if getElementData(thePlayer, "acc:admin") >= 6 then
					
					setElementData(targetPlayer, "char:fegyverengedely", 1)
					license = toJSON({getElementData(targetPlayer, "char:drivingLicense"),1})
					sql = dbExec(con, "UPDATE characters SET License='".. license .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
					
					if (sql) then
						outputChatBox(info .. "Sikeresen adtál fegyvertartási engedélyt #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff játékosnak.", thePlayer, 255, 255, 255, true)
						outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff adott neked fegyvertartási engedélyt.", targetPlayer, 255, 255, 255, true)
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff adott " .. targetPlayerName:gsub("_"," ") .. " játékosnak fegyvertartási engedélyt.")
					else
						outputChatBox(error .. "Nem sikerült fegyvertartási engedélyt adni a játékosnak. Hibakód: GIVELICENSES2", thePlayer, 255, 255, 255, true)
					end
				end
			end
		end
	end
end
--addCommandHandler("givelicenses", giveLicenses, false, false)

function showLicenses(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "loggedin") then
		
		if not (targetPlayer) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Név / ID] ", thePlayer, 255, 255, 255, true)
		else
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			
			if (targetPlayer) then
				
				local x, y, z = getElementPosition(thePlayer)
				local x1, y1, z1 = getElementPosition(targetPlayer)
				
				local dist = getDistanceBetweenPoints3D( x, y, z, x1, y1, z1 )
				
				if (dist<10) then
				
					sendLocalMeAction(thePlayer, "felmutatja az engedélyeit " .. targetPlayerName:gsub("_"," ") .. "-nak/nek.")
					outputChatBox("-------------------------------------------------------------------------", targetPlayer, 150, 150, 150, true)
					outputChatBox("#0094ff" .. getPlayerName(thePlayer) .. "#ffffff játékos engedélyei:", targetPlayer, 255, 255, 255, true)
					
					local jogsi = getElementData(thePlayer, "char:drivingLicense")
					local fegyver = getElementData(thePlayer, "char:fegyverengedely")
						if jogsi == 1 then
							p = "#7cc576Van"
						else
							p = "#dc143cNincs"
						end
				
						if fegyver == 1 then
							r = "#7cc576Van"
						else
							r = "#dc143cNincs"
						end
					outputChatBox("#ffffffJárművezetői engedély: " .. p, targetPlayer, 255, 255, 255, true)
					outputChatBox("#ffffffFegyvertartási engedély: " .. r, targetPlayer, 255, 255, 255, true)
					outputChatBox("-------------------------------------------------------------------------", targetPlayer, 150, 150, 150, true)
				else
					outputChatBox(error .. "Você está muito longe do jogador.", thePlayer, 255, 255, 255, true)				
				end
			else
				outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
--addCommandHandler("showlicenses", showLicenses, false, false)

function takeLicenses(thePlayer, commandName, targetPlayer, licensz)
	if getElementData(thePlayer, "acc:admin") >= 6 then
		
		if not (targetPlayer) or not (licensz) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Név / ID] [1 = Jogosítvány | 2 = Fegyvertartási engedély]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			if not (targetPlayer) then outputChatBox(error .. "Nincs ilyen játékos.", thePlayer, 255, 255, 255, true) return end
			local licensz = tonumber(licensz)
			
				if not getElementData(targetPlayer, "loggedin") then return end
			
			if licensz > 2 or licensz <= 0 then
				outputChatBox(error .. "A licensz csak 1 és 2 lehet.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if (licensz) == 1 then
				setElementData(targetPlayer, "char:drivingLicense", 0)
				local license = toJSON({0,0})
				local sql = dbExec(con, "UPDATE characters SET License='".. license .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
				
				if (sql) then
					outputChatBox(info .. "Sikeresen elvetted a jogosítványt #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff játékostól.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff elvette a jogosítványodat.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff elvette " .. targetPlayerName:gsub("_"," ") .. " játékosnak a jogosítványát.")
				else
					outputChatBox(error .. "Nem sikerült jogosítványt elvenni a játékostól. Hibakód: TAKELICENSES1", thePlayer, 255, 255, 255, true)
				end
			elseif (licensz) == 2 then
				if getElementData(thePlayer, "acc:admin") >= 6 then
					setElementData(targetPlayer, "char:fegyverengedely", 0)
					license = toJSON({getElementData(targetPlayer, "char:drivingLicense"),0})
					sql = dbExec(con, "UPDATE characters SET License='".. license .. "' WHERE id='" .. getElementData(targetPlayer, "char:id") .. "'")
					
					if (sql) then
						outputChatBox(info .. "Sikeresen elvetted a fegyvertartási engedélyt #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff játékostól.", thePlayer, 255, 255, 255, true)
						outputChatBox(info .. "#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff elvette a fegyvertartási engedélyedet.", targetPlayer, 255, 255, 255, true)
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff elvette " .. targetPlayerName:gsub("_"," ") .. " játékosnak a fegyvertartási engedélyét.")
					else
						outputChatBox(error .. "Nem sikerült jogosítványt elvenni a játékostól. Hibakód: TAKELICENSES2", thePlayer, 255, 255, 255, true)
					end
				end
			end
		end
	end
end
--addCommandHandler("takelicenses", takeLicenses, false, false)

function vhSpawn(thePlayer, commandName, targetPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
		
		if not (targetPlayer) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Name / ID]", thePlayer, 255, 255, 255, true)
		else
				
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local x, y, z =  1204.0526123047, -1755.3236083984, 13.306406021118
			local int = 0
			local dim = 0
			
				if not getElementData(targetPlayer, "loggedin") then return end
				local sourceAdminLVL = getElementData( thePlayer , "acc:admin") or 0
				local targetAdminLVL = getElementData( targetPlayer , "acc:admin") or 0
				if sourceAdminLVL <= targetAdminLVL then
					outputChatBox(error .. "Nmitoni Rank Bala Spawn Bedi!.", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Mikhast Shoma Ro Spawn Kone!", targetPlayer, 255, 255, 255, true)
					return false
				
				
				end
			
			if isPedInVehicle(targetPlayer) then
				removePedFromVehicle(targetPlayer)
			end
			
			if not (targetPlayer) then
				outputChatBox(error .. "Player Dar Shahr Nist!.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if getElementData(targetPlayer, "adminjail") == 1 and not getElementData(thePlayer, "acc:admin") >= 6 then	outputChatBox("#dc143c[falha]:#ffffff Você não tem permissão para teletransportar o jogador para a prefeitura. (Ela está na cadeia.)", targetPlayer, 255, 255, 255, true) return end 
			
			local teleport = setElementPosition(targetPlayer, x, y, z), setElementInterior(targetPlayer, int), setElementDimension(targetPlayer, dim)
			
			if (teleport) then
				outputChatBox("#ffffffVocê conseguiu deportar #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff jogador para a prefeitura.", thePlayer, 255, 255, 255, true)
				outputChatBox(" #7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff teleportou você para #0094ffprefeitura#ffffff.", targetPlayer, 255, 255, 255, true)
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff teletransportado " .. targetPlayerName:gsub("_"," ") .. " jogador para a prefeitura.")
			else
				outputChatBox(error .. "Não conseguiu repatriar a prefeitura. O código de erro: VHSPAWN1", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("spawn", vhSpawn, false, false)

addEvent( "gotoMark", true )
addEventHandler( "gotoMark", getRootElement( ),
	function( x, y, z, interior, dimension, name )
		if type( x ) == "number" and type( y ) == "number" and type( z ) == "number" and type( interior ) == "number" and type( dimension ) == "number" then
			if getElementData ( client, "loggedin" ) and getElementData(client, "acc:admin") >= 1 then				
				setTimer(function(client)
				
					local vehicle = nil
					local seat = nil
				
					if(isPedInVehicle ( client )) then
						 vehicle =  getPedOccupiedVehicle ( client )
						seat = getPedOccupiedVehicleSeat ( client )
					end
					
					if(vehicle and (seat ~= 0)) then
						removePedFromVehicle (client )
					
						setElementPosition(client, x, y, z)
						setElementInterior(client, interior)
						setElementDimension(client, dimension)
					elseif(vehicle and seat == 0) then
						removePedFromVehicle (client )
						
						setElementPosition(vehicle, x, y, z)
						setElementInterior(vehicle, interior)
						setElementDimension(vehicle, dimension)
						warpPedIntoVehicle ( client, vehicle, 0)
					else
						setElementPosition(client, x, y, z)
						setElementInterior(client, interior)
						setElementDimension(client, dimension)
					end
					
					name = name or ""
					
					outputChatBox( "#7cc576[IRG - Teleport]:#ffffff Você foi teleportado com sucesso para #0094ff".. name .. "#ffffff a cena.", client, 0, 255, 0, true )
				
				end, 50, 1, client)
			
			end
		end
	end
)

function sendLocalText(root, message, r, g, b, distance, exclude)
	exclude = exclude or {}
	local x, y, z = getElementPosition(root)
		
	local shownto = 0
	for index, nearbyPlayer in ipairs(getElementsByType("player")) do
		if isElement(nearbyPlayer) and getDistanceBetweenPoints3D(x, y, z, getElementPosition(nearbyPlayer)) < ( distance or 20 ) then
			local logged = getElementData(nearbyPlayer, "loggedin")
			if not exclude[nearbyPlayer] and not isPedDead(nearbyPlayer) and logged and getElementDimension(root) == getElementDimension(nearbyPlayer) then
				outputChatBox(message, nearbyPlayer, r, g, b,true)
				shownto = shownto + 1
			end
		end
	end
end

function sendLocalMeAction(thePlayer, message)
	sendLocalText(thePlayer, " ***" .. getPlayerName(thePlayer):gsub("_", " ") .. ( message:sub( 1, 1 ) == "'" and "" or " " ) .. message, 194, 162, 218)
	triggerClientEvent("onMessageIncome",thePlayer,"***"..message,2)
end

function saveSqlFegyver(player, status)
	if isElement(player) then
		local jogsi = getElementData(player, "char:drivingLicense")
		local save = toJSON({jogsi, 1})
		local sql = dbExec(con, "UPDATE characters SET License = ? WHERE id='" .. getElementData(player, "char:id") .. "'", save)
		if (sql) then
			--outputChatBox(getPlayerName(player) .. " sua permissão de armas foi salva.")
		end
	end
end
addEvent("fegyverengMentes", true)
addEventHandler("fegyverengMentes", getRootElement(), saveSqlFegyver)

function thisCar(thePlayer)
	if getElementData(thePlayer, "loggedin") then
	
		local veh = getPedOccupiedVehicle(thePlayer)
		if isPedInVehicle(thePlayer) then
			if (veh) then
				outputChatBox(info .. "ID do veículo: #7cc576" .. getElementData(veh, "veh:id") or "Desconhecido" .. "", thePlayer, 255, 255, 255, true)
			end
		else
			outputChatBox(error .. "Você não está em um carro.", thePlayer, 255, 255, 255, true)
		end
	end
end
addCommandHandler("essecarro", thisCar, false, false)

addCommandHandler("vehp",
function(playerSource, cmd)
	if (tonumber(getElementData(playerSource, "acc:admin")) >= 1) then
		local pX,pY,pZ = getElementPosition(playerSource)
		for k,v in ipairs(getElementsByType("vehicle")) do
			vX,vY,vZ = getElementPosition(v)
			local dist = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
			local id = getElementData(v,"veh:id") or "Desconhecido"
			local owner = getElementData(v,"veh:owner") or "Desconhecido"
			local oname = getElementData(v, "veh:oname") or "Desconhecido"
			local interior = getElementInterior(playerSource)
			local dimension = getElementDimension(playerSource)			
			local interior1 = getElementInterior(v)
			local dimension1 = getElementDimension(v)
			if dist <= 15 and interior == interior1 and dimension == dimension1 then
				outputChatBox(info .. "Name do veículo: #7cc576"..getVehicleName(v).. " #FFFFFFID: #7cc576" .. id .. "  #FFFFFFDono: #7cc576" .. oname, playerSource, 255,255,255,true)	
				
			end
		end
	end
end)

addCommandHandler("explodido",
function(playerSource, cmd)
	if (tonumber(getElementData(playerSource, "acc:admin")) >= 1) then
		local pX,pY,pZ = getElementPosition(playerSource)
		for k,v in ipairs(getElementsByType("vehicle")) do
			vX,vY,vZ = getElementPosition(v)
			local dist = getDistanceBetweenPoints3D(pX,pY,pZ,vX,vY,vZ)
			local id = getElementData(v,"veh:id") or "Desconhecido"
			local owner = getElementData(v,"veh:owner") or "Desconhecido"
			local oname = getElementData(v, "veh:oname") or "Desconhecido"
			local interior = getElementInterior(playerSource)
			local dimension = getElementDimension(playerSource)			
			local interior1 = getElementInterior(v)
			local dimension1 = getElementDimension(v)
			if dist <= 5 and interior == interior1 and dimension == dimension1 and (getElementHealth(v) < 300) then
				outputChatBox(info .. "Name do veículo: #7cc576"..getVehicleName(v).. " #FFFFFFID: #7cc576" .. id .." #FFFFFFFoi recuperado", playerSource, 255,255,255,true)	
				local rx, ry, rz = getVehicleRotation(v)
				setVehicleRotation(v, 0, 0, 0)
				setElementHealth(v, 1000)
				setVehicleDamageProof(v, false)
				fixVehicle(v)
			end
		end
	end
end)

	
function gluePlayer(slot, vehicle, x, y, z, rotX, rotY, rotZ)
	attachElements(source, vehicle, x, y, z, rotX, rotY, rotZ)
	outputChatBox(info .. "Você aderiu a #7cc576ID: " .. getElementData(vehicle, "veh:id") .. "#ffffff veículos.", source, 255, 255, 255, true)
end
addEvent("gluePlayer",true)
addEventHandler("gluePlayer",getRootElement(),gluePlayer)

function ungluePlayer(vehicle)
	detachElements(source)
	outputChatBox(info .. "Você se desconectou #7cc576ID: Desconhecido#ffffff veículo.", source, 255, 255, 255, true)
end
addEvent("ungluePlayer",true)
addEventHandler("ungluePlayer",getRootElement(),ungluePlayer)


addCommandHandler("setsenha", function(thePlayer, _, ...)
	if getElementData(thePlayer, "acc:admin") >= 9 then
		local text = table.concat({...}, " ")
		
		setServerPassword(text)
		
		outputDebugString("Nova senha do servidor: " .. text, 0, 243, 85, 85)
	end
end)

function setServerMaxPlayers(thePlayer, commandName, newSlot)
	if getElementData(thePlayer, "acc:admin") >= 8 then
		if newSlot then
			setMaxPlayers(newSlot)
			outputAdminMessage("Conjunto de limite de jogadores do servidor " .. newSlot .. " pessoas.")
		else
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [Slot]", thePlayer, 255, 255, 255, true)
		end
	end
end
--addCommandHandler("setslot", setServerMaxPlayers)


function setPlateText(thePlayer, commandName, vehicleID, ...)
	if tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 8 then
		if not (vehicleID) or not (...) then
			outputChatBox("#7cc576Use:#ffffff /" .. commandName .. " [veículo ID] [número da placa]", thePlayer ,255, 255, 255, true)
		else
	
			local vehicleID = tonumber(vehicleID)
			for k, v in ipairs(getElementsByType("vehicle")) do 
				if getElementData(v, "veh:id") == vehicleID then
					veh = v
				end
			end
			if not veh then outputChatBox(error .. "Nenhum veículo encontrado.", thePlayer, 255, 255, 255, true) return end
			if veh then
				local msg = table.concat({...}, " ")
				if string.len(msg) > 8 then outputChatBox(error .. "O número da placa é limitado a 8 caracteres.", thePlayer, 255, 255, 255, true) return end
				
				local query = dbQuery(con, "SELECT * FROM vehicle WHERE rendszam='" .. msg .. "'")
				local results = dbPoll(query, -1)
				if #results > 0 then outputChatBox(error .. "Um veículo com esta placa já existe.", thePlayer, 255, 255, 255, true) return end
				
				setVehiclePlateText(veh, msg)
				dbExec(con, "UPDATE vehicle SET rendszam='" .. msg .. "' WHERE id='" .. getElementData(veh, "veh:id") .. "'")
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff mudou o ID: #0094ff" .. vehicleID .. "#ffffff número da placa do veículo. (" .. msg .. ")")
			end
			end
	end
end
--addCommandHandler("setplaca", setPlateText, false, false)




--/setdrink
function setPlayerDrinkLevel(thePlayer, commandName, targetPlayer, level)
	if getElementData(thePlayer, "acc:admin") >= 1 then

		if not (targetPlayer) or not (level) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Name do Jogador / ID] [Valor]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local level = tonumber(level)
			if not (targetPlayer) then outputChatBox(error .. "Nincs ilyen játékos.", thePlayer, 255, 255, 255, true) return end			
			
			
			if (level) > 100 then
				--outputChatBox(error .. "Az értékek 0 és 100 között vannak.", thePlayer, 255, 255, 255, true)
				return false
			end
			
			local setDrink = setElementData(targetPlayer, "char:thirst", level)
			
			if (setDrink) then
				--outputChatBox(info .. "Sikeresen megváltoztattad #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff Szomjúságát. (" .. level .. ")", thePlayer, 255, 255, 255, true)
				--outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff megváltoztatta #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff szomjúságát. (" .. level .. ")")
			else
				--outputChatBox(error .. "Nem sikerült megváltoztatni " .. targetPlayerName:gsub("_"," ") .. " szomjúságát.", thePlayer, 255, 255, 255, true)
			end
		end
	end
end
addCommandHandler("setsede", setPlayerDrinkLevel, false, false)

--- IC JAIL 


function adminJail(thePlayer, commandName, targetPlayer, ido, ...)
--	if getElementData(thePlayer, "acc:admin") >= 1 then
	
		if not (targetPlayer) or not (ido) or not (...) then
			outputChatBox("#7cc576Use: #ffffff/" .. commandName .. " [Név / ID] [Perc] [Indok]", thePlayer, 255, 255, 255, true)
		else
			
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local ido = tonumber(ido)
			local reason = table.concat({...}, " ")
			
				if not (targetPlayer) then outputChatBox(error .. "Nincs ilyen játékos.", thePlayer, 255, 255, 255, true) return end
				if not getElementData(targetPlayer, "loggedin") then return end
			
			if (ido) <= 0 then
				outputChatBox(error .. "A percek 0 alatt nem adhatóak vannak.", thePlayer ,255, 255, 255, true)
				return
			elseif (ido) > 120 and getElementData(thePlayer, "acc:admin") < 2 then
				outputChatBox(error .. "Nincs jogosultságod 120 percet meghaladó adminjailt osztani.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 300 and getElementData(thePlayer, "acc:admin") < 3 then
				outputChatBox(error .. "Nincs jogosultságod 300 percet meghaladó adminjailt osztani.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 400 and getElementData(thePlayer, "acc:admin") < 4 then
				outputChatBox(error .. "Nincs jogosultságod 400 percet meghaladó adminjailt osztani.", thePlayer, 255, 255, 255, true)
				return
			elseif (ido) > 500 and getElementData(thePlayer, "acc:admin") < 5 then
				outputChatBox(error .. "Nincs jogosultságod 500 percet meghaladó adminjailt osztani.", thePlayer, 255, 255, 255, true)
				return			
			elseif (ido) > 600 and getElementData(thePlayer, "acc:admin") < 6 then
				outputChatBox(error .. "Nincs jogosultságod 600 percet meghaladó adminjailt osztani.", thePlayer, 255, 255, 255, true)
				return
			end
			
			if not (targetPlayer) then
				return
			end
			
			--közbe
				if getElementData(targetPlayer, "adminjail") == 1 then
					outputChatBox(error .. "A játékos már adminjailben van.", thePlayer, 255, 255, 255, true)
					outputChatBox("Ha frissíteni szeretnéd a büntetést, először vedd ki a #7cc576/unjail#ffffff paranccsal, majd próbálkozz újra.", thePlayer, 255, 255, 255, true)
					return
				end
			
				outputChatBox("#dc143c[IC - JAIL]:#7cc576 " .. getPlayerAdminName(thePlayer) .. "#ffffff bebörtönözte #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff játékost #1a75ff" .. ido .. "#ffffff percre.", root ,255, 255, 255, true)
				outputChatBox("#dc143c[IC - JAIL]:#7cc576 Indok:#ffffff " .. reason, root ,255, 255, 255, true)
				--outputChatBox("#ffffffA hátralévő bünetetésed lekérdezéséhez használd a #7cc576/börtönidő#ffffff parancsot.", targetPlayer, 255, 255, 255, true)

				local theTimerCheck = getElementData(targetPlayer, "adminjail:theTimer")
				local theTimerCheck2 = getElementData(targetPlayer, "adminjail:theTimerAccounts")
				
				if isTimer(theTimerCheck) then
					killTimer(theTimerCheck)
				end
				
				if isTimer(theTimerCheck2) then
					killTimer(theTimerCheck2)
				end
				
				if isPedInVehicle(targetPlayer) then
					removePedFromVehicle(targetPlayer)
				end
				
				fadeCamera(targetPlayer, false, 1.0)
				showChat(targetPlayer, false)
				setElementFrozen(targetPlayer, true)
				if isPedInVehicle(targetPlayer) then
					toggleAllControls(targetPlayer, false, false, false)
				end
				
				setTimer(function()
					triggerClientEvent(targetPlayer, "triggerAdminjail", targetPlayer, thePlayer, reason, ido, 1, false)
				end, 500, 1)
				
				setTimer( function()
					local idoTelik = setTimer(idoTelikLe, 60000, ido, targetPlayer)
					local theTimer = setElementData(targetPlayer, "adminjail:theTimer", idoTelik)
					local idoTelikMentes = setElementData(targetPlayer, "idoTelik", ido)
					local idoLetelt = setElementData(targetPlayer, "idoLetelt", 0)
					local setPosition = setElementPosition(targetPlayer, 198.0009765625, 175.1279296875, 1003.0234375)
					local setInterior = setElementInterior(targetPlayer, 3)
					local setDimension = setElementDimension(targetPlayer, 132+getElementData(targetPlayer, "acc:id"))
					
					local adminjailed = setElementData(targetPlayer, "adminjail", 1)
					local adminjail_reason = setElementData(targetPlayer, "adminjail:reason", reason)
					local alapido = setElementData(targetPlayer, "adminjail:ido", ido)
					local admin = setElementData(targetPlayer, "adminjail:admin", getPlayerAdminName(thePlayer))
					local adminSerial = setElementData(targetPlayer, "adminjail:adminSerial", getPlayerSerial(thePlayer))
				end, 1500, 1)
								
				setTimer(function()
					fadeCamera(targetPlayer, true, 2.5)
					setElementFrozen(targetPlayer, false)
					toggleAllControls(targetPlayer, true, true, true)
					showChat(targetPlayer, true)
				end, 7500, 1)
			
				local sql = dbExec(con, "UPDATE characters SET adminjail = ?, adminjail_reason = ?, adminjail_idoTelik = ?, adminjail_alapIdo = ?, adminjail_admin = ?, adminjail_adminSerial = ? WHERE id = '" .. getElementData(targetPlayer, "char:id") .. "'", 1, reason, ido, ido, getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer))
				local ajailMentes = dbExec(con, "INSERT INTO adminjails SET jailed_player = ?, jailed_playerSerial = ?, jailed_accountID = ?, jailed_admin = ?, jailed_adminSerial = ?, jailed_reason = ?, jailed_ido = ?, jailed_idopont=CURDATE(), jailed_idopontora=CURTIME()", targetPlayerName:gsub("_"," "), getPlayerSerial(targetPlayer), getElementData(targetPlayer, "acc:id"),getPlayerAdminName(thePlayer), getPlayerSerial(thePlayer), reason, ido)
		end
	end
--addCommandHandler("jatekosborton", adminJail, false, false)




function shutdownServer(player,cmd,time,...)
	if getElementData(player, "acc:admin" ) >= 9 then
		if not time or not (...) then
			outputChatBox("#7cc576[Use]:#ffffff  /"..cmd.." [tempo] [Motivo]", player, 15, 128, 206, true)
		else
			outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Atenção o servidor ser reiniciado em #32b3ef".. time .."#FFFFFF minutos",getRootElement(),255,255,255,true)
			local indok = table.concat({...}," ")
			outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Motivo: #D75656".. indok .."#FFFFFF.",getRootElement(),255,255,255,true)
			outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Todos são aconselhados a parar de trabalhar porque seu status atual não é salvo!",getRootElement(),255,255,255,true)
			triggerClientEvent(getRootElement(),"setCuccok",getRootElement(),time,indok)
		end
	end
end
addCommandHandler("reiniciarservidor", shutdownServer)

addEvent("hirdetes",true)
addEventHandler("hirdetes",getRootElement(),function(time,indok)
	outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Atenção o servidor ser reiniciado em #32b3ef".. time .."#FFFFFF minutos",getRootElement(),255,255,255,true)
	outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Motivo: #D75656".. indok .."#FFFFFF.",getRootElement(),255,255,255,true)
	outputChatBox("#D75656[ATENÇÃO]:#FFFFFF  Todos são aconselhados a parar de trabalhar porque seu status atual não é salvo!",getRootElement(),255,255,255,true)
end)












-------------------------------------------------------------------------------

local places = {
	["ls"] = {1476.7833251953, -1706.4107, 13.546875, 180},
	["medic"] = {329.22778320312, -1515.6267089844, 35.867187,  273.05798339844},
	["pd"] = {1552.4069824219, -1675.5504150391, 16.1953125, 180},
	["miner"] = {-825.54534912109, -1899.1574707031, 11.627311706543, 180},
	["mechanic"] = {409.79132080078, -1801.7110595703, 7.8281255, 309},
	["carshop"] = {2131.0581054688, -1148.4754638672, 24.359722137451, 0},
	["adminhall"] = {1546.8283691406, -1359.8088378906, 209.91148376465, 180},
}


addCommandHandler("1259988888", function(sourcePlayer, commandName, place)
    --if havePermission(sourcePlayer, commandName, true) then
	if getElementData(sourcePlayer, "adminjail") == 1 and getElementData(sourcePlayer, "acc:admin") < 10 then
					outputChatBox(error .. "Player Dar Jail Ast.", sourcePlayer, 255, 255, 255, true)
					return
				end
	if getElementData(sourcePlayer,"acc:admin") >= 1 then
	
	
        if not place then
            outputUsageText(commandName, "[place]", sourcePlayer)
            outputInfoText("Available places:", sourcePlayer)

			local availablePlaces = {}

			for k, v in pairs(places) do
				table.insert(availablePlaces, k)
			end

			outputInfoText(table.concat(availablePlaces, ", "), sourcePlayer)
        else

        	if places[place] then
        		local data = places[place]

        		setElementPosition(sourcePlayer, data[1], data[2], data[3])
				setElementDimension(sourcePlayer, 0)
				setElementInterior(sourcePlayer, 0)

				outputInfoText("You teleported to the place: #32b3ef" .. place, sourcePlayer)
        	else
        		outputErrorText("The location you selected does not exist.", sourcePlayer)
        	end
        end
    end
end)







addCommandHandler("veh", function(sourcePlayer, commandName, model, ownerId, groupId, r, g, b)
	local adminLVL = getElementData(sourcePlayer , "acc:admin")
	if adminLVL >= 7 then
	model = tonumber(model)
	if model < 400 or model > 600 then
	outputChatBox("The Model ID must be no less than 400 and no more than 611!", sourcePlayer)
					return
				end
		createTempVeh(sourcePlayer , model , adminLVL)
	end
	
end)

local tempAdminVeh , tempVeh = {} , {}
function createTempVeh(sourcePlayer , model , adminLVL)
	local model = tonumber(model)
	--if not model or not isValidVehicleModel[model] then return end
	if not tempAdminVeh[sourcePlayer] then
		tempAdminVeh[sourcePlayer] = {}
	end
	local count = #tempAdminVeh[sourcePlayer]
	if count >= 20 then
		--exports.sadeq_hud:showAlert(sourcePlayer , "info" , "You can only spawn 4 temporary vehicles")
		return
	end
	local x , y , z = getElementPosition(sourcePlayer)
	local veh = createVehicle(model , x+3 , y , z )
	setElementDimension(veh , getElementDimension(sourcePlayer))
	setElementInterior(veh , getElementInterior(sourcePlayer))
	tempAdminVeh[sourcePlayer][count+1] = veh
	tempVeh[veh] = true
	addEventHandler("onVehicleEnter" , veh , warnTempVeh)
end

addEventHandler("onPlayerQuit" , root , function()
	if tempAdminVeh[source] then
		for i , v in pairs(tempAdminVeh[source]) do
			local doIt = isElement(v) and destroyElement(v)
			tempVeh[v] = nil
		end
		tempAdminVeh[source] = nil
	end
end)


addCommandHandler("delveh", function(source)
	if tempAdminVeh[source] then
		for i , v in pairs(tempAdminVeh[source]) do
			local doIt = isElement(v) and destroyElement(v)
			tempVeh[v] = nil
		end
		tempAdminVeh[source] = nil
	end
end)

function warnTempVeh(player)
	----exports.sadeq_hud:showAlert( player , "warning" , "This is a Non-RP Vehicle so avoid using it in RP")
end




















   --[[ function(player)
        for k,v in ipairs(getElementsByType("player")) do
							if isElement(v) and getElementData(v, "loggedin") and tonumber(getElementData(v,"acc:id")) then
								outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(player).." Usou o comando /adminduty para entrar de Staff  ",v,255,255,255,true)
							end
						end
			
			local adutyTimer1 = setTimer(function() 
			
				if isElement(player) and getElementData(player, "acc:id") then
					local adutytime = getElementData(player, "char:playedTime") or 0
					adutytime = adutytime + 1
					setElementData(player, "Char:playedTime", adutytime)
					dbExec(con, "UPDATE characters SET playedTime=? WHERE id='" .. getElementData(player, "char:id") .. "'", adutytime)
				end
				
			end, 60000, 0)
			setElementData(player, "aduty:timer", adutyTimer1)
    end]]
	
	
	--[[
	local marker = createMarker( 1286.8142089844, -1652.1851806641, 13.546875  - 1, "cylinder", 10, 255, 255, 255, 0)
	function timeplay(player)

		--outputChatBox("#7cc576[IRG - LOG]:#ffffff "..getPlayerName(player).." Usou o comando /adminduty para entrar de Staff  ",v,255,255,255,true)
		
			
			for k,v in ipairs(getElementsByType("player")) do
							if isElement(v) and getElementData(v, "loggedin") then
								outputChatBox("#7cc576[IRG - LOG]:#ffffff  Usou o comando /adminduty para entrar de Staff  ",v,255,255,255,true)
							end
						end
			
			local adutyTimer2 = setTimer(function() 
			
				if isElement(player) and getElementData(player, "char:id") then
					local adutytime = getElementData(player, "char:playedTime") or 0
					adutytime = adutytime + 1
					setElementData(player, "char:playedTime", adutytime)
					dbExec(con, "UPDATE characters SET PlayedTime=? WHERE id='" .. getElementData(player, "char:id") .. "'", adutytime)
				end
				
			end, 60000, 0)
			setElementData(player, "aduty:timer", adutyTimer2)
		
			
		--end
		
	
    end
addEvent("onLoginClick", true)
addEventHandler("onLoginClick", root, timeplay)]]
--addCommandHandler("2", adminDuty1, false, false)
--addEventHandler("onResourceStart", getResourceRootElement(), adminDuty1)
--addEventHandler( "onPlayerJoin", root, adminDuty1 )
--addEventHandler("onMarkerHit",marker,  timeplay)
--addEventHandler("onPlayerJoin", getRootElement(), timeplay)
--addEventHandler ( "onResourceStart",adminDuty1 ) 

function adminDuty2(player)
	if getElementData(player, "acc:admin") >= 1 then
	local value = getElementData(player,"char:adminduty")
	if value == 0 then
		setElementData(player, "char:oldName", getPlayerName(player))
		setPlayerName(player, getPlayerAdminName(player))
		setElementData(player, "char:adminduty", 1)
		outputChatBox("#7cc576[STAFF]:#ffffffVocê Entrou como ADMIN",player,255,255,255,true)

		--if not getElementData(player, "acc:id") == 1 then
		--outputAdminMessage("#7cc576" .. getPlayerAdminName(player) .. "#ffffff Entrou no modo admin #ffffff.")
		--end

		
		local accId2 = getElementData(player, "acc:id")
		local spawnQuery2 = dbPoll(dbQuery(con, "SELECT * FROM characters WHERE id = ?", accId2), -1)
		if (#spawnQuery2 > 0) then
		for _, cRow in ipairs(spawnQuery2) do
		genero = cRow["gender"]
		if genero == "no" then 
		setElementModel(player, 211)
		else
		setElementModel(player, 100)
		end
		end
		end

		setElementData(player, "aduty:time", 0)
		local adutyTimer = setTimer(function() 
			if isElement(player) and getElementData(player, "char:adminduty") == 1 then
				local adutytime = getElementData(player, "aduty:time") or 0
				adutytime = adutytime + 1
				setElementData(player, "aduty:time", adutytime)
				dbExec(con, "UPDATE characters SET adutyTime=? WHERE id='" .. getElementData(player, "char:id") .. "'", adutytime)
			end
		end, 60000, 0)
		setElementData(player, "aduty:timer", adutyTimer)
		elseif value == 1 then
		outputChatBox("#7cc576[STAFF]:#ffffffVocê Saiu do ADMIN",player,255,255,255,true)

		if not getElementData(player, "acc:id") == 1 then
		outputAdminMessage("#7cc576" .. getPlayerAdminName(player) .. "#ffffff Saiu do modo admin #ffffff.")
		end
		setPlayerName(player, getElementData(player, "char:oldName"))
		setElementData(player, "char:adminduty", 0)
		setElementModel(player, 0)
		if isTimer(getElementData(player, "aduty:timer")) then
			killTimer(getElementData(player, "aduty:timer"))
		end
	end
end
end
addCommandHandler("adminduty159753", adminDuty2, false, false)

addCommandHandler('allduty',
	function(thePlayer, commandName)
		local value = getElementData(thePlayer,"char:adminduty")
		if value == 0 and not (tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 7)  then outputChatBox("#7cc576Shoma Dar Halate Admin Duty Nistid!!",thePlayer, 255, 194, 14, true) return end
	
	
		if (tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 4) then
				for k,v in ipairs(getElementsByType("player")) do
					if tonumber(getElementData(v, "acc:admin") or 0) >= 1 then
						executeCommandHandler ( "adminduty159753", v )
						outputAdminMessage("#7cc576" .. getPlayerAdminName(v) .. "#ffffff Liberou/colocou o modo admin no staff: " .. getPlayerAdminName(v) .. "  #ffffff.")
			end
		end
	end
end
)

addCommandHandler('ladmin',
	function(thePlayer, commandName, targetPlayer)



		local value = getElementData(thePlayer,"char:adminduty")
		if value == 0 and not (tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 7)  then outputChatBox("#7cc576Você não está no modo admin!!",thePlayer, 255, 194, 14, true) return end
	
		if (tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 4) then
		if not targetPlayer then
				outputChatBox ( "#7cc576[Use]:#ffffff /" .. commandName .. " ID", thePlayer, 255, 0, 0, true )
		else 
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)

			--if getElementData(targetPlayer, "acc:id") == 1 then outputChatBox("#7cc576Jogador esta offline por tempo indeterminado",thePlayer, 255, 194, 14, true) return end

			if (targetPlayer) then
				executeCommandHandler ( "adminduty159753", targetPlayer )
				outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff Liberou/colocou o modo admin no staff: " .. getPlayerAdminName(targetPlayer) .. "  #ffffff.")
			end
		end
	end
end
)


local timer = {}
addCommandHandler('carry',
	function(thePlayer, commandName, targetPlayer)
		local value = getElementData(thePlayer,"char:adminduty")
		if value == 0 and not (tonumber(getElementData(thePlayer, "acc:admin") or 0) >= 7)  then outputChatBox("#7cc576Você não está no modo admin!!",thePlayer, 255, 194, 14, true) return end
	

		--if abinis[getPlayerSerial(thePlayer)] then
		if getElementData(thePlayer, "acc:admin") >= 1 then
			if not targetPlayer then
				outputChatBox ( "#7cc576[Use]:#ffffff /" .. commandName .. " ID", thePlayer, 255, 0, 0, true )
		else 
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, targetPlayer)
			local sourceAdminLVL = getElementData( thePlayer , "acc:admin") or 0
				local targetAdminLVL = getElementData( targetPlayer , "acc:admin") or 0
				if sourceAdminLVL <= targetAdminLVL then
					outputChatBox(error .. "Nmitoni Rank Bala Carry Koni!.", thePlayer, 255, 255, 255, true)
					outputChatBox(" #fff000" .. getPlayerName(thePlayer) .. "#ffffff Mikhast Shoma Ra Carry Kone!", targetPlayer, 255, 255, 255, true)
					return false
				
				
				end
			
			
			if (targetPlayer) then
				if getElementData(thePlayer, "char.grudar") == 1 then
					if isTimer(timer[getElementData(thePlayer, "acc:id")]) then
						killTimer(timer[getElementData(thePlayer, "acc:id")])
					end
						detachElements ( targetPlayer, thePlayer )
						exports.bone_attach:detachElementFromBone(targetPlayer) 
						setElementData(targetPlayer, "char.grudar", 0)
						setPedAnimation( targetPlayer)
						local x,y,z = getElementPosition ( thePlayer )
						setElementPosition(targetPlayer, x+1,y,z)
						setElementData(thePlayer, "char.grudar", 0)
						else
						setElementData(thePlayer, "char.grudar", 1)
						local x,y,z = getElementRotation ( thePlayer )
						if not exports.bone_attach:isElementAttachedToBone(thePlayer) then
							exports.bone_attach:attachElementToBone (targetPlayer, thePlayer, 3, -0, -0.2, -0.1, 0, 0, 170)
							attachElements ( targetPlayer, thePlayer, 0, -0.1, 1.3 )
						end
						outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff grudou o jogador "..getPlayerName(targetPlayer).." pelo #7cc576/carry #ffffff.")

							setPedAnimation( targetPlayer, "FOOD", "FF_Sit_Look", -1, true, false, false)
							timer[getElementData(thePlayer, "acc:id")] = setTimer(function()
						if isElement(thePlayer) then
							if not targetPlayer then return end
							local x,y,z = getElementPosition ( thePlayer )
							setElementPosition(targetPlayer, x,y,z)
							setElementInterior(targetPlayer, getElementInterior(thePlayer))
							setElementDimension(targetPlayer, getElementDimension(thePlayer))
							if not isElement(targetPlayer) then
							if isTimer(timer[getElementData(thePlayer, "acc:id")]) then
							killTimer(timer[getElementData(thePlayer, "acc:id")])
							detachElements ( targetPlayer, thePlayer )
							end
							setElementData(targetPlayer, "char.grudar", 0)
							end
						end	
					end, 500, 0)
				end
			end
		end
	end
end
)

local teleportLocations = {
	-- 			x					y					z			int dim	rot
	ls = { 1479.9873046875, -1710.9453125, 13.36874961853, 	0, 	0,	0	},
	sf = { -1988.5693359375, 507.0029296875, 35.171875,	0, 	0,	90	},
	--sfia = { -1689.0689697266, 	-536.7919921875, 	14.254997, 	0, 	0,	252	},
	lv = { 1691.6801757813, 	1449.1293945313, 	10.765375,	0, 	0,	268	},
	kohsf = { -2254.7575683594, -1711.1319580078, 479.9118957519,	0, 	0,	180	},
	--bank = { 596.82421875, -1245.7109375, 18.19867515564, 0, 0, 24 }, old bank
	bank = { 1570.4228515625, -1337.3984375, 16.484375, 0, 0, 180 },
	medic = { 329.22778320312, -1515.6267089844, 35.867187, 0, 0, 3 },
	mechanic = { 424.13619995117, -1792.6589355469, 5.1720623970032, 0, 0, 267 },
	charrah = {  1369.5415039062, -959.06903076172, 34.29866027832,  0,  0,  352.89239501953 },
	--bayside = {  424.13619995117, -1792.6589355469, 0, 0, 360 },
	--sfpd = {  -1607.71875, 722.9853515625, 12.368106842041, 0, 0, 360 },
	--igs = {  1968.3681640625, -1764.0224609375, 13.546875, 0, 0, 120 },
	--lsia = { 1967.7998046875, -2180.470703125, 13.546875, 0, 0, 165 },
	--ash = { 1178.9794921875, -1324.212890625, 14.146828651428, 0, 0, 268 },
	--dmv = { 1094.306640625, -1791.857421875, 13.617427825928, 0, 0, 255 },
	--lstr = {  2668.1298828125, -2554.9990234375, 13.614336013794, 0, 0, 180 },
	--vgs = { 996.34375, -920.4052734375, 42.1796875, 0, 0, 6 },
}

function showValidTeleportLocations(thePlayer, commandName)
	if getElementData(thePlayer, "acc:admin") >= 1 then
		outputChatBox("----- VALID /GO PLACES -----", thePlayer)
		outputChatBox("ls", thePlayer)
		outputChatBox("lv", thePlayer)
		outputChatBox("sf", thePlayer)
		outputChatBox("kohsf", thePlayer)
		outputChatBox("medic", thePlayer)
		outputChatBox("mechanic", thePlayer)
		outputChatBox("charrah", thePlayer)
	end
end
addCommandHandler("place", showValidTeleportLocations, false, false)

function teleportToPresetPoint(thePlayer, commandName, target, optionalPlayer)
	if getElementData(thePlayer, "acc:admin") >= 1 then
		if not (target) then
			outputChatBox("SYNTAX: /" .. commandName .. " [place] [Player to teleport (optional)]", thePlayer, 255, 194, 14)
			showValidTeleportLocations(thePlayer, "places")
		elseif not optionalPlayer and target then
			local target = string.lower(tostring(target))
			
			if (teleportLocations[target] ~= nil) then
				if (isPedInVehicle(thePlayer)) then
					local veh = getPedOccupiedVehicle(thePlayer)
					setElementAngularVelocity(veh, 0, 0, 0)
					setElementPosition(veh, teleportLocations[target][1], teleportLocations[target][2], teleportLocations[target][3])
					setVehicleRotation(veh, 0, 0, teleportLocations[target][6])
					setTimer(setElementAngularVelocity, 50, 20, veh, 0, 0, 0)
					
					setElementDimension(veh, teleportLocations[target][5])
					setElementInterior(veh, teleportLocations[target][4])

					setElementDimension(thePlayer, teleportLocations[target][5])
					setElementInterior(thePlayer, teleportLocations[target][4])
					setCameraInterior(thePlayer, teleportLocations[target][4])
				else
					detachElements(thePlayer)
					setElementPosition(thePlayer, teleportLocations[target][1], teleportLocations[target][2], teleportLocations[target][3])
					setPedRotation(thePlayer, teleportLocations[target][6])
					setElementDimension(thePlayer, teleportLocations[target][5])
					setCameraInterior(thePlayer, teleportLocations[target][4])
					setElementInterior(thePlayer, teleportLocations[target][4])
				end
				triggerEvent ( "frames:loadInteriorTextures", thePlayer, teleportLocations[target][5] ) -- Adams
			else
				outputChatBox("Invalid Place Entered!", thePlayer, 255, 0, 0)
			end
		elseif optionalPlayer and target then
			local target = string.lower(tostring(target))
			local targetPlayer, targetPlayerName = exports.san_core:findPlayer(thePlayer, optionalPlayer)
				
			if targetPlayer then
				local logged = getElementData(targetPlayer, "loggedin")
					
				if (logged==0) then
					outputChatBox("Player is not logged in.", thePlayer, 255, 0 , 0)

				elseif (teleportLocations[target] ~= nil) then
					outputChatBox("You have been teleported to "..tostring(target).." by "..exports.global:getPlayerFullIdentity(thePlayer)..".", targetPlayer, 255, 194, 14)
					outputChatBox("You have teleported "..exports.global:getPlayerFullIdentity(thePlayer).." to "..tostring(target)..".", thePlayer, 255, 194, 14)
					if (isPedInVehicle(targetPlayer)) then
						local veh = getPedOccupiedVehicle(targetPlayer)
						setElementAngularVelocity(veh, 0, 0, 0)
						setElementPosition(veh, teleportLocations[target][1], teleportLocations[target][2], teleportLocations[target][3])
						setVehicleRotation(veh, 0, 0, teleportLocations[target][6])
						setTimer(setElementAngularVelocity, 50, 20, veh, 0, 0, 0)
						
						setElementDimension(veh, teleportLocations[target][5])
						setElementInterior(veh, teleportLocations[target][4])

						setElementDimension(targetPlayer, teleportLocations[target][5])
						setElementInterior(targetPlayer, teleportLocations[target][4])
						setCameraInterior(targetPlayer, teleportLocations[target][4])
					else
						detachElements(targetPlayer)
						setElementPosition(targetPlayer, teleportLocations[target][1], teleportLocations[target][2], teleportLocations[target][3])
						setPedRotation(targetPlayer, teleportLocations[target][6])
						setElementDimension(targetPlayer, teleportLocations[target][5])
						setCameraInterior(targetPlayer, teleportLocations[target][4])
						setElementInterior(targetPlayer, teleportLocations[target][4])
					end
					triggerEvent ( "frames:loadInteriorTextures", targetPlayer, teleportLocations[target][5] ) -- Adams
				else
					outputChatBox("Invalid Place Entered!", thePlayer, 255, 0, 0)
				end
			end
		else
			outputChatBox("ERROR: Contact a scripter with code #T97sA", thePlayer, 255)
		end
	end
end
addCommandHandler("go", teleportToPresetPoint, false, false)



















local time = 10 --In seconds, time, when player is frozen 
  
function silencedmodes(localPlayer, number) 
local mode = tonumber(number) 
if mode == 0 then 
--tazer 
setElementData(localPlayer,"silencedmode", 0) 
elseif mode == 1 then 
--leathal 
setElementData(localPlayer,"silencedmode", 1) 
elseif mode ==2 then 
--radar 
setElementData(localPlayer,"silencedmode", 2) 
end 
end 
addEvent("silencedmode", true) 
addEventHandler("silencedmode", getRootElement(), silencedmodes, thePlayer, number) 
function tazerShot(x, y, z, target) 
    local px, py, pz = getElementPosition(source)
	local distance = getDistanceBetweenPoints3D(x, y, z, px, py, pz)

	if (distance<20) then
		if (isElement(target) and getElementType(target)=="player") then
			for key, value in ipairs(getElementsByType("player")) do
				if (value~=source) then
					triggerClientEvent(value, "showTazerEffect", value, x, y, z, value) 
				end
			end
			setElementData(target, "tazed", 1, false)
			--toggleAllControls(target, false, false, false)

			--setPedAnimation(target, "ped", "FLOOR_hit_f", -1, false, false, true)
            setPedAnimation( target, "ped", "FLOOR_hit_f")  
            setTimer(setElementFrozen, time * 1000, 1, target, false)

			--setTimer(removeAnimation, 100, 1, target)
			setElementFrozen(target, true)
			setElementData(target,"lesokkolt",true)

--[[
			toggleControl(target,'next_weapon',false)
			toggleControl(target,'previous_weapon',false)
			toggleControl(target,'fire',false)
			toggleControl(target,'aim_weapon',false)
			toggleControl(target,'forwards',false)
			toggleControl(target,'backwards',false)
			toggleControl(target,'left',false)
			toggleControl(target,'right',false)
]]
			executeCommandHandler ( "render", target )

			--outputChatBox(tostring(getElementData(target,"lesokkolt")))
		end
	end
end
  
addEvent("tazerFired", true) 
addEventHandler("tazerFired", getRootElement(), tazerShot, x, y, z, target)   
  
function killmebyped(target) 
--killed by ped blahhhh 
end 
  
  
  
  
  
  
  
  
  
  
--[[function warn2()
	
	
	                if getElementData (thePlayer, "char:farhan") == 3 then
		
			
			
			        
			        local farhan = getElementData(thePlayer, "acc:admin") or 0
					farhan = farhan - 1
					setElementData(thePlayer, "acc:admin", farhan)
					dbExec(con, "UPDATE accounts SET admin=? WHERE id='" .. getElementData(thePlayer, "char:id") .. "'", farhan)
				--if getElementData(targetPlayer, "char.Cuffed") == 1 then
					setElementData(targetPlayer, "char:farhan", 1)
					setElementFrozen(targetPlayer, false)
					toggleControl(targetPlayer,'previous_weapon',true)
					toggleControl(targetPlayer,'fire',true)
					toggleControl(targetPlayer,'aim_weapon',true)
					toggleAllControls(targetPlayer, true, true, true)
					outputChatBox(info .. "Você algemou com sucesso o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#fffffff.", thePlayer, 255, 255, 255, true)
					outputChatBox(info .. " #7cc576" .. getPlayerName(thePlayer):gsub("_"," ") .. "#fffffff ele algemou você.", targetPlayer, 255, 255, 255, true)
					outputAdminMessage("#7cc576" .. getPlayerAdminName(thePlayer) .. "#ffffff ele algemou o #7cc576" .. targetPlayerName:gsub("_"," ") .. "#ffffff.")
				--else
					
					local aw = getElementData(thePlayer, "char:farhan") or 0
					setElementData (thePlayer, "char:farhan", 0)
					
					dbExec(con, "UPDATE characters SET farhan=? WHERE id='" .. getElementData(thePlayer, "char:id") .. "'", aw)
					outputChatBox("#fff000[IRG-MTA] #ffffffShoma Rank Down Shodi!!", thePlayer, 255 ,255, 255, true)
					
			
		
	                end
end
  
addEvent("onLoginClick", true)
addEventHandler("onLoginClick", root, warn2)]]




	function pm(player)

		--outputChatBox("#7cc576[BV - LOG]:#ffffff "..getPlayerName(player).." Usou o comando /adminduty para entrar de Staff  ",v,255,255,255,true)
		if  getElementData(player, "char:playedTime") <= 5 then
		outputAdminMessage1("Player #ffffffBe Esme #fff000" ..getElementData(player,"char:name").. "#ffffff Ba ID: #fff000"..getElementData(player,"acc:id").."#ffffff  Vared Shahr Shod" )
		
		end	
		
	
    end
--addCommandHandler("aloo",pm)
addEvent("onLoginClick", true)
addEventHandler("onLoginClick", root, pm)

--addEventHandler ( "onResourceStart",pm )






