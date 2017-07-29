package com.pfc.datos;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;



@PersistenceCapable
public class Cancion {
	


	 @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;

	
	@Persistent
	private String tituloCancion;
	
	
	@Persistent
	private String tituloDisco;
	
	@Persistent
	private CadenaLarga letra;
	
	
	
	//
	@Persistent
	private CadenaLarga traduccion;
	
	@Persistent
	private int orden;
	@Persistent
	private String resumen;
	@Persistent
	private String mensaje;
	@Persistent
	private String listaEtiquetas; //codificada

	
	
	
	@Persistent
	private CadenaLarga tab;
	@Persistent
	private String duracion;
	
	@Persistent
	private String web;
	@Persistent
	private String wiki;
	@Persistent
	private String redes;
	
	@Persistent
	private int imp;
	
	
	
	//
	public Cancion(String tituloCancion, String titulodisco, String letra) {
		super();
		this.tituloCancion = tituloCancion;
		tituloDisco = titulodisco;
		this.letra = new CadenaLarga(letra);
	}

	
	public Cancion(String tituloCancion, String titulodisco, String letra,String traduccion,String orden,String resumen,String mensaje,String listaEtiquetas,
			String tab,String duracion,String web,String wiki,String redes,String imp) {
		super();
		this.tituloCancion = tituloCancion;
		tituloDisco = titulodisco;
		this.letra = new CadenaLarga(letra);
		this.traduccion=new CadenaLarga(traduccion);
		
		try
		{
		this.orden=Integer.parseInt(orden);
		}catch(NumberFormatException e)
		{
			
			this.orden=0;
		}
		
		this.resumen=resumen;
		this.mensaje=mensaje;
		this.listaEtiquetas=listaEtiquetas;	
		
		this.tab=new CadenaLarga(tab);
		this.duracion=duracion;
		this.web=web;
		this.wiki=wiki;
		this.redes=redes;
		
		try
		{
		this.imp=Integer.parseInt(imp);
		}
		catch(NumberFormatException e)
		{
			this.imp=0;
			
		}
	}
	
	
	
	
	public String getTab() {
		return tab.toString();
	}


	public void setTab(String tab) {
		this.tab = new CadenaLarga(tab);
	}


	public String getDuracion() {
		return duracion;
	}


	public void setDuracion(String duracion) {
		this.duracion = duracion;
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


	public String getTraduccion() {
		return traduccion.toString();
	}






	public void setTraduccion(CadenaLarga traduccion) {
		this.traduccion = traduccion;
	}






	public int getOrden() {
		return orden;
	}






	public void setOrden(int orden) {
		this.orden = orden;
	}






	public String getResumen() {
		return resumen;
	}






	public void setResumen(String resumen) {
		this.resumen = resumen;
	}






	public String getMensaje() {
		return mensaje;
	}






	public void setMensaje(String mensaje) {
		this.mensaje = mensaje;
	}






	public String getListaEtiquetas() {
		return listaEtiquetas;
	}






	public void setListaEtiquetas(String listaEtiquetas) {
		this.listaEtiquetas = listaEtiquetas;
	}






	public String getTituloCancion() {
		return tituloCancion;
	}

	public void setTituloCancion(String tituloCancion) {
		this.tituloCancion = tituloCancion;
	}

	public String getTitulodisco() {
		return tituloDisco;
	}

	public void setTitulodisco(String titulodisco) {
		tituloDisco = titulodisco;
	}

	public String getLetra() {
		return letra.toString();
	}

	public void setLetra(String letra) {
		this.letra = new CadenaLarga(letra);
	}

	@Override
	public String toString() {
		return "Cancion [tituloCancion=" + tituloCancion + ", Titulodisco="
				+ tituloDisco + ", letra=" + letra + "]";
	}
	
	/*......*/
	
	
	
	
	
	
	


}
