package com.example.web2.controllers;

import com.example.web2.model.Point;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "clear", value = "/clear")
public class ClearServlet extends HttpServlet {

    @Override
    public void doGet(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().setAttribute("pointList", new ArrayList<Point>());
    }
}
