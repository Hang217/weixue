<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!-- 导航侧栏 -->
<aside class="main-sidebar">
    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">
        <!-- Sidebar user panel -->
        <div class="user-panel">
            <div class="pull-left image">
                <img src="${pageContext.request.contextPath}/img/user2-160x160.jpg"
                     class="img-circle" alt="User Image">
            </div>
            <div class="pull-left info">
                <p>
                    <security:authentication property="principal.username" />
                </p>
                <a href="#"><i class="fa fa-circle text-success"></i>在线</a>
            </div>
        </div>
        <!-- sidebar menu: : style can be found in sidebar.less -->
        <ul class="sidebar-menu">
            <li class="header">菜单</li>
            <li id="admin-index">
                <a href="${pageContext.request.contextPath}/pages/main.jsp">
                    <i class="fa fa-dashboard"></i> <span>首页</span></a>
            </li>
            <li class="treeview"><a href="#"> <i class="fa fa-cogs"></i>
                <span>系统管理</span>
                <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span>
            </a>
                <ul class="treeview-menu">

                    <li id="system-user">
                        <a href="${pageContext.request.contextPath}/admin/findAll.do">
                            <i class="fa fa-circle-o"></i> 管理员管理
                        </a></li>
                    <li id="system-role">
                        <a href="${pageContext.request.contextPath}/role/findAll.do">
                            <i class="fa fa-circle-o"></i> 角色管理
                        </a></li>
                    <security:authorize access="hasRole('ADMIN')">
                        <li id="system-syslog">
                            <a href="${pageContext.request.contextPath}/syslog/findAll.do?page=1&size=8">
                                <i class="fa fa-circle-o"></i> 访问日志
                            </a></li>
                    </security:authorize>
                </ul></li>
            <li class="treeview"><a href="#">
                <i class="fa fa-cube"></i>
                <span>基础数据</span>
                <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
						</span></a>
                <ul class="treeview-menu">
                    <li id="system-student">
                        <a href="${pageContext.request.contextPath}/student/findAll.do?page=1&size=8">
                            <i class="fa fa-circle-o"></i> 学生管理
                        </a></li>
                    <li id="system-teacher">
                        <a href="${pageContext.request.contextPath}/teacher/findAll.do?page=1&size=8">
                            <i class="fa fa-circle-o"></i> 教师管理
                        </a></li>
                    <li id="system-course">
                        <a href="${pageContext.request.contextPath}/course/findAll.do?page=1&size=8">
                            <i class="fa fa-circle-o"></i> 课程管理
                        </a></li>
                    <li id="system-comment">
                        <a href="${pageContext.request.contextPath}/comment/findAll.do?page=1&size=8">
                            <i class="fa fa-circle-o"></i> 评论管理
                        </a></li>
                </ul>
            </li>
        </ul>
    </section>
    <!-- /.sidebar -->
</aside>
<!-- 导航侧栏 /-->
