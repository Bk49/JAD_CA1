<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logging In</title>
</head>
<body>
<%
String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

String link;
int id;
String role;
   try {
	   		
          // Step 2: Define Connection URL
          String connURL = "jdbc:mysql://localhost/jad?user=root&password=Devious1211&serverTimezone=UTC";

          // Step 3: Establish connection to URL
          Connection conn = DriverManager.getConnection(connURL); 
         // Step 4: Create Statement object
          Statement stmt = conn.createStatement();

                    // Step 5: Execute SQL Command
          String sqlStr = "SELECT * FROM user WHERE email=? AND pwd=?";
    
          ResultSet rs;
          
    		PreparedStatement pstmt = conn.prepareStatement(sqlStr);
    		pstmt.setString(1,email);
    		pstmt.setString(2,pwd);
    		rs = pstmt.executeQuery();
    		if(rs.next()){
    			id = rs.getInt("UserId");
    			role = rs.getString("role");
    			if(role.equals("M"))
    				response.sendRedirect("Home.jsp?id="+id);
    			else if(role.equals("A")){
    				response.sendRedirect("Administrator?id="+id);
    			}
    		}
    		else{
    			response.sendRedirect("Login.jsp?errorCode=invalidLogin");
    		}
    		
     } catch (Exception e) {
    	 response.sendRedirect("login.jsp?errorCode=invalidLogin");
     }
%>
</body>
</html>