<%-- 
    Document   : index
    Created on : 5 de out de 2020, 01:54:05
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="WEB-INF/jspf/menu.jspf"%>
<%@page import="prova_poo.*"%>

<%

disciplina obj = (disciplina)application.getAttribute("lista");

if(obj == null){

disciplina lista = new disciplina(" "," ",0);

disciplina bd  = new disciplina("Banco de Dados","Conceitos de Base de Dados. Modelos conceituais de informações. Modelos de Dados: Relacional,  Redes e Hierárquicos. Modelagem de dados - conceitual, lógica e física. Teoria relacional: dependências funcionais e multivaloradas, formas normais. Restrições de integridade e de segurança em Banco de Dados Relacional. Sistemas Gerenciadores de Banco de Dados – objetivo e funções. Linguagens de declaração e de manipulação de dados.",4);
    lista.getList().add(new disciplina(bd.getNome(),bd.getEmenta(),bd.getCiclo()));

disciplina eng  = new disciplina("Engenharia de Software III","Conceitos, evolução e importância de arquitetura de software. Padrões de Arquitetura. Padrões de Distribuição. Camadas no desenvolvimento de software. Tipos de Arquitetura de Software. Visões na arquitetura de software. Modelo de Análise e Projetos. Formas de representação. O processo de desenvolvimento. Mapeamento para implementação. Integração do sistema. Testes: planejamento e tipos. Manutenção. Documentação.",4);
    lista.getList().add(new disciplina(eng.getNome(),eng.getEmenta(),eng.getCiclo()));
    
disciplina poo  = new disciplina("Programação Orientada a Objetos","Conceitos e evolução da tecnologia de orientação a objetos. Limitações e diferenças entre o paradigma da programação estruturada em relação à orientação a objetos. Conceito de objeto, classe, métodos, atributos, herança, polimorfismo, agregação, associação, dependência, encapsulamento, mensagem e suas respectivas notações na linguagem padrão de representação da orientação a objetos. Implementação de algoritmos orientado a objetos utilizando linguagens de programação. Aplicação e uso das estruturas fundamentais da orientação a objetos.",4);
    lista.getList().add(new disciplina(poo.getNome(),poo.getEmenta(),poo.getCiclo()));
    
disciplina lp  = new disciplina("Linguagem de Programação IV","Comandos de linguagens usadas na construção e estruturação de sites para a Web, com páginas dinâmi­cas e interativas. Definição de layouts e formatação em geral. Adição de algorítmos usando laços, matrizes, datas, funções e condições. Introdução a Orientação a Objetos utilizando objetos, métodos e propriedades. Integração com Banco de Dados. Exercícios práticos com projeto de criação de sites.",4);
    lista.getList().add(new disciplina(lp.getNome(),lp.getEmenta(),lp.getCiclo()));
    
disciplina so2  = new disciplina("Sistemas Operacionais II","Apresentação de um sistema operacional específico utilizado em ambiente corporativo. Requisitos de hardware para instalação do sistema. Processo de instalação, personalização, operação, administração e segurança sobre o sistema operacional focado.  Elaboração de projetos de seleção e implantação de um sistema operacional.",4);
    lista.getList().add(new disciplina(so2.getNome(),so2.getEmenta(),so2.getCiclo()));
    
disciplina ing  = new disciplina("Inglês IV","Consolidação da compreensão e produção oral e escrita por meio da integração das habilidades lingüístico-comunicativas desenvolvidas na disciplina Inglês 3. Ênfase na oralidade, atendendo às especificidades acadêmico-profissionais da área e abordando aspectos sócio-culturais da língua inglesa.",4);
    lista.getList().add(new disciplina(ing.getNome(),ing.getEmenta(),ing.getCiclo()));
    
disciplina met  = new disciplina("Metodologia da Pesquisa Científico-Tecnológica","O Papel da ciência e da tecnologia. Tipos de conhecimento. Método e técnica. O processo de leitura e de análise textual. Citações e bibliografias. Trabalhos acadêmicos: tipos, características e composição estrutural. O projeto de pesquisa experimental e não-experimental. Pesquisa qualitativa e quantitativa. Apresentação gráfica. Normas da ABNT.",4);
    lista.getList().add(new disciplina(met.getNome(),met.getEmenta(),met.getCiclo()));
    
disciplina so1  = new disciplina("Sistemas Operacionais I","Introdução a Sistemas Operacionais. Estrutura dos Sistemas Operacionais. Processos e Threads. Gerencia de Processos. Sincronização de Processos Concorrentes. Gerenciamento de Memória. Memória Virtual. Sistemas de Arquivos. Gerência de Dispositivos. Tópicos complementares. Estudos de caso.",4);
    lista.getList().add(new disciplina(so1.getNome(),so1.getEmenta(),so1.getCiclo()));
    
    application.setAttribute("lista", lista);
}

%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Nome: Henrique Pereira Souza</h1>
        <h1>RA: 1290481912039</h1>
        <h1>Quantas disciplinas eu tenho: <% out.print(obj.getList().size());%></h1>
    </body>
</html>
