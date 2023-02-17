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
<html>
<title>Ticket Details</title>
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
<script type="text/javascript">
	function confirmComplete(methodType) {
		var answer = confirm("Are you sure you want to continue");
		if (answer == true) {
			document.getElementById("firstForm").action = "TicketCancel.jsp";
			document.getElementById("firstForm").method = methodType;
			document.getElementById("firstForm").submit();
		} else {
			alert("Sorry ticket not cancelled");
		}
	}
</script>
<style>
body {
	background-color: #e4e7ff;
}
</style>
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
				<div class="col-xl-10">
					<div class="card rounded-3 text-black">
						<div class="row g-0">
							<div class="col-lg-10">
								<div class="card-body p-md-5 mx-md-4">
									<div class="text-center ">
										<%!String ticket_id, t;%>

										<h1 style="color: RED">Ticket Details :</h1>
										<table border="1" style="text-align: center">
											<tr>
												<td>bus_id</td>
												<td>ticket_id</td>
												<td>booking_status</td>
												<td>booked_date</td>
												<td>curr_date</td>
												<td>booked_charge</td>
												<td>refund_amt</td>
												<td>reas_of_cancel</td>


											</tr>
											<%
											Cancelation c = new Cancelation();
											try {

												response.setContentType("text/html");
												ticket_id = request.getParameter("ticket_id");
												c.setTid(ticket_id);
												t = c.getTid();
												PreparedStatement statement = connection.prepareStatement("select * from cancellation where ticket_id=?");
												statement.setString(1, t);
												ResultSet resultSet = statement.executeQuery();

												while (resultSet.next()) {
											%>
											<tr>
												<td><%=resultSet.getString("bus_id")%></td>
												<td><%=resultSet.getString("ticket_id")%></td>
												<td><%=resultSet.getString("booking_status")%></td>
												<td><%=resultSet.getString("booked_date")%></td>
												<td><%=resultSet.getString("curr_date")%></td>
												<td><%=resultSet.getFloat("booked_charge")%></td>
												<td><%=resultSet.getFloat("refund_amt")%></td>
												<td><%=resultSet.getString("reas_of_cancel")%></td>



											</tr>
											<%
											if (resultSet.getString("booking_status").equals("Cancelled")) {
												return;
											}
											}
											//connection.close();
											} catch (Exception e) {
											e.printStackTrace();
											}
											%>

										</table>


										<br> <br>
										<form method="post" action="TicketCancel.jsp" id="firstForm">
											<div>
												<input type="hidden" id="thisField" name="inputName"
													value="<%=ticket_id%>">
											</div>


											<div class="text-center pt-1 mb-5 pb-1">
												<button onclick="confirmComplete('POST')" type="button"
													class="btn btn-primary">Ticket Cancel</button>
											</div>
											<br>
											<div style="Text-align: center">
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