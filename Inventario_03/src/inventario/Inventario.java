/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package inventario;

import Conexion.Conexion; //Importa del paquete Conexion la clase "Conexion"

/**
 *
 * @author L
 */
public class Inventario {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
  
     Conexion Conecta = new Conexion();
     Conecta.estableceConexion();

    }
    
}
