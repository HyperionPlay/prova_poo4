package prova_poo;
//Verificado
import java.util.ArrayList;
import prova_poo2.DbListener;
import java.sql.*;

public class disciplina {
    private String nome;
    private String ementa;
    private int ciclo;
    private double nota;

    public disciplina(String nome, String ementa, int ciclo, double nota) {
        this.nome = nome;
        this.ementa = ementa;
        this.ciclo = ciclo;
        this.nota = nota;
    }
    /**
     * @return the nom
     */
    public String getNome() {
        return nome;
    }

    /**
     * @param nome the nome to set
     */
    public void setNome(String nome) {
        this.nome = nome;
    }

    /**
     * @return the ementa
     */
    public String getEmenta() {
        return ementa;
    }

    /**
     * @param ementa the ementa to set
     */
    public void setEmenta(String ementa) {
        this.ementa = ementa;
    }

    /**
     * @return the ciclo
     */
    public int getCiclo() {
        return ciclo;
    }

    /**
     * @param ciclo the ciclo to set
     */
    public void setCiclo(int ciclo) {
        this.ciclo = ciclo;
    }

    /**
     * @return the nota
     */
    public double getNota() {
        return nota;
    }

    /**
     * @param nota the nota to set
     */
    public void setNota(double nota) {
        this.nota = nota;
    }
    public static ArrayList<disciplina> getList()throws Exception{
        ArrayList<disciplina> mostrar = new ArrayList<>();
        Connection con = DbListener.getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM disciplinas");
        while(rs.next()){
            mostrar.add(new disciplina(
                rs.getString("nome"),
                rs.getString("ementa"),
                rs.getInt("ciclo"),
                rs.getDouble("nota")   
            ));
        } 
    rs.close();
    stmt.close();
    con.close();
    return mostrar;
}
    public static void inserirDisciplina(String nome, String ementa, String ciclo, double nota) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("INSERT INTO disciplinas(nome, ementa, ciclo, nota) VALUES(?,?,?,?)");
        stmt.setString(1, nome);
        stmt.setString(2, ementa);
        stmt.setString(3, ciclo);
        stmt.setDouble(4, nota);
        stmt.execute();
        stmt.close();
        con.close();
}
    public static void alterarNota(String nome, double nota) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("UPDATE disciplinas SET nota=? WHERE nome=?");
        stmt.setDouble(1, nota);
        stmt.setString(2, nome);
        stmt.execute();
        stmt.close();
        con.close();
}
     public static void excluirDisciplina(String nome) throws Exception{
        Connection con = DbListener.getConnection();
        PreparedStatement stmt = con.prepareStatement("DELETE FROM disciplinas WHERE nome= ?");
        stmt.setString(1, nome);
        stmt.execute();
        stmt.close();
        con.close();
}
    
public static String getCreateStatement(){
    return "CREATE TABLE IF NOT EXISTS disciplinas("
            + "nome VARCHAR(40) PRIMARY KEY,"
            + "ementa VARCHAR(200) NOT NULL,"
            + "ciclo VARCHAR(200) NOT NULL,"
            + "nota DOUBLE(20) NOT NULL"
            + ")";
    }
}
