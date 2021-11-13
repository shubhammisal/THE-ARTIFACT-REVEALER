package com.ar.Add;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ar.GetCon.DbConnection;

/**
 * Servlet implementation class AddAr
 */
@WebServlet("/AddAr")
public class AddAr extends HttpServlet {
	private static final long serialVersionUID = 1L;

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
		PrintWriter out=response.getWriter();
		HttpSession session=request.getSession();
		String aby=(String)session.getAttribute("fname");
		String aname=request.getParameter("aname");
		String acat=request.getParameter("acat");
		String ainfo=request.getParameter("info");
		String img=request.getParameter("image");
				
		FileInputStream fis=new FileInputStream(new File(img));
		Connection con=DbConnection.getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("insert into artifact(arname,arcat,arby,ardesc,arimg)values(?,?,?,?,?)");
			ps.setNString(1,aname);
			ps.setNString(2,acat);
			ps.setNString(3,aby);
			ps.setNString(4,ainfo);
			ps.setBinaryStream(5,fis);
			int n=ps.executeUpdate();
			if(n>0) {
				 RequestDispatcher dis=request.getRequestDispatcher("./LoginArtifact.jsp");          
		          dis.forward(request, response);  
			}else
			{
				out.println("Insertion error!!! Try Again");
				RequestDispatcher dis=request.getRequestDispatcher("./AddArtifact.jsp");          
		          dis.include(request, response);
			}
		}
		catch(Exception e)
		{System.out.println(e);}
		
		
	}

	}


