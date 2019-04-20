function sendMessage(){
	var textBox = document.getElementById("message");
	//See if there's something in the text box, if there's nothing, alert the user
	if(textBox.value == ""){
		swal("Error!","There's nothing inside the text box, the message was discarded","error")
	}
	else{
		//call lua function to send the message
		showMessage(textBox.value, function(response){
			if(response == 1){
				swal("Success!", "The message was sent!", "success");
			}
			else{
				swal("Error!", "Something went wrong!", "error");
			}
		})
	}
	//empty the text box
	textBox.value = "";
}