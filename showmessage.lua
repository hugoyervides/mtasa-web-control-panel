--Function to display a message
function showMessage(message)
	if outputChatBox("ADMIN: " .. message) then
		return 1
	else
		return 0
	end
end
