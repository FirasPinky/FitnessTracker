<%-- 
    Document   : register
    Created on : 30 May 2024, 12:58:44 PM
    Author     : Acer
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>User Registration</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-color: #f2f2f2;
        }
        .container {
            background-color: white;
            border: 1px solid #ccc;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 90%;
            max-width: 400px;
            text-align: center;
        }
        .container h1 {
            margin-bottom: 20px;
        }
        .container label {
            display: block;
            margin: 10px 0 5px;
            text-align: left;
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
        .container a {
            display: block;
            margin-top: 10px;
            color: #000;
            text-decoration: none;
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

        /* Media Queries for Responsive Design */
        @media (max-width: 600px) {
            .container {
                width: 100%;
                margin: 20px;
            }
            .container .buttons {
                flex-direction: column;
            }
            .container .buttons input {
                width: 100%;
                margin-bottom: 10px;
            }
            .container .buttons input:last-child {
                margin-bottom: 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        
        <form action="processRegister.jsp" method="POST">
            <label>Name:</label>
            <input name="name" type="text" placeholder="Enter your name">
            
            <label>Email:</label>
            <input name="email" type="text" placeholder="Enter your email">
            
            <label>Phone number:</label>
            <input name="phoneNo" type="text" placeholder="Enter phone number">
            
            <label>Password:</label>
            <input type="password" name="password" placeholder="Enter your password">
            
            <div class="buttons">
                <input type="reset" id="btnCancel" value="Cancel">
                <input type="submit" id="btnSubmit" value="Confirm">
            </div>
        </form>
        
        <a href="login.jsp" class="login-link">Already have an account? Login here.</a>
    </div>
</body>
</html>

