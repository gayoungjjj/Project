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
.div3{
background-color: #F7F7F7;
padding-top: 20px;
padding-bottom: 20px;

}
  
.test1{
width:150px;
height: 50px;
border: 1px #DDDDDD solid}


.test1div{
background-color:white;
padding: 10px 10px;
border: 1px solid #DBE0E9;

}
  
</style>




</head>
<body>

<header>
  <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
 	 
    	 <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 취업을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
		</div>
 

   <nav class ="headernav">
    <ul class ="leftmenu"> 
   		<li><a href="/postList">채용공고</a></li>
   		<li><a href="/Individual/Resumereg">이력서 등록</a></li>
    	<li><a href="/Individual/ResumeManagement">등록 이력서 관리</a></li>  		
    	<li><a href="/Individual/Recommend">기업 추천</a></li>
    	<li><a href="/cs">고객센터</a></li>  
     </ul>   
     	 
    	 <div>
    		 <ul class="rightmenu"> 
     		 <li><a href="/Individual/Logout">로그아웃</a></li>
     		 <li><a href="/Individual/Mypage">마이페이지</a></li>
    		 </ul>
   		  </div>
   	 </nav>
   	</div> 
  </header>
 
 
 <body>
 
 <div class="div3">
 <form action="/submit-resume" method="POST">
 
  <h3>인적사항</h3> 
    <table class ="test1div" >
    <tr>
       <td>
          <td rowspan="2"> <input class="test1" type="text" value="사진"  style="width:103px; height:103px;"><td>
           <input class="test1" type="text" value="이름">
       	   <input class="test1" type="text" value="주민번호">
           <input class="test1" type="text" value="성별">
           <input class="test1" type="text" value="이메일"><br>
           <input class="test1" type="text" value="전화번호">
           <input class="test1" type="text" value="핸드폰">
           <input class="test1" type="text" value="주소"></td>
    </tr>
	</table>

  <h3>학력사항</h3> 
    <table class ="test1div">
    <tr>
       <td><input class="test1" type="text" value="제학기간">
       	   <input class="test1" type="text" value="학력사항">
           <input class="test1" type="text" value="전공">
           <input class="test1" type="text" value="학점"></td>
    </tr>
	</table>
    

<h3>자격증</h3> 
    <table class ="test1div">
       <tr>
         <td>
       	   <input class="test1" type="text" value="자격증1">
       	   <input class="test1" type="text" value="발행처">
           <input class="test1" type="text" value="취득월">
        </td>
      </tr>
	</table>



<h3>보유기술 및 능력</h3> 
    <table class ="test1div">
      <tr>
        <td>
       	   <input class="test1" type="text" value="보유 기술및 능력1">
		   <input class="test1" type="text" value="보유 기술및 능력2">
		   <input class="test1" type="text" value="보유 기술및 능력3">
		   <input class="test1" type="text" value="보유 기술및 능력4">
		   <input class="test1" type="text" value="보유 기술및 능력5">
	    </td>
      </tr>
	</table>

   
   
<h3>포트폴리오</h3> 
    <table class ="test1div">
      <tr>
        <td>
		   <input class="test1" type="text" value="주소입력">
		   <input class="test" type="file" value="파일첨부">
        </td>
      </tr>
	</table>
  

 <h3>자기소개서</h3> 
    <table class ="test1div">
      <tr>
        <td>
		   <textarea class = "test1" rows="10" cols="50" placeholder="자기소개서를 작성하세요..."></textarea></td>					
      </tr>
	</table>

    </form>
</div>
   
   
 
 <!-- 이름 추가, 아이디 x ,공고제목 , 경력 ,학력 ,기술 ,자격증 ,포트폴리오 , 자기소개서 --> 
  
  
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>


</body>


</html>