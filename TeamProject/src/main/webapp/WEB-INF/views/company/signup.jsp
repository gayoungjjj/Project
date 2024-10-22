<%@ page language="java" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>기업 회원가입</title>
    <script src="https://code.jquery.com/jquery.min.js"></script>
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
        input[type="email"] {
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
        .green { color: green; }
    </style>
</head>
<body>
	
    <div class="container">
        <h2>기업 회원 등록</h2>
        <form action="/Company/SignupForm" method="POST">
            <table>
                <tr>
                    <td><span class="red">*</span>사용자 아이디</td>
                    <td>
                    <input type="text" name="user_id" required />
                    <input type="button"  id="dupCheck"   value="중복확인" />
                    <span id="dupResult"></span>
                    </td>
                </tr>
                <tr>
                    <td><span class="red">*</span>비밀번호</td>
                    <td><input type="password" name="password" id="password" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>비밀번호 확인</td>
                    <td><input type="password" id="passwordCheck" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>사용자 이름</td>
                    <td><input type="text" name="username" required /></td>
                </tr>
                <tr>
                    <td><span class="red">*</span>기업명</td>
                    <td><input type="text" name="compname" required />
                		<input type="button" value="기업 등록" 
                        onclick="location.href='/Company/CompanySignup'" />
                	</td>
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
                    <td colspan="2">
                        <input type="submit" value="가입하기" id=""/>
                        <input type="button" value="돌아가기" id="goLogin" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
    <script>
       let   dupCheckClicked = false;     
       
       document.getElementById('goLogin').onclick = function() {
	        location.href = '/Company/Login';
	    };
	    
       const  formEl          = document.querySelector('form');
       const  user_idEl       = document.querySelector('[name=user_id]');
       const  passwordEl   	  = document.querySelector('#password');
       const  passwordCheckEl = document.querySelector('#passwordCheck');
       const  usernameEl   	  = document.querySelector('[name=username]');
       const  dupCheckEl      = document.querySelector('#dupCheck');
       

       dupCheckEl.onclick = function() {
    	   dupCheckClicked = true;  
       }
       
       formEl.onsubmit   = function () {           
		   if(  useridEl.value.trim() == ''  ) {
               alert('아이디를 입력하세요')
               useridEl.focus()
           	   return  false;
		   } 
		   if( passwordEl.value.trim() == '' ) {
			   alert('비밀번호를 입력하세요')
               passwordEl.focus()
	           return  false;
		   }
		   if( passwordCheckEl.value.trim() == '' ) {
			   alert('비밀번호확인을 입력하세요')
               passwordCheckEl.focus()
	           return  false;
		   }          
           if( passwordEl.value != passwordCheckEl.value ) {
        	   alert('비밀번호가 일치하지 않습니다')
               passwordCheckEl.focus()
        	   return  false;
           }
           if( usernameEl.value.trim().length < 2 ) {
        	   alert('이름은 2자 이상 입력하세요')
               usernameEl.focus()
	           return  false;
		   }	

           if(  dupCheckClicked == false ) {
        	   alert('중복확인을 하세요')
               return false;
           }
		   return  true;
	   }
    </script> 
    <script>
       $( function() {
           $('#dupCheck').on('click', function() {
        	   $.ajax({
                   url  : '/Company/IdDupCheck', 
                   data : { user_id : $('[name=user_id]').val()  }  
               })
               .done( function( data ) {   
                   console.log(data)
                   if( data == '' ) {
                     let html = '사용가능한 아이디입니다'; 
                     dupCheckClicked = true;
                     $('#dupResult').html(html).addClass('green')
                   }  else  {  
                     let html = '사용할수 없는 아이디입니다'
                     dupCheckClicked = false;
                   	 $('#dupResult').html(html).addClass('red')
                   }
               })
               .fail( function(err) {
                   console.log(err)
               }) 
           })
       })     
    </script>

    <a href="/">홈으로</a>
</body>
</html>
