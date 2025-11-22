warning = 0
setTimer(function()
    if getElementData(localPlayer, "loggedin") and getElementData(localPlayer, "char:adminduty") == 0 then
        local hunger = getElementData(localPlayer, "char:hunger")
        if getElementData(localPlayer, "adminjail") == 1 then
			return
		end
		
		if hunger > 7 then
            random = math.random(4, 7)
            setElementData(localPlayer, "char:hunger", hunger - random)
        elseif hunger ~= 0 and hunger <= 7 then
            setElementData(localPlayer, "char:hunger", 0)
        else
            if warning ~= 3 then
                outputChatBox("#7cc576[IRG-MTA] #ffffffBe Ghaza Niyaz Dary!!",255, 255, 255, true)

                --triggerEvent(localPlayer,"JoinQuitGtaV:notifications", localPlayer,"comida", "*Ei, Você está ficando com fome! Come alguma coisa!", 5 )
                
                exports.JoinQuitGtaV:createNotification("comida", "*Be Ghaza Niyaz Dary!", 5)

                warning = warning + 1
            else
                setElementHealth(localPlayer, getElementHealth(localPlayer) - 3)
            end
        end
    end
end, 1000 * 60 * 5, 0)


setTimer(function()
    if getElementData(localPlayer, "loggedin") and getElementData(localPlayer, "char:adminduty") == 0 then
        local hunger = getElementData(localPlayer, "char:thirst")
        if getElementData(localPlayer, "adminjail") == 1 then
			return
		end
		
		if hunger > 7 then
            random = math.random(4, 7)
            setElementData(localPlayer, "char:thirst", hunger - random)
        elseif hunger ~= 0 and hunger <= 7 then
            setElementData(localPlayer, "char:thirst", 0)
        else
            if warning ~= 3 then
                outputChatBox("#7cc576[IRG-MTA] #ffffff*Be Noshidani Ehtiyaj Dar!",255, 255, 255, true)

                exports.JoinQuitGtaV:createNotification("comida", "*Be Noshidani Ehtiyaj Dari!", 5)


                warning = warning + 1
            else
                setElementHealth(localPlayer, getElementHealth(localPlayer) - 10)
            end
        end
    end
end, 1000 * 60 * 3, 0)