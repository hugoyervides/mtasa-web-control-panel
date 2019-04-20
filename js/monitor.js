// This Script is used on the Monitor page of the resource

var serverNameSpan = document.getElementById("serverName");
var serverPasswordSpan = document.getElementById("serverPassword");
var serverGameSpan = document.getElementById("serverGame");
var onlinePlayersSpan = document.getElementById("onlinePlayers");
var serverInfoSpan = document.getElementById("serverInfo");
var serverIPSpan = document.getElementById("serverIP");
var fpsLIMITSpan = document.getElementById("fpsLIMIT");
var mapNameSpan = document.getElementById("mapName");

//function to retrieve the data and update the values on the HTML file
function retrieveData(){
	getServerInfo("name", function(answer){
		serverNameSpan.innerHTML = answer;
	});

	getServerInfo("password", function(answer){
		serverPasswordSpan.innerHTML = answer;
	});

	getServerInfo("game" ,function(answer){
		serverGameSpan.innerHTML = answer;
	});

	getServerInfo("players" ,function(answer){
		onlinePlayersSpan.innerHTML = answer;
	});

	getServerInfo("info", function(answer){
		serverInfoSpan.innerHTML = answer;
	});

	getServerInfo("ip", function(answer){
		serverIPSpan.innerHTML = answer;
	});

	getServerInfo("fpslimit", function(answer){
		fpsLIMITSpan.innerHTML = answer;
	});

	getServerInfo("map" , function(answer){
		mapNameSpan.innerHTML = answer;
	});
}

//Fill all the information of the span's and update every 2 seconds
setInterval(retrieveData, 2000);
