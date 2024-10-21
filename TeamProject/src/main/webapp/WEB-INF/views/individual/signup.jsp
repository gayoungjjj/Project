<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
    <main>
        <h2>개인 회원가입</h2>
        <!-- 기능 구현
        1. form action 기능
        2. 아이디 중복확인
        3. 비밀번호 확인-->
        <form action="" method="POST">
            <table>
                <tr>
                    <td>사용자 아이디</td>
                    <td><input type="text" name="" required></td>
                </tr>
                <tr>
                    <td>비밀번호</td>
                    <td><input type="password" name="" required></td>
                </tr>
                <tr>
                    <td>비밀번호 확인</td>
                    <td><input type="password" name="" required></td>
                </tr>
                <tr>
                    <td>사용자 이름</td>
                    <td><input type="text" name="" required></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="" required></td>
                </tr>
                <tr>
                    <td>포인트</td>
                    <td><input type="text" name="" value="" readonly></td>
                </tr>
                <tr>
                    <td>가입일</td>
                    <td><input type="text" name="" readonly></td>
                </tr>
            </table>
            <input type="submit" value="회원가입">
        </form>
        <!-- 기능구현
        1. 홈화면으로 이동 -->
        <a href="./home">홈으로</a>
    </main>
</body>
</html>