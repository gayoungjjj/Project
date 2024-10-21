<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원가입</title>
    <style>
        body {
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
            max-width: 600px; 
        }
        h2 {
            text-align: center;
            color: #00796b; 
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            margin-top: 20px;
        }
        td {
            padding: 10px;
        }
        input[type="text"],
        input[type="password"],
        input[type="email"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 10px 15px;
            border-radius: 5px;
            cursor: pointer;
            width: 49%; 
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #004d40;
        }
        .red { color: red; }
    </style>
</head>
<body>
    <div class="container">
        <h2>기업 회원가입</h2>
        <form action="/Company/Signup" method="POST">
            <table>
                <tr>
                    <td><span class="red">*</span>사용자 아이디</td>
                    <td><input type="text" name="user_id" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>비밀번호</td>
                    <td><input type="password" name="password" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>비밀번호 확인</td>
                    <td><input type="password" name="passwordCheck" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>사용자 이름</td>
                    <td><input type="text" name="username" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>기업명</td>
                    <td><input type="text" name="compname" required /></td>
                </tr>
                <tr>
                    <td>이메일</td>
                    <td><input type="email" name="email" /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>전화번호</td>
                    <td><input type="text" name="phone_number" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>가입일</td>
                    <td><input type="date" name="j_date" id="j_date" value="" readonly /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="가입하기" />
                        <input type="button" value="돌아가기" id="goLogin" />
                    </td>
                </tr>
            </table>
        </form>
    </div>

    <script>
        document.getElementById('goLogin').onclick = function() {
            location.href = '/Company/Login';
        };

        document.querySelector('form').onsubmit = function() {
            const password = document.querySelector('[name=password]').value;
            const passwordCheck = document.querySelector('[name=passwordCheck]').value;

            if (password !== passwordCheck) {
                alert('비밀번호가 일치하지 않습니다.');
                return false;
            }
            return true;
        };
    </script>
    <a href="/">홈으로</a>
</body>
</html>
