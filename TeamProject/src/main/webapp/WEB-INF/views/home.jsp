<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Pick Me</title>
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
        h2 {
            margin-bottom: 20px;
        }
        .button-container {
            display: flex;
            justify-content: space-between;
            width: 80%; 
            max-width: 600px; 
        }
        .button {
            flex: 1; 
            margin: 0 10px; 
            padding: 20px; 
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            font-size: 18px; 
            transition: background-color 0.3s;
        } 
        .individual {
            background-color: #00796b; 
        }
        .company {
            background-color: #28a745; 
        }
        .individual:hover {
            background-color: #004d40; 
        }
        .company:hover {
            background-color: #218838; 
        }
        a {
            margin-top: 20px;
            color: #00796b; 
            text-decoration: none; 
        }
    </style>
</head>
<body>
	<h2>Pick Me</h2>
    <h2>어떤 회원 이신가요?</h2>
    <div class="button-container">
        <button class="button individual" onclick="location.href='/Individual/Login'">개인 로그인</button>
        <button class="button company" onclick="location.href='/Company/Login'">기업 로그인</button>
    </div>
</body>
</html>
