<%@ 


page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
import="com.pfc.datos.*"    
import="java.util.*"    
    
%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Disco</title>


<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
<style>
a:hover {
    background-color: gray;
      font-size: 110%;
}
</style>
</head>
<body>




<%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>




<%




@SuppressWarnings("unchecked")
List<Cancion> c=(List<Cancion>)request.getAttribute("param1");


/**buscar datos del disco para mostrar la portada*/
Disco d=(Disco)request.getAttribute("param");

%>

<div align="center">
<h1> Canciones del disco: <%= d.getTitulo() %>  </h1>
<h1> del grupo: <a href="navegar.jsp?nombreGrupo=<%=d.getGrupo() %>"> <%=d.getGrupo() %> </a> </h1>


<a href="navegar.jsp?nombreDisco=<%=d.getTitulo() %>">      <img src="<%=d.getPortada() %>" width="300" height="300" ></a>



</div>
<br>

<div align="center">
<%

	for (Cancion x : c) 
	{

%>
	
	<a href="navegar.jsp?nombreCancion=<%=x.getTituloCancion() %>"> <%=x.getOrden() %>    <%=x.getTituloCancion()%> <%=x.getDuracion() %> </a>
	<br>
	

<%
	} 
%>

</div>
<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>


</body>
</html>