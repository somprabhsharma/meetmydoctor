<%@ page import="meetmydoctor.*" %>
<div class="row">
<div class="large-3 columns"><p>&nbsp;</p></div>
	<%
	Object obj = session.getAttribute("docid");
	if(obj!=null){
		String docid = obj.toString(); 
		String[] docdet = DocDet.getDetails(docid);
		int i=0;
	%>
	<div class="large-6 columns">
		<h3 class="text-center">Appointment Details</h3>
		<div class="row">
			<div class="large-12 columns">
			<table>
			<thead>
				<tr>
					<th colspan="2" class="text-center">Doctor Details</th>
					<th colspan="2" class="text-center"><%=request.getAttribute("currentDate") %></th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Name:</td>
					<td> <%= docdet[i] %></td>
					<td>Email:</td>
					<td> <%= docdet[i+1] %></td>
				</tr>
				<tr>
					<td>Field:</td>
					<td> <%= docdet[i+2] %></td>
					<td>Address:</td>
					<td> <%= docdet[i+3] %></td>
				</tr>
				<tr>
					<td>Appointment Date:</td>
					<td><%=request.getAttribute("appDate") %></td>
					<td>Appointment Time:</td>
					<td><%=request.getAttribute("appTime") %></td>
				</tr>
				<tr>
					<td colspan="2">Symptoms:</td>
					<td colspan="2"><%=request.getAttribute("symptoms") %></td>
				</tr>
			</tbody>
			</table><% } else{out.print("sdfsdafa");} %>
			</div>
		</div>
		<div class="row">
			<div class="large-3 columns"><p>&nbsp;</p></div>
			<div class="large-6 columns">
				
			</div>
		</div>
				<div class="row">
			<div class="large-2 columns"><p>&nbsp;</p></div>
				<% if(request.getAttribute("status")!=null){ %>
			<div class="large-8 columns red">
			<p class="text-center"> Your appointment request has been sent Successfully! <br> You can check the status of your appointment in the Appointment History Tab</p>
		</div>
		<% } %>
</div>
</div>
</div>
