<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="icon" type="image/png" href="/img/favicon.png" />
<link rel="stylesheet"  href="/css/common.css" />


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




#aside {
    position:fixed;
    width: 300px;
    height:60px;
    bottom:90px;
    left:1400px;
    background-color:transparnet;

}

.asidesubmit{
  margin-left:22px;
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


/*이력서 css (끝)*/




  

</style>




</head>
<body>

<header style="margin-bottom: 10px;">
  <div class = "div1">
 	 <h1 class ="logo">
  		<a href="/Individual/Main"><img src="/img/로고.png"  alt=회사로고/></a>
 	 </h1>
 	 
    	 <div class="search">
  		<input type="text" placeholder="#픽미 는 당신의 취업을 응원합니다!! ">
  		<img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png" >
		</div>
 

   <nav class ="headernav">
    <ul class ="leftmenu"> 
   		<li><a href="/postList">채용공고</a></li>
   		<li><a href="/Individual/Resumereg">이력서 등록</a></li>
    	<li><a href="/Individual/ResumeManagement">등록 이력서 관리</a></li>  		
    	<li><a href="/Individual/Recommend">기업 추천</a></li>
    	<li><a href="/cs">고객센터</a></li>  
     </ul>   
     	 
    	 <div>
    		 <ul class="rightmenu"> 
     		 <li><a href="/Individual/Logout">로그아웃</a></li>
     		 <li><a href="/Individual/Mypage">마이페이지</a></li>
    		 </ul>
   		  </div>
   	 </nav>
   	</div> 
  </header>
 

     

 
 <body>
 
 <div class="div3">
 <form action="/Submit-Resume" method="POST">
  <h2 style="margin-top: -5px;text-align: center;">이력서작성</h2>


 <table  id="aside">
  <tr>
   <td>
   <input  class ="asidesubmit"type="submit" value="작성완료" >
   <input  class ="asidesubmit"type="button" value="이전으로" style="background-color: white; color:black"></td>
  </tr>
 </table>
 
 
 
 
  
  <table class= "totaltable" style="border: 1px #DDDDDD solid; padding: 30px; background-color: #E8ECEF ">
  <tr>
  <td>
     <h3 style="margin-top: -18px;">이력서 제목</h3>

 <table class ="resumetable" >

    <tr>
          <td style="width:800px;">
            <input class="resumeinput1" type="text" placeholder ="제목(필수)     (ex)기업에게 나에 대해 알려줍시다. 강점,목표 등을 넣은 제목을 작성해보세요!" style="width:800px; height:50px; font-size: 18px;" >
        	
           </td>
    </tr>
	</table>
 
 
  <h3>인적사항</h3> 
    <table class ="resumetable" >
    <tr>
          <td style="padding-top:10px; width:696px;"> 
            <input class="resumeinput1" type="text" placeholder ="이름(필수)"  value="${vo.username}">
        	<input class="resumeinput1" type="text" placeholder ="생년월일(필수)" name="">
            <select class="resumeinput1"> 
                <option>성별(필수)</option>
            	<option>남자</option>
           		<option>여자</option>
           	</select>
            <input class="resumeinput1" type="text" placeholder ="이메일(필수)" style="width:222px;" value="${vo.email}">
            <br><p>
            <input class="resumeinput1" type="text" placeholder ="전화번호" >
            <input class="resumeinput1" type="text"  value="${vo.phone_number}">
            <input class="resumeinput1" type="text" placeholder ="주소(필수)" style="width:377px;height: 50px;border: 1px #DDDDDD solid ;" value="${vo.address}">            
           		<td rowspan="2"> 
           			<input class="resumeinput1" type="text" value="사진"  style="width:103px; height:120px; margin-left: -50 px; margin-bottom:5px; text-align:center;">
            	</td>

    </tr>
	</table>

<h3>경력사항</h3> 
    <table class ="resumetable">
       <tr>
         <td style="width:800px;" >
                  
           <select class="resumeinput1" name="" > 
        		<option>경력(필수)</option>
        		<option>신입</option>
        		<option>경력(1년 이상)</option>
        		<option>경력(3년 이상)</option>
        		        		
          </select>
       	   <input class="resumeinput1" type="text" placeholder="경력사항을 적어주십시오..   (ex) JAVA개발자 2년근무 " style="width:640px;">
       	   
        </td>
      </tr>
	</table>


  <h3>학력사항</h3> 
    <table class ="resumetable">
    <tr>
       <td style="width:800px;">
       <input class="resumeinput1" type="date" placeholder="제학기간 (ex) 2014-2-3"> ~
       <input class="resumeinput1" type="date" placeholder="제학기간">
        <select class="resumeinput1" name="" > 
        		<option>학력(필수)</option>
        		<option>대학원</option>
        		<option>대학교(4년)</option>
        		<option>대학교(2년)</option>
        		<option>고등학교 </option>
        		<option>검정고시 </option>
        		<option>그 외</option>
        </select>
       	   <select class="resumeinput1" name="" > 
        		<option>학력상태(필수)</option>
        		<option>학위(석사,박사)</option>
        		<option>졸업,졸업예정</option>
        		<option>재학중</option>
        		<option>중퇴</option>
        		<option>합격</option>
        		<option>기타 </option>
        </select>
         <input class="resumeinput1" type="text" placeholder="전공(대학교 선택시)" style="width:158px;">
         </td>
    </tr>
	</table>
    

<h3>자격증</h3> 
    <table class ="resumetable">
       <tr>
         <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="" placeholder="자격증1">
       	   <input class="resumeinput1" type="text" placeholder="발행처">
           <input class="resumeinput1" type="date" placeholder="취득월"> 
           <input class="resumeinput1" type="text" placeholder="예시) 컴퓨터활용1급" style="margin-left: 5px;">
           <input class="resumeinput1" type="text" placeholder="예시) 대한상공회의소" >
           <br><p>
       	   <input class="resumeinput1" type="text" name="" placeholder="자격증2">
       	   <input class="resumeinput1" type="text" placeholder="발행처">
           <input class="resumeinput1" type="date" placeholder="취득월">

           <br><p>
       	   <input class="resumeinput1" type="text" name="" placeholder="자격증3">
       	   <input class="resumeinput1" type="text" placeholder="발행처">
           <input class="resumeinput1" type="date" placeholder="취득월">
        </td>
      </tr>
	</table>




<h3>보유기술 및 능력</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
       	   <input class="resumeinput1" type="text" name="" placeholder="(ex) JAVA">
		   <input class="resumeinput1" type="text" name="" placeholder="보유 기술및 능력2">
		   <input class="resumeinput1" type="text" name="" placeholder="보유 기술및 능력3">
		   <input class="resumeinput1" type="text" name="" placeholder="보유 기술및 능력4">
		   <input class="resumeinput1" type="text" name="" placeholder="보유 기술및 능력5">
	    </td>
      </tr>
	</table>

   
   
<h3>포트폴리오</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <input class="resumeinput1" type="text" name="" placeholder="주소입력" style="width:500px;">
		   <input class="test" type="file" value="파일첨부" style="margin-left: 20px">
        </td>
      </tr>
	</table>
  

 <h3>자기소개서</h3> 
    <table class ="resumetable">
      <tr>
        <td style="width:800px;">
		   <textarea class = "resumeinput2" rows="10" cols="50" name=""  placeholder="자기소개서를 작성하세요(최대 500자)"></textarea></td>		
      </tr>
	</table>
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



</script>

</body>
</html>