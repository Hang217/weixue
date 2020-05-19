<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<!-- 页面meta -->
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">

<title>数据 - 后台管理系统</title>
<meta name="description" content="后台管理系统">
<meta name="keywords" content="后台管理系统">

<!-- Tell the browser to be responsive to screen width -->
<meta content="width=device-width,initial-scale=1,maximum-scale=1,user-scalable=no" name="viewport">

<link rel=“stylesheet” href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap/css/bootstrap.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionicons/css/ionicons.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/iCheck/square/blue.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/morris/morris.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datepicker/datepicker3.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.theme.default.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/select2/select2.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-markdown/css/bootstrap-markdown.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/AdminLTE.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/adminLTE/css/skins/_all-skins.min.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.skinNice.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-slider/slider.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.css">
</head>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">

		<!-- 页面头部 -->
		<jsp:include page="../header.jsp"></jsp:include>
		<!-- 页面头部 /-->

		<!-- 导航侧栏 -->
		<jsp:include page="../aside.jsp"></jsp:include>
		<!-- 导航侧栏 /-->

		<!-- 内容区域 -->
		<div class="content-wrapper">

			<!-- 内容头部 -->
			<section class="content-header">
			<h1>
				教师管理 <small>教师详情</small>
			</h1>
			<ol class="breadcrumb">
				<li><a href="${pageContext.request.contextPath}/index.jsp"><i
						class="fa fa-dashboard"></i> 首页</a></li>
				<li><a href="${pageContext.request.contextPath}/teacher/findAll.do?page=1&size=8">教师管理</a></li>
				<li class="active">教师详情</li>
			</ol>
			</section>
			<!-- 内容头部 /-->

			<!-- 正文区域 -->
			<section class="content">
			<!--用户信息-->
			<div class="panel panel-default">
				<div class="panel-heading">教师信息</div>
				<div class="row data-type">

					<div class="col-md-2 title">头像路径</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="头像路径" value="${user.imgUrl}">
					</div>
					<div class="col-md-2 title">用户名</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="用户名" value="${user.username}">
					</div>
					<div class="col-md-2 title">密码</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="密码" value="${user.password}">
					</div>
					<div class="col-md-2 title">职工号</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="职工号" value="${user.num}">
					</div>
					<div class="col-md-2 title">姓名</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="姓名" value="${user.name}">
					</div>
					<div class="col-md-2 title">性别</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="性别" value="${user.sex}">
					</div>
					<div class="col-md-2 title">手机</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="手机" value="${user.telephone}">
					</div>
					<div class="col-md-2 title">学院</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="学院" value="${user.college}">
					</div>
					<div class="col-md-2 title" style="display: none">职业</div>
					<div class="col-md-4 data" style="display: none">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="职业" value="${user.profession}">
						</input>
					</div>
					<div class="col-md-2 title teacher" id="">授课课程</div>
					<div class="col-md-4 data teacher">
						<input type="text" class="form-control" readonly="readonly"
							   placeholder="授课课程" value="${user.course}">
					</div>
					<div class="col-md-2 title">邮箱</div>
					<div class="col-md-4 data">
						<input type="text" class="form-control" placeholder="邮箱"
							   readonly="readonly" value="${user.email}">
					</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title rowHeight2x">个人说明</div>
					<div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" placeholder="个人说明"
									  readonly="readonly">${user.elucidation}</textarea>
					</div>

				</div>
			</div>
			<!--用户信息/-->
			<!--课程收藏信息-->
			<div class="panel panel-default">
				<div class="panel-heading">课程收藏信息</div>
				<c:forEach items="${user.collects}" var="collect">
				<div class="row data-type">

					<div class="col-md-2 title">课程名</div>
					<div class="col-md-4 data text">${collect.courseName}</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title rowHeight2x">课程详情</div>
					<div class="col-md-10 data rowHeight2x">
							<textarea class="form-control" rows="3" readonly="readonly">
								${collect.detail}
							</textarea>
					</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title">图片路径</div>
					<div class="col-md-10 data text">${collect.imageUrl}</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title">视频路径</div>
					<div class="col-md-10 data text">${collect.videoUrl}</div>

				</div>
				</c:forEach>
			</div>
			<!--课程收藏信息/-->
			<!--课程上传信息-->
			<div class="panel panel-default">
				<div class="panel-heading">课程上传信息</div>
				<c:forEach items="${user.courses}" var="course">
				<div class="row data-type">

					<div class="col-md-2 title">课程名</div>
					<div class="col-md-4 data text">${course.courseName}</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title rowHeight2x">课程详情</div>
					<div class="col-md-10 data rowHeight2x">
						<textarea class="form-control" rows="3" readonly="readonly">${course.detail}</textarea>
					</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title">图片路径</div>
					<div class="col-md-10 data text">${course.imageUrl}</div>
					<div style="clear: both"></div>
					<div class="col-md-2 title">视频路径</div>
					<div class="col-md-10 data text">${course.videoUrl}</div>

				</div>
				</c:forEach>
			</div>
			<!--课程上传信息/-->
			<!--工具栏-->
			<div class="box-tools text-center">
				<button type="button" class="btn bg-default"
					onclick="history.back(-1);">返回</button>
			</div>
			<!--工具栏/-->
			</section>
			<!-- 正文区域 /-->


		</div>
		<!-- 内容区域 /-->

		<!-- 底部导航 -->
		<footer class="main-footer">
		<div class="pull-right hidden-xs">
			<b>Version</b> 1.0.8
		</div>
		<strong>Copyright &copy; 2016-2020 jyh.
		</strong> All rights reserved. </footer>
		<!-- 底部导航 /-->

	</div>

	<script src="${pageContext.request.contextPath}/plugins/jQuery/jquery-2.2.3.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jQueryUI/jquery-ui.min.js"></script>
	<script>
		$.widget.bridge('uibutton', $.ui.button);
	</script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/raphael/raphael-min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/morris/morris.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-1.2.2.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/jvectormap/jquery-jvectormap-world-mill-en.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/knob/jquery.knob.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/moment.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/daterangepicker/daterangepicker.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datepicker/bootstrap-datepicker.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datepicker/locales/bootstrap-datepicker.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap3-wysihtml5.all.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/slimScroll/jquery.slimscroll.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/fastclick/fastclick.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/iCheck/icheck.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/adminLTE/js/app.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/treeTable/jquery.treetable.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/select2/select2.full.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/colorpicker/bootstrap-colorpicker.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-wysihtml5/bootstrap-wysihtml5.zh-CN.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/bootstrap-markdown.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/locale/bootstrap-markdown.zh.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/markdown.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-markdown/js/to-markdown.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/ckeditor/ckeditor.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.date.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/input-mask/jquery.inputmask.extensions.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables/jquery.dataTables.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/datatables/dataTables.bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/chartjs/Chart.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.resize.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.pie.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/flot/jquery.flot.categories.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/ionslider/ion.rangeSlider.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-slider/bootstrap-slider.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>

	<script>

		$(document).ready(function() {
			// 选择框
			$(".select2").select2();

			// WYSIHTML5编辑器
			$(".textarea").wysihtml5({
				locale : 'zh-CN'
			});
		});

		// 设置激活菜单
		function setSidebarActive(tagUri) {
			var liObj = $("#" + tagUri);
			if (liObj.length > 0) {
				liObj.parent().parent().addClass("active");
				liObj.addClass("active");
			}
		}

		$(document).ready(function() {

			// 激活导航位置
			setSidebarActive("order-manage");

			// 列表按钮 
			$("#dataList td input[type='checkbox']").iCheck({
				checkboxClass : 'icheckbox_square-blue',
				increaseArea : '20%'
			});
			// 全选操作 
			$("#selall").click(function() {
				var clicks = $(this).is(':checked');
				if (!clicks) {
					$("#dataList td input[type='checkbox']").iCheck("uncheck");
				} else {
					$("#dataList td input[type='checkbox']").iCheck("check");
				}
				$(this).data("clicks", !clicks);
			});
		});
	</script>
</body>

</html>