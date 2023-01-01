package com.example.web2.controllers;

import com.example.web2.model.Coordinates;
import com.example.web2.model.Point;
import com.google.gson.Gson;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;

@WebServlet(name = "hit", value = "/hit")
public class AreaCheckServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        Point point;
        Gson json = new Gson();
        PrintWriter writer = response.getWriter();
        Coordinates coordinates = validate(request);
        if (coordinates == null) {
            response.setStatus(400);
            writer.write("error");
        } else {
            boolean hit = check(coordinates);
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("dd.MM.yyyy hh:mm");
            String date = simpleDateFormat.format(new Date());
            long startTime = (long) getServletContext().getAttribute("startTime");
            float executionTime = (float) (System.nanoTime() - startTime)/1_000_000;
            point = new Point(coordinates.getX(), coordinates.getY(), coordinates.getR(), hit, date, executionTime);
            ArrayList<Point> list = (ArrayList<Point>) session.getAttribute("pointList");
            if (list == null) {
                list = new ArrayList<Point>();
            }
            list.add(point);
            session.setAttribute("pointList", list);
            writer.write(json.toJson(point));
        }
        writer.close();
    }

    private Coordinates validate(HttpServletRequest request) {
        int x;
        float y;
        int r;

        try {
            x = Integer.parseInt(request.getParameter("x"));
            y = Float.parseFloat(request.getParameter("y"));
            r = Integer.parseInt(request.getParameter("r"));
        } catch (NumberFormatException e) {
            return null;
        }

        if (x >= -3 && x<= 5 && y >= -5 && y<= 5 && r >= 1 && r <= 5) {
            return new Coordinates(x, y, r);
        } else
            return null;
    }

    private boolean check(Coordinates coordinates) {
        int x = coordinates.getX();
        float y = coordinates.getY();
        int r = coordinates.getR();
        boolean hit = false;
        if ((y <= r && x <= r/2) && (x >= 0 && y >= 0)) hit = true;
        if ((y >= x - r) && (x >= 0 && y <= 0)) hit = true;
        if ((Math.pow(x, 2) + Math.pow(y, 2) <= Math.pow(r, 2)) && (y <= 0 && x <= 0)) hit = true;
        return hit;
    }
}
