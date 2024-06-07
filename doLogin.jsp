<%-- 
    Document   : doLogin
    Created on : 30 May 2024, 2:39:26 PM
    Author     : Acer
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page language="java" %>
<%@page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Login</title>
</head>
<body>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    String jdbcURL = "jdbc:mysql://localhost:3306/fitnessTracker";
    String jdbcUsername = "root";
    String jdbcPassword = "admin";

    Connection connection = null;
    PreparedStatement statement = null;
    ResultSet resultSet = null;

    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

        String sql = "SELECT * FROM users WHERE email = ? AND password = ?";
        statement = connection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        resultSet = statement.executeQuery();

        if (resultSet.next()) {
            String name = resultSet.getString("name");
            // Set the user's name in the session
            session.setAttribute("name", name);
            session.setAttribute("email", email);
            // Redirect to Account.jsp

            response.sendRedirect("homepage.html?email=" + email + "&name=" + name);
        } else {
            response.sendRedirect("login.jsp?message=Invalid username or password..!");
        }
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    } catch (SQLException e) {
        e.printStackTrace();
        out.println("<p>An error occurred: " + e.getMessage() + "</p>");
    } finally {
        try {
            if (resultSet != null) resultSet.close();
            if (statement != null) statement.close();
            if (connection != null) connection.close();
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>An error occurred while closing resources: " + e.getMessage() + "</p>");
        }
    }
%>
</body>
</html>

