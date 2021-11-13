package com.ar.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ar.GetCon.DbConnection;


@WebServlet("/Signup")
public class Signup extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
    public Signup() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		String fname = request.getParameter("fname");
        String email = request.getParameter("email");
        String pass = request.getParameter("pass");
        String cpass = request.getParameter("cpass");
        String set="insert into login values(?,?,?,?)";
        Connection con=null;
		PreparedStatement ps=null;
		try {
			con=DbConnection.getConnection();
			 ps=con.prepareStatement(set);
			 ps.setNString(1,fname);
			 ps.setNString(3,email);
			 ps.setNString(2,pass);
			 ps.setNString(4,cpass);
			int rs=ps.executeUpdate();  
			 if(rs>0){
				 
				  response.sendRedirect("Login.jsp");
				}
				else{
		
				  response.sendRedirect("Index.jsp");
				}
		}
		catch(Exception e) {
			System.out.println(e);
		}
		finally {
		    try { ps.close(); } catch (Exception e) { /* ignored */ }
		    try { con.close(); } catch (Exception e) { /* ignored */ }
		}
	}

}
