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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>

<style>
  main{
  h2    {margin-left : 16%;}
  table {
         border : 1px solid #DCDBDB;
         text-align : center;
         border-collapse: collapse;
         margin-left : 16%;
         width : 78%;
         font-family:arial;
         height: auto;
         
         background-color: #ffffff;
		 box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
		 margin: 20px auto;
		 width: 90%;
	     max-width: 1100px;
		 border-radius: 10px;
 
   	     margin-top:20px;
	     display: flex;
	     justify-content: center;		  
	     padding: 20px;
         }
         
   td {
        padding : 10px;
        padding-left : 80px;
        padding-right : 80px;}
        
   tr {
       padding : 10px;
       border-bottom: 1px solid #ddd;}
   
   a { text-decoration:none; color : black;}
   a:hover{color : blue;}
   }
   td:nth-of-type(1){
                     background : #E7E7E7;
                     font-weight : bold; }
   td:nth-of-type(3){
                     background : #E7E7E7;
                     font-weight : bold; }
  table tr:last-of-type td {
    background-color: white; 
    border: none; }
</style>

</head>
<body>

 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Company/Main?user_id=${sessionScope.login.user_id}"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 
          	   <li><a href="/Company/Postlist?user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">채용공고</a></li>
      		   <li><a href="/Company/ListManagement?user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList?user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend?user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">인재 추천</a></li>
               <li><a href="/Company/Bookmark?user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">PICK ME</a></li>               
               <li><a href="/Company/Cslist?user_id=${sessionScope.login.user_id}">고객센터</a></li>     
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage?user_id=${sessionScope.login.user_id}">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


<div class= "div2">
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>


  <!--채용공고 목록_상세페이지 -->
<main>  
   
    <h2>공고 내용보기</h2>
    <input type="hidden" name="aplnum" value="${vo.aplnum}" />
    <table id="table">
     <tr>
      <td>공고번호</td>
      <td>${  vo.aplnum      }</td>
      <td>조회수</td>
      <td>${  vo.hit      }</td>
     </tr>
     <tr>
      <td>기업명</td>
      <td>${  vo.compname    }</td>
      <td>마감기한</td>
      <td>${  vo.deadline   }</td>
     </tr>
     <tr>
      <td>급여</td>
      <td>${  vo.salary    }</td>
      <td>모집부서</td>
      <td>${  vo.department  }</td>
     </tr>
     <tr>
      <td>경력</td>
      <td>${  vo.career    }</td>
      <td>학력</td>
      <td>${  vo.edu  }</td>
     </tr>
     <tr>
      <td>모집인원</td>
      <td>${  vo.recruitnum    }</td>
      <td>자격증</td>
      <td>${  vo.licenses  }</td>
     </tr>
     <tr>
      <td>보유기술</td>
      <td colspan="3">${  vo.skills    }</td>
     </tr>
     <tr>
      <td>직무 내용</td>
      <td colspan="3">${ vo.duty }</td>
     </tr>
     <tr>
      <td colspan="4"> 	
       <a class="btn btn-outline-primary" 
         href="/Company/WriteForm2?aplnum=${vo.aplnum}&user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">새로운 공고 쓰기</a>
      
      <!-- login이 완성되면 c:if -user_id를 compname로 변경 -->
      <c:if test="${login.user_id eq vo.user_id}">
       <a class="btn btn-outline-warning" 
          href="/Company/PostupdateForm2?&aplnum=${vo.aplnum}&user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">수정</a>
       <a class="btn btn-outline-danger" 
          href="/Company/Postdelete2?&aplnum=${vo.aplnum}&user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">삭제</a>
       </c:if>

       <a class="btn btn-outline-success" 
          href="/Company/ListManagement?aplnum=${vo.aplnum}&user_id=${sessionScope.login.user_id}&compname=${sessionScope.login.compname}">목록</a>
      </td>
     </tr>
    
    </table>    
  
  
  </main>
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>