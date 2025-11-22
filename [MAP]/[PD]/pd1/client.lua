addEventHandler("onClientResourceStart", resourceRoot,
function()
    local modelId = 3976
    local modelIdLOD = 4064
    local x,y,z = 1571.6016, -1675.7500, 35.6797

    removeWorldModel( modelId, 1000, x,y,z ) -- Hide original
    removeWorldModel ( modelIdLOD, 1000, x,y,z ) -- Hide LOD

    col = engineLoadCOL( "policest02_lan.col" )
    txd = engineLoadTXD( "policest02_lan.txd" )
    dff = engineLoadDFF( "policest02_lan.dff", 0 )

    engineReplaceCOL( col, modelId )
    engineImportTXD( txd, modelId )
    engineReplaceModel( dff, modelId )

    obj = createObject( modelId, x,y,z, 0, 0, 0 )
    objLOD = createObject( modelIdLOD, x,y,z, 0, 0, 0, true )
    setLowLODElement(obj, objLOD)

end
)