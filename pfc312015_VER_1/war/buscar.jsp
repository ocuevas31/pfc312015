<%@ page language="java" contentType="text/html; charset=UTF-8"

import="com.pfc.datos.PMF"
import="javax.jdo.PersistenceManager"
import="com.pfc.datos.*"
import="java.util.Date"

import="javax.jdo.Query"
import="java.util.*"
import="com.google.appengine.api.datastore.*"
import="javax.jdo.*"

  
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buscar datos en el DataStore</title>

<!-- 
<link rel="stylesheet" type="text/css" href="css/formularios.css" />
 -->
 
</head>
<body>


<%
	String nombreGrupo = request.getParameter("nombreGrupo");


	//si no hay grupo -> mostrar todos
	if (nombreGrupo == null || nombreGrupo.equals("")) 
	{

		
		
		/*ponerlo en un jsp que muestre los datos*/
		out.print("Resultados de Todos los GRUPOS <br>");

		List<Grupo> results = DSDatos.buscarGrupos();

		out.print("<br>");

		
		
		/*Limitar el numero max de grupos y max de discos y max de canciones y poner href para verlos todos sin limitar*/
		for (Grupo x : results) 
		{
			
			
				/* < ahref=""  > </a>*/
			out.print("GRUPO: " + x.getNombre().toUpperCase() + "<br>");
			
			
			
			for (Disco d : x.getDiscos()) {
				out.print("-----Disco: " + d.getTitulo().toUpperCase()
						+ "<br>");

				for (Cancion k : d.getCanciones()) {

					out.print("---------------Cancion: "
							+ k.getTituloCancion().toUpperCase()
							+ "<br>");

				}
			}
			out.print("<br>");
		}
		/*En principio se pueden hacer cambios a las clases de las entidades por ejemplo añadir un toString a Employee */

	} else //si hay grupo
	{

		Grupo g = null;

		g = DSDatos.buscarGrupo(nombreGrupo);

		if (g == null)
			out.print("NOTA");
		else {
			out.print("Grupo: " + nombreGrupo);
			for (Disco d : g.getDiscos())
			{
				out.print("-----Disco: " + d.getTitulo().toUpperCase()
						+ "<br>");
				for (Cancion k : d.getCanciones()) {

					out.print("---------------Cancion: "
							+ k.getTituloCancion().toUpperCase()
							+ "<br>");

				}	
			}

			out.print("<br>");
		}

	}

	
%>




</body>
</html>