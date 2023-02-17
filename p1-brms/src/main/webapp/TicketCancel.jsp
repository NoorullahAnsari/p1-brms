<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.revature.util.DataBaseConnection"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="com.revature.model.Cancelation"%>

<%!Connection connection = DataBaseConnection.getConnection();%>
<!DOCTYPE html>
<html>
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



										<form method="post" action="TicketCancel2.jsp">


											<div class="text-left">
												<h2>Reason of ticket cancellation :</h2>
												<input type="text" name="txt" id="txt"
													placeholder="Type something..." style="width: 50%" required>
											</div>

											<%!String resDate = null;
												double ticketCharge = 0;
												double refundAmt = 0;
												double fine = 0;
												String tid;
												String reasOfCancel = null;%>
											<%
											Date date = new Date();
											SimpleDateFormat dform = new SimpleDateFormat("yyyy-MM-dd");
											String now = dform.format(date);
											Cancelation c = new Cancelation();

											tid = request.getParameter("inputName");

											try {

												PreparedStatement statement = connection
												.prepareStatement("select booked_date, booked_charge from cancellation where ticket_id=?");
												statement.setString(1, tid);
												ResultSet resultSet = statement.executeQuery();

												while (resultSet.next()) {
													resDate = resultSet.getString(1);
													ticketCharge = resultSet.getFloat(2);
												}
											} catch (Exception e) {
												e.printStackTrace();
											}

											try {
												Date date1 = dform.parse(resDate);
												Date date2 = date;
												long time_difference = date2.getTime() - date1.getTime();
												long days_difference = (time_difference / (1000 * 60 * 60 * 24)) % 365;
												long hours_difference = (time_difference / (1000 * 60 * 60)) % 24;
												if (days_difference >= 7) {
													refundAmt = ticketCharge - (ticketCharge * 85 / 100);
													fine = (ticketCharge * 85 / 100);
												} else if (days_difference >= 4) {
													refundAmt = ticketCharge - (ticketCharge * 50 / 100);
													fine = (ticketCharge * 50 / 100);
												} else if (days_difference >= 1) {
													refundAmt = ticketCharge - (ticketCharge * 25 / 100);
													fine = (ticketCharge * 25 / 100);
												} else if (hours_difference >= 4) {
													refundAmt = ticketCharge - (ticketCharge * 10 / 100);
													fine = (ticketCharge * 10 / 100);
												} else if (hours_difference >= 1) {
													refundAmt = ticketCharge - (ticketCharge * 5 / 100);
													fine = (ticketCharge * 5 / 100);
												} else {
													refundAmt = 0;
													fine = ticketCharge;
												}
											%>

											<div class="text-left">
												<h2>
													Your ticket fine is :
													<%=fine%>
												</h2>
											</div>
											<%
											} catch (Exception excep) {
											out.print("Inside Catch");
											excep.printStackTrace();
											}
											%>

											<div>
												<input type="hidden" id="thisField" name="inputTid"
													value="<%=tid%>"> <input type="hidden"
													id="thisField2" name="inputDate" value="<%=now%>">
												<input type="hidden" id="thisField4" name="inputAmount"
													value="<%=refundAmt%>">
											</div>

											<div class="text-left">
												<h2>Are you confirm :</h2>
												<input type="radio" name="choice" value="yes" required>
												<label for="yes">Yes</label> 
												<input type="radio"	name="choice" value="no"> <label for="no">No</label>
											</div>
											<br>
											<div class="text-center pt-1 mb-5 pb-1">
												<button type="submit" class="btn btn-primary"
													style="border: 0px; padding: 10px 30px;">OK</button>
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