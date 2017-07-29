package com.pfc.datos;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.jdo.annotations.PersistenceCapable;
import javax.jdo.annotations.Persistent;
import javax.jdo.annotations.PrimaryKey;


@PersistenceCapable
public class Grupo {
	
	
	@PrimaryKey
	 @Persistent
	private String nombre;
	
	
	@Persistent
	private String logo; //url a la imgaen del logo del grupo

	
	//.....todos los demas datos
	@Persistent
	private List<Disco> discos;

	@Persistent
	private Date fini;
	
	
	
	
	
	/*  nuevo */
	@Persistent
	private String biografia;
	@Persistent
	private String web;
	@Persistent
	private String pais;
	@Persistent
	private String wiki;
	@Persistent
	private String idioma;
	
	
	
	@Persistent
	private String estilo;
	
	@Persistent
	private String subestilo;
	
	@Persistent
	private String redes;
	
	
	
	
	
	
	@Persistent
	private String youtube;

	
	@Persistent
	private String facebook;
	
	@Persistent
	private String twitter;
	
	@Persistent
	private String instagram;
	
	
	@Persistent
	private String spotify;
	
	@Persistent
	private String gplus;
	
	
	
	@Persistent
	private String tumblr;
	
	
	
	
	
	// String youtube, String facebook,String twitter, String instagram, String spotify, String gplus, String tumblr
	
	// youtube  facebook twitter instagram spotify gplus tumblr
	
	

	
	
	
	
	public Grupo(String nombre, String logo, Date fini,
			String biografia, String web, String pais, String wiki,
			String idioma,String estilo,String subestilo,String redes, String youtube, String facebook,String twitter, String instagram, String spotify, String gplus,String tumblr) {
		super();
		this.nombre = nombre;
		this.logo = logo;
		discos= new ArrayList<Disco>();
		this.fini = fini;
		this.biografia = biografia;
		this.web = web;
		this.pais = pais;
		this.wiki = wiki;
		this.idioma = idioma;
		this.estilo=estilo;
		this.subestilo=subestilo;
		this.redes=redes;
		
		 this.youtube=youtube;
		 this.facebook=facebook;
		 this.twitter=twitter;
		 this.instagram=instagram;
		 this.spotify=spotify;
		 this.gplus=gplus;
		 this.tumblr=tumblr;
		
	}


	
	
	
	
	
	
	
	


	public Grupo(String nombre,String logo,Date f) {
		super();
		this.nombre = nombre;
		discos= new ArrayList<Disco>();
		this.logo=logo;
		
		fini=f;
		
	}



	
	
	
	
	
	

	public String getYoutube() {
		return youtube;
	}












	public void setYoutube(String youtube) {
		this.youtube = youtube;
	}












	public String getFacebook() {
		return facebook;
	}












	public void setFacebook(String facebook) {
		this.facebook = facebook;
	}












	public String getTwitter() {
		return twitter;
	}












	public void setTwitter(String twitter) {
		this.twitter = twitter;
	}












	public String getInstagram() {
		return instagram;
	}












	public void setInstagram(String instagram) {
		this.instagram = instagram;
	}












	public String getSpotify() {
		return spotify;
	}












	public void setSpotify(String spotify) {
		this.spotify = spotify;
	}












	public String getGplus() {
		return gplus;
	}












	public void setGplus(String gplus) {
		this.gplus = gplus;
	}












	public String getTumblr() {
		return tumblr;
	}












	public void setTumblr(String tumblr) {
		this.tumblr = tumblr;
	}












	public String getEstilo() {
		return estilo;
	}




	public void setEstilo(String estilo) {
		this.estilo = estilo;
	}




	public String getSubestilo() {
		return subestilo;
	}




	public void setSubestilo(String subestilo) {
		this.subestilo = subestilo;
	}




	public String getRedes() {
		return redes;
	}




	public void setRedes(String redes) {
		this.redes = redes;
	}




	public String getBiografia() {
		return biografia;
	}




	public void setBiografia(String biografia) {
		this.biografia = biografia;
	}




	public String getWeb() {
		return web;
	}




	public void setWeb(String web) {
		this.web = web;
	}




	public String getPais() {
		return pais;
	}




	public void setPais(String pais) {
		this.pais = pais;
	}




	public String getWiki() {
		return wiki;
	}




	public void setWiki(String wiki) {
		this.wiki = wiki;
	}




	public String getIdioma() {
		return idioma;
	}




	public void setIdioma(String idioma) {
		this.idioma = idioma;
	}




	public String getLogo() {
		return logo;
	}




	public void setLogo(String logo) {
		this.logo = logo;
	}




	public String getNombre() {
		return nombre;
	}

	public List<Disco> getDiscos() {
		return discos;
	}

	public void setDiscos(List<Disco> discos) {
		this.discos = discos;
	}


	
	
	

	public Date getFini() {
		return fini;
	}




	public void setFini(Date fini) {
		this.fini = fini;
	}




	@Override
	public String toString() {
		return "Grupo [nombre=" + nombre + ", logo=" + logo + ", discos="
				+ discos + ", fini=" + fini + ", biografia=" + biografia
				+ ", web=" + web + ", pais=" + pais + ", wiki=" + wiki
				+ ", idioma=" + idioma + "]";
	}




	public void insertarDisco(Disco d)
	{
	
		discos.add(d);
	}


	
	public int buscarDisco(String nombreDisco)
	{
		
		
		for(int i=0;i<discos.size();i++)
			
			if (discos.get(i).getTitulo().equals(nombreDisco)) { return i;}
		
		return -1;
		
	}
	
	public void borrarDisco(String nombreDisco)
	{
		
		discos.remove(buscarDisco(nombreDisco));
	
	}

	
	
	
	
}
