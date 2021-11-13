package com.ar.Login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ar.GetCon.DbConnection;

@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		 String email = request.getParameter("email");
	        String pass = request.getParameter("pass");
	        String get="select * from login where email=? and pass=?";
	        Connection con=null;
			PreparedStatement ps=null;
			ResultSet rs=null;
			try {
				con=DbConnection.getConnection();
				 ps=con.prepareStatement(get);
				 ps.setNString(1,email);
				 ps.setNString(2,pass);
				 rs=ps.executeQuery();
				 if(rs.next()){
					 String name=rs.getNString("fname");
					 HttpSession session = request.getSession();
					 session.setAttribute("email",email);
					 session.setAttribute("fname",name);
					  response.sendRedirect("LoginHome.jsp");
					}
					else{
					  HttpSession session = request.getSession();
					  session.setAttribute("err", "username and password are incorrect");
					  response.sendRedirect("Login.jsp");
					}
			}
			catch(Exception e) {
				System.out.println(e);
			}
			finally {
			    try { rs.close(); } catch (Exception e) { /* ignored */ }
			    try { ps.close(); } catch (Exception e) { /* ignored */ }
			    try { con.close(); } catch (Exception e) { /* ignored */ }
			}
	}

}
