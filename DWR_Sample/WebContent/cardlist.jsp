<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/cardService.js"></script>
	
	<link rel="stylesheet" type="text/css" href="tabs/tabs.css" />
    <link rel="stylesheet" type="text/css" href="generic.css" />
	
	<script type="text/javascript">
		function init(){
			fillTable();
		}
		
		function fillTable(){
			cardService.getAllCards(cardServiceCallback);
		}
		
		var card = {};
		
		//this callback returns json object cardList
		function cardServiceCallback(cardList){
			for(var i = 0;i < cardList.length;i++){
				card = cardList[i];
				//alert(card.name);
			}
			loadCardTablefromJSON(cardList);
		}
		
		function loadCardTablefromJSON(cardList){
		dwr.util.removeAllRows("cardbody", {
				filter : function(tr) {
					return (tr.id != "pattern");
				}
			});

		var id;
			for ( var i = 0; i < cardList.length; i++) {
				id = cardList[i].name;
				dwr.util.cloneNode("pattern", {
					idSuffix : id
				});
				dwr.util.setValue("cardName" + id, cardList[i].name);
				dwr.util.setValue("description" + id, cardList[i].description);
				dwr.util.setValue("rarity" + id, cardList[i].rarity);
				$("pattern" + id).style.display = "";
			}
		}
	</script>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
</head>

<body onload="init()">
	<div id="cardListDiv">
		<h3>All Cards</h3>
		<table border="1" class="rowed grey">
			<thead>
				<th>Name</th>
				<th>Description</th>
				<th>Rarity</th>
			</thead>
			
			<tbody id="cardbody">
				<tr id="pattern" style="display:none;">
					<td>
						<span id="cardName"> </span>
					</td>
					
					<td>
						<span id="description"></span>
					</td>
					
					<td>
						<span id="rarity"></span>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
</body>
</html>