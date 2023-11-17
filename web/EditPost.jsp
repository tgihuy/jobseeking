<%-- 
    Document   : updatehotel
    Created on : Jul 11, 2023, 8:43:33 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manage Post Page</title>
        
        <link rel="stylesheet" href="css/stylelist.css">
        <link rel="stylesheet" href="css/styleorder.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
        <style>
            input{
                padding: 15px;
                width: 100%;
                margin-left: 20px;
                border-radius: 20px;
                text-align: center;
                margin-bottom: 20px
            }
            td{
                margin-top: 20px;
            }
            
            input[type=submit] {
                margin-top: 50px;
                background-color: black;
                color: white
                
            }
            
            input[type=submit]:hover{
                cursor: pointer;
                background-color: #2f2f2f;
            }
            
            
            select {
                margin-left: 20px;
                margin-bottom: 20px
            }
        </style>
    </head>
    <body>
        <div class="navigation">
            <nav id="nav-bar">
                <div class="contain-logo">
                    <img id="logo" width="70px" height="70px" src="image/logo.png"/>
                    <p>Job Finder</p>
                </div>

                <ul class="nav-component">
                    <li><a href="home">Home</a></li>
                    <li onclick="history.back()"><a href="#">Back</a><li>
                </ul>
                <c:if test="${sessionScope.account != null}">
                    <div class="contain-user" style="width: 22%">
                        <a href="log"><i class='bx bx-log-out'></i>Log out</a>
                    </div>
                </c:if>

                <c:if test="${sessionScope.account == null}">
                    <div class="contain-user">
                        <a href="login.jsp"><i class='bx bx-log-in'></i>Login</a>
                        <a href="#"></i><i class='bx bxs-user'></i>Register</a>
                    </div>
                </c:if>
            </nav>
        </div>

        <div class="main-content" style="display: flex; justify-content: center; align-items: center">
            <form action="crud" method="get" style=" width: 70%; display: flex; justify-content: center; align-items: center">
                <table style="width: 90%">
                    <input type="hidden" name="type" value="post">
                    <input type="hidden" name="action" value="${requestScope.action}">
                    <input type="hidden" name="id" value="${post.id}">
                    <tr>
                        <td>Company: </td>
                        <td><input type="text" name="company" value="${company.name}"  required readonly> </td>
                    </tr>
                    <tr>
                        <td>Title: </td>
                        <td><input type="text" name="title" value="${post.title}"  required> </td>
                    </tr>
                    <tr>
                        <td>Content: </td>
                        <td><input type="text" name="content" value="${post.content}"  required > </td>
                    </tr>
                    <tr>
                        <td>Salary: </td>
                        <td><input type="text" name="salary" value="${post.salary}"  required > </td>
                    </tr>
<!--                    <tr>
                        <td>Status: </td>
                        <td><input type="text" name="status" value="${post.status}"  required readonly> </td>
                    </tr>-->
                    <tr>
                        <td colspan="2" style="text-align: center"><input type="submit" value="SUBMIT"> </td>
                    </tr>
                </table>
            </form>
        </div>
        <footer class="footer">
            <div class="footer__addr">
                <h1 class="footer__logo">
                    <img src="image/logo.png" width="70px" height="70px">
                    <p>Job Finder</p>

                </h1>

                <h2>Contact</h2>
                <address>
                    Name, Location
                    <br>
                </address>
            </div>

            <ul class="footer__nav">
                <li class="nav__item">
                    <h2 class="nav__title">Media</h2>

                    <ul class="nav__ul">
                        <li>
                            <a href="#">Online</a>
                        </li>

                        <li>
                            <a href="#">Print</a>
                        </li>

                        <li>
                            <a href="#">Alternative Ads</a>
                        </li>
                    </ul>
                </li>

                <li class="nav__item nav__item--extra">
                    <h2 class="nav__title">Technology</h2>

                    <ul class="nav__ul nav__ul--extra">
                        <li>
                            <a href="#">Hardware Design</a>
                        </li>

                        <li>
                            <a href="#">Software Design</a>
                        </li>

                        <li>
                            <a href="#">Digital Signage</a>
                        </li>

                        <li>
                            <a href="#">Automation</a>
                        </li>

                        <li>
                            <a href="#">Artificial Intelligence</a>
                        </li>

                        <li>
                            <a href="#">IoT</a>
                        </li>
                    </ul>
                </li>

                <li class="nav__item">
                    <h2 class="nav__title">Legal</h2>

                    <ul class="nav__ul">
                        <li>
                            <a href="#">Privacy Policy</a>
                        </li>

                        <li>
                            <a href="#">Terms of Use</a>
                        </li>

                        <li>
                            <a href="#">Sitemap</a>
                        </li>
                    </ul>
                </li>
            </ul>

            <div class="legal">
                <p >&copy; 2019 Something. All rights reserved.</p>
            </div>
        </footer>
    </body>
</html>
