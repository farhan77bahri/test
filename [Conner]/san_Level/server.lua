	--exports [ "scoreboard" ]:addScoreboardColumn ( "Level") 
local connection = exports.san_mysql:getConnection()


function convertS(s)
	if type(tonumber(s)) == "number" then
		milisegundo = s
		local horas_seg=3600
		local hora = math.floor(milisegundo/horas_seg)
		local minuto = math.floor((milisegundo-(horas_seg*hora))/60)
		local segundo = math.floor((milisegundo-(horas_seg*hora)-(minuto*60)))	
		local tudo = string.format("%02d:%02d:%02d",hora,minuto,segundo)	
		local dia = math.floor(s/86400)

		return hora,minuto,segundo,tudo,dia
	else
		return 0,0,0,0,0		
	end
end





addEventHandler('onPlayerQuit', getRootElement(), function()
  local played = getElementData(source, "char:onlineTime")
  local account = getElementData(source, "acc:id")
  dbExec(connection, "UPDATE characters SET char:onlineTime = ? WHERE id = ?", played, account)
end)



























--[[


function saveData(conta)
	if conta then
			local source = getAccountPlayer(conta)
			local level = getElementData(source,"Sys:Level") or 0
			local exp = getElementData(source,"LSys:EXP") or 0
			setAccountData (conta, "Sys:Level",level)
			setAccountData (conta, "LSys:EXP",exp)
	end	
end

function loaddata(conta)
	if not (isGuestAccount (conta)) then
		if (conta) then	
			local source = getAccountPlayer(conta)	
			local level = getAccountData(conta,"Sys:Level")
			if type(level) == "boolean" or level == nil then
				level = 0
			end
			setElementData (source, "Sys:Level", tonumber(level))
			setElementData (source, "LSys:EXP",tonumber(getAccountData(conta,"LSys:EXP")) or 0)
		end
	end	
end



addEventHandler("onPlayerLogin", root,
  function( _, acc )
	setTimer(loaddata,1000,1,acc)
  end
)

function startScript ( res )
	if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				loaddata(acc)			
			end
		end
	end
end
addEventHandler ( "onResourceStart", getRootElement(), startScript )

function stopScript( res )
    if res == getThisResource() then
		for i, player in ipairs(getElementsByType("player")) do
			local acc = getPlayerAccount(player)
			if not isGuestAccount(acc) then
				saveData(acc)	
			end
		end
	end
end 
addEventHandler ( "onResourceStop", getRootElement(), stopScript )

function deslogar(acc)
	cancelEvent ()
end
addEventHandler("onPlayerLogout",getRootElement(),deslogar)

function sair ( quitType )
	local acc = getPlayerAccount(source)
	if not (isGuestAccount (acc)) then
		if acc then
			saveData(acc)
		end
	end
end
addEventHandler ( "onPlayerQuit", getRootElement(), sair )]]--


local level_maximo = 23

local levelsTable = {
	[0] = 0,
	[1] = 500,
	[2] = 900, 
	[3] = 1100,
	[4] = 1300, 
	[5] = 1600, 
	[6] = 1900, 
	[7] = 2200, 
	[8] = 2500, 
	[9] = 2800, 
	[10] = 3100, 
	[11] = 3400, 
	[12] = 3700, 
	[13] = 4000, 
	[14] = 4300, 
	[15] = 4600, 
	[16] = 4900, 
	[17] = 5200, 
	[18] = 5500, 
	[19] = 5800, 
	[20] = 6100, 
	[21] = 6400, 
	[22] = 6700, 
	[23] = 7000 

}

function checkLevel( player )
	local player = player
	local playerExp = getElementData( player, "LSys:EXP" ) or 0
	local lv = getElementData( player, "Sys:Level" ) or 1 
	local ganhoXP = 1
	local expCheck = levelsTable[lv]-playerExp
	if expCheck <= 0 then
		local exp = (lv + ganhoXP) == level_maximo and 0 or playerExp - levelsTable[lv]
		exports.san_hud:dm("[ UP ] - Você obteve "..playerExp.." De Experiência e Subiu de Nível para o Nivel  ( "..(lv + ganhoXP).." )", player, 255, 255, 255)

 
		setElementData(player, "Sys:Level", lv + ganhoXP ) 

		setElementData(player, "LSys:EXP", 0 )
		setElementData(player, "LSys:EXPF", 0 )
		playSoundFrontEnd ( player, 101 )
	end
end



function givePlayerExp(player, exp )
	if exp and tonumber(exp) and (getElementData(player , "Sys:Level" ) or 0) ~= level_maximo then
		local playerExp = getElementData(player , "LSys:EXP" ) or 0 
			local lv = getElementData( player, "Sys:Level" ) or 1 

			setElementData( player, "LSys:EXP", playerExp + tonumber(exp) ) 


		checkLevel( player ) 


		setElementData( player, "LSys:EXPF", levelsTable[lv] )
		exports.san_hud:dm("Precisa de "..(levelsTable[lv]-playerExp).." de expêriencia para subir de nivel", player, 255, 255, 255)	
		exports.san_hud:dm("[ UP ] - Você obteve "..tonumber(exp).." de expêriencia", player, 255, 255, 255)	
		
		return true
	end
	return false
end
--[[

addEventHandler( "onClientElementDataChange", root,
	function (dataName)
		if (dataName == "LSys:EXP") then
			checkLevel( source )
		end
	end
)
]]--






setTimer(
	function()
		for i, player in ipairs(getElementsByType("player")) do
		local playerExp = getElementData(player , "LSys:EXP" ) or 0 
		local ganho = math.random (100, 255)
		setElementData( player, "LSys:EXP", playerExp + ganho ) 
		checkLevel( player )

		exports.san_hud:dm("[ UP ] - O servidor te presenteou "..ganho.." de expêriencia", player, 255, 255, 255)
		end
end, 60000 * 60, 0)	





