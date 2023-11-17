<%-- 
    Document   : booking
    Created on : Jul 8, 2023, 12:44:15 PM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Job Details Page</title>
        <link rel="stylesheet" href="css/stylebooking.css" />
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    </head>
    <body>
        <div class="navigation">
            <nav id="nav-bar">
                <div class="contain-logo">
                    <img id="logo" width="70px" height="70px" src="image/logo.png"/>
                    <p>Job Finder</p>
                </div>

                <ul class="nav-component" style="width: 30%;">
                    <li><a href="home">Home</a></li>
                    <li onclick="history.back()"><a href="#">Back</a><li>
                </ul>

                <c:if test="${sessionScope.account != null}">
                    <div class="contain-user">
                        <a href="profile"><i class='bx bx-history' ></i>Profile</a>
                        <a href="log"><i class='bx bx-log-out'></i>Log out</a>
                    </div>
                </c:if>

                <c:if test="${sessionScope.account == null}">
                    <div class="contain-user">
                        <a href="login.jsp"><i class='bx bx-log-in'></i>Login</a>
                        <a href="signup.jsp"></i><i class='bx bxs-user'></i>Register</a>
                    </div>
                </c:if>
            </nav>
        </div>


        <div class="main-content">
            <c:set value="${requestScope.post}" var="p"/>
            <c:set value="${requestScope.company}" var="c"/>
            <div class="contain-information">
                <img src="${c.img}" alt="">
                <div class="contain-detail">
                    <div class="hotel-detail">
                        <div class="row-hotel-detail">
                            <p style="font-weight: bold; font-size: 30px;">
                                <i class='bx bx-buildings'></i>
                                ${c.name}
                            </p>
                            <p>
                                <i class='bx bx-location-plus' ></i>
                                ${c.location}
                            </p>
                            <p>
                                <i class='bx bx-dollar-circle' ></i>
                                ${p.salary} $
                            </p>
                        </div>
                        <div style="clear: both;"></div>
                        <div class="row-hotel-detail">
                            <h2>Description</h2>
                            <p>
                                ${p.content}
                            </p>
                        </div>
                    </div>

                    <div class="owner-detail">
                        <div class="contain-owner">
                            <h2>Contact</h2>
                            <div class="owner-info">
                                <img src="${c.img}" alt="">
                                <div>
                                    <p>${c.contact}</p>
                                    <p>${c.mail}</p>
                                </div>
                                <div style="font-size: 25px;">
                                    <i class='bx bxs-message' ></i>
                                    <i class='bx bxs-phone' ></i>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <c:set value="${sessionScope.account}" var="u"/>
            <div class="contain-order">
                <form action="apply" method="post">
                    <table class="order-detail">
                        <input type="hidden" name="postId" value="${p.id}">
                        <input type="hidden" name="username" value="${u.username}" required>
                        <tr>
                            <td style="text-align: center; font-weight: bold; font-size: 20px; padding-top: 50px;">
                                Apply
                            </td>
                        </tr>
                        
                        <tr style="height: 35px;">
                            <td class="info">Your experience:</td>
                        </tr>
                        
                        <tr>
                            <td class="info">
                                <input type="text" name="experience" value="" placeholder="tell us about your experience" required>
                            </td>
                        </tr>
                        
                        <tr style="height: 35px;">
                            <td class="info">Detail:</td>
                        </tr>
                        
                        <tr>
                            <td class="info">
                                <input type="text" name="detail" value="" placeholder="tell us something about you" required>
                            </td>
                        </tr>
                        
                        <tr></tr>
                        
                        <tr>
                            <td style="text-align: center;">
                                <c:choose>
                                    <c:when test="${sessionScope.account == null}">
                                        You have to login to apply!
                                    </c:when>
                                    <c:when test="${sessionScope.account != null}">
                                        <input type="submit" value="APPLY">
                                    </c:when>
                                </c:choose>
                            </td>
                        </tr>
                    </table>
                </form>
            </div>

        </div>



        <footer class="footer" style="margin-top: 100px;">
            <div class="footer__addr">
                <h1 class="footer__logo">
                    <img src="image/logo.png" width="70px" height="70px">
                    <p>Job Finder</p>

                </h1>

                <h2>Contact</h2>
                <address>
                    Phuc, SE1734, FPT University, HoLa, Ha Noi
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


        <script>
            
        </script>
    </body>
</html>

