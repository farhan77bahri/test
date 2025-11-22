

txd = engineLoadTXD ( "dar.txd" )
engineImportTXD ( txd, 1499 )
dff = engineLoadDFF ( "dar.dff" )
engineReplaceModel ( dff, 1499 )


