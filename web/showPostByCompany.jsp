<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Home</title>
        <link rel="stylesheet" href="./css/stylelist.css" />
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
                    
                    <li style="margin-left: 50px">
                        <input style="padding:10px 20px; border-radius: 10px" type="text" name="search" value="${requestScope.search}" id='search' oninput="searchName()">
                    </li>
                    <li>Search</li>
                </ul>

                <c:if test="${sessionScope.account != null}">
                    <div class="contain-user">
                        <a href="profile"><i class='bx bx-user' ></i>Profile</a>
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
            <div class="contain-hotel" style="width: 100%; margin: 0 auto;">
                <h3 style="border-bottom: 2px solid black; padding: 5px 15px; font-size: 25px;">
                    Jobs
                </h3>
                <div id="list-hotel">
                    <div id="empty" style="width: 100%; height: 200px; display: flex; flex-direction: column; justify-content: center; align-items: center; display: none">
                        <p style="height: 20%; font-size: 50px; color: #D9D9D9; text-align: center; padding-top: 70px">No job available</p>
                    </div>
                    <c:set var="c" value="${company}"></c:set>
                    <c:forEach items="${listPost}" var="p">
                        <a href="apply?postId=${p.id}" class="hotel" style="padding: 0; width: 21%">
                            <img src="${c.img}" alt="">
                            <label style="font-size: 18px; font-weight: bold; margin-top: 20px;">${p.title}</label>
                            <label style="font-size: 14px; margin-top: 30px;">${mapCompany.get(p.companyId).name}</label>
                            <label style="font-size: 13px; color: #545454; align-items: center; margin-top: 10px;">
                                <i class='bx bx-location-plus' ></i>
                                ${c.location}
                            </label>
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center; margin-bottom: 20px; "> 
                                <i style="margin-right: 6px;" class='bx bx-dollar-circle'></i>
                                ${p.salary} $
                            </label>
                        </a>
                    </c:forEach>
                </div>
                <div style="clear: both"></div>
                <div style="width: 100%">
                    <ul class="paging" style="text-align: center">
                        <c:forEach begin="1" end="${Math.ceil(listPost.size()/8)}" var="i">
                            <li onclick="changePage(this.innerHTML, true)" class="page" value="${i}">${i}</li>
                            </c:forEach>
                    </ul>
                </div>
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

            function changePage(p, bool) {
                let count = 0;
                //get all li tag contain product information
                var list = document.getElementsByClassName('hotel');
                var name = document.getElementById('search');
                //loop used to access all li tag in list
                for (var i = 0; i < list.length; i++) {
                    if (name.value.length !== 0) {
                        if (list[i].children[1].innerHTML.toLowerCase().includes(name.value.toLowerCase())) {
                            count++;
                            if (count < 8 * p && count >= (p - 1) * 8) {
                                list[i].style.display = 'block';
                            } else {

                                list[i].style.display = 'none';
                            }

                        } else {
                            list[i].style.display = 'none';
                        }
                    }
                    //check valid display product with size of page
                    else if (i < p * 8 && i >= (p - 1) * 8)
                        list[i].style.display = 'block';
                    else {
                        list[i].style.display = 'none';
                    }
                }
                const x = window.innerWidth / 15;
                const y = window.innerHeight / 1.3;

                if (bool) {
                    //scroll screen to filter
                    window.scrollTo({
                        top: x,
                        left: y,
                        behavior: "smooth"
                    });
                }

            }

            function searchName() {
                let count = 0;
                let count2 = 0;
                let check2 = true;
                let check = true;
                let listHotel2 = document.getElementsByClassName('hotel2');
                let listHotel = document.getElementsByClassName('hotel');
                let namePart = document.getElementById('search');

                if (namePart.value.length === 0) {
                    changePage2(1, true);
                    changePage(1, true);
                    
                }

                for (var i = 0; i < listHotel.length; i++) {
                    if (listHotel[i].children[1].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())) {
                        //console.log(listHotel[i].children[1].innerHTML.toLowerCase() + ' - ' + namePart.value.toLowerCase());
                        if (count < 8) {
                            listHotel[i].style.display = 'block';
                        } else {
                            listHotel[i].style.display = 'none';
                        }
                        count++;
                        check = false;
                    } else {
                        listHotel[i].style.display = 'none';
                    }
                }
                
                for (var i = 0; i < listHotel2.length; i++) {
                    if (listHotel2[i].children[1].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())) {
                        if (count2 < 8) {
                            listHotel2[i].style.display = 'block';
                        } else {
                            listHotel2[i].style.display = 'none';
                        }
                        count2++;
                        check2 = false;
                    } else {
                        listHotel2[i].style.display = 'none';
                    }
                }
                //check empty data after filer by name
                if (check) {
                    var c = document.getElementById('empty');
                    c.style.display = 'block';

                } else {
                    var c = document.getElementById('empty');

                    c.style.display = 'none';

                }

                if (check2) {
                    var c2 = document.getElementById('empty2');
                    c2.style.display = 'block';
                } else {
                    var c2 = document.getElementById('empty2');
                    c2.style.display = 'none';
                }

                //get list page
                var paging = document.getElementsByClassName('page');
                for (var i = 0; i < paging.length; i++) {
                    if (paging[i].value > Math.ceil(count / 8)) {
                        paging[i].style.display = 'none';
                    } else {
                        paging[i].style.display = 'list-item';
                    }
                }

                //get list page
                var paging2 = document.getElementsByClassName('page2');
                for (var i = 0; i < paging2.length; i++) {
                    if (paging2[i].value > Math.ceil(count2 / 8)) {
                        paging2[i].style.display = 'none';
                    } else {
                        paging2[i].style.display = 'list-item';
                    }
                }
            }
            function changePage2(p, bool) {
                let count = 0;
                //get all li tag contain product information
                var list = document.getElementsByClassName('hotel2');
                var name = document.getElementById('search');
                //loop used to access all li tag in list
                for (var i = 0; i < list.length; i++) {
                    if (name.value.length !== 0) {
                        if (list[i].children[1].innerHTML.toLowerCase().includes(name.value.toLowerCase())) {
                            count++;
                            if (count < 8 * p && count >= (p - 1) * 8) {
                                list[i].style.display = 'block';
                            } else {

                                list[i].style.display = 'none';
                            }

                        } else {

                            list[i].style.display = 'none';
                        }
                    }
                    //check valid display product with size of page
                    else if (i < p * 8 && i >= (p - 1) * 8)
                        list[i].style.display = 'block';
                    else {
                        list[i].style.display = 'none';
                    }
                }
                const x = window.innerWidth / 1.5;
                const y = window.innerHeight / 1.3;

                if (bool) {
                    //scroll screen to filter
                    window.scrollTo({
                        top: x,
                        left: y,
                        behavior: "smooth"
                    });
                }

            }
            document.onload = searchName();
        </script>
    </body>
</html>
