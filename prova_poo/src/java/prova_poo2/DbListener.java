package prova_poo2;

import javax.servlet.ServletContextListener;
import java.sql.*;
import javax.servlet.ServletContextEvent;
import prova_poo.disciplina;


public class DbListener implements ServletContextListener {
    public static final  String CLASS_NAME = "org.sqlite.JDBC";
    public static final  String URL = "jdbc:sqlite:DisciplinaPOO.db";
    
    public static String exceptionMessage = null;
    
    public static Connection getConnection() throws Exception{
        return DriverManager.getConnection(URL);
    }
    public void contextInitialized(ServletContextEvent sce){
    Connection con = null;
    Statement stmt = null;
    
    try{
    Class.forName(CLASS_NAME);
    con = DriverManager.getConnection(URL);
    stmt = con.createStatement();
    stmt.execute(disciplina.getCreateStatement());
    if(disciplina.getList().isEmpty()){
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Banco de Dados','Conceitos de Base de Dados. Modelos conceituais de informações.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Engenharia de Software III','Conceitos, evolução e importância de arquitetura de software.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Programação Orientada a Objetos','Conceitos e evolução da tecnologia de orientação a objetos.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Linguagem de Programação IV','Comandos de linguagens usadas na construção e estruturação de sites para a Web','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Sistemas Operacionais II','Apresentação de um sistema operacional específico utilizado em ambiente corporativo.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Inglês IV','Consolidação da compreensão e produção oral e escrita por meio da integração das habilidades lingüístico-comunicativas desenvolvidas na disciplina Inglês 3.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Metodologia da Pesquisa Científico-Tecnológica','O Papel da ciência e da tecnologia. Tipos de conhecimento.','4º','0.00')");
        
        stmt.execute("INSERT INTO disciplinas "
        + "VALUES('Sistemas Operacionais I','Introdução a Sistemas Operacionais.','4º','0.00')");
    }
    }catch(Exception ex){
        exceptionMessage = ex.getLocalizedMessage();
    }finally{
    try{stmt.close();}catch(Exception ex2){}
    try{con.close();}catch(Exception ex2){}  
    }
  }
public void contextDestroyed(ServletContextEvent sce){   
    }
}

