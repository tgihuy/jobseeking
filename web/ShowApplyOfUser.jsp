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
        <style>
            .button:hover {
                cursor: pointer
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

                <ul class="nav-component" style="width: 30%;">
                    <li><a href="home">Home</a></li>
                    <li><a href="addPost">Add new post</a></li>
                    <li onclick="history.back()"><a href="#">Back</a><li>
                </ul>
                
                <div style="width: 200px"></div>
                
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
                    <label>Your Post</label>
                    <label style="font-weight: lighter;"><input id="search" type="text" oninput="searchName()">Search</label>
                </h3>
                <div id="list-hotel">
                    <div id="empty" style="width: 100%; height: 200px; display: flex; flex-direction: column; justify-content: center; align-items: center; display: none">
                        <p style="height: 20%; font-size: 50px; color: #D9D9D9; text-align: center; padding-top: 70px">No Post</p>
                    </div>
                    <c:forEach items="${requestScope.listPost}" var="p">
                        <li href="#" class="hotel" style="padding: 0; height: 500px;">
                            <img src="${p.img}" alt="">
                            <label style="font-size: 18px; font-weight: bold; margin-top: 20px;">${p.title}</label>
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-door-open' ></i>
                                ${p.companyName}
                            </label>

                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-calendar'></i>
                                <p class="content">${p.content}</p>
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-dollar-circle'></i>
                                ${p.salary}
                            </label>

                            <div style="width: 100%; display: flex; justify-content: center">
                                <label class="button" style="width: 40%; text-align: center; margin-top: 10px; font-size: 30px; color: red; padding: 0">
                                    <i onclick="deletePost(${p.id})" class='bx bx-trash'></i>
                                </label>
                                <label class="button" style="width: 40%; text-align: center; margin-top: 10px; font-size: 30px; color: blue; padding: 0">
                                    <i onclick="updatePost(${p.id})" class='bx bx-pencil' ></i>
                                </label>
                            </div>
                        </li>
                    </c:forEach>

                </div>
                <div style="clear: both"></div>
                <div style="width: 100%">
                    <ul class="paging" style="text-align: center">
                        <c:forEach begin="1" end="${Math.ceil(requestScope.listPost.size()/6)}" var="i">
                            <li onclick="changePage(this.innerHTML, true)" class="page" value="${i}">${i}</li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
            
            <div class="contain-hotel">
                <h3 style="border-bottom: 2px solid black; padding: 15px 15px; font-size: 25px;">
                    <label>Your Apply</label>
                    <label style="font-weight: lighter;"><input id="search2" type="text" oninput="searchName2()">Search</label>
                </h3>
                <div id="list-hotel">
                    <div id="empty2" style="width: 100%; height: 200px; display: flex; flex-direction: column; justify-content: center; align-items: center; display: none">
                        <p style="height: 20%; font-size: 50px; color: #D9D9D9; text-align: center; padding-top: 70px">No Apply</p>
                    </div>
                    <c:forEach items="${listApply}" var="a">
                        <li href="#" class="hotel2" style="padding: 0">
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

                            <label style="display: flex; justify-content: left; font-size: 14px; align-items: center;"> 
                                <i style="margin-right: 6px;" class='bx bx-calendar'></i>
                                ${a.detail}
                            </label>
                            
                            <label style="display: flex; justify-content: left; font-size: 20px; align-items: center; color: ${a.getColor()}; margin-left: 50px;"> 
                                ${a.status}
                            </label>

                            <label id="delete" style="width: 100%; text-align: center; margin-top: 10px; font-size: 30px; color: red;">
                                <i onclick="deletePost(${a.id})" class='bx bx-trash'></i>
                            </label>
                        </li>
                    </c:forEach>

                </div>
                <div style="clear: both"></div>
                <div style="width: 100%">
                    <ul class="paging" style="text-align: center">
                        <c:forEach begin="1" end="${Math.ceil(requestScope.listApply.size()/6)}" var="i">
                            <li onclick="changePage2(this.innerHTML, true)" class="page2" value="${i}">${i}</li>
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

            function changePage(p, bool) {
                let count = 0;
                //get all li tag contain product information
                var list = document.getElementsByClassName('hotel');
                var name = document.getElementById('search');
                //loop used to access all li tag in list
                for (var i = 0; i < list.length; i++) {
                    if (name.value.length !== 0) {
                        if (list[i].children[1].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[2].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[3].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[4].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[5].innerHTML.toLowerCase().includes(name.value.toLowerCase())) {
                            count++;
                            if (count < 6 * p && count >= (p - 1) * 6) {
                                list[i].style.display = 'block';
                            } else {

                                list[i].style.display = 'none';
                            }

                        } else {
                            list[i].style.display = 'none';
                        }
                    }
                    //check valid display product with size of page
                    else if (i < p * 6 && i >= (p - 1) * 6)
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
                let check = true;
                let listHotel = document.getElementsByClassName('hotel');
                let namePart = document.getElementById('search');
                
                if (namePart.value.length === 0) {
                    changePage(1, true);
                }

                for (var i = 0; i < listHotel.length; i++) {
                    if (listHotel[i].children[1].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())||
                                listHotel[i].children[2].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[3].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[4].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[5].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())) {
                        //console.log(listHotel[i].children[1].innerHTML.toLowerCase() + ' - ' + namePart.value.toLowerCase());
                        if (count < 6) {
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
                //check empty data after filer by name
                if (check) {
                    var c = document.getElementById('empty');
                    c.style.display = 'block';
                } else {
                    var c = document.getElementById('empty');
                    c.style.display = 'none';
                }

                //get list page
                var paging = document.getElementsByClassName('page');
                for (var i = 0; i < paging.length; i++) {
                    if (paging[i].value > Math.ceil(count / 6)) {
                        paging[i].style.display = 'none';
                    } else {
                        paging[i].style.display = 'list-item';
                    }
                }
            }

            function changePage2(p, bool) {
                let count = 0;
                //get all li tag contain product information
                var list = document.getElementsByClassName('hotel2');
                var name = document.getElementById('search2');
                //loop used to access all li tag in list
                for (var i = 0; i < list.length; i++) {
                    if (name.value.length !== 0) {
                        if (list[i].children[1].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[2].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[3].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[4].innerHTML.toLowerCase().includes(name.value.toLowerCase()) ||
                                list[i].children[5].innerHTML.toLowerCase().includes(name.value.toLowerCase())) {
                            count++;
                            if (count < 6 * p && count >= (p - 1) * 6) {
                                list[i].style.display = 'block';
                            } else {

                                list[i].style.display = 'none';
                            }

                        } else {

                            list[i].style.display = 'none';
                        }
                    }
                    //check valid display product with size of page
                    else if (i < p * 6 && i >= (p - 1) * 6)
                        list[i].style.display = 'block';
                    else {
                        list[i].style.display = 'none';
                    }
                }

                const x = window.innerWidth / 1.2;
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

            function searchName2() {
                let count = 0;
                let check = true;
                let listHotel = document.getElementsByClassName('hotel2');
                let namePart = document.getElementById('search2');
                
                if (namePart.value.length === 0) {
                    changePage2(1, true);
                }

                for (var i = 0; i < listHotel.length; i++) {
                    if (listHotel[i].children[1].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())||
                                listHotel[i].children[2].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[3].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[4].innerHTML.toLowerCase().includes(namePart.value.toLowerCase()) ||
                                listHotel[i].children[5].innerHTML.toLowerCase().includes(namePart.value.toLowerCase())) {
                        //console.log(listHotel[i].children[1].innerHTML.toLowerCase() + ' - ' + namePart.value.toLowerCase());
                        if (count < 6) {
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
                //check empty data after filer by name
                if (check) {
                    var c = document.getElementById('empty2');
                    c.style.display = 'block';
                } else {
                    var c = document.getElementById('empty2');
                    c.style.display = 'none';
                }

                //get list page
                var paging = document.getElementsByClassName('page2');
                for (var i = 0; i < paging.length; i++) {
                    if (paging[i].value > Math.ceil(count / 6)) {
                        paging[i].style.display = 'none';
                    } else {
                        paging[i].style.display = 'list-item';
                    }
                }
            }

            function scroll() {
                const x = window.innerWidth / 100;
                const y = window.innerHeight / 2;
                //scroll screen to filter
                window.scrollTo({
                    top: x,
                    left: y,
                    behavior: "smooth"
                });
            }
            
            function deletePost(id) {
                if(confirm("Are you sure?"))
                    window.location.href = 'deleteApply?id=' + id + '&backUrl=showApply';
            }
            
            function deletePost(id) {
                window.location.href = 'crud?id=' + id +'&action=delete&type=post';
            }
            
            function updatePost(id) {
                window.location.href = 'crud?id=' + id + '&action=update&type=post';
            }
            
            let shortenString = document.getElementsByClassName('content');
            for (var i = 0; i < shortenString.length; i++) {
                shortenString[i].innerHTML = shortenString[i].innerHTML.substring(0, 300).concat('...');
            }
            document.onload = searchName2();
            document.onload = searchName();
            
        </script>
    </body>
</html>
