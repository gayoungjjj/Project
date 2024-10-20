<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon1.png" />

<style>

/*기본 css*/
* {
  margin-left: 0;
  margin-right:0;
  padding: 0;
  box-sizing: border-box;
}


/* (공통) 상단(로고,검색창 , 메뉴 , 로그아웃...) css <시작> */

.div1 {
  display: flex; 
  align-items: center; 
  padding-left: 200px;
  margin-top:-30px;
  border-bottom : 1px solid #E8E8E8;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1); 
  
 
}

.logo img {
  width: 200px; 
  height: 120px; 
  margin-right: 0px; 
}


.search {
  position: relative;
  width: 400px; 
  padding-left:10px;
  margin-right: 20px;
  margin-top: 30px;
}

.search input {
  width: 100%;
  border: 2px solid #1F2C63;
  border-radius: 8px;
  padding: 10px 12px ;
  font-size: 14px;
}

.search img {
  position : absolute;
  width: 18px;
  top: 50%;
  right: 10px;
  transform: translateY(-50%);
  margin: 0;
}


.headernav {
  margin-top: 30px;
  margin-left: -600px; 
  margin-bottom: -80px;
  display: flex; 
  justify-content: flex-start; 
  font-weight: bold;
}


.headernav ul {

  list-style: none; 
  display: flex; 
  gap: 20px; 
  margin-top:30px; 
  padding: 0; 
}

.headernav a {
  text-decoration: none; 
  color:black;
}


.rightmenu {
  margin-left:810px;
  margin-right:auto;
  font-size: 13px;

}

/* 상단 css <끝> 10.20 기준 1차 

깔끔하게 코드 정리해야함 = 필요없는 부분 삭제및 정리
메뉴(카테고리) 폰트 찾아야함
좌우 비율 맞춰야함
검색창 = 꾸미기용 없으면 너무 허전함 

*/



/* 꾸미기용 배너(공간채우기용)*/
.div2 {
   margin-top: 20px;

}
.div2 img {
  width: 78%; 
  height: auto; 
  margin-left: 200px;
}


/* 테스트용 모집공고 css <시작>*/

.legnav {
   margin-top:20px;
   display: flex;
   flex-wrap: wrap; 
   justify-content: center; 
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
    
    
 
 /* (공통) footer css<시작>*/   
footer {   
   margin-top:20px;
   background-color: white;
   color: black;
   text-align: center;
   padding: 10px 0;
   position: relative;
   bottom: 0;
   width: 100%;
   border-top: 1px #F4F4F4  solid;    
 		} 
 /* footer css  <끝>
 로고 를 넣을지 말지 고민 
 */		
 
 
 /* 창을 줄였을때 고정되게 해야함 */
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
   <!-- 기능 구현 
    1. 채용공고, 고객센터는 개인이랑 똑같음-->
    
   <!-- 기능 구현
    1. 로그아웃 기능 구현
    2. 마이페이지 이동 구현 -->
          	   <li><a href="postList">채용공고</a></li>
      		   <li><a href="/Company/ListManagement">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend">인재 추천</a></li>
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
<a href="/Company/Main"><img src="/img/exaplebanner.png" alt="예시 배너"></a>
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