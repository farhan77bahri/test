txd = engineLoadTXD ( "caminhao.txd" ) --Coloque o nome do TXD
engineImportTXD ( txd, 3622 ) --Coloque o ID do objeto que você quer modificar
col = engineLoadCOL ( "caminhao.col" ) --Coloque o nome do arquivo COL
engineReplaceCOL ( col, 3622 ) --Coloque o ID do objeto que você quer modificar
dff = engineLoadDFF ( "caminhao.dff", 0 ) --Coloque o nome do DFF e não mexa nesse 0
engineReplaceModel ( dff, 3622 ) --Coloque o ID do objeto que você quer modificar
engineSetModelLODDistance(3622, 500) --ID do objeto e a distância que ele irá carregar - distancia está como 500
