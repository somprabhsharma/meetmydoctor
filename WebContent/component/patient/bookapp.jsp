<%@ page import="meetmydoctor.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<div class="row">
	<div class="large-3 columns">
	<%
	Object obj = request.getParameter("docid");
	if(obj!=null){
		String docid = obj.toString(); 
		String[] docdet = DocDet.getDetails(docid);
		int i=0;
	%><div class="row"><div class="large-12 columns">
		<h3>Visited Doctors</h3></div></div>
	    <% ArrayList<String> docids = DocDet.getVisitedDoctors(session.getAttribute("userid").toString()); 
			if(docids.isEmpty()){
				%><p>You have not visited any doctor yet</p><%
			} else {
			Iterator<String> itr2 = docids.iterator();
			while(itr2.hasNext()){
			String doctorid = itr2.next();
			String[] strdoc = DocDet.getDetails(doctorid);
			
		%>
		<div class="row"><div class="large-12 columns">
		<a href="patient_home.jsp?page=bookapp&docid=<%=doctorid%>"><h6><%=strdoc[0] %></h6></a><br>
		</div></div>
		<%}} %>
	</div>
	<div class="large-9 columns">
		<h3 class="text-center">Book An Appointment</h3>
		<div class="row">
			<div class="large-3 columns"><p>&nbsp;</p></div>
			<div class="large-6 columns">
			<table>
			<thead>
				<tr>
					<th colspan="4" class="text-center">Doctor Details</th>
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
			</tbody>
			</table><% } else{out.print("sdfsdafa");} %>
			</div>
		</div>
		<div class="row">
			<div class="large-3 columns"><p>&nbsp;</p></div>
			<div class="large-6 columns">
				<form class="custom" action="BookApp" method="get">
				<fieldset>
				<legend>Book Now</legend>
				<div class="row">
					<div class="large-12 columns">
						<label>Symptoms</label>
						<textarea name="symptoms" rows="5" cols="20" placeholder="Enter your disease symptoms or reason for appointment"></textarea>
					</div>
				</div>
				<div class="row">
					<div class="large-12 columns">
						<label>Select Date</label>
					</div>
				</div>
				<div class="row">
					<div class="large-12 columns">
						<input type="text" class="datepicker" name="sdate" placeholder="select date"/>		
					</div>
				</div>
				<% String time[]=DocDet.getTime(obj.toString()); %>
				<div class="row">
					<div class="large-12 columns">
						<select name="time">
						<% for(int k=0;k<time.length;k++){ 
							if(time[k]!=null){
						%>
							<option><%=time[k] %></option>
							<%} %>
						<% } %>
						</select>		
					</div>
				</div>
				<div class="row">
					<div class="large-12 columns">
						<input type="submit" name="book" value="book" class="blue button radius"/>
					</div>
				</div>
				</fieldset>
				</form>
			</div>
		</div>
</div>
</div>
<% Object objn = request.getParameter("docid");
if(objn!=null){
session.setAttribute("docid", objn.toString());
String enddate = DocDet.getDate(objn.toString());
String startdate = DocDet.getStartDate(objn.toString());
Date date = new Date();
String start= new SimpleDateFormat("yyyy-MM-dd").format(date);
if(start.compareTo(startdate)>0){
%>
<script>$(document).ready(function() {

    
    $('input.datepicker').Zebra_DatePicker({direction: ['<%= start%>', '<%= enddate%>'] });

 });</script>
<% }
else{
%>
<script>$(document).ready(function() {

    
    $('input.datepicker').Zebra_DatePicker({direction: ['<%= startdate%>', '<%= enddate%>'] });

 });</script>
<%
}
}
 %>