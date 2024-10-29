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

.div3 {
   margin-top:20px;
   display: flex;
   flex-wrap: wrap; 
   justify-content: center; 
   padding: 20px;
   background-color: #F7F7F7;
}

.div4 {
   background-color: #F7F7F7;
}

/* 메인 form 영역 */
.main form {
  width: 100%;
}

.main table {
  
  width: 1000px;
  border-spacing: 10px;
  background-color: white;
  border-radius: 10px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

/* 테이블 셀 정렬 */
.main table td {
  padding: 10px;
  vertical-align: middle;
}

.main table td:first-child {
  font-weight: bold;
  text-align: center;
  color: #333;
}

/* input 스타일 */
.main input[type="text"],
.main input[type="password"] {
  width: 90%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 5px;
  font-size: 14px;
  box-sizing: border-box;
}

/* readonly */
.main input[readonly] {
  background-color: #e9e9e9;
}

/* 버튼 스타일 */
.main input[type="button"],
.main input[type="submit"] {
  padding: 10px 15px;
  margin-right: 5px;
  border: none;
  border-radius: 5px;
  background-color: #007BFF;
  color: white;
  font-size: 14px;
  cursor: pointer;
}

/* 수정 버튼 */
.main input[type="button"]:hover,
.main input[type="submit"]:hover {
  background-color: #0056b3;
}

/* 이전, 회원탈퇴 버튼 색상 */
#goMain {
  background-color: #6c757d;
}

#goMain:hover {
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

     <!--메인화면 -->
     <div class= "div3">
       <main class ="main">
         <form action="/Company/Csupdate?csp_id=${vo.csp_id}&user_id=${param.user_id}&compname=${compname}"  method="POST">
         <table>
           <h2 style=text-align:center;>문의글 수정${vo.csp_id}</h2>
     	   <tr>
     	     <td>문의 구분</td>
     	     <td>
      	      <select name="type" value="${vo.type }" >
      	       <option value="로그인">로그인</option>
      	       <option value="회원정보">회원정보</option>
      	       <option value="이력서">이력서</option>
      	       <option value="입사지원">입사지원</option>
      	       <option value="채용정보">채용정보</option>
      	       <option value="기타">기타</option>
      	      </select>
      	     </td>
     	   </tr>
     	   <tr>
      		 <td>제목</td>
      		 <td><input type="text" name="csp_title" value="${vo.csp_title }" /></td>
     	   </tr>
     	   <tr>
      		 <td>비밀번호</td>
      		 <td><input type= "text" name="csp_pw" id="csp_pw" readonly /></td>
      		 <td><input type="checkbox" id="goEdit" /><label for="goEdit">비밀글</label></td>
     	   </tr> 
     	   <tr>
       		 <td>내용</td>
      		 <td><input type="text" name="content" value="${vo.content }" /></td>
     	   </tr>
     	   <tr>
      		 <td>문의 파일</td>
      		 <td><input type="text" name="csp_file" value="${vo.csp_file }" /></td>
     	   </tr>
     	   <tr>
      		 <td>답변받을 이메일</td>
      		 <td><input type="text" name="email" value="${vo.email }" /></td>
     	   </tr>

     	   <tr>
      		 <td colspan="3">
      		   <input type="button" value="이전" id="goMain" />
      		   <input type="submit" value="수정" />
      		 </td>
     	   </tr>

     	   
     	 </table>    
     	 </form>
  
      <script>
         const goMain      = document.getElementById('goMain')
  			goMain.onclick    = function() {
  				location.href = '/Company/Cslist?user_id=${param.user_id}&compname=${compname}'
  			}  

         const csp_pw = document.getElementById('csp_pw')
         const goEdit = document.getElementById('goEdit')
         
         goEdit.onchange = function() {
         	if (goEdit.checked) {
    	    	csp_pw.removeAttribute('readonly'); // Enable editing
            } else {
    	      	csp_pw.setAttribute('readonly', 'readonly'); // Disable editing
              }
        	 
         }
</script> 
       </main>  
      
     </div>
     
     <!-- 공간띄우기 -->
     <div class= "div4">
       <tr><br><br></tr>
     </div>
  
  
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>

</body>
</html>