
<%@page import="java.util.List"%>
<%@page import="SA.FoodItem"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Tracker - Meals</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="FoodPage.css">
</head>
<body>
    <header>
        <div class="dropdownAvatar">
            <img src="avatar.png" alt="Avatar" class="avatar">
            <div class="avatarDropdown">
                <a href="Account.jsp">Profile</a>
                <a href="login.jsp">Log Out</a>
            </div>
        </div>
        <div class="title">
            <h1>Fitness Tracker</h1>
        </div>
    </header>

    <div class="container">
        <div class="header">
            <h1>Plan Meals</h1>
        </div>
        <div class="content">
            <div class="section" id="calorie-section">
                <h2>Calorie</h2>
               <div class="subsection">
                    <h3>Breakfast <button class="add-btn" onclick="window.location.href='SearchFood.jsp?mealType=breakfast'"></i> Add</button></h3>
                    <div id="breakfast-list" class="food-list">
                        <%-- Loop through breakfast items from the server-side --%>
                        <%
                            List<FoodItem> breakfastItems = (List<FoodItem>) request.getAttribute("breakfastItems");
                            if (breakfastItems != null) {
                                for (FoodItem item : breakfastItems) {
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i> <%= item.getName() %> - Calories: <%= item.getCalories() %>
                        </div>
                        <%
                                }
                            }
                        %>
                        <%-- Display selected foods for breakfast --%>
                        <%
                            String mealType = request.getParameter("mealType");
                            String selectedFoodsString = request.getParameter("selectedFoods");
                            if ("breakfast".equals(mealType) && selectedFoodsString != null && !selectedFoodsString.isEmpty()) {
                                String[] foods = selectedFoodsString.split(",");
                                for (String food : foods) {
                                    String[] foodDetails = food.split(":");
                                    String name = foodDetails[0];
                                    String calories = foodDetails[1];
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i> &nbsp; <%= name %> - Calories: <%= calories %>KCal
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="subsection">
                    
                    <h3>Lunch <button class="add-btn" onclick="window.location.href='SearchFood.jsp?mealType=lunch'"></i> Add</button></h3>
                    <div id="lunch-list" class="food-list">
                        <%-- Loop through lunch items from the server-side --%>
                        <%
                            List<FoodItem> lunchItems = (List<FoodItem>) request.getAttribute("lunchItems");
                            if (lunchItems != null) {
                                for (FoodItem item : lunchItems) {
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i> <%= item.getName() %> - Calories: <%= item.getCalories() %>KCal
                        </div>
                        <%
                                }
                            }
                        %>
                        <%-- Display selected foods for lunch --%>
                        <%
                            if ("lunch".equals(mealType) && selectedFoodsString != null && !selectedFoodsString.isEmpty()) {
                                String[] foods = selectedFoodsString.split(",");
                                for (String food : foods) {
                                    String[] foodDetails = food.split(":");
                                    String name = foodDetails[0];
                                    String calories = foodDetails[1];
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i> &nbsp; <%= name %> - Calories: <%= calories %>KCal
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
                <div class="subsection">
                    <h3>Dinner <button class="add-btn" onclick="window.location.href='SearchFood.jsp?mealType=dinner'"></i> Add</button></h3>
                    <div id="dinner-list" class="food-list">
                        <%-- Loop through dinner items from the server-side --%>
                        <%
                            List<FoodItem> dinnerItems = (List<FoodItem>) request.getAttribute("dinnerItems");
                            if (dinnerItems != null) {
                                for (FoodItem item : dinnerItems) {
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i> <%= item.getName() %> - Calories: <%= item.getCalories() %>
                        </div>
                        <%
                                }
                            }
                        %>
                        <%-- Display selected foods for dinner --%>
                        <%
                            if ("dinner".equals(mealType) && selectedFoodsString != null && !selectedFoodsString.isEmpty()) {
                                String[] foods = selectedFoodsString.split(",");
                                for (String food : foods) {
                                    String[] foodDetails = food.split(":");
                                    String name = foodDetails[0];
                                    String calories = foodDetails[1];
                        %>
                        <div class="item">
                            <i class="fas fa-utensils"></i>&nbsp; <%= name %> - Calories: <%= calories %>
                        </div>
                        <%
                                }
                            }
                        %>
                    </div>
                </div>
            </div>
        </div>
        <div class="footer-nav">
            <a href="homepage.html"><i class="fas fa-home"></i>Home</a>
            <a href="Myexercise.html"><i class="fas fa-dumbbell"></i>Exercise</a>
            <a href="FoodPage.jsp" class="active"><i class="fas fa-fire"></i>Calories</a>
            <a href="input.html"><i class="fas fa-running"></i>Run</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            flatpickr("#datePicker", {
                dateFormat: "D, d M",
                defaultDate: "today",
                onChange: function (selectedDates, dateStr, instance) {
                    console.log("Selected date: ", dateStr);
                }
            });
        });
    </script>
</body>
</html>
