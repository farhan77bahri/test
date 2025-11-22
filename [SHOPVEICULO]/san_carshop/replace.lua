txd = engineLoadTXD("TenorioLoko.txd")
engineImportTXD(txd, 480)
dff = engineLoadDFF("TenorioLoko.dff", 480)
engineReplaceModel(dff, 480)
