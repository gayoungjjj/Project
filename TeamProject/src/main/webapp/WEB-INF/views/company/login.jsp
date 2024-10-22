<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원 로그인</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            height: 100vh;
            margin: 0;
            background-color: #e0f7fa;
        }
        .container {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            width: 90%;
            max-width: 400px; 
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-bottom: 20px;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%; 
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #218838; 
        }
        .link-container {
            display: flex;
            justify-content: space-between;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>기업 로그인</h2>
        <form action="/Company/Login" method="post">
            <table>
                <tr>
                    <td>ID</td>
                    <td><input type="text" name="userid" required /></td>
                </tr>
                <tr>
                    <td>P/W</td>
                    <td><input type="password" name="password" required /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="로그인" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        <div class="link-container">
                            <input type="button" value="기업 회원가입" onclick="location.href='/Company/Signup'" />
                        </div>
                    </td>
                </tr>
            </table>
        </form>
            <a href="/">홈으로</a>
    </div>
</body>
</html>
