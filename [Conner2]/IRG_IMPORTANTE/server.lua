addCommandHandler("startscript",
    function(thePlayer)
	if getElementData(thePlayer, "acc:admin") >= 10 then
        for i, v in ipairs(getResources()) do 
            startResource(v)
            outputChatBox("[AVISO] Todos scripts foram startados.", v, 255, 255, 255, true)
        end
    end
end
)