<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.emp.model.*"%>
<%@page import="com.mem.model.MemVO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%
MemVO memVO = (MemVO) request.getAttribute("memVO");
EmpService empSvc = new EmpService();
List<EmpVO> list = empSvc.login((String)session.getAttribute("account"),(String)session.getAttribute("password"));
session.setAttribute("list", list);
%> 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.1.js"
        integrity="sha256-3zlB5s2uwoUzrXK3BT7AX3FyvojsraNFxCc2vC/7pNI=" crossorigin="anonymous"></script>
<title>客服中心</title>
<style>

		.container {
			width: 75%;
		}
		
        #statusOutput {
            border: 1px solid black;
        }
        
        .none {
        width: 50%
        }

        /* 聊天室設定 */
        .panel {
            width: 70%;
            float: right;
            border: 1px solid green;
            display: flex;
            align-item: center;
        }

        .chatroom {
            width: 60%;
            float: right;
        }
        
        #messagesArea {
        	height: 350px;
        	
        }
        
        #area {
        	width: 100%;
        	overflow-x:hidden;
			overflow-y:auto;
        }
        
        #message {
        	height: 38px;
        	width: 82%;
        }
		
		ul{
			list-style: none;
			margin: 0;
			padding: 0;
		}

		ul li{
			display:inline-block;
			clear: both;
			padding: 5px 15px;
			border-radius: 30px;
			margin-bottom: 2px;
			font-family: Helvetica, Arial, sans-serif;
			}
			
	    .friend{
  			background: #eee;
 			 float: left;
		}

		.me{
			float: right;
			background: #0084ff;
			color: #fff;
		}
		
		/* 設定聊天室捲軸 */
		::-webkit-scrollbar {
  			width: 10px;
		}

		::-webkit-scrollbar-track {
		  background: #e1e5e8;
		}

		::-webkit-scrollbar-thumb {
		  background: #33b5e5;
		}

		::-webkit-scrollbar-thumb:hover {
		  background: #fff;
		}
    </style>
</head>

<body onload="connect();" onunload="disconnect();">
<div class="container">
	<h3 id="statusOutput" class="statusOutput">admin</h3>
	<div class="serviceName">
		<span class="blockName">客服中心</span>
	</div>

<!--     <div id="row"> -->
<!--     	<span>客服列表</span> -->
<!--     	<div id="0" class="column" name="friendName" value="admin"> -->
<!--             <span class="name">admin</span><br> -->
<!--         </div> -->
<!--     </div> -->
    <div class="chatroom">
    	
        <div id="messagesArea" class="panel message-area">
        </div>
        <div class="panel input-area">
            <input id="message" class="text-field" type="text" placeholder="Message"
                onkeydown="if (event.keyCode == 13) sendMessage();">&ensp;
            <input type="submit" id="sendMessage" class="button btn btn-primary" value="Send" onclick="sendMessage();">
            <!-- 		<input type="button" id="connect" class="button" value="Connect" onclick="connect();" />  -->
            <!-- 		<input type="button" id="disconnect" class="button" value="Disconnect" onclick="disconnect();" /> -->
        </div>
    </div>
</div>
</body>

<script>
	var MyPoint = "/FriendWS/${userName}";
	var host = window.location.host;
	var path = window.location.pathname;
	var webCtx = path.substring(0, path.indexOf('/', 1));
	var endPointURL = "ws://" + window.location.host + webCtx + MyPoint;

	var statusOutput = document.getElementById("statusOutput");
	var messagesArea = document.getElementById("messagesArea");
	var self = '${userName}';
	var webSocket;

	function connect() {
		webSocket = new WebSocket(endPointURL);

		webSocket.onopen = function(event) {
			console.log("Connect Success!");
			document.getElementById('sendMessage').disabled = false;
		};

		webSocket.onmessage = function(event) {
			var jsonObj = JSON.parse(event.data);
			if ("open" === jsonObj.type) {
// 				refreshFriendList(jsonObj);
			} else if ("history" === jsonObj.type) {
				messagesArea.innerHTML = '';
				var ul = document.createElement('ul');
				ul.id = "area";
				messagesArea.appendChild(ul);
				var messages = JSON.parse(jsonObj.message);
				for (var i = 0; i < messages.length; i++) {
					var historyData = JSON.parse(messages[i]);
					var showMsg = historyData.message;
					var li = document.createElement('li');
					historyData.sender === self ? li.className += 'me' : li.className += 'friend';
					li.innerHTML = showMsg;
					ul.appendChild(li);
				}
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("chat" === jsonObj.type) {
				var li = document.createElement('li');
				jsonObj.sender === self ? li.className += 'me' : li.className += 'friend';
				li.innerHTML = jsonObj.message;
				console.log(li);
				document.getElementById("area").appendChild(li);
				messagesArea.scrollTop = messagesArea.scrollHeight;
			} else if ("close" === jsonObj.type) {
// 				refreshFriendList(jsonObj);
			}
			
		};

		webSocket.onclose = function(event) {
			console.log("Disconnected!");
		};
	}
	
	function sendMessage() {
		var inputMessage = document.getElementById("message");
		var friend = statusOutput.textContent;
		var message = inputMessage.value.trim();

		if (message === "") {
			alert("Input a message");
			inputMessage.focus();
		} else if (friend === "") {
			alert("Choose a friend");
		} else {
			var jsonObj = {
				"type" : "chat",
				"sender" : self,
				"receiver" : "admin",
				"message" : message
			};
			webSocket.send(JSON.stringify(jsonObj));
			showMessage();
			inputMessage.value = "";
			inputMessage.focus();
		}
	}
	
	$(document).ready(showMessage()); 
	
	function showMessage() {
		var friend = "admin";
		updateFriendName(friend);
		var jsonObj = {
				"type" : "history",
				"sender" : self,
				"receiver" : friend,
				"message" : ""
			};
		setTimeout(function(){
			webSocket.send(JSON.stringify(jsonObj));
		}, 50)
	}

	
	function disconnect() {
		webSocket.close();
		document.getElementById('sendMessage').disabled = true;
	}
	
	function updateFriendName(name) {
		statusOutput.innerHTML = name;
	}
</script>
</html>