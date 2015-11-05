
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
	</div>
	<div class="row">
	<div class="large-12 columns">
	<table>
			<thead>
				<tr>
					<th>S.No.</th>
					<th>Patient Name</th>
					<th>Appointment Date</th>
					<th>Appointment Time</th>
					<th>Symptoms</th>
					<th>Approve</th>
					<th>Cancel</th>
					
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
						for(int i =0;i<str.length;i+=5){
						%><td><%=sno %></td><%
						%><td><%=str[i] %></td><%
						%><td><%=str[i+1] %></td><%
						%><td><%=str[i+2] %></td><%
						%><td><%=str[i+3] %></td><% String appid = str[i+4];
						if(request.getAttribute("approved")!=null&&request.getAttribute("appid").toString().equals(appid)){
						%><td>Approved</td><%
						%><td></td><%
						}
						else if(request.getAttribute("cancelled")!=null&&request.getAttribute("appid").toString().equals(appid)){
						%><td></td><%
						%><td>Cancelled</td><%
						}
						else{
						int a = AppStatus.approvalStatus(appid);
						if(a==2){
						%><td></td><%
						%><td>Cancelled</td><%
						}
						else if(a==1){
						%><td>Approved</td><%
						%><td></td><%
						}
						else{
						%><td><a href="Approve?appid=<%=appid %>">Approve</a></td><%
						%><td><a href="Cancel?appid=<%=appid %>">Cancel</a></td><%
						}
						}
						}
					}
				%>	
				</tr>
			</tbody>
			</table>
	</div>
	</div>	
	</div>
</div>
