package dao;

import entidad.Usuario;

public interface UsuariosDao {
	public Usuario BuscarUsuario(Usuario obj);
	
	public int agregarUsuario(Usuario obj);
	
	public int modificarUsuario(Usuario obj);

	public boolean existeUsuario(String usuario);

	public Usuario BuscarContrase�a(String usuario);
	
	public int bajaUsuario(int dni);
	
	public boolean EliminarUsuario(String usuario);
}
