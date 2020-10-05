<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>
<%@page import="prova_poo.*"%>
<!DOCTYPE html>
<%
 //Verificado
double nota;
int indice;

disciplina lista = (disciplina)application.getAttribute("lista");

if(lista == null){

lista = new disciplina("","",0);
    
}
try{
    nota = Double.parseDouble(request.getParameter("nota"));
    indice = Integer.parseInt(request.getParameter("indice"));
}catch(Exception e){
    nota = -1;
    indice = -1;
}
if(nota >=0 && nota <= 10) lista.getList().get(indice).setNota(nota);

%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Disicplina</h1>
        <table border="1">
            <tr>
                <th>Disciplina</th>
                <th>Ementa</th>
                <th>Ciclo</th>
                <th>Nota</th>
            </tr>
            <%
            for(int i=0; i < lista.getList().size(); i++){
            %>
            <tr>
                <th><%= lista.getList().get(i).getNome()%></th>
                <th><%= lista.getList().get(i).getEmenta()%></th>
                <th><%= lista.getList().get(i).getCiclo()%></th>
            <form method="get">
                <th><input type="text" name="nota" value="<%= lista.getList().get(i).getNota()%>"></th>
                    <input type="hidden" name="indice" value="<%= i%>"/>
                    <th><input type="submit" value="Adicionar"></th>
            </form>
            </tr>
            <% } %> 
    </body>
</html>
