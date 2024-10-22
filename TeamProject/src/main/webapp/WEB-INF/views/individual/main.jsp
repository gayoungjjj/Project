<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
/* 테스트용 모집공고 css <시작>*/

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
    
/* 테스트용 모집공고 css <끝> 
상의 필요함 메인화면이 어떤 화면으로 구성될것인지 
자체적인 메인 화면을 만들것인지 -> 이경우 모집공고 칸 안에 넣는 기능 구현 필요  
기능구현된 화면을 메인 화면으로 할것인지 
 */

</style>


</head>
<body>

 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 
   <!-- 기능 구현 
    1. 채용공고, 고객센터는 개인이랑 똑같음-->
    
   <!-- 기능 구현
    1. 로그아웃 기능 구현
    2. 마이페이지 이동 구현 -->
          	   <li><a href="/Posting/Indmain">채용공고</a></li>
      		   <li><a href="/Individual/ResumeRegister">이력서 등록</a></li>
      		   <li><a href="/Individual/ResumeList">등록 이력서 관리</a></li>
               <li><a href="/Individual/Recommend">기업 추천</a></li>
               <li><a href="cs">고객센터</a></li>   
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Individual/Logout">로그아웃</a></li>
     		   <li><a href="/Individual/Mypage">마이페이지</a></li>
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