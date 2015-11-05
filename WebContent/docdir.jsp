<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->
<%@ page import="meetmydoctor.*" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Doctor Directory</title>  
	<meta name="author" content="Som Prabh Sharma">
	<meta name="description" content="A website to book appointment with best doctors across the country">
	<meta name="keyword" content="Doctors, Appointment, Doctor Appointment, Clinic, Online Doctor, Hospitals">
	<!-- Smallipop CSS - Tooltips -->
	<link rel="stylesheet" href="js/plugins/smallipop/css/contrib/animate.min.css" type="text/css" media="all" title="Screen" />
	<link rel="stylesheet" href="js/plugins/smallipop/css/jquery.smallipop.css" type="text/css" media="all" title="Screen" />

	<!-- Default CSS -->
	<link rel="stylesheet" href="css/normalize.css" />
	<link rel="stylesheet" href="css/foundation.css" />
	<link rel="stylesheet" href="css/fgx-foundation.css" />
	<!--[if IE 8]><link rel="stylesheet" href="css/ie8-grid-foundation-4.css" /><![endif]-->

	<!-- Font Awesome - Retina Icons -->
	<link rel="stylesheet" href="js/plugins/fontawesome/css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nivo-slider.css" />
	<link rel="stylesheet" href="css/themes/default/default.css" />
	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/style.css" />

	<!-- Main JS Files -->
	<script src="js/vendor/jquery.js"></script>
	<script src="js/vendor/custom.modernizr.js"></script>
<script>
$(document).ready(function(){

$('#state1').change(function(event){
var state_name = $("select#state1").val();
$.get('City',{
	state_n : state_name
}, function(response){
var out ="<label>City</label><select name='cityname'><option value='1'>All</option>";
var i;
for(i = 0; i < response.length; i++) {
        out +='<option value="'+response[i]+'">'+response[i]+'</option>';
    }
    out +='</select>'

document.getElementById("a").innerHTML = out;



});});});

</script>	
</head>
<body>

<!-- Begin Main Wrapper -->
<div class="main-wrapper">
	<!-- Main Navigation -->  
		<header class="row main-navigation">
		<div class="large-3 columns">	
			<a href="index.html" id="logo"><img src="images/logo.png" alt="Logo" /></a>
		</div>
		<div class="large-9 columns">			
			<nav class="top-bar">
				<ul class="title-area">
				  <!-- Title Area -->
				  <li class="name"></li>
				  <!-- Remove the class "menu-icon" to get rid of menu icon. Take out "Menu" to just have icon alone -->
				  <li class="toggle-topbar menu-icon"><a href="#"><span>Main Menu</span></a></li>
				</ul>

				<section class="top-bar-section">
					<!-- Left Nav Section -->
					  <ul class="right">
						<!-- class="has-dropdown" -->
						<li><a href="index.jsp">Home</a></li>
						<li><a href="docdir.jsp" class="acitve">Doctor Directory</a></li>
						<li class="has-dropdown"><a href="#">Register</a>
						<ul class="dropdown">
							<li><a href="register.jsp?comp=patient">Patient</a></li>
							<li><a href="register.jsp?comp=doctor">Dcotor</a></li>
						</ul>
						</li>
						<li><a href="Profile">Profile</a></li>
						<li><a href="about.jsp">About Us</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					  </ul>
					  <!-- End Left Nav Section -->					 
				</section>
			</nav>
		</div>
	</header>
</div><!-- End Main Navigation -->
	<div class="main-content-top">	
		<div class="main-wrapper">	
			<div class="row">
				<div class="large-6 columns">
					<h2>Doctor Directory</h2>
				</div>        
				<div class="large-6 columns">
					<ul class="breadcrumbs right">
						<li>You are here: </li>
						<li><a href="index.jsp">home</a></li>
						<li><a href="docdir.jsp">Doctor Directory</a></li>
					</ul>
				</div>
			</div>
		</div>		
	</div>

<!-- End Main Content Top -->
<div class="main-wrapper">	
	<div class="row main-content">
		<div class="large-12 columns">							
			<div class="row">
				<div class="large-4 columns"><p>&nbsp;</p></div>
				<div class="large-4 columns">
				<div class="row">
					<div class="large-12 columns">
						<h3 class="text-center">Find A Doctor</h3>
					</div>
				</div>
				<form class="custom" action="FindAllDoc" method="get">
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
					}%></tr><%
				}
			 %>
			</tbody>
		</table></div>
	<% } else if(request.getAttribute("result").toString().equals("0")){%>
		<div class="large-8 columns red"><p class="text-center">No available doctor for your search please do another search.</p>
	<%}
	} %>
	</div>
</div>
		</div>
	</div>	
</div>
<jsp:include page="footer.jsp" />
<!-- carouFredSel plugin -->
<script src="js/plugins/carouFredSel/jquery.carouFredSel-6.2.0-packed.js"></script>
<script src="js/plugins/carouFredSel/helper-js/plugins/jquery.touchSwipe.min.js"></script>

<!-- Scripts Initialize -->
<script type="text/javascript" src="js/app-head-calls.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>	
<script src="js/foundation.min.js"></script>

<!-- Smallipop JS - Tooltips -->
<script type="text/javascript" src="js/plugins/smallipop/lib/contrib/prettify.js"></script>
<script type="text/javascript" src="js/plugins/smallipop/lib/jquery.smallipop.js"></script>
<!-- Initialize JS js/plugins -->
<script src="js/app-bottom-calls.js"></script>  

<script>
$(document).foundation();
</script>  



<!-- End Main Wrapper -->
</body>
</html>
