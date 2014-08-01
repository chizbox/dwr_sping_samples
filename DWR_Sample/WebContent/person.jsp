<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<script type='text/javascript' src='tabs/tabs.js'> </script>
	<script type="text/javascript" src="dwr/engine.js"></script>
	<script type="text/javascript" src="dwr/util.js"></script>
	<script type="text/javascript" src="dwr/interface/People.js"></script>
	<script type="text/javascript" src='generic.js'> </script>
	
	<link rel="stylesheet" type="text/css" href="tabs/tabs.css" />
    <link rel="stylesheet" type="text/css" href="generic.css" />
	

	<script type="text/javascript">
		function init(){
			fillTable();
		}
		
		var peopleCache = {};
		var viewed = -1;
		
		function fillTable(){
			 People.getAllPeople(function(people) {
				    // Delete all the rows except for the "pattern" row
				    dwr.util.removeAllRows("peoplebody", { filter:function(tr) {
				      return (tr.id != "pattern");
				    }});
				    // Create a new set cloned from the pattern row
				    var person, id;
				    people.sort(function(p1, p2) { return p1.name.localeCompare(p2.name); });
				    for (var i = 0; i < people.length; i++) {
				      person = people[i];
				      id = person.id;
				      dwr.util.cloneNode("pattern", { idSuffix:id });
				      dwr.util.setValue("tableName" + id, person.name);
				      dwr.util.setValue("tableSalary" + id, person.salary);
				      dwr.util.setValue("tableAddress" + id, person.address);
				      $("pattern" + id).style.display = ""; // officially we should use table-row, but IE prefers "" for some reason
				      peopleCache[id] = person;
				    }
				  });
		}
		
		function editClicked(eleid){
			//we were an id of the form "edit{id}" 
			var person = peopleCache[eleid.substring(4)];
			dwr.util.setValues(person);
		}
		
		
		function deleteClicked(eleid){
			//we werer an id of the form 
			var person = peopleCache[eleid.substring(6)];
			if (confirm("Are you sure you want to delete " + person.name + "?")) {
			    dwr.engine.beginBatch();
			    People.deletePerson({ id:id });
			    fillTable();
			    dwr.engine.endBatch();
			};
		}
		
		function writePerson() {
			  var person = { id:viewed, name:null, address:null, salary:null};
			  dwr.util.getValues(person);

			  dwr.engine.beginBatch();
			  People.setPerson(person);
			  fillTable();
			  dwr.engine.endBatch();
		}
		
		function clearPerson() {
			  viewed = -1;
			  dwr.util.setValues({ id:-1, name:null, address:null, salary:null });
		}
		
	</script>

	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Person Example</title>
</head>

<body onload="init()">
	<div id="page-title">[
  		<a href="http://getahead.org/dwr/">DWR Website</a> 
  		<a href="..">Web Application Index</a>
	</div>

	<h1>Dynamically Editing a Table</h1>

<div id="tabContents">
  <div id="demoDiv">
    <h3>All People</h3>
    <table border="1" class="rowed grey">
      <thead>
        <tr>
          <th>Person</th>
          <th>Salary</th>
          <th>Actions</th>
        </tr>
      </thead>
      <tbody id="peoplebody">
        <tr id="pattern" style="display:none;">
          <td>
            <span id="tableName">Name</span><br/>
            <small>&nbsp;&nbsp;<span id="tableAddress">Address</span></small>
          </td>
          <td>$<span id="tableSalary">Salary</span></td>
          <td>
            <input id="edit" type="button" value="Edit" onclick="editClicked(this.id)"/>
            <input id="delete" type="button" value="Delete" onclick="deleteClicked(this.id)"/>
          </td>
        </tr>
      </tbody>
    </table>
    <h3>Edit Person</h3>
    <table class="plain">
      <tr>
        <td>Name:</td>
        <td><input id="name" type="text" size="30"/></td>
      </tr>
      <tr>
        <td>Salary:</td>
        <td>$<input id="salary" type="text" size="20"/></td>
      </tr>
      <tr>
        <td>Address:</td>
        <td><input type="text" id="address" size="40"/></td>
      </tr>
      <tr>
        <td colspan="2" align="right">
          <small>(ID=<span id="id">-1</span>)</small>
          <input type="button" value="Save" onclick="writePerson()"/>
          <input type="button" value="Clear" onclick="clearPerson()"/>
       </td>
      </tr>
    </table>
  </div>
</body>
</html>