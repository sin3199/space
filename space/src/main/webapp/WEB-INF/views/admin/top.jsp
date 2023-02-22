<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>관리자</title>
	<link href="resources/bootstrap/css/bootstrap.css" rel="stylesheet">
    <link rel="stylesheet" href="https://unicons.iconscout.com/release/v4.0.0/css/line.css">
    <link href="resources/css/adminstyle.css" rel="stylesheet">
    <link rel="shortcut icon" href="resources/img/favicon.ico">
  </head>
  <body class="pt-5">
    <nav>
        <div class="logo-name">
            <div class="logo-image">
            </div>
            <a href="admin_main.do"><span class="logo_name">관리자 페이지</span></a>
        </div>

        <div class="menu-items">
            <ul class="nav-links">
                <li><a class="hostList" href="admin_listHost.do">
                    <i class="uil uil-user-md"></i>
                    <span class="link-name">호스트 관리</span>
                </a></li>
                <li><a class="guestList" href="admin_listGuest.do">
                    <i class="uil uil-user"></i>
                    <span class="link-name">게스트 관리</span> 
                </a></li>
                <li><a href="admin_insertCategory.do">
                    <i class="uil uil-list-ul"></i>
                    <span class="link-name">카테고리 등록</span>
                </a></li>
                <li><a href="admin_listCategory.do">
                    <i class="uil uil-list-ol-alt"></i>
                    <span class="link-name">카테고리 관리</span>
                </a></li>
                <li><a href="admin_listRoom.do">
                    <i class="uil uil-store"></i>
                    <span class="link-name">호스트 방 관리</span>
                </a></li>
                <li><a href="admin_listReserve.do">
                    <i class="uil uil-clipboard-notes"></i>
                    <span class="link-name">방 예약 리스트</span>
                </a></li>
            </ul>
            
            <ul class="logout-mode">
                <li><a href="guest_logout.do">
                    <i class="uil uil-signout"></i>
                    <span class="link-name">로그아웃</span>
                </a></li>

                <li class="mode">
                    <a href="#">
                        <i class="uil uil-moon"></i>
                    <span class="link-name">다크모드</span>
                </a>

                <div class="mode-toggle">
                  <span class="switch"></span>
                </div>
            </li>
            </ul>
        </div>
    </nav>