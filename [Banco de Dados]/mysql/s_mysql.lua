felhasznalonev =  "root"
jelszo =  ""
adatbazis = "irangaming"
host = "127.0.0.1"
port = 3306

function getMySQLUsername()
	return felhasznalonev
end

function getMySQLPassword()
	return jelszo
end

function getMySQLDBName()
	return adatbazis
end

function getMySQLHost()
	return host
end

function getMySQLPort()
	return port
end

local sqlDatas = {
	["host"] = "127.0.0.1",
	["user"] = "root",
	["pw"] = "",
	["database"] = "irangaming",
}

function getSQLDatas()
	return sqlDatas
end

addEventHandler("onResourceStart", resourceRoot, function()
	dbHandler = dbConnect( "sqlite", "data.sqlite" )

	dbHandler = dbConnect("mysql","dbname=".. getSQLDatas()["database"] ..";host="..getSQLDatas()["host"], getSQLDatas()["user"], getSQLDatas()["pw"], "autoreconnect=1")
	if not dbHandler then
		outputDebugString("Falha na conexão do mysql",1)
		cancelEvent(true)
	end
end)

function getConnection(res)
    if res then
        local resName = getResourceName(res)
        if resName then
            outputDebugString("Entrou com sucesso no mysql [ "..resName.." ]")
            return dbHandler
        end
	else
		return dbHandler
    end
end


