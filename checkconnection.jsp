<%@ page import="java.sql.*" %>    
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Check connection page</title>
</head>
<body>
<%
Connection conn = null;
try{
	String url = "jdbc:mysql://127.0.0.1/bms";
	//NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
	String username = "root";
	String password = "";
	Class.forName("com.mysql.cj.jdbc.Driver");
	conn = DriverManager.getConnection(url,username,password);
	if(conn!=null)
	{
		out.print("Connected to Database");
	}
}catch(ClassNotFoundException e)
	{
		out.print("Not connected: "+e);
	}
%>

</body>
</html>