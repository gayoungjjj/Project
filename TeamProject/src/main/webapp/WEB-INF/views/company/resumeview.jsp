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
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>

<!-- main style 넣어주세욤 -->
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

/* 버튼 스타일 */
main input[type="button"] {
  padding: 10px 15px;
  margin-right: 5px;
  border: none;
  border-radius: 5px;
  background-color: #007BFF;
  color: white;
  font-size: 14px;
  cursor: pointer;
}
/* 합격 버튼 색상 */
#goPass {
  background-color: #007BFF;
}

#goPass:hover {
  background-color: #0056b3;
}

/* 불합격 버튼 색상 */
#goFail {
  background-color: #dc3545;
}

#goFail:hover {
  background-color: #c82333;
}

/* 보류 버튼 색상 */
#goPending {
  background-color: #6c757d;
}

#goPending:hover {
  background-color: #5a6268;
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
          	   <li><a href="/Company/Postlist?user_id=${param.user_id}&compname=${compname}">채용공고</a></li>
      		   <li><a href="/Company/ListManagement?user_id=${param.user_id}&compname=${compname}">등록 공고 관리</a></li>
      		   <li><a href="/Company/ResumeList?user_id=${param.user_id}&compname=${compname}">지원 받은 이력서</a></li>
               <li><a href="/Company/Recommend?user_id=${param.user_id}&compname=${compname}">인재 추천</a></li>
               <li><a href="/Company/Bookmark?user_id=${param.user_id}&compname=${compname}">북마크한 인재</a></li>
               <li><a href="/Company/Cslist?user_id=${param.user_id}&compname=${compname}">고객센터</a></li>
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Company/Logout">로그아웃</a></li>
     		   <li><a href="/Company/Mypage?user_id=${param.user_id}&compname=${compname}">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


<div class= "div2">
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>


  <!--이력서_상세페이지 -->

<div class= "div3">
  <main>    
    <h2 style=text-align:center;>이력서 내용보기 (${post_id }_${ vo.title })</h2>
    <table id="table">
     <tr>
      <td>지원자명</td>
      <td>${  vo.username      }</td>
      <td>생년월일</td>
      <td>${  vo.birth      }</td>
     </tr>
     <tr>
      <td>연락처</td>
      <td>${  vo.phone_number    }</td>
      <td>비상연락처</td>
      <td>${  vo.number2   }</td>
     </tr>
     <tr>
      <td>주소</td>
      <td colspan="3">${  vo.address    }</td>
     </tr>
     <tr>
      <td>경력</td>
      <td>${  vo.career    }</td>
      <td>학력</td>
      <td>${  vo.edu  }</td>
     </tr>
     <tr>
      <td>보유기술</td>
      <td>${  vo.skills1    }</td>
      <td>자격증</td>
      <td>${  vo.licenses1  }</td>
     </tr>    
     <tr>
      <td>포트폴리오</td>
      <td colspan="3">${  vo.portfolio    }</td>
     </tr>
     <tr>
      <td>자기소개서</td>
      <td colspan="3">${  vo.selfintro    }</td>
     </tr>
     
     
     <tr>
      <td colspan="4"> 	
       <input type="button" value="합격" id="goPass" />
       <input type="button" value="불합격" id="goFail" />
       <input type="button" value="보류" id="goPending" />
      </td>
     </tr>
    
    </table>    
	<script>
    const goPassEl    = document.getElementById('goPass');
    const goFailEl    = document.getElementById('goFail');
    const goPendingEl = document.getElementById('goPending');
    
    goPassEl.onclick = function() {
        const title = '${vo.title}';
        window.location.href = `/Company/updateresume?title=${title}&result=합격&post_id=${post_id}&user_id=${param.user_id}&compname=${param.compname}`;
    };

    goFailEl.onclick = function() {
        const title = '${vo.title}';
        window.location.href = `/Company/updateresume?title=${title}&result=불합격&post_id=${post_id}&user_id=${param.user_id}&compname=${param.compname}`;
    };

    goPendingEl.onclick = function() {
        const title = '${vo.title}';
        window.location.href = `/Company/updateresume?title=${title}&result=대기&post_id=${post_id}&user_id=${param.user_id}&compname=${param.compname}`;
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