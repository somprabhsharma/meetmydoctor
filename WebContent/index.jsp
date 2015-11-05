
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<!--[if IE 8]> 	<html class="no-js lt-ie9" lang="en"> <![endif]-->
<!--[if gt IE 8]><!--> <html class="no-js" lang="en"> <!--<![endif]-->

<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width" />
	<title>Find Best Doctors and Book Appointments Online | meetmydoctor.co.in</title> 
	<meta name="author" content="Som Prabh Sharma">
	<meta name="description" content="A website to book appointment with best doctors across the country">
	<meta name="keyword" content="Doctors, Appointment, Doctor Appointment, Clinic, Online Doctor, Hospitals">
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400italic,400,700' rel='stylesheet' type='text/css'>
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
	<link rel="stylesheet" href="css/datepicker/metallic.css" />
	<!-- Google Fonts -->
	<link href='http://fonts.googleapis.com/css?family=Open+Sans:400,700' rel='stylesheet' type='text/css'>
	<link rel="stylesheet" href="css/style.css" />
	<!-- Main JS Files -->
	<script src="js/vendor/jquery.js"></script>
	<script src="js/vendor/custom.modernizr.js"></script>
</head>
<body class="boxed">
<%
Object uid=request.getAttribute("uid");
Object err= request.getAttribute("err");
Object error = request.getAttribute("error");

%>
<!-- Begin Main Wrapper -->
<div class="main-wrapper">
	<!-- Main Navigation -->  
	<header class="row main-navigation">
		<div class="large-2 columns">	
			<a href="index.jsp" id="logo"><img src="images/logo.png" alt="Logo" /></a>
		</div>
		<div class="large-10 columns">			
			<nav class="top-bar">
				<section class="top-bar-section">
					<!-- class="has-dropdown" -->
					  <ul class="right">
						<li><a href="index.jsp" class="active">Home</a></li>
						<li><a href="docdir.jsp">Doctor Directory</a></li>
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
	<!-- Start Main Slider -->
	<jsp:include page="slider.jsp" /> 
	<!-- End Main Slider -->
	<div class="row"  id="status">
		<div class="large-12 columns red">
			<%
			if(uid!=null){
			%>
			<p class="text-center">You have successfully registered. Your userid is : <%= uid.toString() %>. Please login to continue.</p>
			<%
			}
			if(err!=null){
			%>
			<p class="text-center">Invalid User Name and Password</p>
			<%
			}
			%>
	 	</div>
	</div>
	<!-- Main Content -->
	<jsp:include page="login.jsp" /> 
	<jsp:include page="footer.jsp" /> 
</div>
<script src="js/foundation.min.js"></script>
<script>$(document).foundation()</script>  

<!-- carouFredSel plugin -->
<script src="js/plugins/carouFredSel/jquery.carouFredSel-6.2.0-packed.js"></script>
<script src="js/plugins/carouFredSel/helper-js/plugins/jquery.touchSwipe.min.js"></script>

<!-- Scripts Initialize -->
<script type="text/javascript" src="js/app-head-calls.js"></script>
<script type="text/javascript" src="js/jquery.nivo.slider.pack.js"></script>	
<script type="text/javascript" src="js/datepicker.js"></script>	
<!-- Smallipop JS - Tooltips -->
<script type="text/javascript" src="js/plugins/smallipop/lib/contrib/prettify.js"></script>
<script type="text/javascript" src="js/plugins/smallipop/lib/jquery.smallipop.js"></script>
<!-- Initialize JS js/plugins -->
<script src="js/app-bottom-calls.js"></script>  

<%if(error!=null){
	%><script>alert("You must login first");</script><%
} %>
<script>
jQuery.noConflict();

jQuery(window).load(function() {
	jQuery('#slider').nivoSlider({ controlNav: false});	
});
jQuery(document).ready(function() {

	jQuery('input.datepicker').Zebra_DatePicker();
	// Carousel
	jQuery("#carousel-type1").carouFredSel({
		responsive: true,
		width: '100%',
		auto: false,
		circular : false,
		infinite : false, 
			items: {visible: {min: 1,max: 4},
		},
		scroll: {
			items: 1,
			pauseOnHover: true
		},
		prev: {
			button: "#prev2",
			key: "left"
		},
		next: {
			button: "#next2",
			key: "right"
		},
		swipe: true
	});
	
	jQuery(".work_slide ul").carouFredSel({
		circular: false,
		infinite: true,
		auto: false,
		scroll:{items:1},
		items: {visible: {min: 3,max: 3}},
		prev: {	button: "#slide_prev", key: "left"},
		next: { button: "#slide_next",key: "right"}
	});
	jQuery("#testimonial_slide").carouFredSel({
		circular: false,
		infinite: true,
		auto: false,
		scroll:{items:1},
		prev: {	button: "#slide_prev1", key: "left"},
		next: { button: "#slide_next1",key: "right"}
	});
	
	
});  
	
</script>


<!-- End Main Wrapper -->
</body>
</html>
