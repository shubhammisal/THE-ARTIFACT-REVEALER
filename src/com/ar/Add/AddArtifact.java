package com.ar.Add;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ar.GetCon.DbConnection;

@WebServlet("/AddArtifact")
public class AddArtifact extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		
		PrintWriter out = res.getWriter(); 
		HttpSession session = req.getSession();
		String bby= (String) session.getAttribute("fname");
		//String bby=(String)session.getAttribute("fname");  
		String name=req.getParameter("aname");
		String cat=req.getParameter("acat");
		String ainfo=req.getParameter("info");
		Part p= req.getPart("image");
		String set="insert into artifact(arno,arname,arcat,arby,ardesc,arimg)values(?,?,?,?,?,?)";
		if(p!=null) {
		try {  
			Class.forName("com.mysql.jdbc.Driver");
		    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ar_database","root","");
		    PreparedStatement ps = con.prepareStatement(set);
			
			
			InputStream a=p.getInputStream(); 
			ps=con.prepareStatement(set);
			ps.setNString(1,name);
			ps.setNString(2,cat);
			ps.setNString(3,"bby");
			ps.setNString(4,ainfo);
			ps.setBlob(5,a);
			int rs=ps.executeUpdate();
			 if(rs>0){
				 
				  res.sendRedirect("LoginArtifact.jsp");
				}
				else{
					 out.print("Sorry Insertion Error!");  
				        RequestDispatcher rd=req.getRequestDispatcher("AddArtifact.jsp");  
				        rd.include(req,res);
				}
			
		}
		catch(Exception e) 
		{System.out.println(e);}
	}
	}

}
