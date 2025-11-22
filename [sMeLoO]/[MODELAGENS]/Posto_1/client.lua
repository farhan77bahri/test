txd = engineLoadTXD ( "posto.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 5409 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "posto.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 5409 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "posto.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 5409 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(5409, 500) --ID do objeto e a distância que ele irá carregar - distancia está como 500
