<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
/* 테스트용 모집공고 css <시작>*/

.legnav {
   padding-top:20px;
   display: grid;
   grid-template-columns: repeat(4, 250px); 
   justify-content: center;
   gap:8px;
   background-color: #F7F7F7;
   padding-bottom: 20px;
  }

.div2 img{
    border: 1px solid #e0e0e0; 
    border-radius: 10px; 
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
    box-sizing: border-box; 
    background-color: #ffffff; 
    transition: transform 0.3s, box-shadow 0.3s;
}

.div2 img:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
}
.job-card {
    border: 1px solid #e0e0e0; 
    border-radius: 10px; 
    text-align: center;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
    box-sizing: border-box; 
    background-color: #ffffff; 
    transition: transform 0.3s, box-shadow 0.3s; 
}

.job-card:hover {
    transform: translateY(-5px);
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2); 
}

.job-card img {
    width: 100%;  
    height: auto;     
    max-height: 100px;    
    object-fit: contain; 
    border-radius: 10px 10px 0 0; 
}

.company-name {
    font-weight: bold;
    margin: 10px 0; 
    font-size: 18px; /
    color: #333; 
}

.description {
    margin-top: 5px; 
    color: #777; 
    font-size: 14px; 
    padding: 0 10px; 
    height: 40px; 
    display: flex;
    align-items: center; 
    justify-content: center; 
    text-align: center; 
}

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
               <li><a href="/Individual/Cslist?user_id=${param.user_id}">고객센터</a></li>   
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


 <div class= "div3">
  <!--메인화면 테스트용 -->
	
   <nav class="legnav"> 
    <c:set var="postList" value="${requestScope.postList}" />
    <c:set var="user_id" value="${param.user_id}" />
    
    <c:choose>
        <c:when test="${not empty postList}">
            <c:forEach var="main" items="${postList}">
                <div class="job-card" onclick="location.href='/Individual/Postview?aplnum=${main.aplnum}&user_id=${user_id}'">
                    <img src="${not empty main.logoPath ? main.logoPath : '/img/ex.PNG'}" alt="회사 로고">
                    <div class="company-name">${main.compname}</div>
                    <div class="description">${main.duty}</div>
                    <div class="hit-count">조회수: ${main.hit}</div> 
                </div>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <div class="no-posts">등록된 채용공고가 없습니다.</div> 
        </c:otherwise>
    </c:choose>
	</nav>
</div>
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>