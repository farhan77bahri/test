addEventHandler("onPlayerJoin", root,
    function () 
        for i,p in ipairs(getElementsByType("player")) do
            setPlayerVoiceIgnoreFrom(p, nil)
            setPlayerVoiceBroadcastTo(p, getElementsByType("player"))
        end
    end
)

addEventHandler("onResourceStart", root,
    function () 
        for i,p in ipairs(getElementsByType("player")) do
            setPlayerVoiceIgnoreFrom(p, nil)
            setPlayerVoiceBroadcastTo(p, getElementsByType("player"))
        end
    end
)

addEvent("proximity-voice::broadcastUpdate", true)
addEventHandler("proximity-voice::broadcastUpdate", root,
    function (broadcastList) 
        if client and source == client then else return end
        setPlayerVoiceIgnoreFrom(source, nil)
        setPlayerVoiceBroadcastTo(source, broadcastList)
    end
)