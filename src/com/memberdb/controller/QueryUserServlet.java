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

public class QueryUserServlet extends HttpServlet {
    UserService userService = new UserServiceImpl();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String uname = (String) session.getAttribute("username");
        String upass = (String) session.getAttribute("password");
        User u = new User(uname, upass);
        if (uname.isEmpty() || upass.isEmpty() || !userService.login(u)) {
            response.getWriter().println("会话超时 请重新登录！");
            response.sendRedirect("/login.jsp");
        } else {
            String userId = request.getParameter("userId");
            Long id = Long.valueOf(userId.trim());
            User user = userService.queryUserById(id);
            request.setAttribute("user", user);
            request.getRequestDispatcher("WEB-INF/modifyUser.jsp").forward(request, response);
        }
    }
}
