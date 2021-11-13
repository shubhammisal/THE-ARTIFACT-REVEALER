package com.ar.BlogData;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/bimg")
public class bimg extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public bimg() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void service(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		Blogdao dao=new Blogdao();
	    ServletOutputStream ou=null;
		int id=Integer.parseInt(req.getParameter("id"));
		byte[] img=dao.getImage(id);
		ou=res.getOutputStream();
		ou.write(img);
		ou.close();
	}

}
