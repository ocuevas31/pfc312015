<%@page import="com.pfc.comunicacion.Comunicacion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.*" import="java.util.Properties"
	import=" javax.mail.Message" import="javax.mail.MessagingException"
	import="javax.mail.Session" import="javax.mail.Transport"
	import="javax.mail.internet.AddressException"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeMessage" import="java.util.Date"
	import="java.text.SimpleDateFormat" import="com.pfc.global.*"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">







<title>Insertar datos en el DataStore</title>
</head>
<body>


	<%
		//insertamos un empleado con ese nombre ay apellidos y la fecha actual. tb tiene una clave autogenerada.

		String nombreGrupo = request.getParameter("nombreGrupo");
		//String lastName=request.getParameter("lastName");

		String img = (String) request.getAttribute("imagen");

		String fecha = (String) request.getParameter("fini");
		Date date = new SimpleDateFormat("yyyy-MM-dd").parse(fecha);

		String biografia = (String) request.getParameter("biografia");
		

		String web = (String) request.getParameter("web");

		String pais = (String) request.getParameter("pais");
		

		String wiki = (String) request.getParameter("wiki");
		

		String idioma = (String) request.getParameter("idioma");

		String estilo = (String) request.getParameter("estilo");

		String subestilo = (String) request.getParameter("subestilo");

		String redes = (String) request.getParameter("redes");
		
		
		String youtube=(String) request.getParameter("youtube");
		String facebook=(String) request.getParameter("facebook");
		String twitter=(String) request.getParameter("twitter");
		String instagram=(String) request.getParameter("instagram");
		String spotify=(String) request.getParameter("spotify");
		String gplus=(String) request.getParameter("gplus");
		String tumblr=(String) request.getParameter("tumblr");
		
		
		
		
		

		nombreGrupo = nombreGrupo.toUpperCase();

		//Esta repetido?

		Grupo rep = DSDatos.buscarGrupo(nombreGrupo);

		if (rep != null) {
			
			out.print("El grupo: "+nombreGrupo+ " Ya existe, no se puede insertar.");

		} else {

			//control datos correctos....
			Grupo g = new Grupo(nombreGrupo, img, date, biografia, web,
					pais, wiki, idioma, estilo, subestilo, redes,youtube, facebook, twitter, instagram, spotify, gplus,tumblr);

			boolean ok;

			ok = DSDatos.insertarGrupo(g);

			if (ok) {

				Comunicacion
						.enviarCorreo(
								Global.correoRoot(),
								"Se ha insertado un grupo: " + g.toString(),
								"grupo ins " + g.toString()
										+ new Date().toString());

				out.print("<h1>Grupo insertado: " + g.getNombre() + "</h1");

			} else {
				out.print("<h1>no se ha insertado el grupo: "
						+ g.toString() + "</h1>");
			}

			//out.print(com.pfc.html.HTML.getInicio());

		}
	%>


</body>
</html>