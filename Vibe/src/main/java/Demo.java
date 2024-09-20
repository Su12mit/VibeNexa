import java.util.ArrayList;
import java.util.List;
import java.sql.*;

public class Demo {
    public static void main(String[] args) {
    	try {
    		Connection con;
        	Statement stmt;

            Class.forName("com.mysql.cj.jdbc.Driver");

            con=DriverManager.getConnection("jdbc:mysql://localhost:3306/vibenexa","root","");
            
            stmt=con.createStatement();
            String str="SELECT friend.*, COUNT(user.user_id) AS user_count FROM friend INNER JOIN user ON friend.user_id = user.user_id WHERE user.user_id = 1";
            
            ResultSet rs=stmt.executeQuery(str);
            while (rs.next()) {
            	System.out.println(rs.getInt("user_count"));
			}
            
            
            
		} catch (Exception e) {}
    	
    }
}
