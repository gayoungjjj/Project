<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery.min.js"></script>
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
        input[type="file"],
        input[type="password"],
        input[type="email"] {
            width: 95%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }
        input[type="submit"],
        input[type="button"] {
            background-color: #2759FF;
            color: white;
            border: none;
            padding: 10px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%; 
            transition: background-color 0.3s;
        }
        input[type="submit"]:hover,
        input[type="button"]:hover {
            background-color: #405DAB;
        }
        .red { color: red; }
        .green { color: green; }
    </style>
</head>
<body>
	<img src="/img/로고.png"  alt=회사로고 onclick="location.href='/'"/>
	<div class="container">
	<h2>기업 등록</h2>
	<form action="/Company/CompanySignupForm" method="POST" enctype="multipart/form-data">
		<table>
			<tr>
            	<td colspan="2">
            	<input type="text" name="compname" placeholder="*기업명" required />
            	<input type="button"  id="dupCheck2"   value="중복확인" />
            	<span id="dupResult2"></span>
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="ceo" placeholder="*대표이사" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="phone_number" placeholder="*전화번호" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="address" placeholder="*주소" required />
            	</td>
            </tr>
            <tr>
            	<td colspan="2">
            	<input type="text" name="business_type" placeholder="업종"  />
            	</td>
            </tr>
            <tr>
    			<td colspan="2">
        		<input type="file" id="logo" name="logo" accept="image/*" required />
        		<small style="color: gray;">* 로고 이미지 등록(최대 2MB, JPG, PNG 형식만 가능)</small>
    			</td>
			</tr>
            <tr>
            	<td>
                <input type="submit" value="등록하기" />
                </td>
                <td>
                <input type="button" value="돌아가기" id="goLogin" />
            	</td>
            </tr>
		</table>
	</form>
 </div>
 <script>
 	let   dupCheck2Clicked = false;
 	
 	document.getElementById('goLogin').onclick = function() {
        location.href = '/Company/Signup';
    };
    
 	const  formEl          = document.querySelector('form');
 	const  compnameEl      = document.querySelector('[name=compname]');
 	const  dupCheck2El     = document.querySelector('#dupCheck2');
 	
 	dupCheck2El.onclick = function() {
 	   dupCheck2Clicked = true;  
    }
 	
 	formEl.onsubmit = function() {
 		
 		if (dupCheck2Clicked === false) {
            alert('중복확인을 해주세요');
            return false;
        }
 		alert('기업 등록이 완료되었습니다.');
        return true;           
    };
    </script>
    
    <script>
    	$( function() {
 	  	$('#dupCheck2').on('click', function() {  	   
 	   	const compname = $('[name=compname]').val().trim();
        if (compname === '') {
            alert('기업명을 입력하세요'); 
            $('[name=compname]').focus(); 
            return; 
        }

        	   $.ajax({
                   url  : '/Company/CompDupCheck', 
                   data : { compname : $('[name=compname]').val()  }  
               })
               .done( function( data ) {   
                   console.log(data)
                   if( data == '' ) {
                     let html = '등록 가능한 기업입니다.'; 
                     dupCheck2Clicked = true;
                     $('#dupResult2').html(html).addClass('green')
                   }  else  {  
                     let html = '이미 등록된 기업입니다.'
                     dupCheck2Clicked = false;
                   	 $('#dupResult2').html(html).addClass('red')
                   }
               })
               .fail( function(err) {
                   console.log(err)
                   alert('오류:다시 시도해주세요.');
               })
           })
       });  
    </script>
</body>
</html>