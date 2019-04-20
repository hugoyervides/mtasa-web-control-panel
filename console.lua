--create an array to save the messages
array = {}
--edit this value to change the max number of messages stored in the array
max_messages= 10;
--function to get the time
function getRealTime()
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
	return "[" .. timeHour .. ":" .. timeMinute .. "]"
end

function saveMessage( message , type )
	--see if a player is the source of the event
	if isElement( source ) and getElementType( source ) == "player" then
		--see if the number of values on the array does not exceed the max messages value
		if #array > max_messages then
			table.remove(array,1)
		end
		--condition to see what type of message it is
		--normal message
		if type == 0 then
			table.insert(array,getRealTime() .. "[CHAT]" .. getPlayerName(source) .. ": " .. message)
		--me message
		elseif type == 1 then
			table.insert(array,getRealTime() .. "[ME]" .. getPlayerName(source) .. ": " .. message)
		--team message
		elseif type == 2 then
			table.insert(array,getRealTime() .. "[TEAM]" .. "[" .. getTeamName(getPlayerTeam(source)) .."]" .. getPlayerName(source) .. ": " .. message)
		end
	end
end


addEventHandler("onPlayerChat", getRootElement(), saveMessage)