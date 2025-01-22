package excepciones;

public class ValidarTextosException extends RuntimeException{
	
	public ValidarTextosException() {
        super("El texto contiene caracteres no v�lidos.");
    }

    public ValidarTextosException(String message) {
        super(message);
    }

    @Override
    public String getMessage() {
        return super.getMessage(); // Mensaje pasado al constructor.
    }

}
