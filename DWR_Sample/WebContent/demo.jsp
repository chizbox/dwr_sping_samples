<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
	
	<script type="text/javascript" src="/DWR_Sample/dwr/engine.js"></script>
	<script type="text/javascript" src="/DWR_Sample/dwr/util.js"></script>
	<script type="text/javascript" src="/DWR_Sample/dwr/interface/Communicator.js"></script>
	
	<script type="text/javascript" >
		function clear(){
			$('messageToBackend').value=""; 
			$('messageFromBackend').value="";
		};
		
		function communicateWithServer(){
			message=$('messageToBackend').value;
			Communicator.doCommunicate(message, function(data){
				$('messageFromBackend').value=data;
			});
		};
	</script>
	
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Welcome to Demo JSP</title>
	</head>
	<body>
		<br/>Communication between frontend and backend<br/>
		
		Message To Backend:<input id='messageToBackend' type="text" />
		<button id='communicateWithBackend' onclick="communicateWithServer();">
		Communicate With Backend</button>
		
		<br/>
		
		<input id="messageFromBackend" type="text"> 
		<button id='clear' onclick="clear();">Clear</button>
		
		
	</body>
</html>