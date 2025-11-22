local ifp = engineLoadIFP( "anim.ifp", "newAnimBlock" )

addEvent( "anim", true )
addEventHandler( "anim", root,
	function(anim,enable)
		if (enable) then
			setPedAnimation(source, "newAnimBlock", "continencia", -1, false, true, false, false)
			if (anim == "continencia2") then
				setTimer(setPedAnimationProgress, 50, 1, source, "continencia", 0.5)
				setTimer(setPedAnimationSpeed, 50, 1, source, "continencia", 0.000001)
			end
		else
			setPedAnimation(source)
		end
	end
)

addEventHandler("onClientResourceStart", resourceRoot,
    function()
        triggerServerEvent("onClientSync", resourceRoot)
	end
)

addEventHandler("onClientResourceStop", resourceRoot,
	function()
		if ifp then
			for _,player in ipairs(getElementsByType("player")) do
				local _, anim = getPedAnimation(player)
				if (anim == "run_wuzi") then -- wtf bug
					setPedAnimation(player)
				end
			end
			destroyElement(ifp)
		end
	end
)