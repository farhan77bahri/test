

-- GUI Job Data
---------------->>



-- Job Exports
--------------->>

function getPlayerJob(isWorking)
	local job = getElementData(localPlayer, "job")
	if (job == "" or not job) then return false end
	
	if (isWorking) then
		local working = getElementData(localPlayer, "isWorking")
		if (working == 1) then
			return job
		else
			return false
		end
	end
	return job
end
