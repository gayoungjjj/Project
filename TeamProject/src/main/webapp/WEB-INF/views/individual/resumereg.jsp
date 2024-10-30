<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib  prefix="c"  uri="http://java.sun.com/jsp/jstl/core"  %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<title>Insert title here</title>
<link rel="stylesheet"  href="/css/common.css" />
<link rel="icon" type="image/png" href="/img/favicon.png" />

<style>
.div3{
background-color:#F7F7F7;
padding-top: 20px;
padding-bottom: 20px;
display:flex;
justify-content: center;
align-items: center;

}
  
/*이력서 css */

.resumeinput1{
width:150px;
height: 50px;
border: 1px #DDDDDD solid; 
}

.resumeinput2{
width:800px;
height:300px;
resize: none;
border: 1px #DDDDDD solid; }

.resumetable{
background-color:white;
padding: 10px 10px;
border: 1px solid #DBE0E9;
}

/*수정됨*/
.button-container {             
    display: flex;
    justify-content: center; 
    align-items: center; 
    padding-top: 20px;
}


/*수정됨*/
.asidesubmit{

  background-color:#4c5cc5;
  font-weight:bolder;
  font-size:15px;
  color:white;
  width:200px;
  margin-bottom:10px;
  height:40px;
  border: 1px #DDDDDD solid; 
  border-radius: 20px;
}

.red{color:red;}
/*이력서 css (끝)*/

</style>

</head>
<body>

<header style="margin-bottom: 10px;">
  <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main?user_id=${param.user_id}"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
 	 
    	 <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 취업을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
		</div>
 

   <nav class ="headernav">
    <ul class ="leftmenu"> 
   			<li><a href="/Individual/Postlist?user_id=${param.user_id}">채용공고</a></li>
   			<li><a href="/Individual/Resumereg?user_id=${param.user_id}">이력서 등록</a></li>
    		<li><a href="/Individual/ResumeList?user_id=${param.user_id}">등록 이력서 관리</a></li>  		
    		<li><a href="/Individual/Recommend?user_id=${param.user_id}">기업 추천</a></li>
    		<li><a href="/Individual/Bookmarking?user_id=${param.user_id}">PICK ME</a></li>
            <li><a href="/Individual/Cslist?user_id=${param.user_id}">고객센터</a></li>    
     </ul>   
     	 
    	 <div>
    		 <ul class="rightmenu"> 
     		 <li><a href="/Individual/Logout">로그아웃</a></li>
     		 <li><a href="/Individual/Mypage?user_id=${param.user_id}">마이페이지</a></li>
    		 </ul>
   		  </div>
   	 </nav>
   	</div> 
  </header>
 
<div class= "div2">
<a href="/Company/Main"><img src="/img/examplebanner.png" alt="예시 배너"></a>
</div>

 <body>
<div class="div3">
  <form  id="WriteForm" action="/Individual/Write" method="POST" >
  <h2 style="margin-top: -5px;text-align: center;">이력서작성</h2>


 
  <table class= "totaltable" style="border: 1px #DDDDDD solid; padding: 30px; background-color: #E8ECEF ">
  	<tr>
  	   <td>
  	   
         <h3 style="margin-top: -18px;">이력서 제목 <span class="red" style="font-size: 11px;">* 이력서 제목은 작성후 수정이 불가합니다. </span></h3> 
 			<table class ="resumetable" >
  		  	<tr>
          		<td style="width:800px;">
            	<input class="resumeinput1" type="text" name="title"  placeholder ="제목(필수)   (ex)기업에게 나에 대해 알려줍시다. 강점,목표 등을 넣은 제목을 작성해보세요!" style="width:800px; height:50px; font-size: 18px;" >
		        </td>
   			 </tr>
	</table>
 
 
  <h3>인적사항<span class="red" style="font-size: 11px;"> * 필수 기재 사항을 확인해주세요 </span></h3>   
    <table class ="resumetable" >
    <tr>
        <td style="padding-top:10px; width:800px;"> 
        <input type="hidden" name="user_id" value="${vo.user_id }">
            <input class="resumeinput1" type="text" name="username" value="${vo.username}" readonly>
        	<input class="resumeinput1" type="text" name="birth" placeholder ="생년월일(필수)"  >
            <select class="resumeinput1" name="gender" required> 
                <option value="">성별(필수)</option> <!-- value를 빈 문자열로 설정 -->
                <option value="남자">남자</option>
                <option value="여자">여자</option>
           	</select>
           	<input class="resumeinput1" type="text"     name="email"  value="${vo.email}" style="width:321px;" readonly>               <!-- 수정됨 -->
                <br><p>
            	<input class="resumeinput1" type="text" name="number2"   placeholder ="비상연락처" style="width:200px;" >
            	<input class="resumeinput1" type="text" name="phone_number"  value="${vo.phone_number}" style="width:200px;" readonly>   <!-- 수정됨 -->
            	<input class="resumeinput1" type="text" name="address"  value="${vo.address}" style="width:377px;height: 50px;border: 1px #DDDDDD solid ;" readonly>            
           		<!-- 수정됨  삭제함--> 
         </td>
    </tr>
	</table>

<h3>경력사항<span class="red" style="font-size: 11px;"> * 필수 기재 사항을 확인해주세요 </span></h3>  
    <table class ="resumetable">
       <tr>
         <td style="width:800px;" >
                  
           <select class="resumeinput1" name="career" > 
        		<option value="">경력(필수)</option>
        		<option value="신입">신입</option>
        		<option value="경력(1년 이상)">경력(1년 이상)</option>
        		<option value="경력(3년 이상)">경력(3년 이상)</option>
        		        		
          </select>
       	   <input class="resumeinput1" type="text"  name ="careers" placeholder="경력사항을 적어주십시오..   (ex) JAVA개발자 2년근무 " style="width:640px;">
       	   
        </td>
      </tr>
	</table>


  <h3>학력사항<span class="red" style="font-size: 11px;"> * 필수 기재 사항을 확인해주세요 </span></h3>   
    <table class ="resumetable">
    <tr>
    
       <td style="width:800px;">

    <input class="resumeinput1" type="text" name="eduwhen" placeholder="제학기간 2018-02 ~ 2022-03"  style="width:250px;"> 
    <input class="resumeinput1" type="text" name="eduwher" placeholder="학교명" >                  <!-- 수정됨 -->
    


        <select class="resumeinput1" name="edu" style="width:220px;"> 
        		<option value="">최종학력(필수)</option>
        		<option value="학위(석사,박사)/(취득/예정)">학위(석사,박사)/(취득/예정)</option>
        		<option value="대학교(4년)/(졸업/예정)">대학교(4년)/(졸업/예정)</option>
        		<option value="대학(2년)/(졸업/예정)">대학(2년)/(졸업/예정) </option>
        		<option value="고등학교/(졸업/예정)">고등학교/(졸업/예정) </option>
        		<option value="기타">기타 </option>

        </select>
    
        

        
        <input class="resumeinput1" type="text" name= "major" placeholder="전공(대학/교 선택시)" style="width:158px;">
        </td>
    </tr>
	</table>
    

<h3>자격증</h3> 
    <table class ="resumetable">
       <tr>
         <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="licenses1"   placeholder="자격증1">
       	   <input class="resumeinput1" type="text" name="publisher1"  placeholder="발행처">
           <input class="resumeinput1" type="date" name="passdate1"   placeholder="취득월"> 
           <input class="resumeinput1" type="text" value="예시) 컴퓨터활용1급" style="margin-left: 5px;" readonly>
           <input class="resumeinput1" type="text" value="예시) 대한상공회의소" readonly>
           <br><p>
       	   <input class="resumeinput1" type="text" name="licenses2"   placeholder="자격증2">
       	   <input class="resumeinput1" type="text" name="publisher2"  placeholder="발행처">
           <input class="resumeinput1" type="date" name="passdate2"   placeholder="취득월">

           <br><p>
       	   <input class="resumeinput1" type="text" name="licenses3"   placeholder="자격증3">
       	   <input class="resumeinput1" type="text" name="publisher3"  placeholder="발행처">
           <input class="resumeinput1" type="date" name="passdate3"   placeholder="취득월">
        </td>
      </tr>
	</table>




<h3>보유기술 및 능력</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="skills1" placeholder="(ex) JAVA">
		   <input class="resumeinput1" type="text" name="skills2" placeholder="보유 기술및 능력2">
		   <input class="resumeinput1" type="text" name="skills3" placeholder="보유 기술및 능력3">
		   <input class="resumeinput1" type="text" name="skills4" placeholder="보유 기술및 능력4">
		   <input class="resumeinput1" type="text" name="skills5" placeholder="보유 기술및 능력5">
	    </td>
      </tr>
	</table>

   
   
<h3>포트폴리오</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <input class="resumeinput1" type="text" name="portfolio" placeholder="주소입력" style="width:500px;">
		   <input class="test" type="file" value="파일첨부" style="margin-left: 20px">
        </td>
      </tr>
	</table>
  

 <h3>자기소개서</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <textarea class = "resumeinput2" rows="10" cols="50" name="selfintro"  placeholder="자기소개서를 작성하세요(최대 500자)"></textarea></td>			  
		 
      </tr>
	</table>
	
    <!--  수정됨  --> 
	<div class="button-container">
    <table>
        <tr>
            <td class="endbutton">
                <button class="asidesubmit"  type="submit"  id="checkForm">작성완료</button>   
                <input class="asidesubmit" type="button" value="이전으로" id="goList" style="background-color: white; color: black">
            </td> 
        </tr>
    </table>
</div>
	
	
	
	
    </td>
    </tr>
  
     </table>
      </form>
</div>
   
 <!-- 이름 추가, 아이디 x ,공고제목 , 경력 ,학력 ,기술 ,자격증 ,포트폴리오 , 자기소개서 --> 
  
 <footer>
  <div class="footer1">
   <p><small>&copy; 2024 All rights reserved 픽미</small></p>
  </div>
 </footer>


<script>

const  goList = document.getElementById('goList')
goList.onclick = function() {
   location.href = '/Individual/Main?user_id=${param.user_id}'
};



document.getElementById('checkForm').onclick = function(event) {
    event.preventDefault(); // 기본 제출 동작 방지
    
    const userId = '${param.user_id}';
    const title = document.querySelector('input[name="title"]');
    const birth = document.querySelector('input[name="birth"]');
    const gender = document.querySelector('select[name="gender"]');
    const career = document.querySelector('select[name="career"]');
    const edu = document.querySelector('select[name="edu"]');

    // 필수 입력란 검증
    if (!title.value ) {
        alert("제목을 입력해 주세요.");
        title.focus();
        return false;
    }
    if (birth.value.length !== 8) {
        alert("생년월일을 다시 확인해 주세요.\n (예시) 20241029 ");
        birth.focus();
        return false;
    }
    if (gender.value === "") {
        alert("성별을 선택해 주세요.");
        gender.focus();
        return false;
    }
    if (career.value === "") {
        alert("경력을 선택해 주세요.");
        career.focus();
        return false;
    }
    if (edu.value === "") {
        alert("최종 학력을 선택해 주세요.");
        edu.focus();
        return false;
    }
    console.log('모든 검증을 통과했습니다. AJAX 요청을 보냅니다.'); 
    
    $.ajax({
        url: '/Individual/Checktitle', // 제목 중복 확인 API URL
        type: 'POST', // POST 메서드 사용
        contentType: 'application/json',
        data: JSON.stringify({
            user_id: userId,
            title: title.value // title.value로 수정
        }),
        success: function(response) {
            if (response.submitted) {
                alert("이미 같은 제목의 이력서가 등록되어있습니다. 다른 제목을 입력해 주세요.");
                title.focus();
            } else {
                // 모든 검증 통과 후 폼 제출
                document.getElementById('WriteForm').submit();
            }
        },
        error: function() {
            alert("제목 중복 확인 중 오류가 발생했습니다.");
        }
    });
};

</script>

</body>
</html>