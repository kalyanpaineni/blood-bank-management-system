<%@page import ="java.sql.*" %>
<%@page import ="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory JSP</title>
</head>
<link rel="stylesheet" type="text/css" href="mystyle.css">
<body>
<center>
<%
String bgid = request.getParameter("bgid");
String bgname = request.getParameter("bgname");
float bgquantity = Float.valueOf(request.getParameter("bgquantity"));
try{
    Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bms","root","");
  //NOTE --> IN THE URL "bloodbank" IS THE NAME OF THE DATABASE. REPLACE THE  WORD "bloodbank" WITH THE DATABASE NAME TO CONNECT TO YOUR DATABASE.
    String sql="insert into inventory(id,bgname,quantity)values(?,?,?)";
    PreparedStatement preparestatement=con.prepareStatement(sql);
    preparestatement.setString(1,bgid);
    preparestatement.setString(2,bgname);
    preparestatement.setString(3,String.valueOf(bgquantity));
    preparestatement.execute();
	}
catch(SQLException e)
{
out.println("error in loading data");
out.println(e);
}
%>
<p>Inventory</p>
<table border="1">
<tr>
<td>Blood Group ID</td>
<td>Blood Group</td>
<td>Quantity</td>
</tr>
<%
try{
	Class.forName("com.mysql.jdbc.Driver").newInstance();
    java.sql.Connection connect = DriverManager.getConnection("jdbc:mysql://localhost:3306/bms","root","");
    Statement fetchdata = connect.createStatement();
    String sqlquery = "select * from inventory";
    ResultSet displaydata = fetchdata.executeQuery(sqlquery);
    while(displaydata.next())
    {%>
    <tr>
    <td><%=displaydata.getString("id") %></td>
    <td><%=displaydata.getString("bgname") %></td>
    <td><%=displaydata.getString("quantity") %></td>
    </tr>
    <%
    }
}catch(Exception e)
{
	out.println(e);
}
%>
</table>
<a href="menu.html">Go Back To Menu</a>
</center>
</body>
</html>