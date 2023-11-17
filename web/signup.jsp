<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sign up Page</title>
        <link rel="stylesheet" href="css/stylehome.css" />
        <link rel="stylesheet" href="css/stylelogin.css">
        <style>
            .title-row input[type=text], .title-row input[type=password] {
                padding: 10px 20px;
                margin: 8px 0;
            }
            h3{
                margin-bottom: 20px;
                margin-top: 80px
            }
        </style>
    </head>
    <body>
        <div class="banner" style="background: url('image/banner.png')">
            <div class="title">
                <div class="title-row" style="background-color: rgb(46, 43, 43); border-radius: 20px; flex-direction: column; width: 50%; color: white;">
                    <h2>Sign up</h2>
                    <p>Already have account?</p>
                    <a href="login.jsp">Login</a>
                </div>
                <div class="title-row">
                    <form action="log" method="post">
                        <input type="hidden" name="type" value="signup">
                        <h3>Sign Up</h3>
                        <p style="color: black; margin-left: 20%">${message}</p>
                        <input type="text" name="displayName" placeholder="display name"><br>
                        <input type="text" name="user" placeholder="username"><br>
                        <input type="password" name="pass" placeholder="password"><br>
                        <input type="password" name="pass2" placeholder="re-type password"><br>
                        <input type="text" name="contact" placeholder="contact"><br>
                        <input type="text" name="mail" placeholder="mail"><br>
                        
                        <input type="submit" value="SIGN UP"/>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
