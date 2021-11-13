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
 * Servlet implementation class AddB
 */
@WebServlet("/AddB")
public class AddB extends HttpServlet {
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
		String bby=(String)session.getAttribute("fname");
		String bname=request.getParameter("bname");
		String bcat=request.getParameter("bcat");
		String binfo=request.getParameter("binfo");
		String img=request.getParameter("image");
		java.sql.Date sqlDate = new java.sql.Date(new java.util.Date().getTime());
		
		FileInputStream fis=new FileInputStream(new File(img));
		Connection con=DbConnection.getConnection();
		
		try {
			PreparedStatement ps=con.prepareStatement("insert into blog(bname,bby,bdate,bcategory,bdesc,bimg)values(?,?,?,?,?,?)");
			ps.setNString(1,bname);
			ps.setNString(2,bby);
			ps.setDate(3, sqlDate);
			ps.setNString(4,bcat);
			ps.setNString(5,binfo);
			ps.setBinaryStream(6,fis);
			int n=ps.executeUpdate();
			if(n>0) {
				 RequestDispatcher dis=request.getRequestDispatcher("./LoginBlog.jsp");          
		          dis.forward(request, response);  
			}
			else
			{
				out.println("Insertion error!!! Try Again");
				RequestDispatcher dis=request.getRequestDispatcher("./AddBlog.jsp");          
		          dis.include(request, response);  
			}
		}
		catch(Exception e)
		{System.out.println(e);}
		
		
	}

}
