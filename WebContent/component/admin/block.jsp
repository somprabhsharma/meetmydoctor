<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <div class="row">
    	<div class="large-12 columns">
    		<h3 class="text-center">Block A User</h3>
    	</div>
    </div>
    <div class="row">
    <div class="large-4 columns"><p>&nbsp;</p></div>
    <div class="large-4 columns">
<form class="custom" action="BlockUser" method="get">
	<div class="row">
		<div class="large-12 columns">
			<label>Select A User Type</label>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<select name="utype">
				<option value="0">Select a User Type</option>
				<option value="admin">Admin</option>
				<option value="doctor">Doctor</option>
				<option value="patient">Patient</option>
			</select>		
		</div>
		</div>
	<div class="row">
		<div class="large-12 columns">
			<label>Enter User ID</label>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<input type="text"  name="uid" placeholder="Enter User ID"/>		
		</div>
		</div>
		<br>
	<div class="row"> 							
		<div class="large-12 columns">
			<input type="submit" class="blue button radius" name="submit" value="Block" />
		</div>
	</div>
	</form><div class="row"><% 
	Object obj = request.getAttribute("status");
	Object obj1 = request.getAttribute("select");
   if(obj!=null){
   String status = obj.toString();
  
%>

	<div class="large-12 cloumns red">
		<% if(status.equals("1")){
			%><p class="text-center">You have blocked a user successfully.</p>
		<% }  
		else{
			%><p class="text-center">Please enter a valid userid</p>
		<% } %></div><%} if(obj1!=null){ String select = obj1.toString();%><div class="large-12 cloumns red"><%
		if(select.equals("0")){
			%><p class="text-center">Please select a user.</p>
		<% } %>
	</div>

<% } %></div></div></div>

