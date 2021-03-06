<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.Connection" %>
    <%@ page import="java.sql.Statement" %>
    <%@ page import="java.sql.ResultSet" %>
    <%@ page import="javax.servlet.*" %>
    <%@ page import="java.util.Date" %>
    <%@page import="java.util.Calendar"%>
<%@page import="meetmydoctor.DocDet"%>
<%@ page import="java.text.*" %>
<%@page import="meetmydoctor.Connectivity"%>


<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Patient Profile</title>  
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
	
	<script type="text/javascript" src="js/datepicker.js"></script>
	<link rel="stylesheet" href="css/datepicker/metallic.css" type="text/css">

		<!--   <script>

function getCity(){

var state_name = document.getElementById("state1").value;

window.location.replace("?state_name="+state_name); 

}

</script> -->

	<script>
$(document).ready(function(){

$('#state1').change(function(event){
var state_name = $("select#state1").val();
$.get('City',{
	state_n : state_name
}, function(response){
var out ="<label>State</label><select name='cityname'><option value='1'>All</option>";
var i;
for(i = 0; i < response.length; i++) {
        out +='<option value="'+response[i]+'">'+response[i]+'</option>';
    }
    out +='</select>'

document.getElementById("a").innerHTML = out;



});});});

</script>		

		<script type="text/javascript" src="validate.min.js"></script>
</head>
<body>
<%
if(session.getAttribute("userid")!=null){
String userid = session.getAttribute("userid").toString();  %>

<!-- Begin Main Wrapper -->
<div class="main-wrapper">
	<!-- Main Navigation -->  
		<header class="row main-navigation">
		<div class="large-3 columns">	
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt="Logo" /></a>
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
						<li><a href="docdir.jsp">Doctor Directory</a></li>
						<li class="has-dropdown"><a href="#">Register</a>
						<ul class="dropdown">
							<li><a href="register.jsp?comp=patient">Patient</a></li>
							<li><a href="register.jsp?comp=doctor">Dcotor</a></li>
						</ul>
						</li>
						<li><a href="Profile"  class="active">Profile</a></li>
						<li><a href="about.jsp">About Us</a></li>
						<li><a href="contact.jsp">Contact Us</a></li>
					  </ul>
					  <!-- End Left Nav Section -->					 
				</section>
			</nav>
		</div>
	</header>
	<% 
	Object obj = request.getParameter("page");
						Connection conn = Connectivity.getConnection();
						Statement stmt = conn.createStatement();
						ResultSet rs = stmt.executeQuery("select * from patient where patient_id = '"+userid+"'");
						String name=null;
						if(rs.next()){
							name = rs.getString(2);
						}
						%>
</div><!-- End Main Navigation -->
<div class="main-content-top">	
	<div class="main-wrapper">	
		<div class="row">
			<div class="large-6 columns">
				<h3>Hi <%=name %></h3>
			</div>        
			<div class="large-6 columns">
				<ul class="breadcrumbs right">
					<!--<li><a href="patient_home.jsp?param=profile">Profile</a></li>-->
					<li><a href="Logout">Logout</a></li>
				</ul>
			</div>
		</div>
	</div>		
</div>

<!-- End Main Content Top -->
<div class="main-wrapper">
	<div class="row main-content"><!-- Main Content -->
    	<div class="large-12 columns">
			<div class="row"><!-- Row -->
			<% if(obj.toString().equals("content")){
			%><jsp:include page="component/patient/content.jsp"/><%
			} %>
			<% if(obj.toString().equals("finddoc")){
			%><jsp:include page="component/patient/finddoc.jsp"/><%
			} %>
			<% if(obj.toString().equals("bookapp")){
			%><jsp:include page="component/patient/bookapp.jsp"/><%
			} %>
			<% if(obj.toString().equals("booksuccess")){
			%><jsp:include page="component/patient/booksuccess.jsp"/><%
			} %>
			<% if(obj.toString().equals("appHistory")){
			%><jsp:include page="component/patient/appHistory.jsp"/><%
			} %>
			<% if(obj.toString().equals("question")){
			%><jsp:include page="component/patient/question.jsp"/><%
			} %>
			<% if(obj.toString().equals("exception")){
			%><jsp:include page="component/exception.jsp"/><%
			} %>
			</div><!-- End Row --><br><br><br><br><br><br>
        </div>
	</div><!-- End Main Content -->
</div>   
<jsp:include page="footer.jsp" /> 
<!-- carouFredSel plugin -->
<script type="text/javascript" src="js/plugins/carouFredSel/jquery.carouFredSel-6.2.0-packed.js"></script>
<script type="text/javascript" src="js/plugins/carouFredSel/helper-js/plugins/jquery.touchSwipe.min.js"></script>

<!-- Scripts Initialize -->
<script src="js/app-head-calls.js"></script> 
<script src="js/foundation.min.js"></script>

<!-- Smallipop JS - Tooltips -->
<script type="text/javascript" src="js/plugins/smallipop/lib/contrib/prettify.js"></script>
<script type="text/javascript" src="js/plugins/smallipop/lib/jquery.smallipop.js"></script>
<script type="text/javascript" src="js/plugins/smallipop/lib/smallipop.calls.js"></script> 

<!-- Initialize JS js/plugins -->
<script src="js/app-bottom-calls.js"></script>
	
<script>
$(document).foundation();
</script>  
<%} else{
request.setAttribute("error", 1);
request.getRequestDispatcher("index.jsp").forward(request, response);

} %>


</body>
</html>
