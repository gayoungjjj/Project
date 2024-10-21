<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />

<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<script src="https://code.jquery.com/jquery.min.js"></script>
<style>
 table {border:1px solid black;}
 td    {border:1px solid black;}
</style>

</head>
<body>
  <main>  
    
   
    <form action="/Company/Update"  method="POST">
    <h2>공고 등록(${param.aplnum})</h2>
    <input type="hidden" name="aplnum" value="${vo.aplnum}" />
    <tr>
       <select 	name="career" value="${vo.career }">
         <option value="">경력</option>
         <option value="신입">신입</option>
         <option value="경력">경력</option>
         <option value="무관">무관</option>
       </select>
       <select name="edu" value="${vo.edu}">
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
       <input type="text"     name="post_id"   id="post_id" value="${vo.post_id}" /> 
       </td>
       <td>모집인원</td>
       <td>
       <input type="number"     name="recruitnum"   id="recruitnum" value="${vo.recruitnum}"   /> 
       </td>
     </tr>
     <tr>
       <td>모집부서</td>
       <td>
       <input type="text"     name="department"   id="department" value="${vo.department}"  /> 
       </td>
       <td>마감기한</td>
       <td>
       <input type="date"     name="deadline"   id="deadline" value="${vo.deadline}"  /> 
       </td>
     </tr>
     <tr>
       <td>근무지역</td>
       <td>
       <input type="text"     name="workspace"   id="workspace" value="${vo.workspace}"  /> 
       </td>
       <td>급여</td>
       <td>
       <input type="number"     name="salary"   id="salary" value="${vo.salary}"  /> 
       </td>
     <tr>
       <td>보유기술</td>
       <td>
       <input type="text"     name="skills"   id="skills" value="${vo.skills}"  /> 
       </td>
       <td>자격증</td>
       <td>
       <input type="text"     name="licenses"   id="licenses" value="${vo.licenses}"  /> 
       </td>
     </tr>
     <tr>
      <td>직무내용</td>
      <td><textarea name="duty" maxlength="1300" >${vo.duty}</textarea></td>
     </tr>
     <tr>
      <td colspan="2">
       <input type="submit" value="수정" />
       <input type="button" value="목록" id="goList" />
      </td>
     </tr>
    
    </table>    
    </form>
    
    <script>
        
       const  goListEl = document.getElementById('goList')
       goListEl.onclick = function() {
          location.href = '/Company/Main' 
       }    
       
       const  formEl       = document.querySelector('form');
       const  post_idEl      = document.querySelector('#post_id');
       
       // 회원가입버튼 클릭
       formEl.onsubmit   = function () {           
		   if(  post_idEl.value.trim() == ''  ) {
               alert('제목을 입력하세요')
               post_idEl.focus()
           	   return  false;
		   } 

		   return  true;
	   }
    </script> 
  
  </main>
</body>
</html>















