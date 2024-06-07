<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Fitness Tracker - Search Food Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
    <link rel="stylesheet" href="SearchFood.css">
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
            <div class="close-btn" onclick="goToFoodPage()"><i class="fas fa-times"></i></div>
            <h1>Meals</h1>
        </div>
        <div class="content">
            <form id="foodForm">
                <input type="text" id="foodQuery" name="foodQuery" placeholder="Enter a food item">
                <button type="button" onclick="getFoodCalories()">Add Food</button>
            </form>
            <ul id="foodList"></ul>
            <button class="add-to-meals" onclick="addToMeals()">Add to Meals</button>
        </div>
    </div>
    
    <div class="footer-nav">
            <a href="homepage.html"><i class="fas fa-home"></i>Home</a>
            <a href="Myexercise.html"><i class="fas fa-dumbbell"></i>Exercise</a>
            <a href="FoodPage.jsp" class="active"><i class="fas fa-fire"></i>Calories</a>
            <a href="input.html"><i class="fas fa-running"></i>Run</a>
        </div>

    <script>
        
        var foods = [];

        function getFoodCalories() {
            var foodInput = document.getElementById('foodQuery').value;
            if (foodInput.trim() !== '') {
                fetchCalories(foodInput);
            }
        }

        function fetchCalories(foodInput) {
            var apiUrl = "https://api.calorieninjas.com/v1/nutrition?query=" + encodeURIComponent(foodInput);

            fetch(apiUrl, {
                headers: {
                    'X-Api-Key': 'vwvH02mBXIx0iwFIfIUA5Q==lpKkmxbRflAsMBfX'
                }
            })
            .then(response => response.json())
            .then(data => {
                var foodItem = {
                    name: capitalize(foodInput),
                    calories: data?.items[0]?.calories || 'Calories not found'
                };
                foods.push(foodItem);
                renderFoodList();
            })
            .catch(error => {
                console.error('Error fetching data:', error);
                alert('Error fetching calories. Please try again later.');
            });
        }

        function capitalize(input) {
            return input.charAt(0).toUpperCase() + input.slice(1).toLowerCase();
        }

        function renderFoodList() {
            var foodListContainer = document.getElementById('foodList');
            foodListContainer.innerHTML = '';
            foods.forEach(function (food, index) {
                var listItem = document.createElement('li');
                listItem.textContent = (index + 1) + '. ' + food.name + ' - Calories: ' + food.calories+ 'KCal';

                var deleteButton = document.createElement('i');
                deleteButton.className = 'fas fa-times delete-icon';
                deleteButton.onclick = function() {
                    deleteFood(index);
                };
                listItem.appendChild(deleteButton);
                foodListContainer.appendChild(listItem);
            });
        }

        function deleteFood(index) {
            foods.splice(index, 1);
            renderFoodList();
        }

        function addToMeals() {
            if (foods.length > 0) {
                var selectedFoodsString = foods.map(function (food) {
                    return food.name + ':' + food.calories;
                }).join(',');
                var mealType = getUrlParameter('mealType');
                window.location.href = 'FoodPage.jsp?mealType=' + mealType + '&selectedFoods=' + encodeURIComponent(selectedFoodsString);
            } else {
                alert('Please add at least one food before adding to meals.');
            }
        }

        function goToFoodPage() {
            window.location.href = 'FoodPage.jsp';
        }

        // Function to get URL parameters
        function getUrlParameter(name) {
            name = name.replace(/[\[]/, '\\[').replace(/[\]]/, '\\]');
            var regex = new RegExp('[\\?&]' + name + '=([^&#]*)');
            var results = regex.exec(location.search);
            return results === null ? '' : decodeURIComponent(results[1].replace(/\+/g, ' '));
        }
    </script>
</body>
</html>
