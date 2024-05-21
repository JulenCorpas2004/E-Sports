package Controlador.ControladoresVista;

import Controlador.ControladorPrincipal;
import Modelo.*;
import Vista.VentanaInicial;
import Vista.VentanaInicioSesion;

import java.sql.Connection;
import java.util.List;

public class ControladorVista {

    //CONTROLADORES DE LAS VENTANAS
    private ControladorVI cvi;
    private ControladorVTienda cvt;
    private ControladorVIS cvis;
    private ControladorVAdmin cva;
    private ControladorVUser cvu;
    private ControladorVCompeticiones cvco;
    private ControladorVEquipos cve;
    private ControladorVJornadas cvj;
    private ControladorDUsuario cdu;

    private final ControladorPrincipal cp;

    public ControladorVista(ControladorPrincipal cp) {
        this.cp = cp;

        //Creación de los controladores de las ventanas

        cvi = new ControladorVI(this);
        cvis = new ControladorVIS(this);
        cva = new ControladorVAdmin(this);
        cvu = new ControladorVUser(this);
        cvco = new ControladorVCompeticiones(this);
        cve = new ControladorVEquipos(this);
        cvj = new ControladorVJornadas(this);
        cdu = new ControladorDUsuario(this);
        cvt = new ControladorVTienda(this);

        cvi.crearMostrar();
    }

    public void mostrarInicioSesion(VentanaInicial vi){
        cvis.crearMostrar(vi);
    }

    public void mostrarUser(VentanaInicioSesion vis){
        cvu.crearMostrar(vis);
    }

    public void mostrarVAdmin(VentanaInicioSesion vis){
        cva.crearMostrar(vis);
    }

    public void mostrarJornadas(VentanaInicial vi){
        cvj.crearMostrar(vi);
    }

    public void mostrarClasificacion(VentanaInicial vi){
        cvco.crearMostrar(vi);
    }

    public void mostrarEquipos(VentanaInicial vi){
        cve.crearMostrar(vi);
    }

    public void mostrarTienda(){
        cvt.crearMostrar();
    }

    public void mostrarDUsuario(){
        cdu.crearMostrar();
    }

    //COMPETICION
    public void insertarCompeticion(Competicion c) throws Exception {
        cp.insertarCompeticion(c);
    }

    public void borrarCompeticion(int idCompeticion) throws Exception{
        cp.borrarCompeticion(idCompeticion);
    }

    public Competicion buscarCompeticion(Integer id_competicion) throws Exception {
        return cp.buscarCompeticion(id_competicion);
    }

    public String[][] buscarEquiposPorNombreCom(String nombre) throws Exception {
        return cp.buscarEquiposPorNombreCom(nombre);
    }

    public List<Competicion> buscarTodasCompeticiones() throws Exception {
        return cp.buscarTodasCompeticiones();
    }

    public void modificarCompeticion(Competicion c) throws Exception{
        cp.modificarCompeticion(c);
    }


    //EQUIPO
    public void insertarEquipo(Equipo e) throws Exception {
        cp.insertarEquipo(e);
    }

    public void borrarEquipo(int idEquipo) throws Exception{
        cp.borrarEquipo(idEquipo);
    }

    public Equipo buscarEquipo(Integer id_equipo) throws Exception {
        return cp.buscarEquipo(id_equipo);
    }

    public void modificarEquipo(Equipo e) throws Exception{
        cp.modificarEquipo(e);
    }


    //JORNADA
    public void insertarJornada(Jornada j) throws Exception {
        cp.insertarJornada(j);
    }

    public void borrarJornada(int idJornada) throws Exception{
        cp.borrarJornada(idJornada);
    }

    public Jornada buscarJornada(Integer id_jornada) throws Exception {
        return cp.buscarJornada(id_jornada);
    }

    public void modificarJornada(Jornada j) throws Exception{
        cp.modificarJornada(j);
    }


    //JUEGO
    public void insertarJuego(Juego j) throws Exception {
        cp.insertarJuego(j);
    }

    public void borrarJuego(int idJuego) throws Exception{
        cp.borrarJuego(idJuego);
    }

    public Juego buscarJuego(Integer id_juego) throws Exception {
        return cp.buscarJuego(id_juego);
    }

    public void modificarJuego(Juego j) throws Exception{
        cp.modificarJuego(j);
    }


    //JUGADOR
    public void insertarJugador(Jugador j) throws Exception {
        cp.insertarJugador(j);
    }

    public void borrarJugador(int idJugador) throws Exception{
        cp.borrarJugador(idJugador);
    }

    public Jugador buscarJugador(Integer id_jugador) throws Exception {
        return cp.buscarJugador(id_jugador);
    }

    public void modificarJugador(Jugador j) throws Exception{
        cp.modificarJugador(j);
    }


    //PATROCINADOR
    public void insertarPatrocinador(Patrocinador p) throws Exception {
        cp.insertarPatrocinador(p);
    }

    public void borrarPatrocinador(int idPatrocinador) throws Exception{
        cp.borrarPatrocinador(idPatrocinador);
    }

    public Patrocinador buscarPatrocinador(Integer id_patrocinador) throws Exception {
        return cp.buscarPatrocinador(id_patrocinador);
    }

    public void modificarPatrocinador(Patrocinador p) throws Exception{
        cp.modificarPatrocinador(p);
    }


    //STAFF
    public void insertarStaff(Staff s) throws Exception {
        cp.insertarStaff(s);
    }

    public void borrarStaff(int idStaff) throws Exception{
        cp.borrarStaff(idStaff);
    }

    public Staff buscarStaff(Integer id_staff) throws Exception {
        return cp.buscarStaff(id_staff);
    }

    public void modificarStaff(Staff s) throws Exception{
        cp.modificarStaff(s);
    }

    //EQUIPO_COMPETICION
    public List<EquipoCompeticion> buscarTodosEquiposCompeticiones() throws Exception {
        return cp.buscarTodosEquiposCompeticiones();
    }

    //CONEXION
    public void cerrarConexion() throws Exception{
        cp.cerrarConexion();
    }
}