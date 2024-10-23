<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
/* 테스트용 모집공고 css <시작>*/

.legnav {
   padding-top:20px;
   display: grid;
   grid-template-columns: repeat(4, 250px); /* 3개의 열, 각 100px */
   justify-content: center;
   gap:8px;
   background-color: #F7F7F7;
   padding-bottom: 20px;
  }



.job-card {
   border: 1px solid #ccc;
   border-radius: 8px;
   text-align: center;
   box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
   box-sizing: border-box; 
   background-color: white;
   height: 220px;
   }

.job-card img {
   max-width: 200px;
   height: 100px;
   object-fit: cover ;
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
          	   <li><a href="/Company/Postlist?user_id=${param.user_id}&compname=삼성">채용공고</a></li>
      		   <li><a href="/Company/ListManagement?user_id=${param.user_id}&compname=삼성">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList?user_id=${param.user_id}&compname=삼성">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend?user_id=${param.user_id}&compname=삼성">인재 추천</a></li>
               <li><a href="cs">고객센터</a></li>  
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


<div class= "div2">
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>


 <div class= "div3">
  <!--메인화면 테스트용 -->

  <nav class ="legnav">
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description"> 픽미 로 오세요</div>
    </div>
    <div class="job-card">
        <img src="/img/ex.png" alt="회사 1">
        <div class="company-name">JOBKOREA</div>
        <div class="description"> 대한민국 대표구인 구직 사이트 잡코리아 </div>
    </div>
    <div class="job-card">
        <img src="/img/ex2.png" alt="회사 1">
        <div class="company-name">TOSS</div>
        <div class="description"> 신입/경력 영입합니다 </div>
    </div>
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description">테스트용 </div>
    </div>
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description">테스트용 </div>
    </div>
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description">테스트용 </div>
    </div>
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description">테스트용 </div>
    </div>
    <div class="job-card">
        <img src="/img/로고.png" alt="회사 1">
        <div class="company-name">PICK ME(픽미)</div>
        <div class="description">테스트용 </div>
    </div>
  </nav>  
</div>
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>