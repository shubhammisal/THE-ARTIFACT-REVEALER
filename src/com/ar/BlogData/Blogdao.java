package com.ar.BlogData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ar.GetCon.DbConnection;

public class Blogdao {
	private String get="select bid,bname,bby,bdate,bcategory,bdesc from blog";
	private String geti="select bimg from blog where bid=?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		 public List<Blogdto> getData() {
			 Blogdto Image;
			 List<Blogdto> Imagelist=new ArrayList<Blogdto>();
			 try {
				 con=DbConnection.getConnection();
				 ps=con.prepareStatement(get);
				 rs=ps.executeQuery();
				 while(rs.next())
				 {
					 Image =new Blogdto();
					 Image.setBid(rs.getInt(1));
					 Image.setBname(rs.getString(2));
					 Image.setBby(rs.getString(3));
					 Image.setBdate(rs.getDate(4));
					 Image.setBcat(rs.getString(5));
					 Image.setBdesc(rs.getString(6));
					 Imagelist.add(Image);
				 }
		 }catch(Exception e) {
			 System.out.println(e);
		 }
			 finally {
				    try { rs.close(); } catch (Exception e) { /* ignored */ }
				    try { ps.close(); } catch (Exception e) { /* ignored */ }
				    try { con.close(); } catch (Exception e) { /* ignored */ }
				}
			 return Imagelist;
		}
		 
	 public byte[] getImage (int id) {
		byte[] imag=null;
	      try{con=DbConnection.getConnection();
		    ps=con.prepareStatement(geti);
				 ps.setInt(1,id);
				 rs=ps.executeQuery();
				 if(rs.next()) {
					imag=rs.getBytes(1);
				 }
			  }catch(Exception e)
			  {
				  System.out.println(e);
			  }
	      finally {
	    	    try { rs.close(); } catch (Exception e) { /* ignored */ }
	    	    try { ps.close(); } catch (Exception e) { /* ignored */ }
	    	    try { con.close(); } catch (Exception e) { /* ignored */ }
	    	}
			  return imag;
		  }
}
