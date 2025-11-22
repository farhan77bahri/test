function getSQLData()
	return "dbname=brasilmatamata_bgo;host=127.0.0.1", "root", "", "share=0"
end

--[[function SQL_Logok()
	return "dbname=need_logok;host=127.0.0.1", "root", "pdEpxBkGnFMPB4O5", "share=0"        
end]]--

function connectToDb()

	local mysqlConnect = dbConnect("mysql",getSQLData())
	if not (mysqlConnect) then
		outputDebugString("Eu não consegui me conectar ao MYSQL.")
	else
		outputDebugString("Eu me conectei com sucesso ao MYSQL.")
	end
	
	-- conexão de banco de dados de log
	--[[local logkapcsolodas = dbConnect("mysql",SQL_Logok())
	if not (logkapcsolodas) then
		outputDebugString("Não foi possível conectar-se ao banco de dados needLogok.")
	else
		outputDebugString("Eu me conectei com sucesso ao banco de dados needLogok.")
	end]]--
	
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), connectToDb, false)