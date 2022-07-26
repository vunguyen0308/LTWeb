<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fn" uri = "http://java.sun.com/jsp/jstl/functions" %>
<%
    request.setCharacterEncoding("UTF-8");
    response.setCharacterEncoding("UTF-8");
%>
<!--header-->
<div class="header" id="home">
    <div class="container">
        <ul>
            <c:if test="${sessionScope.acc == null}">
                <li> <a href="login" ><i class="fa fa-unlock-alt" aria-hidden="true"></i> Sign In </a></li>
                <li> <a href="register" ><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Sign Up </a></li>
                <li><i class="fa fa-phone" aria-hidden="true"></i> Call : 01234567898</li>
            </c:if>
            <c:if test="${sessionScope.acc != null}">
                <c:if test="${sessionScope.acc.isAdmin == 1}">
                    <li> <a href="admin" ><i class="fa fa-user-alt" aria-hidden="true"></i>Admin page</a></li>
                </c:if>
                <c:if test="${sessionScope.acc.isAdmin != 1}">
                    <li class="dropdown">
                        <a href="#" role="button" class="dropdown-toggle" data-toggle="dropdown">Hello ${sessionScope.acc.username}</a>
                        <div class="dropdown-menu">
                            <a style="color: #000" class="dropdown-item" href="orders-history">Orders History</a>
                        </div>
                    </li>
                </c:if>
                <li> <a href="logout" ><i class="fa fa-unlock-alt" aria-hidden="true"></i>Log Out</a></li>
                <li><a href="changepassword"> <i class="fa fa-lock" aria-hidden="true"></i> Change Password</a></li>
            </c:if>

            <li><i class="fa fa-envelope-o" aria-hidden="true"></i> <a href="mailto:ducminh0573@gmail.com">ducminh0573@gmail.com</a></li>
        </ul>
    </div>
</div>
<!-- //header -->
<!-- header-bot -->
<div class="header-bot">
    <div class="header-bot_inner_wthreeinfo_header_mid">
        <div class="col-md-4 header-middle" style="float: right;">
            <form action="search" method="get">
                <input type="search" name="search" placeholder="Search here..." required="" value="${result}">
                <input type="submit" value=" ">
                <div class="clearfix"></div>
            </form>
        </div>
        <!-- header-bot -->
        <div class="col-md-4 logo_agile">
            <h1><a href="index"><span>B</span>ox Perfume <i class="fa fa-shopping-bag top_logo_agile_bag" aria-hidden="true"></i></a></h1>
        </div>
        <!-- header-bot -->

        <div class="clearfix"></div>
    </div>
</div>
<!-- //header-bot -->
<!-- banner -->
<div class="ban-top">
    <div class="container">
        <div class="top_nav_left">
            <nav class="navbar navbar-default">
                <div class="container-fluid">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse menu--shylock" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav menu__list">
                            <li class=" menu__item ${sessionScope.URL.contains("index") ? "menu__item--current" : ""}"><a class="menu__link" href="index">Home <span class="sr-only">(current)</span></a></li>
                            <li class=" menu__item ${sessionScope.URL.contains("about") ? "menu__item--current" : ""}"><a class="menu__link" href="about">About</a></li>
                            <li class=" menu__item ${(sessionScope.URL.contains("product") || sessionScope.URL.contains("detail") || sessionScope.URL.contains("category")) ? "menu__item--current" : ""}"><a class="menu__link" href="product">Products</a></li>
                            <li class=" menu__item ${sessionScope.URL.contains("contact") ? "menu__item--current" : ""}"><a class="menu__link" href="contact">Contact</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
        <div class="top_nav_right">
            <div class="wthreecartaits wthreecartaits2 cart cart box_1">
                <form action="cart" method="post" class="last">
                    <button class="w3view-cart" type="submit" name="submit" value=""><i class="fa fa-cart-arrow-down" aria-hidden="true"></i></button>
                </form>

            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //banner-top -->
