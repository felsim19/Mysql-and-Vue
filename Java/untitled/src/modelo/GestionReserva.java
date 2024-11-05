package modelo;

import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

public class GestionReserva {
    Conexion con = new Conexion();
    Connection SaveConexion = con.Conecta();
    PreparedStatement ps=null;
    Statement st = null;
    ResultSet res=null;

    private HashMap <String,Reserva> datos = new HashMap<>();
    private ArrayList <Reserva> Datos = new ArrayList<>();

    public boolean InsertarDatos(Reserva r){
        boolean resultado = false;
        Reserva existe = BuscarReserva(r.getCodigo());
        try{
            if (existe == null){
                String sql="insert into reserva values(?,?,?,?,?,?)";
                ps = SaveConexion.prepareStatement(sql);
                ps.setString(1, r.getCodigo());
                ps.setString(2, r.getFecha_Ingreso());
                ps.setString(3, r.getFecha_Egreso());
                ps.setString(4, r.getCedula());
                ps.setString(5, r.getNombre());
                ps.setInt(6, r.getNo_Personas());
                resultado =  ps.executeUpdate()>0;
            }
        }catch (SQLException ex){
            System.out.println("Error al insertar" + ex);
        }
        return resultado;
    }

    public Reserva BuscarReserva(String Codigo){
        Reserva rsv=null;
        try {
             String sql = "Select * from reserva where codigo = ? ";
             ps = SaveConexion.prepareStatement(sql);
             ps.setString(1,Codigo);
             res= ps.executeQuery();
             while (res.next()){
                 rsv = new Reserva(res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getInt(6));
             }
        }catch (SQLException ex){
            System.out.println("error al consultar " + ex);
        }
        return rsv;
    }
    public ArrayList<Reserva> BuscarTodos(){
        Reserva rsv=null;
        try {
            String sql = "Select * from reserva";
            st = SaveConexion.createStatement();
            res= st.executeQuery(sql);
            while (res.next()){
                rsv = new Reserva(res.getString(1),res.getString(2),res.getString(3),res.getString(4),res.getString(5),res.getInt(6));
                Datos.add(rsv);
            }
        }catch (SQLException ex){
            System.out.println("error al consultar todos las reservas" + ex);
        }
        return Datos;
    }

}
