local connection = exports["san_mysql"]:getConnection()

addEvent("updateJobToServer", true)
addEventHandler("updateJobToServer", root, function (JobID)
	dbPoll ( dbQuery( connection, "UPDATE characters SET job='?' WHERE id = '?'", JobID, getElementData(source, "acc:id")), -1 )
end)


addEvent("trabalho", true)
addEventHandler("trabalho", root, function (a,b)
	exports.san_employment:setPlayerJob(source, a, a, b,true)
end)