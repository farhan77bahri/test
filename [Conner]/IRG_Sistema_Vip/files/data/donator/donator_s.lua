local con = exports.san_mysql:getConnection()

local Superman = {}

-- Static global values
local rootElement = getRootElement()
local thisResource = getThisResource()



-- Static global values
local rootElement = getRootElement()
local thisResource = getThisResource()




-----------------------------------------------------------------------SISTEMA VIP ABAIXO----------------------------------------------------------------------
function findPlayerByName (name)
	local player = getPlayerFromName(name)
	if player then return player end
	for i, player in ipairs(getElementsByType("player")) do
		if string.find(string.gsub(getPlayerName(player):lower(),"#%x%x%x%x%x%x", ""), name:lower(), 1, true) then
			return player
		end
	end
return false
end
----------------------------------------------------------------------------------------
function convertMS( timeMs )


    value = math.floor(timeMs/86400)
	local horas	= math.floor((timeMs - (value*86400))/(60*60))
	local s = math.floor(timeMs/60)

	local minutes	= tostring(math.fmod(s,60))
	local timeMs	= timeMs - minutes * 60;

	local seconds	= math.floor( timeMs / 60 )
	local ms		= timeMs - seconds * 60;

	return string.format( '%02d Dia(s) = %02d Hora(s) = %3d minuto(s) = %3d Segundo(s)', value, horas, minutes, ms );

end


addEventHandler("onResourceStart", getResourceRootElement(getThisResource()),
	function()
		setTimer(checkLoggedPlayer,2000,1)
		setTimer(checkojogador,60000,0)

		for id,thePlayer in pairs(getElementsByType("player")) do
		setElementData(thePlayer, "conviteAccp", false)
		end

	end)


function checkojogador()
	for id,thePlayer in pairs(getElementsByType("player")) do
		local account = getPlayerAccount(thePlayer)
		if not (isGuestAccount(account)) then
			aviso(thePlayer)
		end
	end
end

function aviso(thePlayer)
	removeovip(thePlayer)
end
function removeovip(thePlayer)
	if thePlayer then
		local account = getPlayerAccount(thePlayer)
		if not isGuestAccount(account) then
			local donatorState,donatorTime = false,"NOT AVAILABLE"
			if getAccountData(account,"donatorEnabled") == 1 then
				local donatorTime = tonumber(getAccountData(account,"donatorTime"))
				if donatorTime then
					local currentTime = getRealTime()
					if donatorTime > currentTime.timestamp then
					else


local Account = getPlayerAccount(thePlayer)
local AccountName = getAccountName(Account)
if isPlayerVIP ( AccountName ) == true then
if isCodeEnable ( getAccountActivationCode(AccountName) ) == true then
removeActivationCode ( getAccountActivationCode(AccountName)  )
end
end
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 0 .. "' WHERE id='" .. getElementData(thePlayer, "acc:id") .. "'")
if (sql) then

						setElementData(thePlayer,"VIP",false)
						setAccountData(account,"donatorEnabled",0)
						setAccountData(account,"donatorTime",0)
						outputChatBox("#FFA000**VIP #FFFFFFSeu vip acaba de expirar!.",thePlayer,255,255,255,true)
						if getAccountData(account, "myHouse") then
						     outputChatBox("#FFA000**VIP #FFFFFFO Aluguel da sua casa venceu.",thePlayer,255,255,255,true)
						     setAccountData(account, "myHouse", false)
						     return
						end
						triggerClientEvent (thePlayer, "PainelOFF", getRootElement())
						setElementData(thePlayer, "acc:aseged", 0)
						return removeovip(thePlayer)
					end
				end
			end
		end
	end
end
end

------------------------------------------------------------------------

function checkLoggedPlayer()
	for id,thePlayer in pairs(getElementsByType("player")) do
		local account = getPlayerAccount(thePlayer)
		if not (isGuestAccount(account)) then
			onPlayerLoginHandler(thePlayer)
		end
	end
end

function onPlayerLoginHandler(thePlayer)
	donatorLogin(thePlayer)
end


function onPlayerLogin (_, playeraccount)
		donatorLogin(source)
end
addEventHandler ( "onPlayerLogin", getRootElement ( ), onPlayerLogin)


function donatorLogin(thePlayer)
	if thePlayer then
		local account = getPlayerAccount(thePlayer)
		if not isGuestAccount(account) then
			local donatorState,donatorTime = false,"NOT AVAILABLE"
			if getAccountData(account,"donatorEnabled") == 1 then
				local donatorTime = tonumber(getAccountData(account,"donatorTime"))
				if donatorTime then
					local currentTime = getRealTime()
					if donatorTime > currentTime.timestamp then
						local donatorState,donatorTime = true,convertMS(donatorTime-currentTime.timestamp)
						outputChatBox("#7cc576[4i20 - Vip]:#ffffff Seu Vip expira em "..(tostring(donatorTime) or 'BUGGED').." ",thePlayer,255,255,255,true)
						setElementData(thePlayer,"VIP",true)
     						local accName = getAccountName ( getPlayerAccount ( thePlayer ) )
     						if getElementData(thePlayer, "acc:aseged") == 0 then
								local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 1 .. "' WHERE id='" .. getElementData(thePlayer, "acc:id") .. "'")
								if (sql) then
								setElementData(thePlayer, "acc:aseged", 1)
								setAccountData(account, "myHouse", true)
							end
						end
					else


local Account = getPlayerAccount(thePlayer)
local AccountName = getAccountName(Account)
if isPlayerVIP ( AccountName ) == true then
if isCodeEnable ( getAccountActivationCode(AccountName) ) == true then
removeActivationCode ( getAccountActivationCode(AccountName)  )
end
end
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 0 .. "' WHERE id='" .. getElementData(thePlayer, "acc:id") .. "'")
						if (sql) then
						setElementData(thePlayer, "acc:aseged", 0)
						setElementData(thePlayer,"VIP",false)
						setAccountData(account,"donatorEnabled",0)
						outputChatBox("#7cc576[4i20 - Vip]:#ffffff Seu Vip expirou",thePlayer,255,255,255,true)
						return donatorLogin(thePlayer)
					end
				end
			end
		end
	end
end
end


function donatorLogin222(thePlayer)
	if thePlayer then
		local account = getPlayerAccount(thePlayer)
		if not isGuestAccount(account) then
			local donatorState,donatorTime = false,"NOT AVAILABLE"
			if getAccountData(account,"donatorEnabled") == 1 then
				local donatorTime = tonumber(getAccountData(account,"donatorTime"))
				if donatorTime then
					local currentTime = getRealTime()
					if donatorTime > currentTime.timestamp then
						local donatorState,donatorTime = true,convertMS(donatorTime-currentTime.timestamp)
						outputChatBox( "#FFFFFF**VIP #FFA000Seu VIP Expira em "..(tostring(donatorTime) or 'BUGGED').." ",thePlayer,255,255,255, true)
					end
				end
			end
		end
	end
end
addCommandHandler("tempovip", donatorLogin222)



addEvent("getIP", true)
addEventHandler("getIP", root, function()
local country = exports.admin:getPlayerCountry(source)
local ip = getPlayerIP(source)
local accountName = getAccountName(getPlayerAccount(source))
local donatorTime = tonumber(getAccountData(getPlayerAccount(source),"donatorTime"))
if donatorTime then
local currentTime = getRealTime()
if donatorTime > currentTime.timestamp then
local donatorState,donatorTime = true,convertMS(donatorTime-currentTime.timestamp)
setElementData(source,"seuip",ip)
setElementData(source,"conta",accountName)
setElementData(source,"vip",donatorTime)
setElementData(source, "Country", country)
end
end
end
)


--[[
addEvent("getIP", true)
addEventHandler("getIP", root, function()
local country = exports.admin:getPlayerCountry(source)
local ip = getPlayerIP(source)
local accountName = getAccountName(getPlayerAccount(source))
setElementData(source,"seuip",ip)
setElementData(source,"conta",accountName)
setElementData(source, "Country", country)
end
)]]--

---------------------------------------------------------------






--[[======================================================================
======================================================================
======================================================================]]--

local VehicleVIP = {}

function outButDxChat (Text,player,r,p,g)
outputChatBox(Text,player,r,p,g, true)
end

local key = get("KeyToOpen")
setElementData(getRootElement(),"KeyToOpenWindow",key)
function isPlayerVIP ( AccountName )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE AccountName = ?", tostring ( AccountName ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return true
end
end




function showPanel23(source)
    accountname = getAccountName (getPlayerAccount(source))
    if isObjectInACLGroup ( "user." .. accountname, aclGetGroup ( "Console" ) ) then
	triggerClientEvent (source, "PainelVipAdmin", getRootElement())
    end
end
addCommandHandler("vipadmin",showPanel23)



addEventHandler("onPlayerLogin", root,
function()
	if getElementData(source, "acc:aseged") == 1 then
	setElementData(source, "VIP", true)
	--outputChatBox("#7cc576[4i20 - Vip]: #00ff00BEM VINDO USUÁRIO PRESSIONE F10 PARA ACESSAR O PAINEL VIP",source, 255, 100, 255,true)

	else
	setElementData(source, "VIP", false)
	end
end
)

function getAccountActivationCode ( AccountName )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE AccountName = ?", tostring ( AccountName ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return result[ 1 ][ "ActivationCode" ]
end
end

function setVIPPlayerName ( AccountName, PlayerName )
executeSQLQuery( "UPDATE `VIP` SET `PlayerName` = '".. tostring ( PlayerName ) .."' WHERE `AccountName` = '" .. tostring ( AccountName ) .."'" )
end

addEventHandler ( "onResourceStart", resourceRoot,
function ( )
executeSQLQuery ( "CREATE TABLE IF NOT EXISTS VIP (ActivationCode TEXT, AccountName TEXT, PlayerName TEXT, TimeToEnd TEXT, Status TEXT, Use TEXT)" )
for i,player in ipairs (getElementsByType("player")) do
local Account = getPlayerAccount(player)
if not (isGuestAccount(Account)) then
local AccountName = getAccountName(Account)
if isPlayerVIP ( AccountName ) == true then
if isCodeEnable ( getAccountActivationCode(AccountName) ) == true then
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 1 .. "' WHERE id='" .. getElementData(player, "acc:id") .. "'")
if (sql) then
setElementData(player, "acc:aseged", 1)
setElementData(player,"VIP",true)
else
setElementData(player,"VIP",false)
end
else
setElementData(player,"VIP",false)
end
else
setElementData(player,"VIP",false)
end
end
end
end
)

function JoinPlayer ( )
setElementData(source,"VIP",false)
setElementData(source,"Admin",false)
end

addEventHandler ( "onPlayerJoin", getRootElement(), JoinPlayer )
addEventHandler("onPlayerLogin", root,
function(_,Account)
local AccountName = getAccountName(Account)
if isPlayerVIP ( AccountName ) == true then
if isCodeEnable ( getAccountActivationCode(AccountName) ) == true then
setElementData(source,"VIP",true)
local Account = getPlayerAccount(source)
local AccountName = getAccountName(Account)
setVIPPlayerName ( AccountName, getPlayerName(source) )
else
setElementData(source,"VIP",false)
end
else
setElementData(source,"VIP",false)
end
end
)

function doesCodeExsit ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ?", tostring ( ActivationCode ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return true
end
end

function isCodeUsed ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ? AND Use = ?", tostring ( ActivationCode ), "true" )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return true
end
end
function isCodeEnable ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ? AND Status = ?", tostring ( ActivationCode ), "true" )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return true
end
end

function getActivationCodes()
local result = executeSQLQuery ( "SELECT * FROM VIP" )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return {}
else
return result
end
end

function addNewActivationCode ( ActivationCode )
executeSQLQuery( "INSERT INTO `VIP` (`ActivationCode`, `AccountName`, `PlayerName`, `Status`, `Use`) VALUES ('".. tostring ( ActivationCode ) .."', 'Not Found', 'Not Found', 'true', 'false');" )
end

function removeActivationCode ( ActivationCode )
executeSQLQuery( "DELETE FROM `VIP` WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .. "'" )
end

function getActivationCodeStatus ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ?", tostring ( ActivationCode ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return result[ 1 ][ "Status" ]
end
end

function getActivationCodeAccount ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ?", tostring ( ActivationCode ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return result[ 1 ][ "AccountName" ]
end
end

function setActivationCodeStatus ( ActivationCode, Status )
executeSQLQuery( "UPDATE `VIP` SET `Status` = '".. tostring ( Status ) .."' WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .."'" )
end

function getActivationCodeUse ( ActivationCode )
local result = executeSQLQuery ( "SELECT * FROM VIP WHERE ActivationCode = ?", tostring ( ActivationCode ) )
if ( type ( result ) == "table" and #result == 0 or not result ) then
return false
else
return result[ 1 ][ "Use" ]
end
end

function setActivationCodeUse ( ActivationCode, Use )
executeSQLQuery( "UPDATE `VIP` SET `Use` = '".. tostring ( Use ) .."' WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .."'" )
end

function editActivationCode ( ActivationCodeOLD, ActivationCode, TimeToEnd )
executeSQLQuery( "UPDATE `VIP` SET `ActivationCode` = '" .. tostring ( ActivationCodeOLD ) .."'" )
executeSQLQuery( "UPDATE `VIP` SET `ActivationCode` = '".. tostring ( ActivationCode ) .."' WHERE `ActivationCode` = '" .. tostring ( ActivationCodeOLD ) .."'" )
end

function setActivationCodeUseByPlayer ( ActivationCode, AccountName, PlayerName )
executeSQLQuery( "UPDATE `VIP` SET `Use` = 'true' WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .."'" )
executeSQLQuery( "UPDATE `VIP` SET `AccountName` = '" .. tostring ( AccountName ) .."' WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .."'" )
executeSQLQuery( "UPDATE `VIP` SET `PlayerName` = '" .. tostring ( PlayerName ) .."' WHERE `ActivationCode` = '" .. tostring ( ActivationCode ) .."'" )
end

function nickChangeHandler(oldNick, newNick)
if getElementData(source,"VIP") == true then
local Account = getPlayerAccount(source)
local AccountName = getAccountName(Account)
setVIPPlayerName ( AccountName, newNick )
end
end
addEventHandler("onPlayerChangeNick", getRootElement(), nickChangeHandler)

addEvent("ActiveVIP",true) 
addEventHandler("ActiveVIP",root, 
function (player,ActivationCode)
if doesCodeExsit ( ActivationCode ) == true then
if isCodeUsed ( ActivationCode ) == false then
if isCodeEnable ( ActivationCode ) == true then
local Account = getPlayerAccount(player)
if not (isGuestAccount(Account)) then
local AccountName = getAccountName(Account)
if isPlayerVIP ( AccountName ) == false then
setActivationCodeUseByPlayer ( ActivationCode, AccountName, getPlayerName(player) )

							--local time = 30
							--local donatorAccount = getPlayerAccount(player)
						        --local currentTime = getRealTime()
							--local daysToDonate = oneDay * time
							--local tempo = currentTime.timestamp + daysToDonate
							--setAccountData (donatorAccount, "donatorTime", tempo)
							--setAccountData(donatorAccount,"donatorEnabled",1)



local time= getRealTime()
local vipTime= time.timestamp 
setAccountData(getPlayerAccount(player),"donatorEnabled",1)
setAccountData(getPlayerAccount(player),"donatorTime",(vipTime)+(30*86400))

donatorLogin(player)

outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)
outputChatBox(" ",root,255,255,255,true)

outputChatBox("#FF14934i20: O JOGADOR #FFFFFF"..getPlayerName(player).." #FF1493AGORA É UM JOGADOR #FFFFFFVIP #FF1493!! ",root,255,255,255,true)

triggerClientEvent("WriteInVipPanel",player,player,"Codigo ativado, agora você é vip !!",0,255,0)
triggerClientEvent("CloseVipPanel",player,player)
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 1 .. "' WHERE id='" .. getElementData(player, "acc:id") .. "'")
if (sql) then
setElementData(player,"VIP",true)
setElementData(player, "acc:aseged", 1)
else
triggerClientEvent("WriteInVipPanel",player,player,"Você ja é vip, seu vip esta desativado !!",255,0,0)
end
else
triggerClientEvent("WriteInVipPanel",player,player,"Por favor login para usar este código!",255,0,0)
end
else
triggerClientEvent("WriteInVipPanel",player,player,"este vip não é permitido usar!",255,0,0)
end
else
triggerClientEvent("WriteInVipPanel",player,player,"Este código já utilizado por outro jogador!",255,0,0)
end
else
triggerClientEvent("WriteInVipPanel",player,player,"Não encontrado",255,0,0) 
end
end
end
)














addEvent("CreateCode",true) 
addEventHandler("CreateCode",root, 
function (player,ActivationCode)
if doesCodeExsit ( ActivationCode ) == false then
addNewActivationCode ( ActivationCode )
outButDxChat( "#7cc576[4i20 - Vip]: #00ff00Codigo criado com sucesso!!",player,0, 255, 255 )
triggerClientEvent("HideCreateNewCodePanel",player,player)
triggerEvent("RefreshTheAdminWindow",player,player)
else
outButDxChat( "#7cc576[4i20 - Vip]: #FF0000Este código de ativação é já existem!!",player,0, 255, 255)
end
end
)

addEvent("RefreshTheAdminWindow",true) 
addEventHandler("RefreshTheAdminWindow",root, 
function (player)
Table = {}
for index, VIP in ipairs ( getActivationCodes() ) do
table.insert ( Table, { ActivationCodes = VIP [ "ActivationCode" ],PlayerName = VIP [ "PlayerName" ],Status = VIP [ "Status" ],})
end
triggerClientEvent("RefreshTheAdminWindow",player,player,Table)
end
)

addEvent("ChangeStatus",true) 
addEventHandler("ChangeStatus",root, 
function (player,ActivationCode,PlayerName)
if doesCodeExsit ( ActivationCode ) == true then
if isCodeEnable ( ActivationCode ) == true then
setActivationCodeStatus ( ActivationCode, 'false' )
outButDxChat( "#7cc576[4i20 - Vip]: #00FF00Feito desativar o código de ativação!!",player,0, 255, 255 )
triggerEvent("RefreshTheAdminWindow",player,player)
TheVIPPlayer = false
for i,player in ipairs (getElementsByType("player")) do
if player == getPlayerFromName(PlayerName) then
TheVIPPlayer = getPlayerFromName(PlayerName)
end
end
if not (TheVIPPlayer == false) then
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 0 .. "' WHERE id='" .. getElementData(TheVIPPlayer, "acc:id") .. "'")
if (sql) then
setElementData(TheVIPPlayer,"VIP",false)
setElementData(TheVIPPlayer, "acc:aseged", 0)
end
end
else
setActivationCodeStatus ( ActivationCode, 'true' )
outButDxChat( "#7cc576[4i20 - Vip]:#00ff00 Feito permitir o código de ativação!!",player,0, 255, 255 )
triggerEvent("RefreshTheAdminWindow",player,player)
TheVIPPlayer = false
for i,player in ipairs (getElementsByType("player")) do
if player == getPlayerFromName(PlayerName) then
TheVIPPlayer = getPlayerFromName(PlayerName)
end
end
if not (TheVIPPlayer == false) then
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 1 .. "' WHERE id='" .. getElementData(TheVIPPlayer, "acc:id") .. "'")
if (sql) then
setElementData(TheVIPPlayer,"VIP",true)
setElementData(TheVIPPlayer, "acc:aseged", 1)
end
end
end
else
outButDxChat( "#7cc576[4i20 - Vip]: #ff0000Este Código não foi encontrado!!",player,0, 255, 255 )
end
end
)

addEvent("DeleteCode",true) 
addEventHandler("DeleteCode",root,
function (player,ActivationCode,PlayerName)
if doesCodeExsit ( ActivationCode ) == true then

for i,player in ipairs (getElementsByType("player")) do
if player == getPlayerFromName(PlayerName) then
TheVIPPlayer = getPlayerFromName(PlayerName)
end
end
local sql = dbExec(con, "UPDATE accounts SET aseged='" .. 0 .. "' WHERE id='" .. getElementData(TheVIPPlayer, "acc:id") .. "'")
if (sql) then
removeActivationCode ( ActivationCode )
setElementData(TheVIPPlayer,"VIP",false)
setAccountData(getPlayerAccount ( TheVIPPlayer ),"donatorEnabled",0)
setAccountData(getPlayerAccount ( TheVIPPlayer ),"donatorTime",0)
setElementData(TheVIPPlayer, "acc:aseged", 0)
setElementData(TheVIPPlayer,"VIP",false)
setAccountData(getPlayerAccount ( TheVIPPlayer ), "myHouse", true)				

outButDxChat( "#7cc576[4i20 - Vip]: #00FF00Feito apagar o código de ativação!!",player,0, 255, 255 )
triggerEvent("RefreshTheAdminWindow",player,player)

aviso(TheVIPPlayer)


end
end
end
)







addEvent("EditCode",true) 
addEventHandler("EditCode",root, 
function (player,ActivationCode)
setActivationCodeStatus ( ActivationCode, 'true' )
setElementData(player,"VIP",true)
editActivationCode ( getElementData(player,"ActiCodeOLD"), ActivationCode, TimeToEnd )
outButDxChat( "#7cc576[4i20 - Vip]: #00FF00Feito codigo editado com sucesso!!",player,0, 255, 255 )
triggerClientEvent("HideEditCodePanel",player,player)
triggerEvent("RefreshTheAdminWindow",player,player)
end
)
------------



--============================================================ SISTEM HOUSE ========================================================--

local entrada = createPickup(1654.043, -1656.188, 21.516 + 1.5, 3, 1318, 1)
local stopAll = createMarker (1654.043, -1656.188, 21.516 - 1, "cylinder", 3, getColorFromString("#FFA00020"))
blipM = createBlipAttachedTo ( entrada, 31 )

exitH ={}

house = createColCuboid(2246.00488, -1225.78796, 1045.02002, 25.59375, 21.1416015625, 11.9)

function enterH (thePlayer)
     local account = getPlayerAccount(thePlayer)
	 if not isGuestAccount(account) then 
	    -- if (getAccountData(account, "myHouse")) then
	     local theVehicle = getPedOccupiedVehicle ( thePlayer )
		 if theVehicle then outputChatBox("#FFFFFF**CASA #FFA000Saia dp veiculo para entrar na casa.", thePlayer, 255,255,255, true) return end


		     if not getAccountData(account,"donatorEnabled") == 1 then
			     outputChatBox( "#FFFFFF**CASA #FFA000Você não possui uma casa ou ela ja venceu!",thePlayer,255,255,255, true)
			 else
			 if (getElementData(thePlayer, "VIP") == false) then outputChatBox( "#FFFFFF**CASA #FFA000Você não possui uma casa ou ela ja venceu.",thePlayer,255,255,255, true) return end  
			     if isElementWithinMarker(thePlayer, stopAll) then
				 dim = getElementData(thePlayer, "char:id")
		         outputChatBox( " ",thePlayer,255,255,255, true)
 	    		 outputChatBox( " ",thePlayer,255,255,255, true)
     			 outputChatBox( " ",thePlayer,255,255,255, true)
    			 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( " ",thePlayer,255,255,255, true)
	     		 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( " ",thePlayer,255,255,255, true)
	    		 outputChatBox( "#FFFFFF**CASA #FFA000Bem vindo a sua residencia Sr. #FFFFFF"..getPlayerName(thePlayer),thePlayer,255,255,255, true)
				     setElementPosition(thePlayer, 2264.536, -1210.322, 1048.023)
					 setElementInterior(thePlayer, 10)
					 setElementDimension(thePlayer, dim)
					 if isElement (exitH[thePlayer]) then
					     destroyElement(exitH[thePlayer])
					 end
					     exitH[thePlayer] = createMarker (2270.16, -1210.516, 1046.563, "cylinder", 1.3, getColorFromString("#FFA00020"))
						 setElementDimension(exitH[thePlayer], getElementDimension(thePlayer))
						 setElementInterior(exitH[thePlayer], getElementInterior(thePlayer))
						 addEventHandler("onMarkerLeave", exitH[thePlayer], exitLH)
						 addEventHandler("onMarkerHit", exitH[thePlayer], exitMYH)


				 --end
			 end
		 end
     end
end
addEventHandler("onMarkerHit", stopAll, enterH)

--setElementInterior(exitH, 10)

function exitMYH (thePlayer)
     local account = getPlayerAccount(thePlayer)
	 if not isGuestAccount(account) then 
	     exports.san_hud:drawNote("house", "[HOUSE]: para sair da casa pressione 'X'", thePlayer, 255, 255, 255, 15000)
		 bindKey( thePlayer, "x","down", exitHS)
     end
end

function exitLH (thePlayer)
     local account = getPlayerAccount(thePlayer)
	 if not isGuestAccount(account) then 
		 unbindKey( thePlayer, "x","down", exitHS)
     end
end

function exitHS (thePlayer)
     local account = getPlayerAccount(thePlayer)
	 if not isGuestAccount(account) then 
		 setElementPosition(thePlayer, 1654.428, -1660.824, 22.5160)
		 setElementDimension(thePlayer, 0)
		 setElementInterior(thePlayer, 0)
			     		 if isElement (exitH[conHouse]) then
			     		     destroyElement(exitH[conHouse])
			    		 end
     end     
end

Mconvite = createMarker (1658.722, -1656.715, 21.516, "cylinder", 1.2, getColorFromString("#FF000020"))

function infconvite (thePlayer)
	 outputChatBox( " ",thePlayer,255,255,255, true)
 	 outputChatBox( " ",thePlayer,255,255,255, true)
     outputChatBox( " ",thePlayer,255,255,255, true)
     outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( " ",thePlayer,255,255,255, true)
	 outputChatBox( "#FFA000[AVISO] #FFFFFFPara pedir para ser convidado a uns dos apartamentos digite o commando abaixo.",thePlayer,255,255,255, true)
	 outputChatBox( "#FFA000[SYNTAX] #FFFFFF/convite [ID] do dono do apartamento.",thePlayer,255,255,255, true)     
end
addEventHandler("onMarkerHit", Mconvite, infconvite)

function convite (thePlayer, command, id)
     if id then
	     nid = tonumber(id)
		 if isElementWithinMarker(thePlayer, Mconvite) then
		     for index, ownerHouse in pairs(getElementsWithinColShape(house, "player")) do
				 if (getElementData(ownerHouse, "char:id") == nid) then
					 local account = getPlayerAccount(ownerHouse)
					 if (getAccountData(account, "myHouse")) then
                             outputChatBox( "#FFA000[CONVITE] #FFFFFFConvite enviado com sucesso",thePlayer,255,255,255, true)  
                         if (getElementData(ownerHouse, "char:id") == getElementDimension(ownerHouse)) then	
                         if (getElementData(ownerHouse, "conviteAccp")) then outputChatBox( "#FFA000[ERROR] #FFFFFFOcorreu um problema ao enviar o convite... Aguarde alguns segundos",thePlayer,255,255,255, true) return end				 
						     outputChatBox( " ",ownerHouse,255,255,255, true)
 	                         outputChatBox( " ",ownerHouse,255,255,255, true)
                             outputChatBox( " ",ownerHouse,255,255,255, true)
                             outputChatBox( "#FFA000[CONVITE] #FFFFFFO jogador "..getPlayerName(thePlayer).." #FFFFFFpediu para entrar no seu apartamento.",ownerHouse,255,255,255, true)
						     triggerClientEvent(ownerHouse, "startDxH", root, getPlayerName(thePlayer))
							 setElementData(ownerHouse, "conviteAccp", getElementData(thePlayer, "char:id"))
							 else
						     outputChatBox( " ",thePlayer,255,255,255, true)
 	                         outputChatBox( " ",thePlayer,255,255,255, true)
                             outputChatBox( " ",thePlayer,255,255,255, true)
                             outputChatBox( "#FFA000[CONVITE] #FFFFFFO jogador "..getPlayerName(ownerHouse).." #FFFFFFnão esta em sua casa.",thePlayer,255,255,255, true)
						 end
					 end
				 end
			 end
		 end
	 end
end
addCommandHandler("convite", convite)

function getElementsWithinMarker(marker)
	if (not isElement(marker) or getElementType(marker) ~= "marker") then
		return false
	end
	local markerColShape = getElementColShape(marker)
	local elements = getElementsWithinColShape(markerColShape)
	return elements
end

function acc (thePlayer, id)
     if id then
	     nid = tonumber(id)
		 if isElementWithinColShape(thePlayer, house) then
		     for index, conHouse in pairs(getElementsWithinMarker(Mconvite, "player")) do
				 if (getElementData(conHouse, "char:id") == getElementData(thePlayer, "conviteAccp")) then
					 local account = getPlayerAccount(thePlayer)
					 if (getAccountData(account, "myHouse")) then
					     if (nid == 1) then
				             dim = getElementData(thePlayer, "char:id")
		                     outputChatBox( " ",conHouse,255,255,255, true)
 	    	             	 outputChatBox( " ",conHouse,255,255,255, true)
     	        	     	 outputChatBox( " ",conHouse,255,255,255, true)
    	        	    	 outputChatBox( " ",conHouse,255,255,255, true)
	            	    	 outputChatBox( " ",conHouse,255,255,255, true)
	            	    	 outputChatBox( " ",conHouse,255,255,255, true)
	                 		 outputChatBox( " ",conHouse,255,255,255, true)
	                 		 outputChatBox( " ",conHouse,255,255,255, true)
	    	            	 outputChatBox( " ",conHouse,255,255,255, true)
	    	             	 outputChatBox( "#FFFFFF**CASA #FFA000"..getPlayerName(thePlayer).." #FFFFFFAceitou seu convite",conHouse,255,255,255, true)
	    	             	 outputChatBox( "#FFFFFF**CASA #FFA000Você entrou na casa de. #FFFFFF"..getPlayerName(thePlayer),conHouse,255,255,255, true)
					    	 outputChatBox( "#FFFFFF**CASA #FFA000"..getPlayerName(conHouse).." #FFFFFFEntrou em seu apartamento", thePlayer,255,255,255, true)
		     		         setElementPosition(conHouse, 2264.536, -1210.322, 1048.023)
			          		 setElementInterior(conHouse, 10)
			         		 setElementDimension(conHouse, dim)
			         		 if isElement (exitH[conHouse]) then
			         		     destroyElement(exitH[conHouse])
			        		 end
			     		     exitH[conHouse] = createMarker (2270.16, -1210.516, 1046.563, "cylinder", 1.1, getColorFromString("#FFA00001"))
			    			 setElementDimension(exitH[conHouse], getElementDimension(thePlayer))
			    			 setElementInterior(exitH[conHouse], getElementInterior(thePlayer))
			    			 addEventHandler("onMarkerLeave", exitH[conHouse], exitLH)
			    			 addEventHandler("onMarkerHit", exitH[conHouse], exitMYH)
							 setElementData(thePlayer, "conviteAccp", false)	
						 else
						     if (nid == 2) then
	                     		 outputChatBox( " ",conHouse,255,255,255, true)
	                     		 outputChatBox( " ",conHouse,255,255,255, true)
	    	                	 outputChatBox( " ",conHouse,255,255,255, true)
	    	                 	 outputChatBox( "#FFFFFF**NEGADO #FFA000"..getPlayerName(thePlayer).." #FFFFFFrejeitou o seu convite.",conHouse,255,255,255, true)
                                 setElementData(thePlayer, "conviteAccp", false)									 
						     end
						 end
					 end
				 end
			 end
		 end
	 end
end
addEvent("accP", true)
addEventHandler("accP", root, acc)
------------------------------------------------------------------------------------

function exp (thePlayer)
     if isElementWithinColShape(thePlayer, house) then
	     if (getElementData(thePlayer, "char:id") == getElementDimension(thePlayer) or getElementData(thePlayer, "char:adminduty") == 1) then
		     for index, visitas in pairs(getElementsWithinColShape(house, "player")) do
			     if (getElementData(thePlayer, "char:id") == getElementDimension(visitas) or getElementDimension(thePlayer) == getElementDimension(visitas)) then
				     if (getElementData(visitas, "char:id") ~= getElementData(thePlayer, "char:id")) then
				         outputChatBox("#FFA000[VISITAS] #FFFFFF"..getPlayerName(visitas).." ["..getElementData(visitas, "char:id").."]", thePlayer, 255,255,255,true)
					 end
				 end
			 end
		 end
	 end
end
addCommandHandler("visitas", exp)


function kick (thePlayer, command, id)
     if not id then return end
	 ids = tonumber(id)
     if isElementWithinColShape(thePlayer, house) then
	     if (getElementData(thePlayer, "char:id") == getElementDimension(thePlayer) or getElementData(thePlayer, "char:adminduty") == 1) then
		     for index, visitas in pairs(getElementsWithinColShape(house, "player")) do
			     if (getElementData(thePlayer, "char:id") == getElementDimension(visitas) or getElementDimension(thePlayer) == getElementDimension(visitas)) then
				     if (getElementData(visitas, "char:id") == ids)then
					     if (getElementData(visitas, "char:id") == getElementData(thePlayer, "char:id")) then outputChatBox( "#FFFFFF**CASA #FFA000Você não pode se próprio expulsar da sua casa",visitas,255,255,255, true) else
				             exitHS (visitas)
	            	     	 outputChatBox( " ",visitas,255,255,255, true)
	            	    	 outputChatBox( " ",visitas,255,255,255, true)
	            	     	 outputChatBox( " ",visitas,255,255,255, true)
	    	            	 outputChatBox( " ",visitas,255,255,255, true)
	    	            	 outputChatBox( "#FFFFFF**CASA #FFA000Você foi expulso da casa do proprietário #FFFFFF"..getPlayerName(thePlayer),visitas,255,255,255, true) 
					    	 outputChatBox( "#FFFFFF**CASA #FFA000"..getPlayerName(visitas).." #FFFFFFFoi expulso com sucesso de sua casa!",thePlayer,255,255,255, true) 
						 end
					 end
				 end
			 end
		 end
	 end
end
addCommandHandler("expulsar", kick)