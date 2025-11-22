function AndrixxClient1 ()
txd = engineLoadTXD("newstuff_sfn.txd") 
engineImportTXD(txd, 9314 )
end
addEventHandler( "onClientResourceStart", resourceRoot, AndrixxClient1 )


function AndrixxClient ()
txd = engineLoadTXD("factory_door.txd") 
engineImportTXD(txd, 2885 )
end
addEventHandler( "onClientResourceStart", resourceRoot, AndrixxClient )