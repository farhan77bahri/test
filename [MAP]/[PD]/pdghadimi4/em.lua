-- SparroW MTA
-- Script Sitemiz :https://sparrow-mta.blogspot.com
-- Facebook : https://www.facebook.com/sparrowgta/
-- OBJE ID : 2190
function replaceModel()
  txd = engineLoadTXD("2190.txd", 2190 )
  engineImportTXD(txd, 2190)
  dff = engineLoadDFF("2190.dff", 2190 )
  engineReplaceModel(dff, 2190)
  col= engineLoadCOL ( "2190.col" )
  engineReplaceCOL ( col, 2190 )
end
addEventHandler ( "onClientResourceStart", getResourceRootElement(getThisResource()), replaceModel)