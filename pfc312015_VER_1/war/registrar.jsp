<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*" pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="google-signin-client_id"
	content="22115098457-1ehmt8s0c6l659nioc4asoa6bd6mte0t.apps.googleusercontent.com">



<title>Admins</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>
<body>


	<!-- 
COMPROBAR QUE ES ALGUNO DE LOS USUARIOS ADMITIDOS, SINO FUERA.

 -->


	<%
String user=(String)request.getParameter("user");
session.setAttribute("user",user);

%>


	<%



  request.getRequestDispatcher("menu.jsp").include(request, response);

%>


	<%



out.print("Usuario: "+user);



	
	
	/*RequestDispatcher rd=request.getRequestDispatcher("Pfc312015_VER_1.jsp");
	
	rd.forward(request, response);
	*/
	
	
	
	%>



	<h1>Selecciona los grupos de los que quieres estar informado (Para
		seleccionar varios, mantén pulsado la tecla Ctrl o Mayusculas). Puedes
		pulsar una tecla para ir directamente al grupo que comienza por esa
		letra.</h1>



	<form action="insertarRegistro.jsp" method="post">
		<fieldset>
			<legend>Selecciona Grupos</legend>



			<p>
				<label>nombre Grupo:</label>



				<%
					//List<Grupo> results=DSDatos.buscarGrupos();

						List<Grupo> results = DSDatos.buscarGrupos();

						out.print("<select name=\"nombreGrupo\" multiple>");

						for (Grupo x : results) {
							out.print("<option value=\"");
							out.print(x.getNombre());
							out.print("\">" + x.getNombre().toUpperCase() + "</option>");

						}
						out.print("</select>");
				%>


			</p>

		</fieldset>
		<input type="submit" value="REGISTRAR" /> 
		
	</form>






	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>


</body>
</html>