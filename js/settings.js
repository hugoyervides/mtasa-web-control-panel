	//this script is used for the settings page

//Select all the information boxes 
var serverPassword = document.getElementById("serverPassword");
var fpsLimit = document.getElementById("fpsLimit");
var gameType = document.getElementById("gameType");
var maxPlayers = document.getElementById("maxPlayers");
var time = document.getElementById("time");
var weather = document.getElementById("weather");
var gravitation = document.getElementById("gravitation");
var gameSpeed = document.getElementById("gameSpeed");
var waveHeight = document.getElementById("waveHeight");
var serverStatus = document.getElementById("serverStatus");

//function to retrieve the data and update the values on the HTML file
function retrieveData(){
	getServerInfo("password", function (answer){
		serverPassword.innerHTML = answer;
	});
	getServerInfo("fpslimit", function (answer){
		fpsLimit.innerHTML = answer;
	});
	getServerInfo("game", function (answer){
		gameType.innerHTML = answer;
	});
	getServerInfo("maxPlayers", function (answer){
		maxPlayers.innerHTML = answer;
	});
	getServerInfo("time" , function (answer){
		time.innerHTML = answer;
	});
	getServerInfo("weather" , function (answer){
		weather.innerHTML = answer;
	});
	getServerInfo("gravitation" , function (answer){
		gravitation.innerHTML = answer;
	});
	getServerInfo("gameSpeed" , function (answer){
		gameSpeed.innerHTML = answer;
	});
	getServerInfo("waveHeight" , function (answer){
		waveHeight.innerHTML = answer;
	});
}

//Get the data from the server
var interval = setInterval(retrieveData,1000);

//function to edit a value on the server
function editServerValue(valueType){
	if (valueType == "shutdown") {
		swal("Danger!","Are you sure you want to continue?",{
			buttons:{
				cancel: "No!" ,
				yes: {
					text: "Yes",
					value: "continue",
				}
			},
			icon: "warning",
		},)
		.then((value)=>{
			switch(value){
				case "continue":
					swal("Please enter Shutdown Reason",{
						content: "input",
						button: "Shutdown",
						icon: "warning",
					})
					.then((value)=>{
						if(value){
							var array = ["shutdown", value];
							editServer(array , function (answer){
								if (answer == "success"){
									swal("Success!","Server is shutding down!","success");
									clearInterval(interval);
									serverStatus.innerHTML = "Shutting Down";
								}
								else{
									swal("Error!","Internal server error!","error");
								}
							});
						}
						else{
							swal("Error", "You need to specify a shutdown reason!","error")
						}
					});
					break;
				default:
					swal("Operation canceled!","The server will continue running!","info");
					break;
			}
		});
	}
	else{
		swal("Enter new value!", "Editing value ID: \"" + valueType + "\"" , {
			content: "input",
			button: "Change!",
		})
		.then((value)=>{
			var array = [valueType,value];
			editServer(array, function (answer){
				if (answer == "success"){
					swal("Success!","The value has been changed!","success");
				}
				else{
					swal("Error!", "Server says: " + answer, "error");
				}
			});
		});
	}
}