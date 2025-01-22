package excepciones;

public class BuscarDniConLetrasException extends RuntimeException{

	public BuscarDniConLetrasException() {
		
	}
	
	public BuscarDniConLetrasException(String message) {
        super(message);
    }
	
	public String getMessage() {
        return "Ingrese solo n�meros para buscar el DNI.";
    }
	
}
