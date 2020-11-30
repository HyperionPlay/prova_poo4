<%-- 
    Document   : index
    Created on : 5 de out de 2020, 01:54:05
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>
<%@page import="prova_poo.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Nome: Henrique Pereira Souza</h1>
        <h1>RA: 1290481912039</h1>
        <h1>Quantas disciplinas eu tenho: <%= disciplina.getList().size()%> </h1>
    </body>
</html>
