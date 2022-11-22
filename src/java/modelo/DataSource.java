package modelo;
import java.sql.Connection;
import java.sql.DriverManager;
/**
 *
 * @author Hevert.Sousa
 */
public class DataSource {
    Connection conn;
    public void conectar() throws Exception{
        String url,usuario,senha;
        usuario="root";
        senha="";
        url="jdbc:mysql://localhost/projetofinalpoo";
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection(url, usuario, senha);
    }
    public void desconectar() throws Exception{
        if(!conn.isClosed()){
            conn.close();
        }
    }
}
