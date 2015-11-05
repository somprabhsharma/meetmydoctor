<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.util.*" %>
    <%@page import="meetmydoctor.*" %>
<div class="row">
		<div class="large-12 columns">
			<h3 class="text-center">Generate a Report</h3>
		</div>
	</div>
	<form class="custom" action="GenerateReport" method="get">
	<div class="row">
	<div class="large-4 columns"><p>&nbsp;</p></div>
	<div class="large-4 columns">
	<div class="row">
		<div class="large-12 columns">
			<label>Select Date</label>
		</div>
	</div>
	<div class="row">
		<div class="large-6 columns">
			<input type="text" class="datepicker" name="sdate" placeholder="start date"/>		
		</div>
		<div class="large-6 columns">
			<input type="text" class="datepicker" name="edate" placeholder="end date"/>							
		</div>
	</div>
	<br>
	<div class="row">
		<div class="large-12 columns">
				<label>Report Type</label>					
		</div>
	</div>
	<div class="row">
		<div class="large-12 columns">
			<select name="report">
					<option value="0">Select Type of Report</option>
					<option value="1">Appointment History</option>
					<option value="2">Schedule History</option>
			</select>
		</div>
</div>
<div class="row">
	<div class="large-12 columns">
		<input type="submit" class="blue button radius" value="Generate" />
	</div>								
</div>
</div>
</div>
</form>
<% Object obj =  request.getAttribute("return");
if(obj!=null){
String ret = obj.toString();
if(ret.equals("0")){ %>
<div class="row">
	<div class="large-4 columns"><p>&nbsp;</p></div>
	<div class="large-4 columns red">
		<p class="text-center">Please select a report type.</p>
	</div>	
	</div>
<% } else if(ret.equals("1")){ %>
<div class="row">
	<div class="large-12 columns">
		<table>
			<thead>
				<tr>
					<th>Appointment Id</th>
					<th>Patient Id</th>
					<th>Patient Name</th>
					<th>Doctor Id</th>
					<th>Doctor Name</th>
					<th>Appointment Date</th>
					<th>Appointment Time</th>
					<th>Symptoms</th>
					<th>Booking Date</th>
					<th>Approval Status</th>
					<th>Appointment Status</th>
				</tr>
			</thead>
			<tbody>
				
				<% ArrayList<String[]>  data = (ArrayList<String[]>)request.getAttribute("appList"); 
					Iterator<String[]> itr = data.iterator();
					while(itr.hasNext()){
					%><tr><% 
						String[] str = itr.next();
						for(int i =0;i<str.length;i+=9){
						%><td><%=str[i] %></td><%
						%><td><%=str[i+1] %></td><%
						%><td><%=str[i+2] %></td><%
						%><td><%=str[i+3] %></td><%
						%><td><%=str[i+4] %></td><% 
						%><td><%=str[i+5] %></td><%
						%><td><%=str[i+6] %></td><%
						%><td><%=str[i+7] %></td><%
						%><td><%=str[i+8] %></td><% String appid = str[i];
						int a = AppStatus.approvalStatus(appid);
						if(a==2){
						%><td>Cancelled</td><%
						}
						else if(a==1){
						%><td>Approved</td><%
						}
						else{
						%><td>Pending</td><%
						}
						int b = AppStatus.appointmentStatus(appid);
						if(b==1){
						%><td>Successful</td><%
						}
						else if(b==0){
						%><td>To be Scheduled</td><%
						}
						}
					}
				%>	
				</tr>
			</tbody>
			</table>
	</div>
</div>
<% }  else if(ret.equals("2")){ %>
<div class="row">
	<div class="large-2 columns"><p>&nbsp;</p></div>
	<div class="large-8 columns">
		<table>
			<thead>
				<tr>
					<th>Availability Id</th>
					<th>Doctor Id</th>
					<th>Doctor Name</th>
					<th>Start Date</th>
					<th>End Date</th>
					<th>Morning Slot</th>
					<th>AfterNoon Slot</th>
					<th>Evening Slot</th>
				</tr>
			</thead>
			<tbody>
				
				<% ArrayList<String[]>  data = (ArrayList<String[]>)request.getAttribute("scheduleList"); 
					Iterator<String[]> itr = data.iterator();
					while(itr.hasNext()){
					%><tr><% 
						String[] str = itr.next();
						for(int i =0;i<str.length;i+=8){
						%><td><%=str[i] %></td><%
						%><td><%=str[i+1] %></td><%
						%><td><%=str[i+3] %></td><%
						%><td><%=str[i+2] %></td><%
						%><td><%=str[i+4] %></td><% 
						%><td><%=str[i+5] %></td><%
						%><td><%=str[i+6] %></td><%
						%><td><%=str[i+7] %></td><%
						}
					}
				%>	
				</tr>
			</tbody>
			</table>
	</div>
</div>
<% } 
 } %>

