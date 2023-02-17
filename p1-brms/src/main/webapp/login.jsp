<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.revature.util.DataBaseConnection"%>
<%@page import="com.revature.model.Cancelation"%>
<%
Connection connection = DataBaseConnection.getConnection();
%>
<!DOCTYPE html>
<html lang="en">

<head>
<!-- basic -->
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<!-- mobile metas -->
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta name="viewport" content="initial-scale=1, maximum-scale=1" />
<!-- site metas -->
<title>LogIn</title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<meta name="author" content="" />
<!-- bootstrap css -->
<link rel="stylesheet" href="css/bootstrap.min.css" />
<!-- style css -->
<link rel="stylesheet" href="css/style.css" />
<!-- Responsive-->
<link rel="stylesheet" href="css/responsive.css" />
<!-- fevicon -->
<link rel="icon" href="images/fevicon.png" type="image/gif" />
<!-- Scrollbar Custom CSS -->
<link rel="stylesheet" href="css/jquery.mCustomScrollbar.min.css" />
<!-- Tweaks for older IEs-->
<link rel="stylesheet"
	href="https://netdna.bootstrapcdn.com/font-awesome/4.0.3/css/font-awesome.css" />
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/fancybox/2.1.5/jquery.fancybox.min.css"
	media="screen" />
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script
    ><![endif]-->
</head>
<!-- body -->

<body class="main-layout">
	<!-- loader  -->
	<div class="loader_bg">
		<div class="loader">
			<img src="images/loading.gif" alt="#" />
		</div>
	</div>
	<!-- end loader -->
	<!-- header -->
	<header>
		<!-- header inner -->
		<div class="header bg-info text-white">
			<div class="container">
				<div class="row">
					<div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 col logo_section">
						<div class="full">
							<div class="center-desk">
								<div class="logo">
									<a href="index.html"><img src="images/logo.png" alt="#"
										style="height: 70px; width: 100px" /></a>
								</div>
							</div>
						</div>
					</div>
					<div class="col-xl-9 col-lg-9 col-md-9 col-sm-9">
						<nav class="navigation navbar navbar-expand-md navbar-dark" >
							<button class="navbar-toggler" type="button"
								data-toggle="collapse" data-target="#navbarsExample04"
								aria-controls="navbarsExample04" aria-expanded="false"
								aria-label="Toggle navigation">
								<span class="navbar-toggler-icon"></span>
							</button>
							<div class="collapse navbar-collapse" id="navbarsExample04">
								<ul class="navbar-nav mr-auto">
									<li class="nav-item active"><a class="nav-link"
										href="index.html">Home</a></li>
									<li class="nav-item"><a class="nav-link" href="about.html">About</a>
									</li>
									<li class="nav-item"><a class="nav-link"
										href="cities.html">Cities</a></li>
									<li class="nav-item"><a class="nav-link"
										href="contact.html">Contact Us</a></li>
									<li class="nav-item"><a class="nav-link" href="login.jsp">SignIn/SignUp</a>
									</li>
									<li class="nav-item"><a class="nav-link" href="./AdminLogin.html">Admin login</a></li>
								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>
	<!-- end header inner -->
	<!-- end header -->
	<!-----login page-->
	<section class="h-100 gradient-form" style="background-color: #eee">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-8">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-12">
								<div class="card-body p-md-5 mx-md-4">
									<div class="text-center">
										<img src="images/bus1.png" style="width: 200px" alt="logo" />
										<h4 class="mt-1 mb-5 pb-1">
											<b>Welcome to MSTANG Bus Services</b>
										</h4>
									</div>

									<form method="post" action="UserValidation">
										<h2>Please login to your account</h2>
										<br>
										<div class="form-outline mb-4">
											<input type="text" id="form2Example11" name="userid" class="form-control"
												placeholder="Phone number or email address" /> <label
												class="form-label" for="form2Example11">Username</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example22" name="password"
												class="form-control" /> <label class="form-label"
												for="form2Example22">Password</label>
										</div>
										<div  style="color:RED;font-style: italic; font-size: 30px">
										<%
										try{
											boolean result = Boolean.parseBoolean(request.getAttribute("invalid").toString());
											if(result){
												out.print("Invalid username or password");
											}
										}catch(Exception e){
											e.getMessage();
										}
										%>
										
										</div>
				
										<div class="text-center pt-1 mb-5 pb-1">
											<a href="./dashboard.html">
												<button type="submit" 
													class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Log in</button>
											</a> <a class="text-muted" href="#!">Forgot password?</a>
										</div>

										<div
											class="d-flex align-items-center justify-content-center pb-4">
											<p class="mb-0 me-2">Don't have an account?</p>
											<button type="button" class="btn btn-outline-danger">
												Create new</button>
										</div>
									</form>
								</div>
							</div>


						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


	<!--  footer -->
	<footer>
		<div class="footer">
			<div class="container">
				<div class="row">
					<div class="col-md-4">
						<h3>Contact US</h3>
						<ul class="conta">
							<li><i class="fa fa-map-marker" aria-hidden="true"></i>
								Address</li>
							<li><i class="fa fa-mobile" aria-hidden="true"></i> +01
								1234569540</li>
							<li><i class="fa fa-envelope" aria-hidden="true"></i><a
								href="#"> demo@gmail.com</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<h3>Menu Link</h3>
						<ul class="link_menu">
							<li class="active"><a href="index.html">Home</a></li>
							<li><a href="about.html"> about</a></li>
							<li><a href="room.html">Our Room</a></li>
							<li><a href="gallery.html">Gallery</a></li>
							<li><a href="blog.html">Blog</a></li>
							<li><a href="contact.html">Contact Us</a></li>
						</ul>
					</div>
					<div class="col-md-4">
						<h3>News letter</h3>
						<form class="bottom_form">
							<input class="enter" placeholder="Enter your email" type="text"
								name="Enter your email" />
							<button class="sub_btn">subscribe</button>
						</form>
						<ul class="social_icon">
							<li><a href="#"><i class="fa fa-facebook"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-twitter"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-linkedin"
									aria-hidden="true"></i></a></li>
							<li><a href="#"><i class="fa fa-youtube-play"
									aria-hidden="true"></i></a></li>
						</ul>
					</div>
				</div>
			</div>
			<div class="copyright">
				<div class="container">
					<div class="row">
						<div class="col-md-10 offset-md-1">
							<p>
								© 2019 All Rights Reserved. Design by <a
									href="https://html.design/"> Free Html Templates</a> <br /> <br />
								Distributed by <a href="https://themewagon.com/" target="_blank">ThemeWagon</a>
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
	<!-- end footer -->
	<!-- Javascript files-->
	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.bundle.min.js"></script>
	<script src="js/jquery-3.0.0.min.js"></script>
	<!-- sidebar -->
	<script src="js/jquery.mCustomScrollbar.concat.min.js"></script>
	<script src="js/custom.js"></script>
</body>

</html>