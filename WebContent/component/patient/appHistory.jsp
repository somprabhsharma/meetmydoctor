
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="meetmydoctor.*" %>
<%@ page import="java.util.*" %>

<div class="row">
	<div class="large-3 columns"><p>&nbsp;</p></div>
	<div class="large-6 columns">
	<div class="row">
		<div class="large-12 columns">
			<h3 class="text-center">Appointment Requests</h3>
		</div>
	</div></div></div>
	<div class="row">
	
	<div class="large-12 columns">
	<table>
			<thead>
				<tr>
					<th>S.No.</th>
					<th>Doctor Name</th>
					<th>Doctor Email</th>
					<th>Doctor Field</th>
					<th>Doctor Address</th>
					<th>Appointment Date</th>
					<th>Appointment Time</th>
					<th>Symptoms</th>
					<th>Approval Status</th>
					<th>Appointment Status</th>
				</tr>
			</thead>
			<tbody>
				
				<% ArrayList<String[]>  data = (ArrayList<String[]>)session.getAttribute("requests"); 
					Iterator<String[]> itr = data.iterator();
					int sno=0;
					while(itr.hasNext()){
					sno++;
					%><tr><% 
						String[] str = itr.next();
						for(int i =0;i<str.length;i+=8){
						%><td><%=sno %></td><%
						%><td><%=str[i] %></td><%
						%><td><%=str[i+1] %></td><%
						%><td><%=str[i+2] %></td><%
						%><td><%=str[i+3] %></td><% 
						%><td><%=str[i+4] %></td><%
						%><td><%=str[i+5] %></td><%
						%><td><%=str[i+6] %></td><% String appid = str[i+7];
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

