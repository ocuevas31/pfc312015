<%@page import="com.pfc.comunicacion.Comunicacion"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Insertar Disco en el DataStore</title>
<link rel="stylesheet" type="text/css" href="/css/formularios.css" />

</head>
<body>


	<%
		String nombreDisco = request.getParameter("nombreDisco");
		String nombreGrupo = request.getParameter("nombreGrupo");
		String portada = (String) request.getAttribute("imagen");

		String fecha = (String) request.getParameter("fecha");
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);

		String web = (String) request.getParameter("web");

		String wiki = (String) request.getParameter("wiki");

		String redes = (String) request.getParameter("redes");

		//control correcto de datos

		// se puede buscar con key...
		/*Query q = pm.newQuery("SELECT  FROM com.pfc.datos.Grupo where nombre=='"+nombreGrupo+"'");*/

		/* 
		try
		{

		results = (List<Grupo>) q.execute();

		 */

		if (nombreDisco != null && !nombreDisco.equals("")
				&& nombreGrupo != null && !nombreGrupo.equals("")) {
			nombreDisco = nombreDisco.toUpperCase();
			nombreGrupo = nombreGrupo.toUpperCase();

			Disco rep = DSDatos.buscarDisco(nombreGrupo, nombreDisco);
			if (rep != null) {

				out.print("el Disco: "+nombreDisco+" del Grupo: " + nombreGrupo
						+ " Ya existe, no se puede insertar.");

			} else {

				Disco e = new Disco(nombreDisco, nombreGrupo, portada,
						date, web, wiki, redes);

				boolean ok = DSDatos.insertarDiscoAGrupo(nombreGrupo, e);

				if (ok) {

					Comunicacion.enviarCorreo(
							Global.correoRoot(),
							"Se ha insertado un disco: " + nombreDisco,
							"grupo ins " + nombreGrupo
									+ new Date().toString());

					//Mandar correo a todos los usuarios registrados al grupo:nombreGrupo
					
					
					
					List<Registro> kk=DSDatos.buscarRegistros(nombreGrupo);
					List<String> dest=new ArrayList<String>(kk.size());
	
					for(Registro k:kk)
					{
						
						dest.add(k.getUser());
						
					}
	
					//solo se envia si hay alguno registrado, sino que vas a enviar
					if (!dest.isEmpty())
		Comunicacion.enviarCorreos(dest, "Se ha insertado un disco: " + nombreDisco,"grupo ins " + nombreGrupo	+ new Date().toString());
	
					
					
					
					
					
					out.print("<h1>Insertado disco: " + nombreDisco
							+ "  al Grupo:" + nombreGrupo + "</h1>");
				}

				else
					out.print("Algun error, contacta con el Admin (root)");

			}
				out.print(com.pfc.html.HTML.getInicio());

			
		}
		/*
		out.print("<br>");
		for(Grupo x:results)
		{
			out.print("Insertando disco"+nombreDisco+"al grupo: "+x.toString());
			x.insertarDisco(e);
			break;
		}


		pm.makePersistent(e);


		}
		finally
		{
			
			q.closeAll();
		}

		 */
	%>


</body>
</html>