<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login Page</title>
        <link rel="stylesheet" href="css/stylehome.css" />
        <link rel="stylesheet" href="css/stylelogin.css">
    </head>
    <body>
        <div class="banner" style="background: url('image/banner.png')">
            <div class="title">
                <div class="title-row" style="background-color: rgb(46, 43, 43); border-radius: 20px; flex-direction: column; width: 50%; color: white;">
                    <h2>First time here?</h2>
                    <p>Feel free to join with us</p>
                    <a href="signup.jsp"> Sign up</a>
                </div>
                <div class="title-row">
                    <form action="log" method="post">
                        <h3>Login</h3>
                        <input type="hidden" name="type" value="login">
                        <p style="margin-left: 20%; color: black">${message}</p>
                        <input type="text" name="user" placeholder="username"><br>
                        <input type="password" name="pass" placeholder="password"><br>
                        
                        <input type="submit" value="SIGN IN"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
