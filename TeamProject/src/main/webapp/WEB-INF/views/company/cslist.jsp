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
  		<a href="/Company/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 채용을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 
          	   <li><a href="/Company/Postlist?user_id=${param.user_id}&compname=${param.compname}">채용공고</a></li>
      		   <li><a href="/Company/ListManagement?user_id=${param.user_id}&compname=${param.compname}">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList?user_id=${param.user_id}&compname=${param.compname}">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend?user_id=${param.user_id}&compname=${param.compname}">인재 추천</a></li>
               <li><a href="/Company/Bookmark?user_id=${param.user_id}&compname=${param.compname}">북마크한 인재</a></li>
               <li><a href="/Company/Cslist?user_id=${param.user_id}&compname=${param.compname}">고객센터</a></li>  
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage?user_id=${param.user_id}&compname=${param.compname}">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


<div class= "div2">
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>


  <!-- 고객센터 문의 목록_메인화면 -->
  
<div class= "div3">
 <main>
 
    <table class= "table1">
    <h2 style=text-align:center;>FAQ</h2>
    <tr>
     <td><input type="button" value="문의글 작성" id="goWrite" /></td>
    </tr>
     <c:forEach var="faq" items="${faqList}">
      <tr>
       <td>[ ${faq.type} ] 
         <a href="#" class="faqtitle">${faq.csp_title}</a> 
       </td>
      </tr>
      <tr>
       <td class="faqcontent" style="display:none;">${ faq.content}</td>
      </tr> 
     </c:forEach>
    </table>
    
         <!-- 공간띄우기 -->
     <div class= "div4">
       <tr><br><br></tr>
     </div>
     
    <table class= "table2">
     <tr>
      <th>구분</th>
      <th>제목</th>
      <th>답변여부</th>
     </tr>
     
     <c:forEach var="cs" items="${csList}">
      <tr>
       <td>${ cs.csp_id    }</td>
       <td>
         <a href="/Company/Csview?user_id=${param.user_id}&csp_title=${cs.csp_title}&compname=${compname}">
           ${ cs.csp_title }</td>
       <td>${ cs.result    }</td>
      </tr>
     </c:forEach>
    </table>
 
 <script>    
     document.querySelectorAll('.faqtitle').forEach((title, index) => {
         title.addEventListener('click', function(event) {
             event.preventDefault(); // Prevent default link behavior
             const content = document.querySelectorAll('.faqcontent')[index];
             if (content.style.display === 'none' || content.style.display === '') {
                 content.style.display = 'block';
             } else {
                 content.style.display = 'none';
             }
         });
     });

     const goWrite = document.getElementById('goWrite');
     goWrite.onclick = function() {
         location.href = '/Company/CswriteForm?user_id=${param.user_id}&compname=${compname}';        
     };
</script>
 
 </main>
</div>  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>