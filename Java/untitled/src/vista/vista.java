package vista;

import controlador.controlador;
import modelo.Reserva;

import java.util.Scanner;

public class vista {
    static Scanner sc = new Scanner(System.in);

    private  static  controlador c =new controlador();

    public static void ejecutar(){
        c.Ejectutar();
    }

    public static int MenuPrincipal(){
        System.out.println("1.Buscar Todos las reservas\n2.Buscar una reserva especifica\n3.Agregar una reserva\n4.Salir");
        int r = sc.nextInt();
        sc.nextLine();
        return r;
    }

    public static void MensajeSalida(){
        System.out.println("Hasta Luego, Vuelva Pronto");
    }

    public static void ImprimirDatosReserva(Reserva r){
        System.out.println("--------------------------");
        System.out.println("Codigo :" + r.getCodigo());
        System.out.println("Fecha Ingreso : " + r.getFecha_Ingreso());
        System.out.println("Fecha Egreso : " + r.getFecha_Egreso());
        System.out.println("Cedula : " + r.getCedula());
        System.out.println("Nombre : " + r.getNombre());
        System.out.println("Numero De Personas : " + r.getNo_Personas());
    }

    public static String RecibirCodigo(){
        System.out.println("Digite el codigo que esta Buscando");
        return sc.nextLine();
    }

    public static Reserva RecibirReserva(){
        System.out.println("Digite el codigo del nuevo registro ");
        String codigo = sc.nextLine();
        System.out.println("Digite la fecha de ingreso del nuevo registro ");
        String fechaingreso = sc.nextLine();
        System.out.println("Digite la fecha de egreso del nuevo registro ");
        String fechaegreso = sc.nextLine();
        System.out.println("Digite la cedula del nuevo registro ");
        String cedula = sc.nextLine();
        System.out.println("Digite el nombre del nuevo registro ");
        String nombre = sc.nextLine();
        System.out.println("Digite el numero de personas del nuevo registro ");
        int numerop =  sc.nextInt();
        sc.nextLine();
        return new Reserva (codigo,fechaingreso,fechaegreso,cedula,nombre,numerop);
    }

}
