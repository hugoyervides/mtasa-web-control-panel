--Developed by ShadoXOy
-- This function will return the spesific server information depending on the value of type
-- the posible value of type are
-- name -> will return the name of the server
-- password -> will return the current server password
-- game -> will return the current game type of the server
-- payers -> will return in the "ONLINE_PLAYERS/MAX_PLAYERS" format the information
-- maxPlayers -> will only return the current max players of the server
-- ip -> will return the current server ip address followed by the port number in the format "IP_ADDRESS:PORT"
-- fpslimit -> will return the current max fps limit set to the server
-- map -> will return the current map name running on the server
-- time -> will return the current time in the "HOURS:MINUTES" format
-- gravitation -> will return the current gravitation value of the server
-- weather -> will return the weather ID set into the server, followed by the name of the weather
-- gameSpeed -> will return the current game speed of the server
-- waveHeight -> will return the current wave height set into the server
-- if the type value does not match any of the mentioned posible values, the return will be "DATA NOT FOUND"
function getServerInfo(type)
	if type == "name" then
		return getServerName()

	elseif type == "password" then
		local password = getServerPassword()
		if password == nil then
			return "NONE"
		else
			return password
		end

	elseif type == "game" then
		return getGameType()

	elseif type == "players" then
		local onlinePlayers = tostring(getPlayerCount())
		local maxPlayers = tostring(getMaxPlayers())
		return onlinePlayers .. "/" .. maxPlayers

	elseif type == "maxPlayers" then
		local maxPlayers = tostring(getMaxPlayers())
		return maxPlayers

	elseif type == "info" then
		local info = getVersion()
		local version = info.mta
		local os = info.os
		local name = info.name

		return name .. " " .. version .. " / " .. os;

	elseif type == "ip" then
		local ip = "localhost"
		local port = getServerPort()
		--get server ip
		fetchRemote("http://checkip.dyndns.com/",
    		function (response)
        		if response ~= "ERROR" then
            		ip = response:match("<body>Current IP Address: (.-)</body>") or "127.0.0.1"
       			end
    		end
    	)
		return ip .. ":" .. port

	elseif type == "fpslimit" then
		return tostring(getFPSLimit())

	elseif type == "map" then
		return getMapName()

	elseif type == "time" then
		local timeHour, timeMinute = getTime ()

		if (timeHour % 10) == timeHour then
			timeHour = "0" .. tostring(timeHour)
		else
			timeHour = tostring(timeHour)
		end

		if (timeMinute % 10) == timeMinute then
			timeMinute = "0" .. tostring(timeMinute)
		else
			timeMinute = tostring(timeMinute)
		end

		return timeHour .. ":" .. timeMinute

	elseif type == "weather" then
		local weatherID = getWeather()
		local weatherNames = {"Blue Sky, Sunny" , "Blue Sky, Sunny" , "Blue Sky, Clouds" , "Blue Sky, Clouds" , "Blue Sky, Clouds" , "Blue Sky, Clouds" , "Blue Sky, Clouds", "Blue Sky, Clouds", "Storming" , "Cloudy and Foggy" , "Clear Blue Sky" , "Sunny, Scorching Hot" , "Very Dull, Colourless, Hazy" , "Very Dull, Colourless, Hazy" , "Very Dull, Colourless, Hazy" , "Very Dull, Colourless, Hazy" , "Dull, Cloudy, Rainy" , "Sunny, Scorching Hot" , "Sunny, Scorching Hot" , "Sandstrom"}
		return tostring(weatherID) .. " (" .. weatherNames[weatherID + 1] .. ")"

	elseif type == "gravitation" then
		return tostring(getGravity())

	elseif type == "gameSpeed" then
		return tostring(getGameSpeed());

	elseif type == "waveHeight" then
		return tostring(getWaveHeight());

	else
		return "DATA NOT FOUND";
	end
end