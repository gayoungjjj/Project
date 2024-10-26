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
background-color:#F7F7F7;
padding-top: 20px;
padding-bottom: 20px;
display:flex;
justify-content: center;
align-items: center;

}
  
/*이력서 css */

.resumeinput1{
width:150px;
height: 50px;
border: 1px #DDDDDD solid; 
}

.resumeinput2{
width:800px;
height:300px;
resize: none;
border: 1px #DDDDDD solid; }

.resumetable{
background-color:white;
padding: 10px 10px;
border: 1px solid #DBE0E9;
}

#aside {
    position:fixed;
    width: 300px;
    height:60px;
    bottom:90px;
    left:1400px;
    background-color:transparnet;
}

.asidesubmit{
  margin-left:22px;
  background-color:#4c5cc5;
  font-weight:bolder;
  font-size:15px;
  color:white;
  width:200px;
  margin-bottom:10px;
  height:40px;
  border: 1px #DDDDDD solid; 
  border-radius: 20px;
}
/*이력서 css (끝)*/

</style>

</head>
<body>

<header style="margin-bottom: 10px;">
  <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
 	 
    	 <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 취업을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
		</div>
 

   <nav class ="headernav">
    <ul class ="leftmenu"> 
   		<li><a href="/Individual/Postlist?user_id=${param.user_id}">채용공고</a></li>
   		<li><a href="/Individual/Resumereg?user_id=${param.user_id}">이력서 등록</a></li>
    	<li><a href="/Individual/ResumeManagement?user_id=${param.user_id}">등록 이력서 관리</a></li>  		
    	<li><a href="/Individual/Recommend?user_id=${param.user_id}">기업 추천</a></li>
    	<li><a href="/cs">고객센터</a></li>  
     </ul>   
     	 
    	 <div>
    		 <ul class="rightmenu"> 
     		 <li><a href="/Individual/Logout">로그아웃</a></li>
     		 <li><a href="/Individual/Mypage?user_id=${param.user_id}">마이페이지</a></li>
    		 </ul>
   		  </div>
   	 </nav>
   	</div> 
  </header>
 

 <body>
 <div class="div3">
 <form action="/Individual/Updating"   method="POST">
  <h2 style="margin-top: -5px;text-align: center;">이력서수정</h2>

 <table  id="aside">
  <tr>
   <td>
   <input  class ="asidesubmit"type="submit" value="수정완료" >
   <input  class ="asidesubmit"type="button" value="목록으로" id="goList" style="background-color: white; color:black"></td>
  </tr>
 </table>
 
  <table class= "totaltable" style="border: 1px #DDDDDD solid; padding: 30px; background-color: #E8ECEF ">
  	<tr>
  	   <td>
  	   
         <h3 style="margin-top: -18px;">이력서 제목</h3>
 			<table class ="resumetable" >
  		  	<tr>
          		<td style="width:800px;">
            	<input class="resumeinput1" type="text" name="title" value="${vo.title }" style="width:800px; height:50px; font-size: 18px;"  readonly> 
		        </td>
   			 </tr>
	</table>
 
 
  <h3>인적사항</h3> 
    <table class ="resumetable" >
    <tr>
        <td style="padding-top:10px; width:696px;"> 
        <input type="hidden" name="user_id" value="${param.user_id}">
            <input class="resumeinput1" type="text" name="username" value="${vo.username}" readonly>
        	<input class="resumeinput1" type="text" name="birth"  value="${vo.birth}" readonly>
            <select class="resumeinput1" name="gender"> 
                <option>${vo.gender}</option>
            	<option>성별(선택)</option>
            	<option>남자</option>
           		<option>여자</option>
           	</select>
           	<input class="resumeinput1" type="text"     name="email"  value="${vo.email}" style="width:222px;" readonly>
                <br><p>
            	<input class="resumeinput1" type="text" name="number2"    value="${vo.number2}">
            	<input class="resumeinput1" type="text" name="phone_number"  value="${vo.phone_number}" readonly>
            	<input class="resumeinput1" type="text" name="address"  value="${vo.address}" style="width:377px;height: 50px;border: 1px #DDDDDD solid ;" readonly>            
           		<td rowspan="2"> 
           		<input class="resumeinput1" type="text" value="사진"  style="width:103px; height:120px; margin-left: -50 px; margin-bottom:5px; text-align:center;">
         </td>
    </tr>
	</table>

<h3>경력사항</h3> 
    <table class ="resumetable">
       <tr>
         <td style="width:800px;" >
                  
           <select class="resumeinput1" name="career" > 
        		<option>${vo.career}</option>
        		<option>경력(필수)</option>
        		<option>신입</option>
        		<option>경력(1년 이상)</option>
        		<option>경력(3년 이상)</option>
        		        		
          </select>
       	   <input class="resumeinput1" type="text"  name ="careers"  value="${vo.careers}" style="width:640px;" >
       	   
        </td>
      </tr>
	</table>


  <h3>학력사항</h3> 
    <table class ="resumetable">
    <tr>
    
       <td style="width:800px;">

    <input class="resumeinput1" type="text" name="eduwhen"   value="${vo.eduwhen}" style="width:250px;" > 
    <input class="resumeinput1" type="text" name="eduwher"  value="${vo.eduwher}">
    


        <select class="resumeinput1" name="edu" style="width:220px;"> 
        		<option>${vo.edu }</option>
        		<option>최종학력(필수)</option>
        		<option>학위(석사,박사)/(취득/예정)</option>
        		<option>대학교(4년)/(졸업/예정)</option>
        		<option>대학(2년)/(졸업/예정) </option>
        		<option>고등학교/(졸업/예정) </option>
        		<option>기타 </option>

        </select>
    
        

        
        <input class="resumeinput1" type="text" name= "major"  value="${vo.major}" style="width:158px;">
        </td>
    </tr>
	</table>
    

<h3>자격증</h3> 
    <table class ="resumetable">
       <tr>
         <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="licenses1"   value="${vo.licenses1}" >
       	   <input class="resumeinput1" type="text" name="publisher1"  value="${vo.publisher1}">
           <input class="resumeinput1" type="date" name="passdate1"   value="${vo.passdate1}" > 
           <input class="resumeinput1" type="text" value="예시) 컴퓨터활용1급" style="margin-left: 5px;" readonly>
           <input class="resumeinput1" type="text" value="예시) 대한상공회의소" readonly>
           <br><p>
       	   <input class="resumeinput1" type="text" name="licenses2"  value="${vo.licenses2}" >
       	   <input class="resumeinput1" type="text" name="publisher2" value="${vo.publisher2}">
           <input class="resumeinput1" type="date" name="passdate2"  value="${vo.passdate2}" >

           <br><p>
       	   <input class="resumeinput1" type="text" name="licenses3"  value="${vo.licenses3}" >
       	   <input class="resumeinput1" type="text" name="publisher3" value="${vo.publisher3}" >
           <input class="resumeinput1" type="date" name="passdate3"  value="${vo.passdate3}" >
        </td>
      </tr>
	</table>




<h3>보유기술 및 능력</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="skills1" value="${vo.skills1}">
		   <input class="resumeinput1" type="text" name="skills2" value="${vo.skills2}">
		   <input class="resumeinput1" type="text" name="skills3" value="${vo.skills3}">
		   <input class="resumeinput1" type="text" name="skills4" value="${vo.skills4}">
		   <input class="resumeinput1" type="text" name="skills5" value="${vo.skills5}">
	    </td>
      </tr>
	</table>

   
   
<h3>포트폴리오</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <input class="resumeinput1" type="text" name="portfolio" value="${vo.portfolio}"style="width:500px;">
		   <input class="test" type="file" value="파일첨부" style="margin-left: 20px">
        </td>
      </tr>
	</table>
  

 <h3>자기소개서</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <textarea class = "resumeinput2" rows="10" cols="50" name="selfintro"  >${vo.selfintro}</textarea></td>		
      </tr>
	</table>
    </td>
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

<script>
const  goList = document.getElementById('goList')
goList.onclick = function() {
   location.href = '/Individual/ResumeList?user_id=${param.user_id}'
} 
</script>

</body>
</html>