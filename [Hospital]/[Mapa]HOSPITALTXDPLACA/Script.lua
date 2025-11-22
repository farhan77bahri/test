function AndrixxClient ()
txd = engineLoadTXD("cw_motel2cs_t.txd") 
engineImportTXD(txd, 18244 )
end
addEventHandler( "onClientResourceStart", resourceRoot, AndrixxClient )