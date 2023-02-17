package com.revature.controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.revature.model.Cancelation;
import com.revature.util.DataBaseConnection;


public class TicketValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con = DataBaseConnection.getConnection();

	public TicketValidation() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");		

		String ticket_id = request.getParameter("ticket_id");
		

		Cancelation c = new Cancelation();
		c.setUserid(ticket_id);
		boolean flag = true;
		try {

			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select ticket_id from `brms`.`cancellation`;");

			while (rs.next()) {
				if (c.getUserid().equals(rs.getString(1))) {
					flag = false;					
					RequestDispatcher rd =  request.getRequestDispatcher("TicketDetails.jsp");
					rd.forward(request, response);

				}

			}
			if (flag == true) {				
				RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("/TicketLogin.html");
				rd.forward(request, response);
			}

		} catch (Exception e) {
			e.getMessage();

		}

	}

}
