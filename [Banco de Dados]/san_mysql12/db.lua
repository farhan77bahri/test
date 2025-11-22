
function getSQLData()
	return "dbname=brasilmatamata_bgo;host=127.0.0.1", "root", "", "share=0"
end

function connectToDb()
	local mysqlConnect = dbConnect( "sqlite", "data.sqlite" ) --dbConnect("mysql",getSQLData())
	if not (mysqlConnect) then
		outputDebugString("Falha na conexão do banco de dados SQL!")
	else
		outputDebugString("Conectado ao do banco de dados SQL !")
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), connectToDb, false)