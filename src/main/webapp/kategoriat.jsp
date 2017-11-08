<%@ page import="java.util.ArrayList" %>
<%@ page import="luokat.Kategoria" %>
<%@ page import="luokat.Keskustelu" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Academy forum</title>
    <link rel="stylesheet" type="text/css" href="forumstyle.css">
</head>
<body>
<nav>
    <h3 style="text-align: right">Kirjaudu</h3>
    <br>
</nav>
<div class="banner">
    <h1 class="maintitle">ACADEMY FORUM</h1>
</div>
<blockquote>
    <p style="text-align: center"><% out.println(request.getAttribute("kategoria")); %></p>
</blockquote>
<div id="keskustelut">
    <%
        ArrayList<Keskustelu> keskustelut = (ArrayList<Keskustelu>) request.getAttribute("keskustelut");
        for (Keskustelu keskustelu : keskustelut) {
            out.println("<a href='index.html?id=" + keskustelu.getId() + "'>" + keskustelu.getOtsikko() + "</a><br>");
        }
    %>
</div>
</body>
</html>
</body>
</html>