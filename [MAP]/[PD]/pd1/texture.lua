addEventHandler("onClientResourceStart", resourceRoot,
function()
	TXD = engineLoadTXD("policest02_lan.txd")
	engineImportTXD(TXD,3976)	
	engineImportTXD(TXD,7079)	
	
	
	engineSetModelLODDistance(3976,500)
	engineSetModelLODDistance(7079,500)

end
)