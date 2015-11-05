<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ page import="meetmydoctor.*" %>
<%@ page import="java.sql.*" %>

<div class="row">
	<div class="large-4 columns"><p>&nbsp;</p></div>
	<div class="large-4 columns">
	<div class="row">
		<div class="large-12 columns">
			<h3 class="text-center">Find A Doctor</h3>
		</div>
	</div>
	<form class="custom" action="FindDoc" method="get">
	<div class="row">
		<div class="large-12 columns">
			<label>Specialization</label>
			<select name="speciality">
				<option value="0">Select Speciliaty</option>
				<option value="1">All</option>
				<option value="Ayurvedic">Ayurvedic</option>
				<option value="Orthopedics">Orthopedics</option>
				<option value="Pediatrician">Pediatrician</option>
				<option value="Neurologist">Neurologist</option>
				<option value="Cardiologist">Cardiologist</option>
				<option value="Endocrinologist">Endocrinologist</option>
				<option value="Physician">Physician</option>
				<option value="Dentist">Dentist</option>
				<option value="Skin">Skin</option>
				<option value="Gastroenterologist">Gastroenterologist</option>
				<option value="Ophthalmologist">Ophthalmologist</option>
			</select>
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<label>State</label>
				<% 
				   Connection conn=Connectivity.getConnection();
				   Statement st = conn.createStatement();
				   ResultSet state = st.executeQuery("select * from state where city is null order by state asc");
				%>	
			<select id="state1" name="state1">
				<option>Select State</option>
				<% while(state.next()){
				%><Option value="<%out.print(state.getString(1));%>"><%out.print(state.getString(1));%></Option><%
				}
				%>
			</select>							
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns" id="a">
									
		</div>
	</div>
	<br><br>
	<div class="row"> 							
		<div class="large-12 columns">
			<input type="submit" class="blue button radius" name="submit" value="submit" />
		</div>
	</div>
	</form>
	</div>	
</div>
<div class="row">
	<div class="large-2 columns"><p>&nbsp;</p></div>
	<% if(request.getAttribute("result")!=null){ 
		if(request.getAttribute("result").toString().equals("1")){
		ArrayList <String[]> docdet = (ArrayList<String[]>)request.getAttribute("docdet");
	%><div class="large-8 columns">
		<table>
			<thead>
				<tr>
					<th>S.No.</th>
					<th>Doctor Name</th>
					<th>Email ID</th>
					<th>Field</th>
					<th>Address</th>
					<th>Rating(out of 5)</th>
					<th>Book Doctor</th>
					<!-- <th style="width:150px">Book Doctor</th> -->
				</tr>
			</thead>
			<tbody>
			<% Iterator<String[]> itr = docdet.iterator();
				int sno=0;
				while(itr.hasNext()){
				sno++;
					String[] data = itr.next();
					%><tr><%
					for(int i=0; i<data.length; i+=8){
					String address = ""+data[i+3]+", "+data[i+4]+", "+data[i+5]+"";
						%>
					<td><%=sno %></td>
					<td><%= data[i] %></td>
					<td><%= data[i+1] %></td>
					<td><%= data[i+2] %></td>
					<td><%= address %></td>
					<td><%= data[i+6] %></td>
					<% 
					//session.setAttribute("docid", data[i+7]);
					 %>
					<td><a href="patient_home.jsp?page=bookapp&docid=<%=data[i+7]%>">Book</a></td>
					
				<%
					}%></tr><%
				}
			 %>
			</tbody>
		</table></div>
	<% } else if(request.getAttribute("result").toString().equals("0")){%>
		<div class="large-8 columns red"><p class="text-center">No available doctor at this time for your search please try again later or do another search.</p>
	<%}
	} %>
	</div>
</div>