package com.ar.ArtifactData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/aimg")
public class aimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    

	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Artifactdao dao=new Artifactdao();
	    ServletOutputStream ou=null;
		int id=Integer.parseInt(req.getParameter("id"));
		byte[] img=dao.getImage(id);
		ou=res.getOutputStream();
		ou.write(img);
		ou.close();
	}

}
