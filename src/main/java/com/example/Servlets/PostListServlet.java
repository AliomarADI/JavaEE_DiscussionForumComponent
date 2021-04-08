package com.example.Servlets;

import com.example.DAO.PostDao;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

public class PostListServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PostDao postDao = new PostDao();
        List<?> posts = null;
        try {
            posts = postDao.select();
        } catch (Exception e) {
            request.getSession().setAttribute("exception",e.getMessage());
        }
        request.getSession().setAttribute("posts",posts);
        response.sendRedirect("index.jsp");
    }

}
