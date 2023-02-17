package com.revature.controller;

import java.io.IOException;
import java.io.PrintWriter;
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


public class UserValidation extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static Connection con = DataBaseConnection.getConnection();

	public UserValidation() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		String userid = request.getParameter("userid");
		String password = request.getParameter("password");
		
		Cancelation c = new Cancelation();
		c.setUserid(userid);
		c.setPassword(password);		
		boolean flag = true;
		try {

			Statement stm = con.createStatement();
			ResultSet rs = stm.executeQuery("select login_id,password from `brms`.`registration`;");

			while (rs.next()) {
				if (c.getUserid().equals(rs.getString(1)) && c.getPassword().equals(rs.getString(2))) {
					flag = false;
					out.println("<h1 style='color:GREEN'>Login is successful</h1>");
					RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("/dashboard.html");
					rd.forward(request, response);
					
				}
				
			}
			if (flag == true) {
			    request.setAttribute("invalid", true);
				RequestDispatcher rd = (RequestDispatcher) request.getRequestDispatcher("login.jsp");
				rd.forward(request, response);
			}
			
		}catch(Exception e) {
			e.getMessage();
			
		}
	
		
	}

}
