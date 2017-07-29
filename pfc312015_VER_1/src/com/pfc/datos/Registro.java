package com.pfc.datos;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable
public class Registro 
{
	
	
	@PrimaryKey
	 @Persistent
	private String user;
	
	
	
	@Persistent
	private List<String> grupos;
	
	
	public Registro(String user,String v[])
	{
		
		this.user=user;
		
		grupos=new ArrayList<String>();

		for (String g : v) {
			
			grupos.add(g);
			
		} 
		
		
		
	}


	public String getUser() {
		return user;
	}


	public void setUser(String user) {
		this.user = user;
	}


	public List<String> getGrupos() {
		return grupos;
	}


	public void setGrupos(List<String> grupos) {
		this.grupos = grupos;
	}


	@Override
	public String toString() {
		return "Registro [user=" + user + ", grupos=" + grupos + "]";
	}
	
	
	
	

}
