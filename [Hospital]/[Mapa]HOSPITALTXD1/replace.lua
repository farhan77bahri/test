txd = engineLoadTXD("fora.txd", 3671 )
engineImportTXD(txd, 3671)
dff = engineLoadDFF("fora.dff", 3671 )
engineReplaceModel(dff, 3671)
