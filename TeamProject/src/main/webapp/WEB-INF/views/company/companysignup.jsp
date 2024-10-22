<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>기업 등록</h2>
	<form action="/Company/CompanySignupForm" method="POST">
		<table>
			<tr>
            	<td>기업명</td>
            </tr>
            <tr>
            	<td>사업자 번호</td>
            </tr>
            <tr>
            	<td>기업전화번호</td>
            </tr>
            <tr>
            	<td>주소</td>
            </tr>
            <tr>
            	<td>설립년도</td>
            </tr>
            <tr>
            	<td>대표성함</td>
            </tr>
            <tr>
            	<td>업종</td>
            </tr>
            <tr>
            	<td colspan="2">
                <input type="submit" value="등록하기" />
            	</td>
            </tr>
		</table>
	</form>
</body>
</html>