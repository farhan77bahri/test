function TreskMapperClient ()
txd = engineLoadTXD("jeetdor.txd") 
engineImportTXD(txd, 3095 )

txd = engineLoadTXD("jeetdor.txd") 
engineImportTXD(txd, 2395 )
end
addEventHandler( "onClientResourceStart", resourceRoot, TreskMapperClient )