<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f0f0f0;
        }
        .container {
            width: 300px;
            padding: 20px;
            background-color: #fff;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            text-align: center;
        }
        .container h2 {
            margin: 0 0 20px;
        }
        .container form {
            display: flex;
            flex-direction: column;
        }
        .container label {
            text-align: left;
            margin-bottom: 5px;
        }
        .container input[type="text"],
        .container input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
        }
        .container input[type="reset"],
        .container input[type="submit"] {
            width: 48%;
            padding: 10px;
            margin: 5px 0;
            border: none;
            border-radius: 5px;
            background-color: #007bff;
            color: white;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }
        .container input[type="reset"] {
            background-color: #6c757d;
        }
        .container input[type="reset"]:hover,
        .container input[type="submit"]:hover {
            background-color: #0056b3;
            transform: translateY(-2px);
        }
        .container input[type="reset"]:hover {
            background-color: #5a6268;
        }
        .container .register {
            margin-top: 15px;
        }
        .container .register a {
            color: #007bff;
            text-decoration: none;
        }
        .container .register a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: red;
            font-weight: bold;
        }
        
        .login-link {
            color: #0044cc;
            text-decoration: none;
            display: inline-block;
            font-weight: bold;
            text-align: center;
            width: 100%;
        }

        .login-link:hover {
            color: black;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Login</h2>
        <% String message = request.getParameter("message"); %>
        <% if (message != null) { %>
            <p class="error-message"><%= message %></p>
        <% } %>
        <form action="doLogin.jsp" method="POST">
            <label for="email">Email:</label>
            <input type="text" id="email" name="email" size="30" placeholder="Enter your email" required/>

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" size="30" placeholder="Enter your password" required/>

            <div class="button-container">
                <input type="reset" id="btnCancel" value="Cancel"/>
                <input type="submit" id="btnSubmit" value="Login"/>
            </div>

            <div class="register">
                <p>Are you new? <a href="register.jsp" class="login-link">Register now!</a></p>
            </div>
        </form>
    </div>
</body>
</html>
