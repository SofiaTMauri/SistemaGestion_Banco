package entidad;

public class Usuario {
	private String Usuario;
	private String Contrase�a;
	private int TipoUsuario;
	
	public Usuario() {
		this.Usuario = "";
		this.Contrase�a = "";
		this.TipoUsuario = 0;
	}
	
	public Usuario(String usuario, String contrase�a, int tipoUsuario) {
		Usuario = usuario;
		Contrase�a = contrase�a;
		TipoUsuario = tipoUsuario;
	}
	///set y gets
	public String getUsuario() {
		return Usuario;
	}
	public void setUsuario(String usuario) {
		Usuario = usuario;
	}
	public String getContrase�a() {
		return Contrase�a;
	}
	public void setContrase�a(String contrase�a) {
		Contrase�a = contrase�a;
	}
	public int getTipoUsuario() {
		return TipoUsuario;
	}
	public void setTipoUsuario(int tipoUsuario) {
		TipoUsuario = tipoUsuario;
	}
	
	
	
	
}
