package com.pfc.datos;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable
public class Admin 
{
	
	 @PrimaryKey
	 @Persistent
	 private String nombre; //correo electronico.
	 
	 @Persistent
	 private String password;
	 
	 
	 

	public Admin(String nombre, String password) {
		super();
		this.nombre = nombre;
		this.password = password;
	}

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	

	

	@Override
	public String toString() {
		
		return "Admin [nombre=" + nombre + ", password=" + password + "]";
		
		
		
		
		

		
	}
	
	
	 
	 
	 
	

}
