<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>사이트 이름</h2>
   <div><a href="/Individual/Login">개인회원</a></div>
   <div><a href="/Company/Login">기업회원</a></div>
   <!-- 기능 구현
   1. 로그인할때 db에서 id, 암호 확인하는 것
   2. 로그인 후 개인_메인화면으로 이동하게 하는 것  -->
   <form action="/Individual/Main" method="post">
       <table>
         <tr>
           <td>아이디</td>
           <td><input type="text" name=""  value="" /></td>
         </tr>
         <tr>
           <td>암호</td>
           <td><input type="password" name="" value="" /></td>
         </tr>
         <tr>
           <td colspan="2" >
             <input type="submit" value="로그인" />
           </td>
           <td colspan="2">
             <input type="button" value="회원가입" id="goSignup"/>
           </td>
         </tr>
       </table>
   </form>
   
   <script>
   <!-- 기능 구현
   1. 회원가입 창으로 가는것 -->
   </script>
</body>
</html>




