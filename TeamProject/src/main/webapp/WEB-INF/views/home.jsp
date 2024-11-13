<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pick Me</title>
    <style>
body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #F5F6F8; 
        }  
        img {
            height: 200px; 
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            width: 600px;
            height: 200px;
            margin: 50px;
        }
        .button {
            flex: 1; 
            margin:  10px; 
            padding: 10px; 
            border: none;
            border-radius: 4px;
            color: white;
            cursor: pointer;
            font-size: 25px; 
            transition: background-color 0.3s;
            background-color: #2759FF
        } 
        .button:hover {
            background-color: #405DAB; 
        }
    </style>
</head>
<body>
	<img src="/img/로고.png"  alt=회사로고/>
    <h2>어떤 회원 이신가요?</h2>
    <div class="button-container">
        <button class="button individual" onclick="location.href='/Individual/Login'">개인 로그인</button>
        <button class="button company" onclick="location.href='/Company/Login'">기업 로그인</button>        
    </div>
</body>
</html>
