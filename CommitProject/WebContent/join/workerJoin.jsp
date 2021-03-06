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
<style type="text/css">
#user{
	border: 2px solid #93D8D9;
	border-radius: 15px;
	width: 600px;
	margin-left: 100px;
	padding-left: 100px;
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
    	  
    	  	id = $('#mem_id').val();
			if(id.length < 1){
				alert("아이디를 입력해주세요");
				return false;
			}
			idval = $("#mem_id").val().trim();
			idreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
			if(!(idreg.test(idval))){
				$("#mem_id").css('border', '2px solid red');
				$('#idCheck').prop('disabled', true);
				return false;
			} else {
				$("#mem_id").css('border', '2px solid blue');
				$('#idCheck').prop('disabled', false);
			}
			
			pass = $('#mem_pass').val();
			if(pass.length < 1){
				alert("비밀번호를 입력해주세요");
				return false;
			}
			pwdval = $('#mem_pass').val().trim();
	        pwdreg = /^(?=.*[A-Z])(?=.*[a-z])(?=.*[0-9])(?=.*[!@#$%^&*()_+]).{8,20}$/
	        if(!(pwdreg.test(pwdval))){
	           $('#mem_pass').css('border', '2px solid red');
	           return false;
	        }else{
	           $('#mem_pass').css('border', '2px solid blue');
	        }
			pass2 = $('#mem_pass2').val();
			if(pass2.length < 1){
				$('#mem_pass').css('border', '2px solid red');
				alert("비밀번호확인을 입력해주세요");
				return false;
			}
			if(pass != pass2){
				$('#mem_pass').css('border', '2px solid red');
				alert("비밀번호를 확인해주세요");
				return false;
			}
			
			name = $('#mem_name').val();
			if(name.length < 1){
				alert("이름을 입력해주세요");
				return false;
			}
			nameval = $('#mem_name').val().trim();
	        namereg = /^[가-힣]{2,5}$/
	        if(!(namereg.test(nameval))){
	           $('#mem_name').css('border', '2px solid red');
	           return false;
	        }else{
	           $('#mem_name').css('border', '2px solid blue');
	        }
	        
			gender = $('input[name=gender]:checked').val();
			if(gender == null){
				alert("성별을 입력해주세요");
				return false;
			}
			
			
			bir = $('#mem_bir').val();
			if(bir.length < 1){
				alert("생년월일을 입력해주세요");
				return false;
			}
			
			tel = $('#mem_tel').val();
			if(tel.length < 1){
				alert("전화번호를 입력해주세요");
				return false;
			}
			hpval = $('#mem_tel').val().trim();
	        hpreg = /^\d{2,3}-\d{3,4}-\d{4}$/
	        if(!(hpreg.test(hpval))){
	           $('#mem_tel').css('border', '2px solid red');
	           return false;
	        }else{
	           $('#mem_tel').css('border', '2px solid blue');
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
		idvalue = $('#mem_id').val().trim();
		if(idvalue.length < 1){
			alert("ID를 입력하세요");
			return false;
		}
		idval = $("#mem_id").val().trim();
		idreg = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;
		if(!(idreg.test(idval))){
			$("#mem_id").css('border', '2px solid red');
			$('#idChkResult').html("형식을 확인하세요").css('color', 'red');
			return false;
		} else {
			$("#mem_id").css('border', '2px solid blue');
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

<div id="user">
<form name="frm" id="memberForm" action="<%=request.getContextPath() %>/memberInsert.do" target="_top" method="post" onsubmit="javascript:stopSubmitEvent(event);">
<table>
<tr>
	<td>회원ID</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="mem_id" id="mem_id"></div>
		<input type="button" id="idCheck" value="중복확인">
		<br><br>
		<span id="idChkResult"></span>
	</td>
</tr>
<tr>
	<td>비밀번호</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="password" class="form-control" name="mem_pass" id="mem_pass"></div></td>
</tr>
<tr>
	<td>비밀번호 확인</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="password" class="form-control" name="mem_pass2" id="mem_pass2"></div></td>
</tr>
<tr>
	<td>회원이름</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="mem_name" id="mem_name"></div></td>
</tr>
<tr>
	<td>성별</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="radio" name="gender" value="남자">남자
		<input type="radio" name="gender" value="여자">여자</div></td>
</tr>
<tr>
	<td>생년월일</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="date" class="form-control" name="mem_bir" id="mem_bir"></div></td>
</tr>
<tr>
	<td>전화번호</td>
	<td><div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" name="mem_tel" id="mem_tel"></div></td>
</tr>
<tr>
	<td>우편번호</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="zip" placeholder="Enter zip" name="mem_zip"></div>
		<button data-toggle="modal" data-target="#myModal" type="button" class="btn btn-success btn-sm">번호검색modal</button>
	</td>
</tr>
<tr>
	<td>주소</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="add1" placeholder="Enter add1" name="mem_add1"></div>
	</td>
</tr>
<tr>
	<td>상세주소</td>
	<td>
		<div class="col-sm-2" style="width: auto;"><input type="text" class="form-control" id="add2" placeholder="Enter add2" name="mem_add2"></div>
	</td>
</tr>
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

<div class="modal fade" id="myModal" role="dialog">
    <div class="modal-dialog"> <!-- modal-sm, modal-lg, 아무것도 안쓰면 기본크기 -->
    
      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">Modal Header</h4>
        </div>
        <div class="modal-body">
           <h3>찾는 동 이름을 입력하세요</h3>
         <input type="text" name="dong" id="dong">
         <button type="button" id="but">검색</button>
         <br><br>
         <div id="result"></div>   
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </div>
      </div>
      
    </div>
  </div>

</body>
</html>


