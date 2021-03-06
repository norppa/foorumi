<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="luokat.Viesti" %>

<!doctype html>
<html lang="fi">
<head>
    <meta charset="utf-8">
    <title>AcademyFoorumi</title>
    <link rel="stylesheet" href="forumstyle.css">
</head>
<body>
<%@ include file="header.jsp" %>
<a href="/">Etusivu</a> /
<a href="/kategoria?id=<% out.print(request.getAttribute("keskusteluKategoriaId")); %>">
    <% out.print(request.getAttribute("keskusteluKategoriaNimi")); %></a> /
    <% out.print(request.getAttribute("keskusteluOtsikko")); %>
<blockquote>
    <p style="text-align: center"><% out.print(request.getAttribute("keskusteluOtsikko")); %></p>
</blockquote>
<div id="viestit">
    <%
        ArrayList<Viesti> viestit = (ArrayList<Viesti>) request.getAttribute("viestit");
        for (Viesti viesti : viestit) {
            out.println("<div class='viesti' id='" + viesti.getId() + "'>");
            out.println("<strong>" + viesti.getKirjoittaja() + "</strong>");
            out.println("<span class='aikaleima'> @ " + viesti.getAikaleima());

            out.println("<br><br>" + viesti.getTeksti() + "<br>");

            if (istunto != null && istunto.getAttribute("rooli") != null && istunto.getAttribute("rooli").equals("moderaattori"))
                out.println("<form method='post' class='poistaviesti' action='/poista?viestiID=" + viesti.getId() + "'>" +
                        "<input type='submit' value='Poista' /></form>");



            ///poista?viestiID=
            out.println("<br><hr></div>");
        }
    %>
</div>
<%
    //HttpSession istunto = request.getSession(false);
    if (istunto == null || istunto.getAttribute("nimi") == null) {
        out.println("<p>Kirjaudu sisään kirjoittaaksesi viestin</p>");
    } else {
        String id = (String) request.getAttribute("keskusteluId");
        out.println("<div class='kirjoita'>");
        out.println("<br>");
        out.println("<form method = 'post' action = '/kirjoita'>");
        out.println("<textarea name = 'viestiTeksti' rows = '20' cols = '50' > Kirjoita kommentti tähän</textarea ><br >");
        out.println("<input type = 'hidden' name = 'keskusteluId' value = '" + id + "'/>");
        out.println("<br>");
        out.println("<input type='submit' value='Lähetä'>");
        out.println("</form >");
        out.println("</div >");
    }
%>
</body>
</html>