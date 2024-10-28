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

<style>
  main{
  h2    {margin-left : 16%;}
  table {
         border : 1px solid #DCDBDB;
         text-align : center;
         border-collapse: collapse;
         margin-left : 16%;
         width : 78%;
         font-weight : bold;
         height: auto;
         }
   td {border : 1px solid #DCDBDB;
       padding : 10px;}
   tr {padding : 10px;}
   
   a { text-decoration:none; color : black;}
   a:hover{color : blue;}
   }
  tr:first-child{background : #E7E7E7; }
  
  .submitbtn{
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
</style>

</head>
<body>

 <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
     <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 취업을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
	</div>

   
  	<header>
 	  <nav class ="headernav">
    	<ul class ="leftmenu"> 
			<li><a href="/Individual/Postlist?user_id=${param.user_id}">채용공고</a></li>
   			<li><a href="/Individual/Resumereg?user_id=${param.user_id}">이력서 등록</a></li>
    		<li><a href="/Individual/ResumeList?user_id=${param.user_id}">등록 이력서 관리</a></li>  		
    		<li><a href="/Individual/Recommend?user_id=${param.user_id}">기업 추천</a></li>
            <li><a href="/Individual/Cslist?user_id=${param.user_id}">고객센터</a></li>    
          </ul> 
              
            <div class="rightmenu" >   
            	<ul>   
  			   <li><a href="/Individual/Logout">로그아웃</a></li>
     		   <li><a href="/Individual/Mypage">마이페이지</a></li>
    		</ul>  	
    		</div>
    	</nav> 	   
 	</header>
 </div>


  <!--채용공고 목록_상세페이지 -->
<main>  
   
    <h2>선택 공고  (${ vo.post_id })</h2>
    <input type="hidden" name="aplnum" value="${vo.aplnum}" />
    <table id="table">
     <tr>
      <td>공고번호</td>
      <td>${  vo.aplnum      }</td>
      <td>조회수</td>
      <td>${  vo.hit      }</td>
     </tr>
     <tr>
      <td>기업명</td>
      <td>${  vo.compname    }</td>
      <td>마감기한</td>
      <td>${  vo.deadline   }</td>
     </tr>
     <tr>
      <td>급여</td>
      <td>${  vo.salary    }</td>
      <td>모집부서</td>
      <td>${  vo.department  }</td>
     </tr>
     <tr>
      <td>경력</td>
      <td>${  vo.career    }</td>
      <td>학력</td>
      <td>${  vo.edu  }</td>
     </tr>
     <tr>
      <td>보유기술</td>
      <td>${  vo.skills    }</td>
      <td>자격증</td>
      <td>${  vo.licenses  }</td>
     </tr>
     <tr>
      <td>직무 내용</td>
      <td colspan="3">${ vo.duty }</td>
     </tr>
     
     <!-- 이력서 작성(이력서 불러오기 등)해서 이력서 보내기로 넘어가는 기능 구현하면 어떨까요? -->
     <tr>
      <td colspan="4"> 	
       <a href="/Individual/Postlist?aplnum=${vo.aplnum}">목록</a>
      </td>
     </tr>
    
    </table>    
  
  
      <h2>입사 지원서  ${param.user_id} </h2>
 <form action="/Individual/Write2?aplnum=${vo.aplnum}&user_id2=${param.user_id}" method="POST" >
   <input type="hidden" name="aplnum" value="${vo.aplnum}" />
   <input type="hidden" name="post_id" value="${vo.post_id}" />
   <input type="hidden" name="user_id" value="${ param.user_id }" />
    <table id="table">
     <tr>
      <td>지원 공고 번호</td>
      <td>${  vo.aplnum  }</td>
       <td>공고 이름</td>
      <td>${ vo.post_id     }</td>
     </tr> 
     <tr>
      <td>희망 근무지역 <span class="red"> *</span></td>
      <td><input type="text"  name = "location" placeholder="  "></td>
       <td>이력서 첨부</td>
       <td>
          <select name="title">
             <c:forEach items="${titles}" var="title">
                <option  value="${title}">${title}</option>
             </c:forEach>
          </select>
       </td>

     </tr>
     
     <!-- 이력서 작성(이력서 불러오기 등)해서 이력서 보내기로 넘어가는 기능 구현하면 어떨까요? -->
     <tr>
      <td colspan="4"> 	
       <input class ="submitbtn"type="submit" value="지원하기">
      </td>
      
 
     </tr>
      </table>    
  
    
  
   </form>
  
  </main>
  
 
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>
<script>


</script>
</body>
</html>