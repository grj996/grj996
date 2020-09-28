<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.memberdb.entity.User" %><%--
  Created by IntelliJ IDEA.
  User: Win
  Date: 2020/9/17
  Time: 14:38
  To change this template use File | Settings | File Templates.
--%>
<%
    User user = (User) request.getAttribute("user");
    String updateFlag = (String) request.getAttribute("updateSuccess");
%>
<%
//    http://localhost:8083/memberdb/
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>修改用户信息</title>
    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!-- <link href="theme.css" rel="stylesheet"> -->
    <script type="text/javascript" src="static/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <script>
        $(function () {
            if ($("#upsp").html().trim() == "true") {
                alert("修改成功！");
            } else if ($("#upsp").html().trim() == "false") {
                alert("修改失败！");
            }
            // $("#username").val()
            $("#cancel").click(function () {
                window.location.href = "http://localhost:8083/memberdb/UserServlet";
            });
        });
    </script>
</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <ul class="nav nav-tabs">
                <li class="active">
                    <h3>后台管理系统(管理)</h3>
                </li>
                <li class="dropdown pull-right">
                    <a href="#" data-toggle="dropdown" class="dropdown-toggle">下拉<strong class="caret"></strong></a>
                    <ul class="dropdown-menu">
                        <li>
                            <a href="#">操作</a>
                        </li>
                        <li>
                            <a href="#">设置栏目</a>
                        </li>
                        <li>
                            <a href="#">更多设置</a>
                        </li>
                        <li class="divider">
                        </li>
                        <li>
                            <a href="#">分割线</a>
                        </li>
                    </ul>
                </li>
            </ul>
            <div class="row clearfix">
                <div class="col-md-2 column">
                    <div class="list-group">

                        <a href="#" class="list-group-item ">项目管理</a>
                        <a href="#" class="list-group-item active">用户管理</a>
                        <a href="#" class="list-group-item ">权限管理</a>
                        <a href="#" class="list-group-item ">系统管理</a>
                        <a href="#" class="list-group-item ">退出系统</a>
                    </div>
                </div>
                <div class="col-md-10 column">
                    <div class="row clearfix">
                        <div class="col-md-8 column">
                            <div align="center">
                                <h3 style="align-items: center">
                                    修改用户
                                </h3>
                            </div>
                            <form class="form-horizontal" role="form" action="ModifyUserServlet" method="post">
                                <span style="display: none" id="upsp">
                                    <%
                                        if ("true".equals(updateFlag)) {
                                    %>
                                    true
                                    <%
                                    } else if ("false".equals(updateFlag)) {
                                    %>
                                    false
                                    <%
                                        }
                                    %>s
                                </span>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;ID</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="userId" name="userId"
                                               value="<%=user.getId()%>" readonly/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用&nbsp;&nbsp;户&nbsp;&nbsp;名</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="username" name="username"
                                               value="<%=user.getUsername()%>"/>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户密码</label>
                                    <div class="col-sm-10">
                                        <input type="text" class="form-control" id="password" name="password"
                                               value="<%=user.getPassword()%>"/>

                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户身份</label>
                                    <div class="col-sm-10">
                                        <select class="btn btn-default btn-block" id="stateUpdate" name="stateUpdate">
                                            <%
                                                if (user.getStatus() == 1) {
                                            %>
                                            <option value="1" selected="selected">启用</option>
                                            <option value="0">禁用</option>
                                            <%
                                            } else if (user.getStatus() == 0) {
                                            %>
                                            <option value="1">启用</option>
                                            <option value="0" selected="selected">禁用</option>
                                            <%
                                                }
                                            %>
                                        </select>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-sm-2 control-label">用户类型</label>
                                    <div class="col-sm-10">

                                        <%
                                            if (user.getType() == 1) {
                                        %>
                                        <input type="radio" name="userType" value="3"/>普通用户
                                        <input type="radio" name="userType" value="2"/>VIP
                                        <input type="radio" name="userType" value="1" checked="checked"/>管理员
                                        <%
                                        } else if (user.getType() == 2) {
                                        %>
                                        <input type="radio" name="userType" value="3"/>普通用户
                                        <input type="radio" name="userType" value="2" checked="checked"/>VIP
                                        <input type="radio" name="userType" value="1"/>管理员
                                        <%
                                        } else if (user.getType() == 3) {
                                        %>
                                        <input type="radio" name="userType" value="3" checked="checked"/>普通用户
                                        <input type="radio" name="userType" value="2"/>VIP
                                        <input type="radio" name="userType" value="1"/>管理员
                                        <%
                                            }
                                        %>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-offset-2 col-sm-10">
                                        <button type="submit" class="btn btn-block btn-default btn-primary" id="modify">
                                            修改
                                        </button>
                                        <button type="button" class="btn btn-block btn-default btn-primary" id="cancel">
                                            <span class="glyphicon glyphicon-circle-arrow-left">返回列表</span>
                                        </button>
                                    </div>
                                </div>
                            </form>
                        </div>

                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>

