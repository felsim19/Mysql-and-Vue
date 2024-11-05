package modelo;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexion {
    private String db = "hotel";
    private  String url = "jdbc:mysql://localhost:3306/"+db;
    private String user="root";
    private String pasw ="0000";

    Connection conex = null;

    public Connection Conecta(){
        try{
            //Conexion base de datos
            conex = DriverManager.getConnection(url,user,pasw);
            System.out.println("Conexion Existosa");
        }catch (Exception e){
            System.out.println("Error en la conexion" + e);
        }
            return conex;
    }

}
