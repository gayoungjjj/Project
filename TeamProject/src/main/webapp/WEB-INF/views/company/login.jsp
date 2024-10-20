<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
 .firstcheck { display : inline-block;
 			   margin-right: 10px ;}

</style>

</head>
<body>
   <h2>사이트 이름</h2>
   <div class = "firstcheck"><a href="/Individual/Login">개인회원</a></div>
   <div class = "firstcheck"><a href="/Company/Login">기업회원</a></div>
   <!-- 기능 구현
   1. 로그인할때 db에서 id, 암호 확인하는 것
   2. 로그인 후 기업_메인화면으로 이동하게 하는 것  -->
   <form action="/Company/Login" method="POST">

       <table>
         <tr>
           <td>아이디</td>
           <td><input type="text" name="userid"  value="" /></td>
         </tr>
         <tr>
           <td>암호</td>
           <td><input type="password" name="password" value="" /></td>
         </tr>
         <tr>
           <td colspan="2" >
             <input type="submit" value="로그인" />
           </td>
           <td colspan="2">
             <input type="button" value="회원가입" id="goSignup" />
           </td>
         </tr>
       </table>
    </form>
   
   <script>
 
   
   const goSignup2 = document.getElementById("goSignup")
   goSignup2.onclick =function(){
	  location.href = '/Company/Signup'	   
   }
   
   </script>
</body>
</html>




