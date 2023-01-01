package com.example.web2.controllers;

import com.example.web2.model.Point;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "controller", value = "/controller")
public class ControllerServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getServletContext().setAttribute("startTime", System.nanoTime());
        if (request.getQueryString() != null) {
            if (request.getParameter("type").equals("hit")) {
                getServletContext().getRequestDispatcher("/hit").forward(request, response);
            }
            else if (request.getParameter("type").equals("clear")) {
                getServletContext().getRequestDispatcher("/clear").forward(request, response);
            }
        }
        else
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);

    }
}
