

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

/**
 * Servlet implementation class AccessDB
 */
@SuppressWarnings("unused")
public class AccessDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AccessDB() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html");
		PrintWriter out=response.getWriter();
		
		int myid=(int) request.getAttribute("id");
	
		try {
			
			Connection con;
			Statement stmt,stmt1;

            Class.forName("com.mysql.cj.jdbc.Driver");

            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vibenexa","root","");
            
            stmt=con.createStatement();
            stmt1=con.createStatement();
            int i=1;
            String relPath,relPath1;
            
            int post_id;
            List<ArrayList<String>> post = new ArrayList<>();
            //ResultSet rs=stmt.executeQuery("SELECT * FROM profile inner join user on profile.user_id=user.user_id WHERE user.user_id="+myid);
            
            ResultSet rs1=stmt1.executeQuery("SELECT * FROM photopost INNER JOIN post ON photopost.post_id = post.post_id INNER JOIN user ON post.user_id = user.user_id INNER JOIN user_profile ON user.user_id = user_profile.user_id");
            ArrayList<String> img = new ArrayList<String>();
            ArrayList<String> profile = new ArrayList<String>();
            ArrayList<String> names = new ArrayList<String>();
            ArrayList<String> caps=new ArrayList<String>();
            while(rs1.next())
            {
            	Blob prof=rs1.getBlob("profile_pic");
            	byte byteArray1[] = prof.getBytes(1,(int)prof.length());
            	String path1="G:/eclipse/Vibe/src/main/webapp/profile/"+i+".jpg";
            	FileOutputStream fs1 = new FileOutputStream(path1);
            	fs1.write(byteArray1);
            	relPath1="profile/"+i+".jpg";
            	//out.println("<html><body><a href='"+relPath+"'>abc</a><br><img src="+relPath+" width='28rem'><br></body></html>");
            	profile.add(relPath1);
            	fs1.close();
            	
            		String nm=rs1.getString("name");
            		String sname=rs1.getString("surname");
            		String name=nm+" "+sname;
            		names.add(name);
            		
            		
            		Blob image=rs1.getBlob(3);
                	byte byteArray[] = image.getBytes(1,(int)image.length());
                	String path="G:/eclipse/Vibe/src/main/webapp/img/"+i+".jpg";
                	FileOutputStream fs = new FileOutputStream(path);
                	fs.write(byteArray);
                	relPath="img/"+i+".jpg";
                	//out.println("<html><body><a href='"+relPath+"'>abc</a><br><img src="+relPath+" width='28rem'><br></body></html>");
                	img.add(relPath);
                	fs.close();
                	
                	
                	String cap=rs1.getString("caption");
                	caps.add(cap);
                	
                	
                	i++;
            	
            }
            
            post.add(img);
            post.add(names);
            post.add(caps);
            post.add(profile);
            //out.println("<b>"+arr+"</b>");
            //request.setAttribute("arr", arr);
            //request.setAttribute("names", names);
//            for(ArrayList obj:post){
//
//                ArrayList<String> temp = obj;
//
//                for(String job : temp){
//                    out.println("<b>"+job+"</b>");
//                }
//                out.println("<br>");
//            }
//            out.print("<b>"+post.get(1).get(1)+"<br><br><br>");
//            for (int j = 0; j < post.size(); j++) {
//            	for (int j2 = 0; j2 < post.size(); j2++) {
//					out.println("<b>"+post.get(j).get(j2)+"</b>");
//				}
//            	out.println("<br>");
//			}
            
            request.setAttribute("post", post);
        	RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
            rd.include(request, response);
		}catch(Exception e) {out.println(e);}
		
		
	}


}
