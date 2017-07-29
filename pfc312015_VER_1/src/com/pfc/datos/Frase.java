package com.pfc.datos;

import javax.jdo.annotations.IdGeneratorStrategy;
import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;

import com.google.appengine.api.datastore.Key;


@PersistenceCapable
public class Frase {
	
	
	
	

	 @PrimaryKey
	    @Persistent(valueStrategy = IdGeneratorStrategy.IDENTITY)
	    private Key key;

	
	@Persistent
	String texto;
	
	
	public Frase(String c)	
	{
		
		texto=c;
	}


	public String getTexto() {
		return texto;
	}


	public void setTexto(String texto) {
		this.texto = texto;
	}


	@Override
	public String toString() {
		return "Noticia [texto=" + texto + "]";
	}
	
	
	
	
}
