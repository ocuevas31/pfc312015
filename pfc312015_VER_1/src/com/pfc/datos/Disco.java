package com.pfc.datos;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;



@PersistenceCapable
public class Disco {
	
	
	 @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;

	
	@Persistent
	private String titulo;
	
	
	@Persistent
	private String grupo;
	
	
	
	
	@Persistent
	private String portada; //url a la imagen  de la portada del disco
	

	private List<Cancion> canciones;
	
	
	
	
	@Persistent
	private Date fecha;
	
	
	@Persistent
	private String web;
	
	
	@Persistent
	private String wiki;
	
	
	@Persistent
	private String redes;
	
	
	
	
	

	public Disco(String titulo,String grupo,String portada,Date f,String web,String wiki,String redes) {
		super();
		this.titulo = titulo;
		this.grupo=grupo;
		canciones=new ArrayList<Cancion>();
		this.portada=portada;
		
		fecha=f;
		
		
		
		this.web=web;
		this.wiki=wiki;
		this.redes=redes;
	}

	
	
	
	public String getWeb() {
		return web;
	}




	public void setWeb(String web) {
		this.web = web;
	}




	public String getWiki() {
		return wiki;
	}




	public void setWiki(String wiki) {
		this.wiki = wiki;
	}




	public String getRedes() {
		return redes;
	}




	public void setRedes(String redes) {
		this.redes = redes;
	}




	public Date getFecha() {
		return fecha;
	}




	public void setFecha(Date fecha) {
		this.fecha = fecha;
	}




	public String getPortada() {
		return portada;
	}




	public void setPortada(String portada) {
		this.portada = portada;
	}




	public String getGrupo() {
		return grupo;
	}


	public void setGrupo(String grupo) {
		this.grupo = grupo;
	}


	public String getTitulo() {
		return titulo;
	}

	

	
	public List<Cancion> getCanciones() {
		return canciones;
	}

/*
	public void setCanciones(List<Cancion> canciones) {
		this.canciones = canciones;
	}
*/
	
	public void insertarCancion(Cancion c)
	{
		
		
	canciones.add(c);
	}


	@Override
	public String toString() {
		return "Disco [titulo=" + titulo + ", grupo=" + grupo + ", canciones="
				+ canciones + "]";
	}


	public int buscarCancion(String tituloCancion)
	{
		
		
		for(int i=0;i<canciones.size();i++)
			
			if (canciones.get(i).getTituloCancion().equals(tituloCancion)) { return i;}
		
		return -1;
		
	}
	
	public void borrarCancion(String tituloCancion)
	{
		
		canciones.remove(buscarCancion(tituloCancion));
	
	}

	

	

	
	
}
