<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.revature.util.DataBaseConnection"%>
<%@page import="com.revature.model.Cancelation"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Cancelled</title>

<title>Ticket Cancel</title>
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

</head>

<body>


	<!-- header start -->
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
						<nav class="navigation navbar navbar-expand-md navbar-dark">
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
										href="contact.html">Contact Us</a></li>

								</ul>
							</div>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</header>

	<!--    end header -->

	<%
	Connection connection = DataBaseConnection.getConnection();
	%>

	<section class="h-100 gradient-form" style="background-color: #eee">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col-xl-12">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-12">
								<div class="card-body p-md-5 mx-md-4">
									<div class="text-center ">


										<form method="post" action="index.html">



											<%!String tid, now, reasOfCancel;
													double refundAmt;%>

											<%
											tid = request.getParameter("inputTid");
											refundAmt = Double.parseDouble(request.getParameter("inputAmount"));
											now = request.getParameter("inputDate");
											reasOfCancel = request.getParameter("txt");
											String checkChoice=request.getParameter("choice");
											
											if(checkChoice.equals("no")){
												out.print("<h1 style='color:RED; text-align:left'><b><i>Ticket Not cancelled...<i><b><h1>");
												RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("login.html");
												
												
											}
											else{
												try {

													String cancel = "Cancelled";
													Statement stmt2 = connection.createStatement();
													int k = stmt2.executeUpdate("update  cancellation set booking_status='" + cancel + "', booked_date = '" + now
													+ "', refund_amt='" + refundAmt + "',reas_of_Cancel='" + reasOfCancel + "' where ticket_id='" + tid + "'");

													if (k > 0) {
												%>
												<h1 style="color: Green; text-align: left"><b><i>Ticket
													Cancelled Successfully...<i><b></b></i></h1>

												<%
												}
												} catch (Exception excep) {
												excep.printStackTrace();
												}
												
											}

											
											%>
											<br>
											<br>
											<br>
											<br>

											<div class="text-center pt-1 mb-5 pb-1">
												<a href="index.html"
													class="btn btn-primary btn-block fa-lg gradient-custom-2 mb-3">Home</a>

											</div>

										</form>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>


</body>
</html>