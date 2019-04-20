--Function to edit server values and shutdown the server
--the first element of the array is the type of value that the users wants to edit
--the second element of the array is the new value, except for the shutdown function, the second value is used for the shutdown reason

function editServer(array)
	if array[1] == "shutdown" then
		if shutdown(array[2]) then
			return "success"
		else
			return "error"
		end
	elseif array[1] == "fpsLimit" then
		--See if the value is a number and that is in the 25-100 range, otherwise return error message!
		if tonumber(array[2]) == nil or (tonumber(array[2]) % 1) ~= 0 then
			return "Error! the value has to be a number"
		elseif (tonumber(array[2]) < 25) or (tonumber(array[2]) > 100) then
			return "FPS limit has to be in the 25-100 range!"
		end
		
		if setFPSLimit(array[2]) then
			return "success"
		else
			return "Unknown server error"
		end
	
	elseif array[1] == "serverPassword" then
		if setServerPassword(array[2]) then return "success" else return "Unknown server error" end

	elseif array[1] == "gameType" then
		if setGameType(array[2]) then return "success" else return "Unknown server error" end

	elseif array[1] == "maxPlayers" then
		--see if the value can be a number otherwise return error
		if tonumber(array[2]) ~= nil and (tonumber(array[2]) % 1) == 0 then
			if setMaxPlayers(array[2]) then
				return "success"
			else
				return "Unknown server error"
			end
		else
			return "The max players value needs to be a valid number"
		end

	elseif array[1] == "gravitation" then
		-- see if the value can be a number
		if tonumber(array[2]) ~= nil then
			if setGravity(array[2]) then
				return "success"
			else
				return "Unknown server error"
			end
		else
			return "The gravitation value needs to be a valid number"
		end
	elseif array[1] =="gameSpeed" then
		--see if the value can be a number
		if tonumber(array[2]) ~= nil then
			if setGameSpeed(array[2]) then
				return "success"
			else
				return "Unknown server error"
			end
		else
			return "The game speed value needs to be a valid number"
		end

	elseif array[1] == "waveHeight" then
		--see if the value can be a number
		if tonumber(array[2]) ~= nil then
			if setWaveHeight(array[2]) then
				return "success"
			else
				return "Unknown server error"
			end
		else
			return "The wave height value needs to be a number"
		end
		
	else
		return "Invalid type!"
	end
end