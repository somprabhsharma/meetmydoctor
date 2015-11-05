<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<!--[if IE 8]><html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Register</title>  
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
var out ="<select name='cityname'>";
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
						<li class="has-dropdown"><a href="#" class="active">Register</a>
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
				<h2>Register</h2>
			</div>        
			<div class="large-6 columns">
				<ul class="breadcrumbs right">
					<li>You are here: </li>
					<li><a href="index.jsp">Home</a></li>
					<li><a href="#">Register</a></li>
				</ul>
			</div>
		</div>
	</div>		
</div>
<% String component = request.getParameter("comp");
String url = null;
if(component.equalsIgnoreCase("patient")){
	url = "patientreg.jsp";
}
if(component.equalsIgnoreCase("doctor")){
	url = "doctorreg.jsp";
}

 %>
<!-- End Main Content Top -->
<div class="main-wrapper">
	<div class="row main-content"><!-- Main Content -->
    	<div class="large-12 columns">
			<div class="row"><!-- Row -->
				<div class="large-3 columns"><p>&nbsp;</p></div>
				<div class="large-6 columns">
                    <jsp:include page="<%=url%>" /> 
					<div class="success_box"></div>
    				<div class="error_box"></div>
				</div>
			</div><!-- End Row -->
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

<script type="text/javascript">

new FormValidator('testform', [{
    name: 'pname',
    display: 'Name',
    rules: 'required'
},  {
    name: 'ppassword',
    display: 'Password',
    rules: 'required|max_length[15]|min_length[8]'
}, {
    name: 'ppasswordr',
    display: 'Password Confirmation',
    rules: 'required|matches[ppassword]'
}, {
    name: 'pemail',
    display: 'Email',
    rules: 'required|valid_email'
}, {
    name: 'pmob',
    display: 'Mobile Number',
    rules: 'required|exact_length[10]|numeric'
} ], function(errors, evt) {

    var SELECTOR_ERRORS = $('.error_box'),
        SELECTOR_SUCCESS = $('.success_box');

    if (errors.length > 0) {
        SELECTOR_ERRORS.empty();

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            SELECTOR_ERRORS.append(errors[i].message + '<br />');
        }

        SELECTOR_SUCCESS.css({ display: 'none' });
        SELECTOR_ERRORS.fadeIn(200);
    } else {
        SELECTOR_ERRORS.css({ display: 'none' });
		//SELECTOR_SUCCESS.append('Details have been added successfully');
        SELECTOR_SUCCESS.fadeIn(200);
		if (event) {
        event.returnValue = true;
		}
    }

	
});
new FormValidator('docform', [{
    name: 'dname',
    display: 'Name',
    rules: 'required'
},  {
    name: 'demail',
    display: 'Email',
    rules: 'required|valid_email'
},{
    name: 'dpassword',
    display: 'Password',
    rules: 'required|max_length[15]|min_length[8]'
}, {
    name: 'dpasswordr',
    display: 'Password Confirmation',
    rules: 'required|matches[dpassword]'
},  {
    name: 'dmob',
    display: 'mobile number',
    rules: 'required|numeric|exact_length[10]'
},{
	name:'daddress',
	rules:'required'
}, {
	name:'cityname',
	display:'City',
	rules:'required'
}, {
	name:'state1',
	display:'State',
	rules:'required'
}], function(errors) {

    var SELECTOR_ERRORS = $('.error_box'),
        SELECTOR_SUCCESS = $('.success_box');

    if (errors.length > 0) {
        SELECTOR_ERRORS.empty();

        for (var i = 0, errorLength = errors.length; i < errorLength; i++) {
            SELECTOR_ERRORS.append(errors[i].message + '<br />');
        }

        SELECTOR_SUCCESS.css({ display: 'none' });
        SELECTOR_ERRORS.fadeIn(200);
    } else {
        SELECTOR_ERRORS.css({ display: 'none' });
		SELECTOR_SUCCESS.append('Details have been added successfully');
        SELECTOR_SUCCESS.fadeIn(200);
		if (event) {
        event.returnValue = true;
		}
    }
});

</script>
<script>
$(document).foundation();
</script>  



</body>
</html>
