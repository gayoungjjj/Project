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
  table {border : 1px solid black;}
  td    {border : 1px solid black;}
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


  <!--채용공고 목록_등록 -->
<main>  
    <form action="/Company/Postwrite?aplnum=${aplnum}&user_id=${param.user_id}&compname=삼성 "  method="POST">
    <h2>공고 등록(${ param.aplnum })</h2>
    
    <tr>
       <select 	name="career" id="career">
         <option value="">경력</option>
         <option value="신입">신입</option>
         <option value="경력">경력</option>
         <option value="무관">무관</option>
       </select>
       <select name="edu" id="edu">
         <option value="">학력</option>
         <option value="고졸">고졸</option>
         <option value="대졸">대졸</option>
         <option value="무관">무관</option>
       </select>
     </tr>
 
    <table id="table">
     
     <tr>
       <td>공고명</td>
       <td>
       <input type="text"     name="post_id"   id="post_id"  /> 
       </td>
       <td>모집인원</td>
       <td>
       <input type="number"     name="recruitnum"   id="recruitnum"   /> 
       </td>
     </tr>
     <tr>
       <td>모집부서</td>
       <td>
       <input type="text"     name="department"   id="department"  /> 
       </td>
       <td>마감기한</td>
       <td>
       <input type="date"     name="deadline"   id="deadline"  /> 
       </td>
     </tr>
     <tr>
       <td>근무지역</td>
       <td>
       <input type="text"     name="workspace"   id="workspace"  /> 
       </td>
       <td>급여</td>
       <td>
       <input type="number"     name="salary"   id="salary"  /> 
       </td>
     <tr>
       <td>보유기술</td>
       <td>
       <input type="text"     name="skills"   id="skills"  /> 
       </td>
       <td>자격증</td>
       <td>
       <input type="text"     name="licenses"   id="licenses"  /> 
       </td>
     </tr>
     <tr>
      <td>직무내용</td>
      <td><textarea name="duty" id = "duty" maxlength="1300"></textarea></td>
     </tr>
     <tr>
      <td colspan="2">
       <input type="submit" value="글 저장" />
       <input type="button" value="목록" id="goList" />
      </td>
     </tr>
    
    </table>    
    </form>
  
    <script>
        
       const  goListEl = document.getElementById('goList')
       goListEl.onclick = function() {
          location.href = '/Company/Postlist?aplnum=${aplnum}&user_id=${param.user_id}&compname=삼성' 
       }    
       
       const  formEl       = document.querySelector('form');
       const  post_idEl    = document.querySelector('#post_id');
       const  dutyEl      = document.querySelector('#duty');
      
       
       
       formEl.onsubmit   = function () {           
		   if(  post_idEl.value.trim() == ''  ) {
               alert('제목을 입력하세요')
               post_idEl.focus()
           	   return  false;
		   } 
		   
		   if(  dutyEl.value.trim() == ''  ) {
               alert('내용을 입력하세요')
               dutyEl.focus()
           	   return  false;
		   } 
		  

		   return  true;
	   }
    </script>
  </main>
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>