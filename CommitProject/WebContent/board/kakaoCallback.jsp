<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<script type="text/javascript">
var email 
Kakao.init('dcd8f89b69b4974502641f42cedac963');
Kakao.Auth.login({
	success: function(authObj){
		Kakao.API.request({
			url:'/v2/user/me',
			success:function(res){
				console.log(res);
				email = res.kakao_account.email
			}
		})
		
		token = authObj.access_token;
	}
})
location.href = "<%=request.getContextPath()%>/membermake.do?mem_id" + email;
</script>
</head>
<body>

</body>
</html>