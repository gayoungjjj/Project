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
.purplebutton {
  padding: 10px 15px;
  margin-right: 5px;
  border: none;
  border-radius: 5px;
  background-color: #4c5cc5;
  color: white;
  font-size: 14px;
  cursor: pointer;
}


/*수정됨*/

.bluebutton {
  padding: 10px 15px;
  margin-right: 5px;
  border: none;
  border-radius: 5px;
  background-color: #007BFF;
  color: white;
  font-size: 14px;
  cursor: pointer;
}

.redbutton{
 padding: 10px 15px;
  margin-right: 5px;
  border: none;
  border-radius: 5px; 
  background-color:red;
  color: white;
  font-size: 14px;
  cursor: pointer;
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

  <!--이력서_상세페이지 -->

<div class= "div3">
  <main>    
    <form action="/Individual/Resumeupdate?title=${vo.title }&user_id=${param.user_id } "method="POST" >
    <h2 style=text-align:center;> 제출이력서 내용 (${ vo.title })</h2>
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
       <input class="purplebutton" type="button"  value="수정하기" id="goUpdate" />
       <input class= "bluebutton"  type="button" value="목록으로" id="goList" />
	   <input class="redbutton"    type="button" value="삭제하기" id="goDel" />
      </td>
     </tr>
    
    </table>    

 </form>
  </main>
</div>  


 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

	<script>
		const  goListEl    = document.getElementById('goList')
        goListEl.onclick = function() {
        const user_id = '${param.user_id}'; 
        window.location.href = '/Individual/ResumeList?user_id=${param.user_id}'
        };

        const goUpdate = document.getElementById('goUpdate');
        goUpdate.onclick = function() {
            // AJAX 요청을 통해 이력서의 제출 여부를 확인
            $.ajax({
                url: '/Individual/CheckSubmittedResume', // 서버의 URL
                type: 'GET',
                data: {
                    title: '${vo.title}', // 이력서 제목
                    user_id: '${param.user_id}' // 사용자 ID
                },
                success: function(response) {
                    // 서버에서 반환된 응답을 기반으로 제출 여부 설정
                    const submittedResumeExists = response.submitted; // 서버 응답에서 제출 여부 확인

                    if (submittedResumeExists) {
                        alert("수정할 수 없습니다. 현재 제출 상태의 이력서 입니다. \n수정을 원하신다면 취소 후 수정해주십시오 ");
                        return; // 삭제를 진행하지 않음
                    }

                        location.href = '/Individual/Resumeupdate?title=${vo.title}&user_id=${param.user_id}';

                },
                error: function() {
                    alert("이력서 제출 여부를 확인하는 데 실패했습니다.");
                }
            });
        };
       
       
        
        const goDel = document.getElementById('goDel');
        goDel.onclick = function() {
            // AJAX 요청을 통해 이력서의 제출 여부를 확인
            $.ajax({
                url: '/Individual/CheckSubmittedResume', // 서버의 URL
                type: 'GET',
                data: {
                    title: '${vo.title}', // 이력서 제목
                    user_id: '${param.user_id}' // 사용자 ID
                },
                success: function(response) {
                    // 서버에서 반환된 응답을 기반으로 제출 여부 설정
                    const submittedResumeExists = response.submitted; // 서버 응답에서 제출 여부 확인

                    if (submittedResumeExists) {
                        alert("삭제할 수 없습니다. 현재 제출 상태의 이력서 입니다. \n삭제를 원하신다면 취소 후 삭제해주십시오 ");
                        return; // 삭제를 진행하지 않음
                    }

                    const confirmed = confirm("정말로 선택한 이력서를 삭제 하시겠습니까?\n기업의 북마크에 담긴 이력서도 사라집니다.");
                    if (confirmed) {
                        location.href = '/Individual/Deleteres?title=${vo.title}&user_id=${param.user_id}';
                    }
                },
                error: function() {
                    alert("이력서 제출 여부를 확인하는 데 실패했습니다.");
                }
            });
        };
        



</script>
</body>
</html>