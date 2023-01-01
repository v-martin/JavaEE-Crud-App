<%@ page import="com.example.web2.model.Point" %>
<%@ page import="java.util.ArrayList" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style.css">
    <title>Document</title>
</head>
<body>
<header class="header">
    <p>Martynov Vsevolod Vladimirovich  Group P32312 Variant 3312</p>
</header>
<main class="main">
    <table class="main-table" cellspacing="5" width="100%">
        <tr>
            <td width="50%">
                <svg id="graph" viewBox="0 0 500 500" maxwidth="250" maxheight="250">
                    <!-- circle -->
                    <path class="graph-shape" d="M 150 250 A 100 100 0 0 1 50 150 L 150 150 Z"/>

                    <!-- triangle -->
                    <polygon class="graph-shape" points="150,150 250,150 150,250"/>

                    <!-- rectangle -->
                    <polygon class="graph-shape" points="150,50 200,50 200,150 150,150"/>

                    <!-- axles -->
                    <text class="graph-axle-text" x="290" y="140">x</text>
                    <line class="graph-axle-line" x1="0" x2="295" y1="150" y2="150"/>
                    <polygon class="graph-axle-arrow" points="299,150 290,155 290,145"/>

                    <text class="graph-axle-text" x="160" y="10">y</text>
                    <line class="graph-axle-line" x1="150" x2="150" y1="5" y2="300"/>
                    <polygon class="graph-axle-arrow" points="150,1 145,10 155,10"/>

                    <!-- points -->
                    <line class="graph-point" x1="50" x2="50" y1="145" y2="155"/>
                    <line class="graph-point" x1="100" x2="100" y1="145" y2="155"/>
                    <line class="graph-point" x1="200" x2="200" y1="145" y2="155"/>
                    <line class="graph-point" x1="250" x2="250" y1="145" y2="155"/>

                    <line class="graph-point" x1="145" x2="155" y1="250" y2="250"/>
                    <line class="graph-point" x1="145" x2="155" y1="200" y2="200"/>
                    <line class="graph-point" x1="145" x2="155" y1="100" y2="100"/>
                    <line class="graph-point" x1="145" x2="155" y1="50" y2="50"/>

                    <!-- labels -->
                    <text class="graph-label r-whole-neg" text-anchor="middle" x="50" y="140">-R</text>
                    <text class="graph-label r-half-neg" text-anchor="middle" x="100" y="140">-R/2</text>
                    <text class="graph-label r-half-pos" text-anchor="middle" x="200" y="140">R/2</text>
                    <text class="graph-label r-whole-pos" text-anchor="middle" x="250" y="140">R</text>

                    <text class="graph-label r-whole-neg" text-anchor="start" x="160" y="255">-R</text>
                    <text class="graph-label r-half-neg" text-anchor="start" x="160" y="205">-R/2</text>
                    <text class="graph-label r-half-pos" text-anchor="start" x="160" y="105">R/2</text>
                    <text class="graph-label r-whole-pos" text-anchor="start" x="160" y="55">R</text>

                    <!-- dashes -->
                    <line class="graph-axle-line graph-x-dash-line" stroke-dasharray="5,5" x1="-10" x2="-10" y1="0" y2="300" stroke="black"></line>
                    <line class="graph-axle-line graph-y-dash-line" stroke-dasharray="5,5" x1="0" x2="300" y1="-10" y2="-10" stroke="black"></line>

                    <% ArrayList<Point> storage = (ArrayList<Point>) session.getAttribute("pointList");
                        if (storage != null){
                                for (Point point: storage){
                                    double convX = (point.getX() / point.getR()) * 100 + 150;
                                    double convY = -((point.getY() / point.getR()) * 100) + 150;
                                    if (convX > 300) {convX = 300;}
                                    if (convY > 300) {convY = 300;}
                    %>
                    <circle cx="<%=convX%>" cy="<%=convY%>" r="2" class="point"/>
                    <%}}%>





                </svg>
                <form class="form" method="GET">
                    <table>
                        <tr>
                            <td>
                                <h4>R value:</h4>
                                <select class="r-select">
                                    <option value="1">1</option>
                                    <option value="2">2</option>
                                    <option value="3">3</option>
                                    <option value="4">4</option>
                                    <option value="5">5</option>
                                </select>
                                <h4>X value:</h4>
                                <label>
                                    <input class="x-input" type="button" value="-3">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="-2">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="-1">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="0">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="1">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="2">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="3">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="4">
                                </label>
                                <label>
                                    <input class="x-input" type="button" value="5">
                                </label>
                                <br>

                                <label for="" style="display: flex">
                                    <h4 class="form-title">Y value:</h4>
                                    <input maxlength="10"
                                           type="text"
                                           placeholder="In range (-5:5)"
                                           id="y-data"
                                    />
                                </label>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <input class="convex-button" id="submit-button" type="submit" value="Submit">
                                <input class="convex-button" id="clear-form-button" type="button" value="Clear form">
                                <input class="convex-button" id="clear-table-button" type="button" value="Clear table">
                            </td>
                        </tr>

                        <tr id="error">
                        </tr>
                    </table>
                </form>
            </td>
            <td rowspan="2" class="main__table">
<%--                <table class="result-table">--%>
                <table>
                    <thead>
                    <tr class="header-table">
                        <th>X value</th>
                        <th>Y value</th>
                        <th>R value</th>
                        <th>Area hit</th>
                        <th>Current time</th>
                        <th>Execution time</th>
                    </tr>
                    </thead>
                    <tbody id="result-table-body">
                    <%if (session.getAttribute("pointList") != null) {
                            for (Point point : (ArrayList<Point>) session.getAttribute("pointList")) {
                    %>
                    <tr style='text-align: center;'>
                        <td><%= point.getX()%>
                        </td>
                        <td><%= point.getY()%>
                        </td>
                        <td><%= point.getR()%>
                        </td>
                        <td><%= point.isHit()%>
                        </td>
                        <td><%= point.getDate()%>
                        </td>
                        <td><%= point.getTime()%> ms</td>
                    </tr>
                    <%
                        }
                    }
                    %>
                    </tbody>
                </table>
            </td>
        </tr>
    </table>
</main>
<script src="main.js"></script>
</body>
</html>