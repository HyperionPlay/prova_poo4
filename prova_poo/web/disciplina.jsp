<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>
<%@page import="prova_poo.*"%>
<%@page import="prova_poo2.*"%>

<!DOCTYPE html>
<%
    String expetionMessage = null;
    if(request.getParameter("FormInserir")!=null){
    response.sendRedirect(request.getRequestURI());
    }
    if(request.getParameter("FormInserir")!=null){
     try{
         String nome = request.getParameter("nome");
         String ementa = request.getParameter("ementa");
         String ciclo = request.getParameter("ciclo");
         Double nota = Double.parseDouble(request.getParameter("nota"));
         disciplina.inserirDisciplina(nome, ementa, ciclo, nota);
         response.sendRedirect(request.getRequestURI());
     }catch(Exception ex){
         expetionMessage = ex.getLocalizedMessage();
     }
 }
    if(request.getParameter("FormAlterar")!=null){
     try{
         String nome = request.getParameter("nome");
         Double nota = Double.parseDouble(request.getParameter("nota"));
         disciplina.alterarNota(nome, nota);
         response.sendRedirect(request.getRequestURI());
     }catch(Exception ex){
         expetionMessage = ex.getLocalizedMessage();
     }
 }
    if(request.getParameter("FormExcluir")!=null){
     try{
         String nome = request.getParameter("nome");
         disciplina.excluirDisciplina(nome);
         response.sendRedirect(request.getRequestURI());
     }catch(Exception ex){
         expetionMessage = ex.getLocalizedMessage();
     }
 }
    
%>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container-fluid">
        <%if(request.getParameter("prepararDelete")!=null){%>
        <fieldset>
            <legend>Exluir Disciplina</legend>
            <% String nome = request.getParameter("nome"); %>
            <form method="post">
                Excluir a categoria <b><%= nome%></b>
                <hr/>
                <input type="hidden" name="nome" value="<%= nome%>"/>
                <input type="submit" name="FormExluir" value="Excluir"/>
                <input type="submit" name="Cancelar" value="Cancelar"/>
                </form>
        </fieldset>
                <%}else if(request.getParameter("prepararUpdate")!=null){%>
        <fieldset>
            <legend>Alterar Disciplina</legend>
            <% String nome = request.getParameter("nome"); %>
            <% double nota = Double.parseDouble(request.getParameter("nota"));%>
            <form method="post">
                <div><input type="hidden" name="nome" value="<%= nome%>"/></div>
                <div>Nome:</div>
                <div><input type="text" name="nome" value="<%= nome%>"/></div>
                <div>Nota:</div>
                <div><input type="number" name="nota" step="0.01" min="0.00" max="10.00" value="<%= nota%>"/></div>
                <hr/>
               <input type="submit" name="FormAlterar" value="Alterar"/>
               <input type="submit" name="Cancelar" value="Cancelar"/>
             </form>
        </fieldset>
                <%}else if(request.getParameter("prepararInsert")!=null){%>
        <fieldset>
            <legend>Inserir Disciplina</legend>
            <form method="post">
                <div>Nome:</div>
                <div><input type="text" name="nome""/></div>
                <div>Ementa:</div>
                <div><input type="text" name="ementa""/></div>
                <div>Ciclo:</div>
                <div><input type="text" name="ciclo""/></div>
                <div>Nota:</div>
                <div><input type="number" name="nota" step="0.01" min="0.00" max="10.00"/></div>
                <hr/>
               <input type="submit" name="FormInserir" value="Inserir"/>
               <input type="submit" name="Cancelar" value="Cancelar"/>
             </form>
        </fieldset>
        <%}else{%>
        <form method="post">
            <input type="submit" name="prepararInsert" value="Inserir"/>
        </form>
        <%}%>
<table class="table table-bordered">
    <thead class="thead-dark">
        <tr>
            <th scope="col">Nome:</th>
            <th scope="col">Ementa:</th>
            <th scope="col">Ciclo:</th>
            <th scope="col">Nota:</th>
            <th scope="col">Comandos:</th>
        </tr>
        </thead>
        <tbody>
         <%for(disciplina d: disciplina.getList()){%>
         <tr>
           <td><%= d.getNome()%></td>
           <td><%= d.getEmenta()%></td>
           <td><%= d.getCiclo()%></td>
           <td><%= d.getNota()%></td>
           <td>
               <form method="post">
                   <input type="hidden" name="nota" step="0.01" min="0.00" max="10.00" value="<%= d.getNota() %>"/>
                   <input type="hidden" name="nome" value="<%= d.getNome() %>"/>
                   <input type="submit" name="prepararUpdate" value="Alterar"/>
                   <input type="submit" name="prepararDelete" value="Excluir"/>
               </form>
           </td>
         </tr>
        </tbody>
        <%}%>
        </table>
        </div>
    </body>
</html>
