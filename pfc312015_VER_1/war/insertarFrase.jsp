<%@page import="com.pfc.comunicacion.Comunicacion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="java.util.Properties"
	import=" javax.mail.Message" import="javax.mail.MessagingException"
	import="javax.mail.Session" import="javax.mail.Transport"
	import="javax.mail.internet.AddressException"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeMessage" import="java.util.Date"
	import="java.text.SimpleDateFormat" import="com.pfc.global.*"
	import="com.pfc.datos.*"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">







<title>Insertar Frase</title>
</head>
<body>


	<%
		//insertamos un empleado con ese nombre ay apellidos y la fecha actual. tb tiene una clave autogenerada.

		String texto = request.getParameter("texto");
	
			//control datos correctos....
			Frase g = new Frase(texto);

			boolean ok;

			ok = DSDatos.insertarFrase(g);

			if (ok) {

				Comunicacion
						.enviarCorreo(
								Global.correoRoot(),
								"Se ha insertado una frase: " + g.toString(),
										 new Date().toString());

				out.print("<h1>Frase insertada: " + g.getTexto() + "</h1");

			} else {
				out.print("<h1>no se ha insertado la frase: "
						+ g.toString() + "</h1>");
			}

			//out.print(com.pfc.html.HTML.getInicio());

		
	%>


</body>
</html>