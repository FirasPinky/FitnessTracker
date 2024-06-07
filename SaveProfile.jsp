<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    // Get the form parameters
    String weight = request.getParameter("weight");
    String height = request.getParameter("height");
    String bmi = request.getParameter("bmi");
    String goals = request.getParameter("goals");

    // Save them to session
    if (weight != null && !weight.isEmpty()) {
        session.setAttribute("weight", weight);
    }
    if (height != null && !height.isEmpty()) {
        session.setAttribute("height", height);
    }
    if (bmi != null && !bmi.isEmpty()) {
        session.setAttribute("bmi", bmi);
    }
    if (goals != null && !goals.isEmpty()) {
        session.setAttribute("goals", goals);
    }

    // Redirect back to the profile page
    response.sendRedirect("Account.jsp?message=success");
%>
