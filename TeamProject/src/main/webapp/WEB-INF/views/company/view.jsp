<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
 table{border:1px solid black;}
 td{border:1px solid black;}
 

</style>

</head>
<body>
  <main>  
   
    <h2>공고 내용보기 (${ vo.post_id })</h2>
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
     <tr>
      <td colspan="4"> 	
       <a href="/Company/WriteForm?aplnum=${vo.aplnum}">새 글 쓰기</a>
      
       <a href="/Company/UpdateForm?&aplnum=${vo.aplnum}">수정</a>
       <a href="/Company/Delete?&aplnum=${vo.aplnum}">삭제</a>
          

       <a href="/Company/Main?aplnum=${vo.aplnum}">목록</a>
      </td>
     </tr>
    
    </table>    
  
  
  </main>
</body>
</html>











