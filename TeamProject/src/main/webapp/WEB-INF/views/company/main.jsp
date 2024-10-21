<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>

/*기본 css*/
* {
  box-sizing: border-box;
}

body {
    width: 100%;
    min-width:1320px;
    margin: 0 auto;
    overflow-x: auto;
}

/* (공통) 상단(로고,검색창 , 메뉴 , 로그아웃...) css <시작> */

.div1 {
  margin-top:-35px;
  display: flex; 
   align-items: center; 
  justify-content: center; 
  border-bottom : 1px solid #E8E8E8;
  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
  width:100%;
  padding: 20px;
 
  
 
}

  .leftmenu,.rightmenu {white-space:nowrap;}



.logo img {
  width:215px; 
  height:auto; 
  margin-left: 30px;
  margin-right: -5px;
}


.search {
  position: relative;
  width: 450px; 
  margin-top: 50px;
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
  width:1320px;
  margin-top: 60px;
  margin-left: -600px; 
  margin-bottom: -80px;
  display: flex; 
  justify-content: flex-start; 
  font-weight: bold;
}


.headernav ul {
  list-style: none; 
  display: flex; 
  
  margin-top:30px; 
 
}

.headernav a {
  text-decoration: none; 
  color:black;
}

.leftmenu {
  gap: 20px; 
  padding: 0; 
  margin-left:30px;
}


.rightmenu {
  padding-top:10px;
  margin-left:450px;
  margin-right:auto;
  gap:10px;
  font-size: 13px;
 
}

/* 상단 css <끝> 10.20 기준 1차 




/* 꾸미기용 배너(공간채우기용)*/
.div2 {
  display: flex; 
  margin-top: 20px;
  justify-content: center;
}
.div2 img {
  width:  1100px; 
  height: auto; 
  margin-bottom: 20px ;
}


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
    
 
 /* (공통) footer css<시작>*/   
footer {   
   margin-top:10px;
   background-color: white;
   color: black;
   text-align: center;
   padding: 10px 0;
   position: relative;
   bottom: 0;
   width: 100%;
   border-top: 1px #F4F4F4  solid;    
 		} 

 /* 창을 줄였을때 고정되게 해야함 */
</style>




</head>
<body>

 <header>
     <div class = "div1" >
 
 	 <h1 class ="logo"  >
  		<a href="/Company/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
 	   
         <div class="search"  >
  		 <input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		 <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	     </div>
    
       

 	  <nav class ="headernav" >
    	<ul class ="leftmenu"> 
          	<li><a href="postList">채용공고</a></li>
      		<li><a href="/Company/ListManagement">등록 공고 관리</a></li>
      		<li><a href="/Company/ResumeList">지원 받은 이력서</a></li>
            <li><a href="/Company/Recommend">인재 추천</a></li>
            <li><a href="cs">고객센터</a></li>   
        </ul> 
            <div>   
               <ul class="rightmenu">   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage">마이페이지</a></li>
    		   </ul>  	
    		</div>	
       </nav> 	 
      </div>  
 	</header>






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