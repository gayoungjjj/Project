<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        body {
            display: flex;
            flex-direction: column;
            align-items: center;
            justify-content: center;
            background-color: #F5F6F8; 
        }
        .container {
            background-color: #FFFFFF;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            padding: 20px;
            width: 90%;
            max-width: 500px;
        }
        img {
            height: 200px; 
        }
        h2 {
            text-align: center;
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
        input[type="email"] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"] {
            background-color: #2759FF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%; 
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover {
            background-color: #405DAB;
        }
        .red { color: red; }
        .green { color: green; }
    </style>
</head>
<body>
	<img src="/img/로고.png"  alt=회사로고/>
	<div class="container">
	<h2>기업 등록</h2>
	<form action="/Company/CompanySignupForm" method="POST">
		<table>
			<tr>
            	<td colspan="2">
            	<input type="text" name="compname" placeholder="기업명" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="ceo" placeholder="대표이사" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="phone_number" placeholder="전화번호" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="address" placeholder="주소" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="business_type" placeholder="업종"  />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
                <input type="submit" value="등록하기" />
            	</td>
            </tr>
		</table>
	</form>
 </div>
</body>
</html>