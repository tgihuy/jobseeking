<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>All Apply</title>
        <link rel="stylesheet" href="css/stylelist.css">
        <link rel="stylesheet" href="css/styleorder.css">
        <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
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
                    <div class="contain-user">
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
            <hr style="width: 90%; margin: 10px auto;">
        </div>




        <div class="main-content">

            <div class="contain-hotel">
                <h3 style="border-bottom: 2px solid black; padding: 15px 15px; font-size: 25px;">
                    <label>All Apply</label>
                </h3>
                <div id="list-hotel">
                    <div id="empty" style="width: 100%; height: 200px; display: flex; flex-direction: column; justify-content: center; align-items: center; display: none">
                        <p style="height: 20%; font-size: 50px; color: #D9D9D9; text-align: center; padding-top: 70px">No Apply</p>
                    </div>
                    <c:forEach items="${requestScope.listApply}" var="a">
                        <li href="#" class="hotel" style="padding: 0">
                            <img src="${a.companyImg}" alt="">
                            <label style="font-size: 18px; font-weight: bold; margin-top: 20px;">${a.title}</label>
                            <label style="font-size: 13px; color: #545454; align-items: center;">
                                <i class='bx bx-location-plus' ></i>
                                ${a.location}
                            </label>
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-dollar-circle'></i>
                                ${a.salary} $
                            </label>
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-door-open' ></i>
                                ${a.companyName}
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 20px; align-items: center; margin-top: 50px; font-weight: bold;"> 
                                Applicant
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-user'></i>
                                ${a.owner}
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                ${a.contact}
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                ${a.mail}
                            </label>

                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                ${a.detail}
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 20px; align-items: center; color: ${a.getColor()}; margin-left: 50px;"> 
                                ${a.status}
                            </label>

                            <label id="delete" style="width: 100%; text-align: center; margin-top: 10px; font-size: 30px; color: red;">
                                <i onclick="updateApply(${a.id},'Approved', ${requestScope.companyId})" class='bx bx-check-square'></i>
                                <i onclick="updateApply(${a.id},'Rejected', ${requestScope.companyId})" class='bx bx-x-circle'></i>
                            </label>
                        </li>
                    </c:forEach>

                </div>
                <div style="clear: both"></div>
                <div style="width: 100%">
                    <ul class="paging" style="text-align: center">
                        <c:forEach begin="1" end="${Math.ceil(requestScope.listApply.size()/9)}" var="i">
                            <li onclick="changePage(this.innerHTML, true)" class="page" value="${i}">${i}</li>
                            </c:forEach>
                    </ul>
                </div>
            </div>
        </div>






        <footer class="footer">
            <div class="footer__addr">
                <h1 class="footer__logo">
                    <img src="image/logo.png" width="70px" height="70px">
                    <p>Job Finder</p>

                </h1>

                <h2>Contact</h2>
                <address>
                    Name, Location, FPT University, HoLa, Ha Noi
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
            function updateApply(id,status, cid) {
                console.log(cid);
                if(confirm("Are you sure?"))
                    window.location.href = 'crud?action=update&type=apply&id=' + id +'&status=' + status + '&companyId='+cid ;
            }
        </script>
    </body>
</html>
