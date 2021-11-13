package com.ar.delete;

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

/**
 * Servlet implementation class deleteblg
 */
@WebServlet("/deleteblg")
public class deleteblg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deleteblg() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
		int idd =Integer.parseInt(request.getParameter("id"));
	        String get="delete * from blog where bid=?";
	        Connection con=null;
			PreparedStatement ps=null;
			try {
				con=DbConnection.getConnection();
				 ps=con.prepareStatement(get);
				 ps.setInt(1,idd);
				int r=ps.executeUpdate();
				 if(r>0){
					 response.sendRedirect("./Adminpanal1.jsp");
					}
					else{
					  response.sendRedirect("./Adminpanal1.jsp");
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
