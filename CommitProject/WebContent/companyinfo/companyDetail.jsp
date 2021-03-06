<%@page import="java.util.List"%>
<%@page import="kr.or.ddit.commit.vo.CompanyVO"%>
<%@page import="kr.or.ddit.commit.service.CompanyInfoServiceImpl"%>
<%@page import="kr.or.ddit.commit.service.ICompanyInfoService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-3.6.0.min.js"></script>



<style>
	img {
		width: 80px;
		height: 80px;
	}
	span:before {
	    display: inline-block;
	    margin: 3px 8px 0;
	    width: 1px;
	    height: 12px;
	    vertical-align: top;
	    background: #e1e1e1;
	    content: "";
	}
	.logo {
		float: left;
		border-radius: 20px
	}
	.logoright {
		float: left;
		margin-left:20px;
	}
	ul {
		display: block;
		float:left;
		
	}
	.salesincome {
		list-style-type: none;
		float:left;
		margin-left:10px;
		width: 100px;
		height: 60px;
		text-align: center;
		background: #f4f6fa;
		border-radius: 15px;
		padding-top: 5px
	}
	.mainobject{
		
		float:left;
		clear:both;
		background: white;
		width: 800px;
		border-radius: 15px;
		margin-bottom: 15px;
		padding-left: 100px;
		padding-top: 30px;
	}
	a{
		text-decoration: none;
		color: #000;
		
		display: inline-block;
	}
	
</style>
</head>
<body>
<%
	String comname = request.getParameter("comname");
	ICompanyInfoService service = CompanyInfoServiceImpl.getInstance();
	List<CompanyVO> list = null;
	list = service.searchCompany(comname);
	if(list != null){
		for(CompanyVO cvo : list){
			
%>

<div class="mainobject">
	<img src="/CommitProject/companylogo/<%=cvo.getCom_img()%>" class="logo">
	<div class="logoright">
		<div id="ad">
		<font size="5"><b><a href="<%=request.getContextPath()%>/companyinfo/companyAll.jsp?mem_id=<%=cvo.getMem_id()%>"><%=cvo.getCom_name() %>
		</a></b></font>&nbsp;&nbsp;채용중인공고 0개<br>
			<div>
				<span><%=cvo.getCom_job() %></span>
				<span><%=cvo.getCom_div() %></span>
				<span><%=cvo.getCom_addr1().substring(0, 2) %></span>
				<span><%=cvo.getCom_bir().substring(0, 10) %></span>
			</div>
		</div>
		<div id="box">
			<ul>
				<li class="salesincome">연간 매출액<br><%=cvo.getCom_sales().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %></li>
				<li class="salesincome">평균 연봉<br><%=cvo.getCom_income().replaceAll("\\B(?=(\\d{3})+(?!\\d))", ",") %></li>
					<li class="salesincome">사원수<br><%=cvo.getCom_memnum()%></li>
			</ul>
		</div>
		
	</div>
</div>

<%
		}
	}
%>

</body>
</html>