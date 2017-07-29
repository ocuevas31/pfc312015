package com.pfc.global;

import java.util.List;

public class Global {
	
	
	//static Grupo m[]=(Grupo[])DSDatos.buscarGrupos().toArray();
	
	static String users[]={
		getRoot(),					//0
		"pfc31201531@gmail.com",		//1
		"p.robledodraven@gmail.com", //2
		"miguel.ocampos.alonso@gmail.com", //3
		"fisicamj@gmail.com",				//4
		"liberartetoledo@gmail.com",			//5
		"hsantossenra@gmail.com",	//6
		"robledo2112@gmail.com" //7
	
	};		
	
	
	/*grupos de cada usuario*/
	static String musers[][]={
		{"METALLICA","GUNS N' ROSES","ROSENDO","AEROSMITH","RAMMSTEIN","MEGADETH","NIRVANA","PINK FLOYD","BJ�RK","THE SMITHS","THE RESIDENTS","QUEEN","ROLLING STONES","THE BEATLES","AC/DC","ESTOPA","SKA-P","EXTREMODURO","BOB DYLAN","FRANK SINATRA","TWENTY ONE PILOTS","LED ZEPPELIN","MOTORHEAD","BARON ROJO","DAVID BOWIE","JANIS JOPLIN","THE WHITE BUFFALO","CAMARON"},    //0 	MAYUSCULAS
		{"METALLICA"},								//1		MAYUSCULAS
		{"RAMMSTEIN","TWENTY ONE PILOTS"},								//2 MAYUSCULAS
		{"MEGADETH","NIRVANA","PINK FLOYD"},		//3
		{"BJ�RK","THE SMITHS"},						//4
		{"THE RESIDENTS"},							//5
		{"RAMMSTEIN","PINK FLOYD","LED ZEPPELIN","MOTORHEAD","BARON ROJO","DAVID BOWIE","JANIS JOPLIN"},						//6
		{"THE WHITE BUFFALO"}  //7
		
	}; 
	
	/********      OJO los nombres de los GRUPOS EN MAYUSCULAS                ***************/
	
	
	
	//-1 indica que no existe
	static public int userApos(String user)
	{
		int i=0;
		while (i<users.length && !user.equals(users[i])) i++;
		
		
		
		if (i==users.length) i=-1;
		
	 return i;
		
	}
	
	
	static public String [] gruposDeAdmin(String user)
	{
		
		
		return musers[userApos(user)];
		
	}
	
	
	static public String correoRoot()
	{
		
		
		return "pfc31201531@gmail.com";
		
	}
	
	static public String getRoot()
	{
		
		return "ocuevas31@gmail.com";
		
	}
	
	
	static public boolean esRoot(String quien)
	{
		
		
		return quien.equals(getRoot());
		
	}
	
	static public boolean esAdmin(String quien)
	{
		boolean loes=false;
		
		
		
		if (esta(quien,users)) loes=true;
		
		
		
		return loes;
	}


	public static boolean esta(String nombre, String[] asignados) {
		
		
		
		int i=0;
		while (i<asignados.length && !nombre.equals(asignados[i])) i++;
		
		
		
		if (i==asignados.length) return false;
		
	 return true;
		
		
	}
	
public static boolean esta(String nombre, List<String>asignados) {
		
		
		
		int i=0;
		while (i<asignados.size() && !nombre.equals(asignados.get(i))) i++;
		
		
		
		if (i==asignados.size()) return false;
		
	 return true;
		
		
	}
	

}
