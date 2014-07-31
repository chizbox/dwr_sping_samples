<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="/DWR_Sample/dwr/engine.js"></script>
	<script type="text/javascript" src="/DWR_Sample/dwr/util.js"></script>
	<script type="text/javascript" src="/DWR_Sample/dwr/interface/echoService.js"></script>
	
	<script type="text/javascript">
		function echo(){
			var e = document.getElementById("ECHO_TEXT_ID");
			echoService.echo(e.value,echoCallback);
		}
		
		
		function echoCallback(response){
			var e = document.getElementById("RESPOPNSE_ID");
			$('RESPOPNSE_ID').value= response;
			e.innerHtml = response;
		}
		
		function clear(){
			$('ECHO_TEXT_ID').value=""; 
			$('RESPOPNSE_ID').value="";
		};
	</script>
	
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>DWR Sampler</title>	
		
</head>
<body>
		<br/>This is from index.jsp<br/>
		Message To Backend:<input id='ECHO_TEXT_ID' type="text" />
		<button id='communicateWithBackend' onclick="echo();">
		Communicate With Backend</button>
		
		<br/>
		
		<input id="RESPOPNSE_ID" type="text"> 
		<button id='clear' onclick="clear();">Clear</button>
</body>
</html>