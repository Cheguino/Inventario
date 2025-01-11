/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
//import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;



/**
 *
 * @author PC_Admin
 */
public class Conexion {
     Connection conectar;
     String usuario = "root"; //almacena usuario 
     String contrasena = "Pollo_7890";
     String bd = "Proyetto"; 
     String ip = "localhost";
     String puerto = "3306";
     
     //Lo anterior se almacena en una cadena tipo String
     String cadena = "jdbc:mysql://" + ip + ":" + puerto + "/" + bd;
    String url = "jdbc:mysql://localhost:3306/Proyetto"; 
     
     //Crea una funcion del tipo "Connection" que me va a devoler una variable del tipo conexion llamado "establece conexion" 
     public Connection estableceConexion(){
         conectar = null;
         try {
             Class.forName("com.mysql.cj.jdbc.Driver");
             conectar = (Connection)DriverManager.getConnection(url, usuario, contrasena);
             JOptionPane.showMessageDialog(null, "Conexión exitosa");
         } catch (Exception e) {
             JOptionPane.showMessageDialog(null, "No se puedo conectar a la bd. Error: "+ e.toString());
         }
    return conectar;
     }
}
