<%--
  Created by IntelliJ IDEA.
  User: Win
  Date: 2020/9/15
  Time: 16:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String message = (String) request.getAttribute("message");
%>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>登陆页面</title>
    <!-- Bootstrap core CSS -->
    <link href="static/css/bootstrap.min.css" rel="stylesheet">
    <!-- Custom styles for this template -->
    <!-- <link href="theme.css" rel="stylesheet"> -->
    <script type="text/javascript" src="static/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/js/bootstrap.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#btn").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                var regex = /^[a-zA-Z0-9]{5,20}$/;
                if (!username) {
                    var usernameMsg = $("#usernameMsg");
                    usernameMsg.html("用户名不能为空");
                    usernameMsg.css("display", "block");
                    usernameMsg.focus();
                    return false;
                }
                if (!password) {
                    var passwordMsg = $("#passwordMsg");
                    passwordMsg.html("密码不能为空");
                    passwordMsg.css("display", "block");
                    passwordMsg.focus();
                    return false;
                }
                if (regex.test(username) == false) {
                    var usernameMsg = $("#usernameMsg");
                    usernameMsg.html("用户名由字母和数字组成");
                    usernameMsg.css("display", "block");
                    usernameMsg.focus();
                    return false;
                }
            });
        });
    </script>

</head>
<body>
<div class="container">
    <div class="row clearfix">
        <div class="col-md-12 column">
            <div class="row clearfix">
                <div class="col-md-4 column">
                </div>
                <div class="col-md-4 column">
                    <h3 class="text-center">
                        用户登陆
                    </h3>
                    <form class="form-horizontal" role="form" action="LoginServlet" method="post">
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="text" class="form-control" id="username" name="username"
                                       placeholder="请输入账户"/>
                                <span id="usernameMsg" style="display: none"></span>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12">
                                <input type="password" class="form-control" id="password" name="password"
                                       placeholder="请输入密码"/>
                                <span id="passwordMsg" style="display: none"></span>
                                <%
                                    if (message != null) {
                                %>

                                <span style="color: red">
                                    <%=message%>
                                </span>
                                <%
                                    }
                                %>
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-sm-12" align="center">
                                <button type="submit" class="btn btn-block btn-lg" id="btn">登 陆</button>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="col-md-4 column">
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
