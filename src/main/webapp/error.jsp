<%--
  Created by IntelliJ IDEA.
  User: AboHolo
  Date: 17-Nov-22
  Time: 1:42 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap">
  <title>Error</title>
</head>
<body style="font-family: 'Roboto', sans-serif;">

<div style="display: flex; flex-direction: column; justify-content: center; align-items: center; height:  100%">
  <% if (response.getStatus() == 400) { %>
  <h1 style="font-size: 30px; color: red; text-align: center; ">
    Wrong number format
  </h1>
  <% }%>
  <div>
    <a href="/web2" style="font-size: 20px; text-align: center; text-decoration: none">To the main page</a>
  </div>
</div>
</body>
</html>
