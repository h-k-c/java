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
<!-- 员工添加 -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="myModalLabel">员工信息添加</h4>
      </div>
      <div class="modal-body">
        <form class="form-horizontal">
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">员工名字</label>
		    <div class="col-sm-10">
		      <input type="text" name="tmoName" class="form-control" id="empName_add_input" placeholder="用户姓名">
		    	 <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">用户邮箱</label>
		    <div class="col-sm-10">
		      <input type="email" name="email" class="form-control" id="empEmail_add_input" placeholder="用户邮箱">
		    	 <span id="helpBlock2" class="help-block">A block of help text that breaks onto a new line and may extend beyond one line.</span>
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">选择性别</label>
		    <div class="col-sm-10">
		      <label class="radio-inline">
				  <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
			  </label>
			  <label class="radio-inline">
				  <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
			   </label>
		    </div>
		  </div>
		  <div class="form-group">
		    <label  class="col-sm-2 control-label">部门</label>
			 <div class="col-sm-4">
			 <!-- 部门提交的id即可 -->
			 	<select class="form-control" name="dId"></select>
			 </div>
		  </div>
		</form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
        <button type="button" class="btn btn-primary" id="emp_save_btn">保存修改</button>
      </div>
    </div>
  </div>
</div>
<!-- 搭建显示页面 -->
<div class="container">
	<!-- 标题 -->
	<div class="row">
		<div class="col-md-12">
			<h1>个人信息管理</h1>
		</div>
	</div>
	<!-- 按钮 -->
	<div class="row">
		 <div class="col-md-4 col-md-offset-8">
		 	<button class="btn btn-primary" id="emp_add_model_btn">新增</button>
		 	<button class="btn btn-success">删除</button>
		 </div>
	</div>
	<!-- 显示表格数据 -->
	<div class="row">
		<div class="col-md-12">
			<table class="table table-hover" id="emps_table">
			<thead>
				<tr>
					<th>#</th>
					<th>Name</th>
					<th>gender</th>
					<th>email</th>
					<th>deptName</th>
					<th>操作</th>
				</tr>
			</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
	</div>
	<!-- 显示分页信息 -->
	<div class="row" >
		<!-- 分页文字信息 -->
			<div calss="col-md-6" id="page_info_area"></div>
			<!-- 分页条信息 -->
			<div calss="col-md-6" id="page_nav_area"></div>
		</div>
</div>
<script type="text/javascript">
	var totalRecord;
	//直接发送一個Ajax請求,到分頁數據
	$(function(){
		to_page(1);
	});
	$(function(){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn=1",
			type:"GET",
			success:function(result){
				//解析并显示数据
				//console.log(result);
				//解析并显示员工信息
				build_emps_table(result);
				//解析并显示分页信息
				build_page_info(result);
				//显示分页条
				build_page_nav(result);
				
			}
		});
	});
	function to_page(pn){
		$.ajax({
			url:"${APP_PATH}/emps",
			data:"pn="+pn,
			type:"GET",
			success:function(result){
				//解析并显示数据
				//console.log(result);
				//解析并显示员工信息
				build_emps_table(result);
				//解析并显示分页信息
				build_page_info(result);
				//显示分页条
				build_page_nav(result);
				
			}
		});
	}
	//显示员工数据
	function build_emps_table(result){
		//清空之前的数据
		$("#emps_table tbody").empty();
		var emps=result.extend.pageInfo.list;
		$.each(emps,function(index,item){
			//alert(item.tmoName);
			var empIdTd=$("<td></td>").append(item.tmpId);
			var empNameTd=$("<td></td>").append(item.tmoName);
			var genderTd=$("<td></td>").append(item.gender=='M'?'男':'女');
			var emailTd=$("<td></td>").append(item.email);
			var deptNameTd=$("<td></td>").append(item.department);
			var editBtn=$("<button></button>").addClass("btn btn-primary btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
			var delBtn=$("<button></button>").addClass("btn btn-danger btn-sm").append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			var btn=$("<td></td>").append(editBtn).append(" ").append(delBtn);
			$("<tr></tr>").append(empIdTd).append(empNameTd).append(genderTd).append(emailTd).append(deptNameTd).append(btn).appendTo("#emps_table tbody");
		});
	}
	//显示分页信息
	function build_page_info(result){
		$("#page_info_area").empty();
		$("#page_info_area").append("当前是"+result.extend.pageInfo.pageNum+"页"+",总共"+result.extend.pageInfo.pages+"页,总"+result.extend.pageInfo.total+"条记录");
		totalRecord=result.extend.pageInfo.total;
	}
	//显示分页条
	function build_page_nav(result){
		$("#page_nav_area").empty();
		var ul=$("<ul></ul>").addClass("pagination");
		var firstPageLi=$("<li></li>").append($("<a></a>").append("首页").attr("href","#"));
		var prePageLi=$("<li></li>").append($("<a></a>").append("&laquo;"));
		if(result.extend.pageInfo.hasPreviousPage==false){
			firstPageLi.addClass("disabled");
			prePageLi.addClass("disabled");
		}
		firstPageLi.click(function(){
			to_page(1);
		});
		prePageLi.click(function(){
			var item=result.extend.pageInfo.pageNum;
			to_page(item-1);
		});
		var nextPageLi=$("<li></li>").append($("<a></a>").append("&raquo;"));
		var LastPageLi=$("<li></li>").append($("<a></a>").append("末页").attr("href","#"));
		if(result.extend.pageInfo.hasNextPage==false){
			nextPageLi.addClass("disabled");
			LastPageLi.addClass("disabled");
		}
		else{
			nextPageLi.click(function(){
				var item=result.extend.pageInfo.pageNum;
				to_page(item+1);
			});
			LastPageLi.click(function(){
				var item=result.extend.pageInfo.pages;
				to_page(item);
			});
		}
		ul.append(firstPageLi).append(prePageLi);
		$.each(result.extend.pageInfo.navigatepageNums,function(index,item){
			
			var numLi=$("<li></li>").append($("<a></a>").append(item));
			if(result.extend.pageInfo.pageNum==item){
				numLi.addClass("active");
			}
			numLi.click(function(){
				to_page(item);
			});
			ul.append(numLi);
		});
		ul.append(nextPageLi).append(LastPageLi);
		var navEle=$("<nav></nav>").append(ul);
		navEle.appendTo("#page_nav_area");
	}
	
	<!--弹出文本框进行编辑-->
	$("#emp_add_model_btn").click(function(){
		<!--进行数据查询-->
		getDepts();	
		$("#empAddModal").modal({
			<!--设置背景存在-->
			//backdrop:"static";
		});
	});
	
	function getDepts(){
		$.ajax({
			url:"${APP_PATH}/depts",
			type:"GET",
			success:function(result){
				//console.log(result);
				$.each(result.extend.depts,function(){
					var optionEle=$("<option></option>").append(this.deptName).attr("value",this.deptId);
					optionEle.appendTo("#empAddModal select");
				});
			}
		});
	}
	
	$("#empName_add_input").change(function(){
		//发送ajax请求校验用户是否可用
		var empName=this.value;
		$.ajax({
			url:"${APP_PATH}/checkuser",
			data:"empName="+empName,
			type:"POST",
			success:function(result){
				if(result.code==100){
					validate_add_msg("#empName_add_input","success","用户名可用");
				}else{
					validate_add_msg("#empName_add_input","error","用户名不可用");
				}
			}
		});
		
	});
	
	<!--新增员工点击事件-->
	//点击保存员工的方法
	$("#emp_save_btn").click(function(){
		//首先把提交给服务器的数据给表单进行校验
		if(!validate_add_form()){
			return false;
		}
		//1.将提交的数据存到数据库中进行保存，使用ajax请求
		$.ajax({
			url:"${APP_PATH}/emp",
			type:"POST",
			data:$("#empAddModal form").serialize(),
			success:function(result){
				//alert(result.msg);
				//1.关闭模态框
				$("#empAddModal").modal('hide');
				//2.显示数据
				to_page(totalRecord);
			}
		});
	});
	function validate_add_form(){
		//1.首先拿到校验的数据
		var empName=$("#empName_add_input").val();
		var regName=/(^[a-zA-Z0-9_-]{6,16}$)/;
		
		if(!regName.test(empName)){
			//alert("用户名的长度是6到16位英文");
			validate_add_msg("#empName_add_input","error","用户名的长度是6到16位英文");
			return false;
		}else{
			validate_add_msg("#empName_add_input","success","");
		};
		
		//校验邮箱
		var email=$("#empEmail_add_input").val();
		var regEmail=/^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;
		if(!regName.test(email)){
			//alert("邮箱格式不正确");
		validate_add_msg("#empEmail_add_input","error","邮箱格式不正确");
			return false;
		}else{
			validate_add_msg("#empEmail_add_input","success","");
		}
		return true;
	}
	function validate_add_msg(ele,status,msg){
		$(ele).parent().removeClass("has-success has-error");
		$(ele).next().text("");
		if("success"==status){
			$(ele).parent().addClass("has-success");
			$(ele).next("span").text(msg);
		}
		else if("error"==status){
			$(ele).parent().addClass("has-error");
			$(ele).next("span").text(msg);
		}
	}
	
	//点击save时进行校验添加点击事件
	$("#empName_add_input").change(function(){
		//发送ajax请求校验的用户是否可用
		var empName=this.value;
		$.ajax({
			url:"${APP_PATH}/checkuser",
			data:"empName="+empName,
			type:"POST",
			success:function(result){
				if(result.code==100){
					validate_add_msg("#empName_add_input","success","用户名可用");
				}
				else{
					validate_add_msg("#empName_add_input","error","用户名不可用");
				}
			}
		});
	});
	
</script>
</body>
</html>