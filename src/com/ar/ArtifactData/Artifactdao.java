package com.ar.ArtifactData;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.ar.GetCon.DbConnection;

public class Artifactdao {
     private String get="select arno,arname,arcat,arby,ardesc from artifact";
	private String geti="select arimg from artifact where arno=?";
		Connection con=null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		
		public List<Artifactdto> getData() {
			Artifactdto Image;
			 List<Artifactdto> Imagelist=new ArrayList<Artifactdto>();
			 try {
				 con=DbConnection.getConnection();
				 ps=con.prepareStatement(get);
				 rs=ps.executeQuery();
				 while(rs.next())
				 {
					 Image =new Artifactdto();
					 Image.setAno(rs.getInt(1));
					 Image.setArname(rs.getNString(2));
					 Image.setArcat(rs.getNString(3));
					 Image.setArby(rs.getNString(4));
					 Image.setArdesc(rs.getNString(5));
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
