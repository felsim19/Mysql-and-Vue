package modelo;

public class Reserva {
    private String Codigo;
    private String Fecha_Ingreso;
    private String Fecha_Egreso;
    private String Cedula;
    private String Nombre;
    private int No_Personas;

    public Reserva() {
    }

    public Reserva(String codigo, String fecha_Ingreso, String fecha_Egreso, String cedula, String nombre, int no_Personas) {
        Codigo = codigo;
        Fecha_Ingreso = fecha_Ingreso;
        Fecha_Egreso = fecha_Egreso;
        Cedula = cedula;
        Nombre = nombre;
        No_Personas = no_Personas;
    }

    public String getCodigo() {
        return Codigo;
    }

    public void setCodigo(String codigo) {
        Codigo = codigo;
    }

    public String getFecha_Ingreso() {
        return Fecha_Ingreso;
    }

    public void setFecha_Ingreso(String fecha_Ingreso) {
        Fecha_Ingreso = fecha_Ingreso;
    }

    public String getFecha_Egreso() {
        return Fecha_Egreso;
    }

    public void setFecha_Egreso(String fecha_Egreso) {
        Fecha_Egreso = fecha_Egreso;
    }

    public String getCedula() {
        return Cedula;
    }

    public void setCedula(String cedula) {
        Cedula = cedula;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String nombre) {
        Nombre = nombre;
    }

    public int getNo_Personas() {
        return No_Personas;
    }

    public void setNo_Personas(int no_Personas) {
        No_Personas = no_Personas;
    }

    @Override
    public String toString() {
        return "Reserva{" +
                "Codigo='" + Codigo + '\'' +
                ", Fecha_Ingreso='" + Fecha_Ingreso + '\'' +
                ", Fecha_Egreso='" + Fecha_Egreso + '\'' +
                ", Cedula='" + Cedula + '\'' +
                ", Nombre='" + Nombre + '\'' +
                ", No_Personas=" + No_Personas +
                '}';
    }
}
