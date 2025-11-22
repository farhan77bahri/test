txd = engineLoadTXD ( "praca.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 3985 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "praca.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 3985 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "praca.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 3985 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(3985, 500) --ID do objeto e a distância que ele irá carregar - distancia está como 500
