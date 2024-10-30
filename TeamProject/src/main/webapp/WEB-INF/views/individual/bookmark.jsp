<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />



<style>

 main{
    h2,p {
           margin-left : 16%;
           font-weight : bold;}
    table {
           border : 1px solid #DCDBDB;
           text-align : center;
           border-collapse: collapse;
           margin-left : 16%;
           width : 78%;
           font-family:arial;
           height: auto;
         
           background-color: #ffffff;
	  	   box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
		   margin: 20px auto;
		   width: 73%;
		   border-radius: 10px;
 
   	       margin-top:10px;
	       display: flex;
	       justify-content: center;		  
	       padding: 20px;}
         
   td { 
           padding : 10px;
           padding-left : 60px;
           padding-right : 60px;}
        
   tr { 
           padding : 10px;
           border-bottom: 1px solid #ddd;}
   
   a     {    
           text-decoration:none; color : black;}
   a:hover {color : blue;}
   }
   
  tr:first-child  { 
            background : #E7E7E7;
            font-weight : bold; }
  
  #bookmark  { width:30px;
               height: auto; 
               cursor: pointer;}
  
/*----------------*/
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
  
  
  
  
 /*원호 수정됨*/ 
  
  
  .job-postings-row {
    transition: height 0.3s ease; /* 높이 변화에 애니메이션 추가 */
}

.job-postings-content {
    margin-top: 10px; /* 버튼과 공고 내용 사이의 간격 */
}

 .job-link {
    color:blue; /* 기본 링크 색상 */
    text-decoration: none; /* 기본 밑줄 제거 */
    font-weight:bolder;
    transition: color 0.3s ease; /* 색상 변화에 애니메이션 추가 */
}

.job-link:hover {
    color: #511252; /* hover 시 색상 변경 */
}
  
 .pick{
 	color: blue;
    text-decoration: none; /* 기본 밑줄 제거 */
    font-weight:bolder;
    transition: color 0.3s ease; /* 색상 변화에 애니메이션 추가 */
 }
  
.pick:hover {
    color: #511252; /* hover 시 색상 변경 */
}

  
</style>
</head>

<body>
 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/>
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
<a href="/Individual/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>
 
 <main>
   <h2>PICK ME </h2>
<table>

    <tr>
    </tr>
    <c:forEach var="book" items="${bookmarkList}">
        <tr class="bookmark-item">
            <td>${book.compname}</td> <!-- 회사 이름 -->
            <td>
                <button onclick="toggleJobPostings('${book.user_id}', this)">상세보기</button>
            </td>
        </tr>
        <tr id="job-postings-${book.user_id}" style="display:none;">
            <td colspan="2">
                <div class="job-postings-content">
                    <table style="width:1000px;">
                    
                        <tr>
                            <th>공고 제목</th>
                            <th>업무</th>
                            <th>근무지</th>
                            <th>급여</th>
                            <th>빠른지원</th>
                        </tr>
                        <c:forEach var="job" items="${jobPostings}">
                            <c:if test="${job.user_id == book.user_id}">
                                <tr>
                                <td ><a href="/Individual/Postview?aplnum=${job.aplnum}&user_id=${param.user_id}"  class="job-link" >${job.post_id}</a></td>
                                    <td>${job.duty}</td> 
                                    <td>${job.workspace}</td> 
                                    <td>${job.salary}</td> 
                                    <td><a href="/Individual/Postapp?aplnum=${job.aplnum}&user_id=${param.user_id}" class="pick">PICK!</a></td>
                                </tr>
                            </c:if>
                        </c:forEach>
                    </table>
                </div>
            </td>
        </tr>
    </c:forEach>
</table>



<script>
function toggleJobPostings(userId, button) {
    var jobPostingsRow = document.getElementById("job-postings-" + userId);
    if (jobPostingsRow.style.display === "none") {
        jobPostingsRow.style.display = "table-row"; // 공고 내용 표시
        button.innerText = "숨기기"; // 버튼 텍스트 변경
    } else {
        jobPostingsRow.style.display = "none"; // 공고 내용 숨기기
        button.innerText = "상세보기"; // 버튼 텍스트 변경
    }
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