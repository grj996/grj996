package com.memberdb.controller;

import com.memberdb.entity.User;
import com.memberdb.service.UserService;
import com.memberdb.service.impl.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

public class UserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
        System.out.println();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uname = (String) session.getAttribute("username");
        String upass = (String) session.getAttribute("password");
        User u = new User(uname, upass);
        if (uname == null || upass == null || !userService.login(u)) {
            response.setCharacterEncoding("UTF-8");
            response.setHeader("Content-type", "text/html;charset=UTF-8");
            response.setHeader("refresh", "3;url='" + request.getContextPath() + "/login.jsp'");
            response.getWriter().write(
                    "<h1>会话超时 请重新登录！如果没有跳转，请点击<a href='" + request.getContextPath() + "/login.jsp'>超链接</a></h1>");
        } else {
            String page = request.getParameter("page");
            Long maxPage = userService.getMaxPage(5);
            int pageNum = 1;
            if (page != null) {
                pageNum = Integer.valueOf(page.trim());
            }
            List<User> userList = userService.queryUserListByPage(pageNum, 5);
            request.setAttribute("users", userList);
            request.setAttribute("maxPage", maxPage);
            request.getRequestDispatcher("WEB-INF/userList.jsp").forward(request, response);
        }
    }
}
