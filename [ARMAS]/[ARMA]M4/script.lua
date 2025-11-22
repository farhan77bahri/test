-- Generated using GM2MC ( GTA:SA Models To MTA:SA Converter ) by SoRa

addEventHandler('onClientResourceStart',resourceRoot,function () 
txd = engineLoadTXD( 'm4.txd' ) 
engineImportTXD( txd, 356 ) 
dff = engineLoadDFF('m4.dff', 356) 
engineReplaceModel( dff, 356 )
end)
