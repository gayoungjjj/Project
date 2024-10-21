<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div>
  <header>
   <h1><a href="">회사로고</a></h1>
   <nav>
    <ul> 
    <!-- 기능 구현
    1. 로그아웃 기능 구현
    2. 마이페이지 이동 구현 -->
     <li><a href="/Individual/Logout">로그아웃</a></li>
     <li><a href="/Individual/Mypage">마이페이지</a></li>
    </ul>
   </nav>
  </header>
 </div>
 
 <div>
  <nav>
  <!-- 기능 구현 
  1. 채용공고, 고객센터는 기업이랑 똑같음-->
   <ul><a href="/postList">채용공고</a></ul>
   <ul><a href="/Individual/ResumeManagement">등록 이력서 관리</a></ul>
   <ul><a href="/Individual/????">지원 받은 공고?이게뭐졍??</a></ul>
   <ul><a href="/Individual/Recommend">기업 추천</a></ul>
   <ul><a href="/cs">고객센터</a></ul>
  </nav>
 </div>
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 기업명</small></p>
  </div>
 </footer>

</body>
</html>