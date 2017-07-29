<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="javax.jdo.PersistenceManager" import="com.pfc.datos.*"
	import="java.util.Date" import="javax.jdo.Query" import="java.util.*"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.*"
	pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="viewport" content="width=device-width, initial-scale=1">


<title>Navegar por los Grupos-Discos-Canciones</title>
<link rel="stylesheet" type="text/css" href="css/formularios.css" />

</head>
<body>




	<%
	String nombreGrupo = request.getParameter("nombreGrupo");



	String nombreDisco = request.getParameter("nombreDisco");
	
	String nombreCancion=request.getParameter("nombreCancion");

	
	boolean hayGrupo=(nombreGrupo != null && !nombreGrupo.equals(""));
	boolean hayDisco=(nombreDisco!= null && !nombreDisco.equals(""));
	boolean hayCancion=(nombreCancion != null && !nombreCancion.equals(""));

	/*
	
	OJOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
		
	Mejor ir guardando en Sesion o donde sea el gurpo, el disco, la cancion para optimizar y que no de problemas canciones con titulos repetidos, ni discos, etc.
	
	
	Algoritmo:
		
		
		Si hay cancion 
		del grupo que este pasado por param, del disco pasadp por param de las canciones de ese disco .... mostrar
		sino si hay disco....
		sino si hay grupo ...
		y sino mostrar TODOS los grupos.
	
		mostrar TODOS los datos.....
	*/

	//si no hay grupo ni nombreDisco-> mostrar todos
	if (! hayGrupo && !hayDisco && !hayCancion) 
	{
		/*ponerlo en un jsp que muestre los datos*/
	
		
		

		List<Grupo> results = DSDatos.buscarGrupos();

		
		
		/*VAmos a hacer que se muestren los datos de los grupos  ne otro jsp*/
		
		request.setAttribute("param", results);
						
		RequestDispatcher rd=request.getRequestDispatcher("mostrarGruposCarrusel.jsp");
		
		rd.forward(request, response);
		
		
		
	}
	else  if (hayGrupo)
 		{

			List<Disco> d = DSDatos.buscarDiscos(nombreGrupo);

			
			request.setAttribute("param", d);
		
			RequestDispatcher rd=request.getRequestDispatcher("mostrarDiscosCarrusel.jsp");		
			rd.forward(request, response);

		}
		else if (hayDisco)
		{
		List<Cancion> c=DSDatos.buscarCanciones(nombreDisco);
			
			
			/**buscar datos del disco para mostrar la portada*/
			Disco d=DSDatos.buscarDisco("", nombreDisco);
		
			request.setAttribute("param", d);
			
			request.setAttribute("param1", c);
						
			RequestDispatcher rd=request.getRequestDispatcher("mostrarCanciones.jsp");
			
			rd.forward(request, response);
			}
			else
				
			{
				
				//out.print("Mostrar datos de cancion: "+ nombreCancion);
							
				Cancion c=DSDatos.buscarCancion(nombreCancion);
			
				request.setAttribute("param", c);
				RequestDispatcher rd=request.getRequestDispatcher("mostrarCancion.jsp");
				
				rd.forward(request, response);
		
			}
			
			
		
	//out.print(com.pfc.html.HTML.getInicio());
	
%>




</body>
</html>