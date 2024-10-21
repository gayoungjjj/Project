<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
  table {border : 1px solid black;}
  td    {border : 1px solid black;}
</style>
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
     <li><a href="/Company/Logout">로그아웃</a></li>
     <li><a href="/Company/Mypage">마이페이지</a></li>
    </ul>
   </nav>
  </header>
 </div>
 
 <div>
  <nav>
  <!-- 기능 구현 
  1. 채용공고, 고객센터는 개인이랑 똑같음-->
   <ul><a href="postList">채용공고</a></ul>
   <ul><a href="/Company/ListManagement">등록 공고 관리</a></ul>
   <ul><a href="/Company/ResumeList">지원 받은 이력서</a></ul>
   <ul><a href="/Company/Recommend">인재 추천</a></ul>
   <ul><a href="cs">고객센터</a></ul>
  </nav>
 </div>
 
 <main>
   <h2>공고 게시판</h2>
    <table>
     <tr>
      <td>공고번호</td>
      <td>제목</td>
      <td>기업명</td>
      <td>마감기한</td>
     </tr>
     
     <c:forEach var="main" items="${mainList}">
      <tr>
       <td>${ main.aplnum   }</td>
       <td>
       <a href="/Company/View?aplnum=${main.aplnum}">
       ${ main.post_id  }</a>
       </td>
       <td>${ main.compname }</td>
       <td>${ main.deadline }</td>
      </tr>
     </c:forEach>
    </table>
 
 </main>
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 기업명</small></p>
  </div>
 </footer>

</body>
</html>