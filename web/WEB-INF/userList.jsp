<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.memberdb.entity.User" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Win
  Date: 2020/9/16
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    String delFlag = (String) request.getAttribute("delSuccess");
    Long maxPage = (Long) request.getAttribute("maxPage");
%>
<%
    String basePath = request.getScheme()
            + "://"
            + request.getServerName()
            + ":"
            + request.getServerPort()
            + request.getContextPath()
            + "/";
%>
<!--写base 标签，永远固定相对路径跳转的结果-->

<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>用户管理系统</title>
    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!-- <link href="theme.css" rel="stylesheet"> -->
    <script type="text/javascript" src="static/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            if ($("#delsp").html().trim() == "true") {
                alert("删除成功！");
            } else if ($("#delsp").html().trim() == "false") {
                alert("删除失败！");
            }
            //增加用户
            $("#addbtn").click(function () {
                location.href = "addUser.jsp";
            });
            //搜索栏
            $("#searchBtn").click(function () {
                var username = $("input[name='search']").val();
                location.href = "http://localhost:8083/memberdb/QueryServlet?type=name&need=" + username;
            });
            //状态变更
            $(".state").on('click', function () {
                var userId = $($(this).parents("tr").children("td")[0]).html().trim();
                //TODO:未完善
                location.href = "http://localhost:8083/memberdb/UserServlet?id=" + userId;
            });
            //修改按钮
            $(".upbtn").on('click', function () {
                var id = $($(this).parents("tr").children("td")[0]).html().trim();
                location.href = "http://localhost:8083/memberdb/QueryUserServlet?userId=" + id;
            });
            //删除按钮
            $(".delbtn").on('click', function () {
                var id = $($(this).parents("tr").children("td")[0]).html().trim();
                location.href = "http://localhost:8083/memberdb/DeleteUserServlet?userId=" + id;
            })
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
                        <div class="col-md-12 column">
                            <nav class="navbar navbar-default" role="navigation">
                                <div class="navbar-header">
                                    <a class="navbar-brand" href="#">Brand</a>
                                </div>
                                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                                    <form class="navbar-form navbar-left" role="search">
                                        <div class="form-group">
                                            <input type="text" class="form-control" name="search"
                                                   placeholder="请输入想到搜索的用户名"/>
                                        </div>
                                        <button type="submit" class="btn btn-default" id="searchBtn">搜索</button>
                                    </form>
                                </div>
                            </nav>
                        </div>
                    </div>
                    <div class="row clearfix">
                        <div class="col-md-12 column">
                            <button id="addbtn" type="button" class="btn btn-primary btn-default btn-block">
                                <span class="glyphicon glyphicon-plus-sign">
                                    添加用户
                                </span>
                                <span style="display: none" id="delsp">
                                    <%
                                        if ("true".equals(delFlag)) {
                                    %>
                                    true
                                    <%
                                    } else if ("false".equals(delFlag)) {
                                    %>
                                    false
                                    <%
                                        }
                                    %>
                                </span>
                            </button>
                            <table class="table table-hover">
                                <thead>
                                <tr>
                                    <th>
                                        ID
                                    </th>
                                    <th>
                                        用户名
                                    </th>
                                    <th>
                                        头像
                                    </th>
                                    <th>
                                        状态
                                    </th>
                                    <th>
                                        操作
                                    </th>
                                </tr>
                                </thead>
                                <tbody>
                                <%
                                    for (int i = 0; i < users.size(); ++i) {
                                %>
                                <tr>
                                    <td>
                                        <%=users.get(i).getId()%>
                                    </td>
                                    <td>
                                        <%=users.get(i).getUsername()%>
                                    </td>
                                    <td>
                                        <%=users.get(i).getImage()%>
                                    </td>
                                    <td>
                                        <%
                                            if (users.get(i).getStatus() == 1) {
                                        %>
                                        <a href="" style="text-decoration: none">
                                            <img class="state" src="../img/open.svg"/>
                                        </a>启用
                                        <%
                                        } else {
                                        %>
                                        <a href="" style="text-decoration: none">
                                            <img class="state" src="../img/close.svg"/>
                                        </a>禁用
                                        <%
                                            }
                                        %>

                                    </td>
                                    <td>
                                        <button type="button" class="upbtn btn btn-sm btn-info">修改</button>
                                        <button type="button" class="delbtn btn btn-danger btn-sm">删除</button>
                                    </td>
                                </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <div align="center">
                    <b>共<%=maxPage%>页</b>
                    <%
                        for (int i = 1; i <= maxPage; i++) {
                    %>
                    <a class="btn btn-default" href="UserServlet?page=<%=i%>"><%=i%>
                    </a>
                    <% } %>
                </div>
            </div>
        </div>

    </div>
</div>
</body>
</html>

