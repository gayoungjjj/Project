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
       
       <!-- 기능 구현 
       1. 로그인을 누르면 각 화면으로 가는 것
       2. 회원가입 누르면 각 화면으로 가는 것 -->
       
       <!-- 로그인 기능 전 화면 확인 용 -->
       <div><a href="/Individual/Main">개인메인화면</a></div>
       <div><a href="/Company/Main">기업메인화면</a></div>
</body>
</html>




