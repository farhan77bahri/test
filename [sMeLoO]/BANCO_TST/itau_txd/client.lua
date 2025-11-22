txd = engineLoadTXD ( "objeto/itau.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 4594 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "objeto/itau.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 4594 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "objeto/itau.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 4594 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(4594, 500) --ID do objeto e a distância que ele irá carregar - distancia está como 500
