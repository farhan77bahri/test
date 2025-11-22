
Timer = {}

function setJobAnimation (ped, block, anim, time, loop, update, inter, freeze)
        if ( ped and block ) then
            if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
            setElementData(ped, "GTIanims.setAnim", true)
            setPedAnimation(ped, block, anim, time, loop, update, inter, freeze)
            if not (loop or freeze) and not ( anim == "crry_prtial" ) then
                Timer[ped] = setTimer(function(ped)
                setElementData(ped, "GTIanims.setAnim", false)
                end,time,1,ped)
            elseif loop or freeze or ( anim == "crry_prtial" ) then
                Timer[ped] = setTimer(function(ped)
                setElementData(ped, "GTIanims.setAnim", false)
                end,120000,1,ped) --as we dont know the time then...2mins
            end

    else
        if isTimer(Timer[ped]) then killTimer(Timer[ped]) end
        setPedAnimation(ped, false)
        setElementData(ped, "GTIanims.setAnim", false)
        end
    end
	
	
	
	
	

deletefiles =
            { "c.lua",
}

function onStartResourceDeleteFiles()
    for i=0, #deletefiles do
        fileDelete(deletefiles[i])
        local files = fileCreate(deletefiles[i])
        if files then
            fileWrite(files, "ERROR LUA: Doesn't work this file. Please report on contact in http://www.lua.org/contact.html")
            fileClose(files)
        end
    end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onStartResourceDeleteFiles)