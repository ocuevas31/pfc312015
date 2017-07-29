<%@page import="com.pfc.html.HTML"%>
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


<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
 <meta name="viewport" content="width=device-width, initial-scale=1">

<title>Buscar Canciones</title>

<!-- 
<link rel="stylesheet" type="text/css" href="css/formularios.css" />
 -->
 <link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
 
 
</head>
<body>

<%

RequestDispatcher rdx=request.getRequestDispatcher("menu.jsp");

rdx.include(request, response);

%>




<%
	String como=request.getParameter("como");
	String que = request.getParameter("que");

	List<Cancion> results=null;
	
	//Si no hay que buscar poner "" para buscarlo TODO
	if (que == null) 
	{
		que = "";
	}

	if (como==null || como.equals("")) 
	{
		
		como="letra";
	}
	
	//buscar por titulo
	if (como.equals("titulo")) 
	{
		results = DSDatos
		.buscarCancionConTitulo(que);

		
		
	}
	//buscar por letra
	else if (como.equals("letra")) 
	{
		results = DSDatos
		.buscarCancionConLetra(que);	
	}
	

		//si no hay cancion -> mostrar todos
	
	
	if (como.equals("grupo"))
	{
		que=que.toUpperCase();   
		
		List<Grupo> res=DSDatos.buscarGruposConNombre(que);
		
		
		request.setAttribute("param", res);
		
		RequestDispatcher rd=request.getRequestDispatcher("mostrarGruposCarrusel.jsp");
		
		rd.include(request, response);
		
	}
	else
		if (como.equals("disco"))
		{
	que=que.toUpperCase();   
	
	List<Disco> res=DSDatos.buscarDiscosConTitulo(que);
	
	
	request.setAttribute("param", res);
	
	RequestDispatcher rd=request.getRequestDispatcher("mostrarDiscosCarrusel.jsp");
	
	rd.include(request, response);
	
		}
		else
	{
			out.print("<div align=\"center\">");
			

				for (Cancion x : results) 
				{

			%>
				
				<a href="navegar.jsp?nombreCancion=<%=x.getTituloCancion() %>"> <%=x.getOrden() %>    <%=x.getTituloCancion()%>    ||  <%=x.getTitulodisco() %></a>
				<br>
				
<% 
			
				} 
			

			out.print("</div>");

		
	}

	
	
	/*mosrar enlaces*/
	
	out.print("<a href='busquedashtml.jsp'>VOLVER A BUSCAR</a>");
	out.print("<br>");
	//out.print(HTML.getInicio());
%>


<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>

</body>
</html>