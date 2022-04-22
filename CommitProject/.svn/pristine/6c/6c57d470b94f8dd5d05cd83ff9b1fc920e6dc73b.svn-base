<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>Insert title here</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://www.google.com/recaptcha/api.js?onload=onloadCallback&render=explicit"
    async defer>
</script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style type="text/css">
#company{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	width: 600px;
	margin-left: 100px;
	padding-left: 80px;
	margin-top: 50px;
	padding-top: 20px;
	padding-bottom: 20px;
}
</style>
<script type="text/javascript">
      var onloadCallback = function() {
        grecaptcha.render('div_reCAPTCHA', {
          'sitekey' : '6LdETqcdAAAAAFm4W-roB2VlEKTDgH78O-LzaQKA'
        });
      };
      
      function stopSubmitEvent(e){
    	  e.stopPropagation();
    	  e.preventDefault();
      }
      
      var isCaptchaSuccess = false;
      function successCaptcha(){
    	  isCaptchaSuccess = true;
      }
      
      function writeOK(){
    	  
    	  	id = $('#company_id').val();
			if(id.length < 1){
				alert("아이디를 입력해주세요");
				return false;
			}
			idval = $("#company_id").val().trim();
			idreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(!(idreg.test(idval))){
				$("#company_id").css('border', '2px solid red');
				$('#idCheck').prop('disabled', true);
				return false;
			} else {
				$("#company_id").css('border', '2px solid blue');
				$('#idCheck').prop('disabled', false);
			}
			
			pass = $('#company_pass').val();
			if(pass.length < 1){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			pwdval = $('#company_pass').val().trim();
	        pwdreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{8,20}$/
	        if(!(pwdreg.test(pwdval))){
	           $('#company_pass').css('border', '2px solid red');
	           alert("비밀번호는 대소문자,특수문자,숫자 포함 8~20자를 입력해주세요")
	           return false;
	        }else{
	           $('#company_pass').css('border', '2px solid blue');
	        }
			pass2 = $('#company_pass2').val();
			if(pass2.length < 1){
				$('#company_pass').css('border', '2px solid red');
				alert("비밀번호 확인을 입력해주세요");
				return false;
			}
			if(pass != pass2){
				$('#company_pass').css('border', '2px solid red');
				alert("비밀번호를 확인해주세요");
				return false;
			}
			
			name = $('#company_name').val();
			if(name.length < 1){
				alert("기업이름을 입력해주세요");
				return false;
			}
			
			tel = $('#company_tel').val();
			if(tel.length < 1){
				alert("전화번호를 입력해주세요");
				return false;
			}
			hpval = $('#company_tel').val().trim();
	        hpreg = /^\d{2,3}-\d{3,4}-\d{4}$/
	        if(!(hpreg.test(hpval))){
	           $('#company_tel').css('border', '2px solid red');
	           alert("사업자 등록번호를 확인해주세요")
	           return false;
	        }else{
	           $('#company_tel').css('border', '2px solid blue');
	        }
	        registration = $('#company_registration').val();
			if(registration.length < 1){
				alert("사업자등록번호를 입력해주세요");
				return false;
			}
			registrationval = $('#company_registration').val().trim();
			registrationreg = /^\d{3}-\d{2}-\d{5}$/
	        if(!(registrationreg.test(registrationval))){
	           $('#company_registration').css('border', '2px solid red');
	           return false;
	        }else{
	           $('#company_registration').css('border', '2px solid blue');
	        }
	        mail = $('#company_url').val();
			if(mail.length < 1){
				alert("홈페이지을 입력해주세요");
				return false;
			}
			mailval = $('#company_url').val().trim();
			mailreg = /^([a-zA-Z0-9\w]+\.*)+[a-zA-Z0-9]{2,4}$/;
	        if(!(mailreg.test(mailval))){
	           $('#company_url').css('border', '2px solid red');
	           return false;
	        }else{
	           $('#company_url').css('border', '2px solid blue');
	        }
	        
			if(!isCaptchaSuccess){
	    		  alert("'로봇이 아닙니다'를 선택하여 reCAPTCHA를 실행하세요");
	    		  return false;
	    	}
    	  	document.frm.submit();
      }
</script>
<script>

$(function(){
	$("#idCheck").on('click', function(){
		idvalue = $('#company_id').val().trim();
		if(idvalue.length < 1){
			alert("ID를 입력하세요");
			return false;
		}
		idval = $("#company_id").val().trim();
		idreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if(!(idreg.test(idval))){
			$("#company_id").css('border', '2px solid red');
			return false;
		} else {
			$("#company_id").css('border', '2px solid blue');
		}
		$.ajax({
			url : '/CommitProject/checkId.do',
			data : {"id" : idvalue},
			type : 'post',
			success : function(res){
				$('#idChkResult').html(res.sw).css('color', 'red');
			},
			error : function(xhr){
				alert("상태 : " + xhr.status);
			},
			dataType : 'json'
		})
	})
	
       
      $('#but').on('click',function(){
    	      dongvalue = $('#dong').val().trim();
    	      console.log(dongvalue);
    	      
    	      if(dongvalue.length < 1){
    	         alert("입력하세요");
    	         return false;
    	      }
    	      
    	      $.ajax({
    	         url : "<%=request.getContextPath()%>/ZipSearch.do",
    	         data : {"dong" : dongvalue},
    	         type : 'post',
    	         success : function(res){
    	            str = "<table>"
    	            str += "<tr><td>우편번호</td>";
    	            str += "<td>주소</td><td>번지</td></tr>";
    	            $.each(res, function(i,v){
    	               str += "<tr class='ziptr'><td>"+ res[i].zipcode +"</td>";
    	               str += "<td>"+v.addr+"</td><td>"+v.bunji+"</td></tr>";   
    	               
    	            })
    	            str += "</table>";
    	            $('#result').html(str);
    	            
    	         },
    	         error : function(xhr){
    	            alert("상태 : " + xhr.status)
    	         },
    	         dataType : 'json'
    	      })
    	})


    	$(document).on('click', '.ziptr', function(){
    	         zip = $('td:eq(0)',this).text(); //this가 가리키는건 .ziptr
    	         addr = $('td:eq(1)',this).text();
    	         
    	         $('#zip').val(zip); //opener는 자바의 super
    	         $('#add1').val(addr);
    	         
    	         //실행결과 지우기
    	         //$('#dong').val(""); //val()가져오는거, val("") ""으로 변경
    	         //$('#result').empty();
    	         
    	         $('#myModal').modal('hide');
    	         
    	 })
    	 $("#myModal").on('hide.bs.modal', function(){
    	          //실행결과 지우기
    	          $('#dong').val(""); //val()가져오는거, val("") ""으로 변경
    	          $('#result').empty();
    	 });
		
})

</script>
 <style>
 .ziptr:hover{
    background : blue;
 }
 .col-sm-2 {
 	display : inline-block;
 }
 </style> 



</head>
<body>
<div id="company">
<form name="frm" id="memberForm" enctype="multipart/form-data" action="<%=request.getContextPath() %>/companyInsert.do" target="_top" method="post" onsubmit="javascript:stopSubmitEvent(event);">
<table>
<tr>
	<td>회원ID</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_id" id="company_id"></div>
		<input type="button" id="idCheck" value="중복확인"><br><br>
		<span id="idChkResult"></span>
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td>
	<div class="col-sm-2" style="width: auto;"><input type="password" class="form-control" name="company_pass" id="company_pass"></div>
	</td>
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="password" class="form-control" name="company_pass2" id="company_pass2"></div></td>
</tr>
<tr>
	<td>기업이름</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_name" id="company_name"></div></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_tel" id="company_tel"></div></td>
</tr>
<tr>
	<td>사업자 등록번호</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_registration" id="company_registration"></div></td>
</tr>
<tr>
	<td>홈페이지</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_url" id="company_url"></div></td>
</tr>
<tr>
	<td>대표자 명</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="company_ceo" id="company_ceo"></div></td>
</tr>
<tr>
	<td>회사로고</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="file" name="company_img"></div></td>
</tr>
<tr>
	<td>기업 주요 직종</td>
	<td><div class="col-sm-2" style="width: auto;">
			<input type="radio" name="jobdiv" value="서버/백엔드 개발">서버/백엔드 개발
			<input type="radio" name="jobdiv" value="프론트엔드 개발">프론트엔드 개발
			<input type="radio" name="jobdiv" value="웹 풀스택 개발">웹 풀스택 개발<br>
			<input type="radio" name="jobdiv" value="안드로이드 개발">안드로이드 개발
			<input type="radio" name="jobdiv" value="ios 개발">ios 개발
			<input type="radio" name="jobdiv" value="크로드 플랫폼 앱개발">크로드 플랫폼 앱개발
			<input type="radio" name="jobdiv" value="게임 클라이언트 개발자">게임 클라이언트 개발자
			<input type="radio" name="jobdiv" value="DBA">DBA
		</div>
	</td>
</tr>
<tr>
	<td>기업 분류</td>
	<td><div class="col-sm-2" style="width: auto;">
			<input type="radio" name="companydiv" value="대기업">대기업
			<input type="radio" name="companydiv" value="중견기업">중견기업
			<input type="radio" name="companydiv" value="중소기업">중소기업
		</div>
	</td>
</tr>
<tr>
	<td>생년월일</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="date" class="form-control" name="com_bir" id="com_bir"></div></td>
</tr>
<tr>
	<td>연간 매출액</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="com_sales" id="com_sales"></div></td>
</tr>
<tr>
	<td>사원 평균연봉</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="com_income" id="com_income"></div></td>
</tr>
<tr>
	<td>사원수</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="com_memnum" id="com_memnum"></div></td>
</tr>
<tr>
	<td>우편번호</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="sample6_postcode" placeholder="우편번호" name="sample6_postcode"></div>
		<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="sample6_address" name="sample6_address" placeholder="주소"><br></div>
	</td>
</tr>
<tr>
	<td>상세주소</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="sample6_detailAddress" name="sample6_detailAddress" placeholder="상세주소"><input type="text" class="form-control" id="sample6_extraAddress" placeholder="참고항목"></div>
	</td>
</tr>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                if(data.userSelectedType === 'R'){
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
<tr>
	<td colspan="2" style="text-align:center;">
		<div id="div_reCAPTCHA" data-callback="successCaptcha"></div>
	</td>
</tr>
<tr>
	<td colspan="2" style="text-align:center;">
		<button type="submit" id="join" onclick="javascript:writeOK()">저장하기</button>
		<input type="reset" value="취소">
	</td>
</tr>


</table>
</form>
</div>

</body>
</html>


