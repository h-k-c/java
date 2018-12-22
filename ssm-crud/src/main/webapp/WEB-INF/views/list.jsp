<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>员工信息</title>
<%
		pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
	<!-- jQuery (Bootstrap 的所有 JavaScript 插件都依赖 jQuery，所以必须放在前边) -->
    <script type="text/javascript" src="${APP_PATH}/static/js/jquery.min.js"></script>
    <!-- 加载 Bootstrap 的所有 JavaScript 插件。你也可以根据需要只加载单个插件。 -->
    <script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <!-- 引入css样式 -->
 	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<!-- 搭建显示页面 -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>SSM-CRUD</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		 <div class="col-md-4 col-md-offset-8">
		 	<button class="btn btn-primary">新增</button>
		 	<button class="btn btn-success">删除</button>
		 </div>
	</div>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover">
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
				<c:forEach items="${pageInfo.list }" var="emp">
				<tr>
					<th>${emp.tmpId}</th>
					<th>${emp.tmoName}</th>
					<th>${emp.gender}</th>
					<th>${emp.email }</th>
					<th>${emp.department.deptName }</th>
					<th>
						<button class="btn btn-primary btn-sm">
							<span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
							新增
						</button>
						<button class="btn btn-danger btn-sm">
							<span class="glyphicon glyphicon-remove-sign" aria-hidden="true"></span>
							删除
						</button>
					</th>
				</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	<!-- 显示分页信息 -->
	<div class="row">
		<!-- 分页文字信息 -->
		当前${pageInfo.pageNum }页,总共有${pageInfo.pages }页,总共有${pageInfo.total }条记录
			<div calss="col-md-6">
				<nav aria-label="Page navigation">
				  <ul class="pagination">
				  <li><a href="${APP_PATH }/emps?pn=1">首页</a></li>
				  <c:if test="${pageInfo.hasPreviousPage }">
				    <li>
				      <a href="${APP_PATH }/emps?pn=${page_num-1}" aria-label="Previous">
				        <span aria-hidden="true">&laquo;</span>
				      </a>
				    </li>
				  </c:if>
				    <c:forEach items="${pageInfo.navigatepageNums }" var="page_num">
				    	<c:if test="${page_num==pageInfo.pageNum }">
				    		<li class="active"><a href="#">${page_num }</a></li>
				    	</c:if>
				    	<c:if test="${page_num!=pageInfo.pageNum }">
				    		<li><a href="${APP_PATH }/emps?pn=${page_num}">${page_num }</a></li>
				    	</c:if>
				    </c:forEach>
				    
				    
				    <c:if test="${pageInfo.hasNextPage }">
					    <li>
					      <a href="${APP_PATH }/emps?pn=${page_num+1}" aria-label="Next">
					        <span aria-hidden="true">&raquo;</span>
					      </a>
					    </li>
				    </c:if>
				     <li><a href="${APP_PATH }/emps?pn=${pageInfo.pages}">末页</a></li>
				  </ul>
				</nav>
			</div>
			<!-- 分页条信息 -->
			<div calss="col-md-6"></div>
		</div>
</div>
</body>
</html>