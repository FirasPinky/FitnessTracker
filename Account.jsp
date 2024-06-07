<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Profile</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
        <style>
            body {
                font-family: "Garamond", Raleway, sans-serif;
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                background-color: #f3f4f6;
                color: #333;
                display: flex;
                justify-content: center;
                align-items: center;
                height: 100vh;
            }
            .container {
                width: 100%;
                max-width: 480px;
                margin: 20px;
                background-color: #fff;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                border-radius: 8px;
                padding: 20px;
                position: relative;
                text-align: center;
            }
            .back-button {
                position: absolute;
                top: 20px;
                left: 20px;
                padding: 10px 20px;
                background-color: #ea9555c0;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
            }
            .back-button:hover {
                background-color: #ffcc99;
            }
            .profile-icon {
                font-size: 100px;
                color: #ea9555c0;
                margin-top: 50px;
                margin-bottom: 10px;
            }
            .profile-name {
                font-size: 24px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .profile-info {
                display: flex;
                flex-direction: column;
                align-items: center;
            }
            .profile-info label {
                width: 80%;
                text-align: left;
                margin-bottom: 5px;
                font-weight: bold;
            }
            .profile-info input {
                width: 80%;
                padding: 10px;
                margin-bottom: 15px;
                border: 1px solid #ddd;
                border-radius: 5px;
                font-size: 16px;
                box-sizing: border-box;
            }
            .button-group {
                display: flex;
                justify-content: space-around;
                margin-top: 20px;
            }
            .button-group a, .button-group button {
                display: inline-block;
                padding: 10px 20px;
                background-color: #ea9555c0;
                color: #fff;
                text-decoration: none;
                border-radius: 5px;
                transition: background-color 0.3s;
                border: none;
                cursor: pointer;
            }
            .button-group a:hover, .button-group button:hover {
                background-color: #ffcc99;
            }
            @media (min-width: 768px) {
                .container {
                    max-width: 720px;
                    margin: 20px auto;
                }
                .profile-info label, .profile-info input {
                    width: 60%;
                }
            }
            @media (min-width: 1024px) {
                .container {
                    max-width: 960px;
                    margin: 20px auto;
                }
            }
            @media (min-width: 1200px) {
                .container {
                    max-width: 1140px;
                    margin: 20px auto;
                }
            }
            .popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                padding: 20px;
                background-color: #fff;
                border: 2px solid #ea9555c0;
                border-radius: 8px;
                box-shadow: 0 2px 8px rgba(0, 0, 0, 0.2);
                z-index: 1000;
            }
            .popup.show {
                display: block;
            }
            .popup button {
                margin-top: 20px;
                padding: 10px 20px;
                background-color: #ea9555c0;
                color: #fff;
                border: none;
                border-radius: 5px;
                cursor: pointer;
            }
            .popup button:hover {
                background-color: #e8f0fe;
            }
        </style>
    </head>
    <body>
        <div class="container">
            <a href="homepage.html" class="back-button">Go Back</a>
            <div class="profile-icon"><i class="fas fa-user-circle"></i></div>
            <div class="profile-name">
                <%= session.getAttribute("name") %>
            </div>
            <form id="profileForm" action="SaveProfile.jsp" method="post">
                <div class="profile-info">
                    <label for="weight">Weight:</label>
                    <input type="text" id="weight" name="weight" value="<%= session.getAttribute("weight") != null ? session.getAttribute("weight") : ""%>">

                    <label for="height">Height:</label>
                    <input type="text" id="height" name="height" value="<%= session.getAttribute("height") != null ? session.getAttribute("height") : ""%>">

                    <label for="bmi">BMI:</label>
                    <input type="text" id="bmi" name="bmi" value="<%= session.getAttribute("bmi") != null ? session.getAttribute("bmi") : ""%>">

                    <label for="goals">Goals Weight:</label>
                    <input type="text" id="goals" name="goals" value="<%= session.getAttribute("goals") != null ? session.getAttribute("goals") : ""%>">
                </div>
                <div class="button-group">
                    <a href="#">Contact Us</a>
                    <button type="submit">Save</button>
                    <a href="Logout.jsp">Log Out</a>
                </div>
            </form>
        </div>

        <div class="popup" id="popupMessage">
            <p>Your data has been saved and updated.</p>
            <button onclick="closePopup()">OK</button>
        </div>

        <script>
            // Check if the save message should be displayed
            const urlParams = new URLSearchParams(window.location.search);
            if (urlParams.get('message') === 'success') {
                showPopup();
            }

            function showPopup() {
                document.getElementById('popupMessage').classList.add('show');
            }

            function closePopup() {
                document.getElementById('popupMessage').classList.remove('show');
                // Remove the message parameter from the URL
                window.history.replaceState(null, null, window.location.pathname);
            }
        </script>
    </body>
</html>
