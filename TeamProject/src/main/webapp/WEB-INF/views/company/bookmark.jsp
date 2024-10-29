<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />



<style>

 /*임시-----------*/
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
/*----------------*/
  .legnav {
   margin-top:20px;
   display: flex;
   flex-wrap: wrap; /* 줄 바꿈을 허용 */
   justify-content: center; /* 중앙 정렬 */
   padding-left: 200px;
   padding-right: 200px;
   background-color: #F7F7F7;
 }

.job-card {
   border: 1px solid #ccc;
   border-radius: 8px;
   width: 200px;
   margin: 10px;
   padding: 10px;
   text-align: center;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   flex: 0 0 calc(25% - 20px); /* 한 줄에 4개 배치 */
   box-sizing: border-box; /* 패딩과 마진을 포함한 너비 계산 */
   background-color: white;
   height: 300px;
 }

.job-card img {
   width: 100%;
   height: 150px;
   object-fit: cover;
   border-radius: 8px 8px 0 0;
 }

.company-name {
   font-weight: bold;
   margin: 5px 0;
 }

.description {
   margin-top:10px;
   color: #555;
   font-size: 14px;
    flex-grow: 1; 
   display: flex;
   align-items: center; 
   justify-content: center; 
  }
</style>
</head>

<body>
 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Company/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 
          	   <li><a href="/Company/Postlist?user_id=${param.user_id}&compname=${param.compname}">채용공고</a></li>
      		   <li><a href="/Company/ListManagement?user_id=${param.user_id }&compname=${param.compname}">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList?user_id=${param.user_id}&compname=${param.compname}">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend?user_id=${param.user_id}&compname=${param.compname}">인재 추천</a></li>
               <li><a href="/Company/Bookmark?user_id=${param.user_id}&compname=${param.compname}">북마크한 인재</a></li>               
               <li><a href="/Company/Cslist?user_id=${param.user_id}&compname=${param.compname}">고객센터</a></li>  
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage?user_id=${param.user_id}&compname=${param.compname}">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>
 
 <div class= "div2">
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>
 
 <main>
   <h2>북마크한 인재 목록</h2>
     <table>
       <tr>
        <td>이름</td>
        <td>생년월일</td>
        <td>이력서 제목</td>
        <td>전화번호</td>
         <td>북마크</td>
       </tr>
       
       <c:forEach var="book" items="${bookmarkList}">
         <form action="/Company/Bookmarking" method="post">
         <input type="hidden" name="user_id" value="${param.user_id}">
         <input type="hidden" name="compname" value="${param.compname}"> 
       <tr>
        <td>${book.username}</td>
        <td>${book.birth}</td>
        <td>
          <a href="/Company/Resumejustview?title=${book.title}&user_id=${param.user_id}&compname=${param.compname}"> 
                ${book.title}
            </a>
         </td>
        <td>${book.phone_number}</td>
        <td>
            
            <input type="hidden" name="username" value="${book.username}">
            <input type="hidden" name="title" value="${book.title}">
        	<input type="submit" value="북마크" onclick="disableButton(this)">
        </td>
       </tr>
       </form>  
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