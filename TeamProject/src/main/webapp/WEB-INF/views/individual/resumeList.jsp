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
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
.div3 {
   margin-top:20px;
   display: flex;
   flex-wrap: wrap; 
   justify-content: center; 
   padding: 20px;
   background-color: #F7F7F7;
   
}

main {
  padding: 40px;
  background-color: #ffffff;
  box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
  margin: 20px auto;
  width: 90%;
  max-width: 1100px;
  border-radius: 10px; 
}

main h2 {
  font-size: 24px;
  color: #1f2c63;
  margin-bottom: 20px;
}

table {
  width: 100%;
  border-collapse: collapse;
  
}

table tr {
  border-bottom: 1px solid #ddd;
}

table th, table td {
  padding: 12px;
  text-align: center;
}

table th {
  font-size: 14pt;
  background-color: #CBD5F5;
  font-weight: bold;
  color: #333;
}

table td a {
  color: #007bff;
  text-decoration: none;
}

table td a:hover {
  text-decoration: underline;
}
</style>


</head>
<body>

 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/></a> <!--수정됨  -->
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
    		<li><a href="/Individual/Bookmarking?user_id=${param.user_id}">PICK ME</a></li>
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
 <main>
    <table>
    <h2 style="text-align:center;">등록된 이력서 내역</h2>
     <tr>
      <th>등록자명</th>
      <th>이력서제목</th>
      <th>최근 작성/수정일</th>
     </tr>
     
     <c:forEach var="ree" items="${reList}">
      <tr>
       <td>${ ree.username }</td>
       <td>
       <a href="/Individual/Resumeview?title=${ree.title}&user_id=${param.user_id }" >
           ${ ree.title }</a>
       </td>
       <td>${ ree.u_date}</td>
      </tr>
     </c:forEach>
    </table>
 
 
 <table>
    <h2 style=text-align:center;>제출한 이력서 내역</h2>
     <tr>
     <th>지원번호</th>
      <th>지원자명</th>
      <th>지원공고명</th>
      <th>이력서제목</th>
      <th>희망 근무 지역</th>
      <th>지원일</th>
      <th>합격여부</th>
      <th>지원취소</th>
     </tr>
     
     <c:forEach var="app" items="${appList}">
      <tr>
      <td>${ app.app_id}</td>
       <td>${ app.user_id }</td>
       <td>${ app.post_id }</td>
       <td>
       <a href="/Individual/Resumejustview?title=${app.title}&user_id=${param.user_id }" >
           ${ app.title }</a>
       </td>
       <td>${ app.location }</td>
       <td>${ app.app_date }</td>
       <td>${ app.result }</td>    
       
       <td>   
         <form action="/Individual/Delapplist" method="POST"> <!-- POST 요청을 위한 form -->
         <input type="hidden" name="app_id" value="${app.app_id}" />
         <input type="hidden" name="user_id" value="${app.user_id}" />
          <input  type="button" value="지원 취소" id="goDel" />
         </form>
	  </td>
      </tr>
     </c:forEach>
    </table>
 </main>
</div>  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>


<script>


const goDelButtons = document.querySelectorAll('#goDel'); 

goDelButtons.forEach(button => {
    button.onclick = function() {
        const form = this.closest('form'); 
        const confirmed = confirm("정말로 해당 지원 취소 하시겠습니까?\n 취소후 발생한 불이익에 대하여 “회사”는 책임지지 않습니다.");
        if (confirmed) {
            form.submit(); 
        }
    };
});
</script>


</body>
</html>