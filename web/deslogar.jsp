<%-- 
    Document   : deslogar
    Created on : 05/01/2018, 13:27:18
    Author     : JoaoG
--%>

<%
session.setAttribute("id", null);
session.invalidate();
response.sendRedirect("index.jsp");
%>
