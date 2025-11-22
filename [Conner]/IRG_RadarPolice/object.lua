addEventHandler("onClientResourceStart", resourceRoot,
function()
	
	local txd = engineLoadTXD("texture.txd") -- txd neve
	engineImportTXD(txd, 1337)
	
	local dff = engineLoadDFF("trafi.dff", 1337) -- dff neve
	engineReplaceModel(dff, 1337)
	
	local col = engineLoadCOL("trafi.col") -- col neve
	engineReplaceCOL(col, 1337)
	
	engineSetModelLODDistance(1337, 500)     
end
)
