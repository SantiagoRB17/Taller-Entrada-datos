import javax.swing.JOptionPane;
/**
 * Clase Mensaje para mostrar cuadros de diálogo de entrada y salida usando JOptionPane.
 * 
 * 
 * Si el primer argumento es "input", muestra un cuadro de entrada y retorna el valor ingresado por consola.
 * Si se proporciona cualquier otro argumento, muestra ese mensaje en un cuadro de diálogo.
 * Si no se proporciona ningún argumento, muestra un mensaje por defecto.
 *
 *
 * 
 * Ejemplo de uso:
 *   java Mensaje input "Ingrese su nombre:"
 *   java Mensaje "Hola mundo"
 *
 */
public class Mensaje {
    public static void main(String[] args) {
        if (args.length > 0 && args[0].equals("input")) {
            String mensaje = args.length > 1 ? args[1] : "Ingrese un valor:";
            String input = JOptionPane.showInputDialog(null, mensaje);
            System.out.println(input);
        } else if (args.length > 0) {
            JOptionPane.showMessageDialog(null, args[0]);
        } else {
            JOptionPane.showMessageDialog(null, "No se proporcionó ningún mensaje");
        }
    }
}