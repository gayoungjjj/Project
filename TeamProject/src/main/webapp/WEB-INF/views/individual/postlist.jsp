<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
  main{
  h2    {margin-left : 16%;}
  table {
         border : 1px solid #DCDBDB;
         text-align : center;
         border-collapse: collapse;
         margin-left : 16%;
         width : 78%;
         font-weight : bold;
         height: auto;
         }
   td {border : 1px solid #DCDBDB;
       padding : 10px;}
   tr {padding : 10px;}
   
   a { text-decoration:none; color : black;}
   a:hover{color : blue;}
   }
  tr:first-child{background : #E7E7E7; }
</style>


</head>
<body>

 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 

          	   <li><a href="/Individual/Postlist?user_id=${param.user_id}">채용공고</a></li>
      		   <li><a href="/Individual/Resumereg?user_id=${param.user_id}">이력서 등록</a></li>
      		   <li><a href="/Individual/ResumeList?user_id=${param.user_id}">등록 이력서 관리</a></li>
               <li><a href="/Individual/Recommend?user_id=${param.user_id}">기업 추천</a></li>
               <li><a href="cs">고객센터</a></li>   
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Individual/Logout">로그아웃</a></li>
     		   <li><a href="/Individual/Mypage?user_id=${param.user_id}">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


<div class= "div2">
<a href="/Company/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>


  <!--채용공고 목록_메인화면 -->
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
       <a href="/Individual/Postview?aplnum=${main.aplnum}&user_id=${param.user_id}">
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
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>