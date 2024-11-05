package controlador;
import modelo.BDReserva;
import modelo.Reserva;
import vista.vista;

public class controlador {
    private final BDReserva bdreserva = new BDReserva();
    public void Ejectutar(){
        boolean inprogram = true;
        while (inprogram){
            int r = vista.MenuPrincipal();
            switch (r) {
                case 1:
                    for (Reserva re : bdreserva.getDatos().values()){
                        vista.ImprimirDatosReserva(re);
                    }
                    break;
                case 2:
                    String codigo = vista.RecibirCodigo();
                    Reserva ReservaCodigo =  bdreserva.BuscarReserva(codigo);
                    if (ReservaCodigo != null){
                        vista.ImprimirDatosReserva(ReservaCodigo);
                    }
                    break;
                case 3:
                    Reserva rsev = vista.RecibirReserva();
                    bdreserva.InsertarDatos(rsev);
                    break;
                case 4:
                    inprogram = false;
                    vista.MensajeSalida();
                    break;
            }
        }
    }
}
