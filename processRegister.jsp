<%-- 
    Document   : processRegister
    Created on : 30 May 2024, 1:00:53 PM
    Author     : Acer
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="tracker.user" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Registration Fitness Tracker</title>
    <style>
        p {
            color: blue;
        }
    </style>
    <script type="text/javascript">
        function showSuccessMessageAndRedirect() {
            alert("Record saved successfully !");
            window.location.href = "login.jsp";  // Change this to the actual login page URL if different
        }
    </script>
</head>
<body>
    <h1>Registration</h1>

    <jsp:useBean id="myUser" class="tracker.user" scope="request"/>
    <jsp:setProperty name="myUser" property="*"/>

    <%
        String jdbcURL = "jdbc:mysql://localhost:3306/fitnesstracker";
        String jdbcUsername = "root";
        String jdbcPassword = "admin";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);

            String sql = "INSERT INTO users (name, email, phone_number, password) VALUES (?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);

            statement.setString(1, myUser.getName());
            statement.setString(2, myUser.getEmail());
            statement.setString(3, myUser.getPhoneNo());
            statement.setString(4, myUser.getPassword());

            int result = statement.executeUpdate();
            if (result > 0) {
                out.println("<script type='text/javascript'>showSuccessMessageAndRedirect();</script>");
            } else {
                out.println("<p>Failed to add the record.</p>");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println("<p>An error occurred: " + e.getMessage() + "</p>");
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("<p>An error occurred: " + e.getMessage() + "</p>");
        } finally {
            try {
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
