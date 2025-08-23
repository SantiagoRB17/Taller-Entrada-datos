import javax.swing.JOptionPane;

public class Formulario {
    public static void main(String[] args) {
        if (args.length > 0 && args[0].equals("input")) {
            String nombre = args.length > 1 ? args[1] : "Ingrese el nombre de el empleado:";
            String inputNombre = JOptionPane.showInputDialog(null, nombre);
            String horasTrabajadas = args.length > 2 ? args[2] : "Ingrese las horas trabajadas: ";
            int inputHorasTrabajadas = Integer.parseInt(JOptionPane.showInputDialog(null, horasTrabajadas));
            String valorPorHora= args.length > 3 ? args[3] : "Ingrese el valor por hora: ";
            double inputValorPorHora = Double.parseDouble(JOptionPane.showInputDialog(null, valorPorHora));
            System.out.println(inputNombre + "," + inputHorasTrabajadas + "," + inputValorPorHora);
        } else if (args.length > 0) {
            JOptionPane.showMessageDialog(null, args[0]);
        } else {
            JOptionPane.showMessageDialog(null, "No se proporcionó ningún mensaje");
        }
    }
}
