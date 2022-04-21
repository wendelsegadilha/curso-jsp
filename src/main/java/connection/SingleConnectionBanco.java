package connection;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnectionBanco {

    private static String url = "jdbc:postgresql://localhost:5433/curso-jsp-jdev?autoReconnect=true";
    private static String user = "postgres";
    private static String password = "postgres";
    private static Connection connection = null;

    /*Conecta ao invocar a classe*/
    static {
        conectar();
    }

    /*Conecta ao criar uma nova instancia da classe*/
    public SingleConnectionBanco() {
        conectar();
    }

    private static void conectar() {
        try{
            if (connection == null){
                Class.forName("org.postgresql.Driver"); /* Carrega o driver de conexão com o banco */
                connection = DriverManager.getConnection(url, user, password);
                connection.setAutoCommit(false); /* Para não efetuar alterações no banco sem nosso comando */
            }
        }catch (Exception e){
            e.printStackTrace(); /* Mostra qualquer erro ao efetuar a conexão com o banco*/
        }
    }

    /*retorna a conexão*/
    public static Connection getConnection() {
        return connection;
    }
}
