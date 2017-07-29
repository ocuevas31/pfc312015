<%@ page
	import="com.google.appengine.api.blobstore.BlobstoreServiceFactory"%>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.*" import="java.util.Properties"
	import=" javax.mail.Message" import="javax.mail.MessagingException"
	import="javax.mail.Session" import="javax.mail.Transport"
	import="javax.mail.internet.AddressException"
	import="javax.mail.internet.InternetAddress"
	import="javax.mail.internet.MimeMessage" import="java.util.Date"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*" pageEncoding="UTF-8"%>

<%
	BlobstoreService blobstoreService = BlobstoreServiceFactory
			.getBlobstoreService();
%>

<!doctype html>
<html>
<head>
<meta http-equiv="content-type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Insertar disco</title>

<link rel="stylesheet" type="text/css" href="/css/formularios.css" />

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>

<body>

	<%
		RequestDispatcher rd = request.getRequestDispatcher("menu.jsp");

		rd.include(request, response);
	%>


	<%
		String user = (String) session.getAttribute("user");
		if (user != null && user.length() != 0 && Global.esAdmin(user))

		{
	%>


	<h1>
		Insertar un Disco por Admin:
		<%=user%></h1>

	<form action="<%=blobstoreService.createUploadUrl("/Upload")%>"
		method="post" enctype="multipart/form-data">
		<fieldset>
			<legend>Inserta un Disco</legend>



			<p>
				<label>nombre Grupo:</label>



				<%
					//List<Grupo> results=DSDatos.buscarGrupos();

						List<Grupo> results = DSDatos.buscarGruposDeAdmin(user);

						out.print("<select name=\"nombreGrupo\">");

						for (Grupo x : results) {
							out.print("<option value=\"");
							out.print(x.getNombre());
							out.print("\">" + x.getNombre().toUpperCase() + "</option>");

						}
						out.print("</select>");
				%>


			</p>

			<p>
				<label>Titulo Disco:</label> <input type="text" name="nombreDisco"
					required value="" />
			</p>

			<p>
				<label>Portada Disco:</label> <input type="file" name="imagen"
					required />
			</p>

			<p>

				<label>Fecha edicion: </label> <input type="date" name="fecha" required>
			</p>

			<p>
				<label>Web:</label> <input type="text" name="web" value="" size="50" />
			</p>

			<p>
				<label>Wiki:</label> <input type="text" name="wiki" value=""
					size="50" />
			</p>

			<p>
				<label>redes:</label> <input type="text" name="redes" value=""
					size="50" />
			</p>



		</fieldset>
		<input type="submit" value="INSERTAR" /> <input type="hidden"
			value="insertarDisco" name="accion" />

	</form>




	<ul class="nav nav-tabs">
		<li class="active"><a href="#panel-949238" data-toggle="tab">Ayuda</a>
		</li>
		<li><a href="#panel-958636" data-toggle="tab">Ejemplos</a></li>
		
		<li><a href="#panel-1" data-toggle="tab">Ojo</a></li>
		
		<li><a href="#panel-tube" data-toggle="tab">Video Ayuda</a></li>
		

	</ul>



	<div class="tab-content">
		<div class="tab-pane active" id="panel-949238">
			<p>Rellena todos los campos y pulsa el boton.
			La fecha de edicion en Chrome dd/mm/aaaa en firefox aaaa/mm/dd ....
			</p>
			<p>
			Si quieres ver un video de ayuda, pincha en la pestaña Videos Ayuda.
			</p>
		</div>
		<div class="tab-pane" id="panel-958636">
			<p>
				<img src="/imagenes/ayuda/ayuda_insertar_Disco.png">
			</p>
		</div>
	
		<div class="tab-pane" id="panel-1">
			<p>No va IE logout.....</p>
		</div>
		
		
		<div class="tab-pane" id="panel-tube">
			<p>Ejemplo de como insertar un disco a traves de firefox y selenium. Tb se puede con Chrome u Opera o cualquier Navegador</p>
			<iframe width="854" height="480" src="https://www.youtube.com/embed/JUsXu0ToC2M" frameborder="0" allowfullscreen></iframe>			
			<p>Video de como instalar firefox, y selenium. </p>
			<iframe width="854" height="480" src="https://www.youtube.com/embed/RhPOwED2XdY" frameborder="0" allowfullscreen></iframe>
			
		</div>
		

	</div>





	<%
		} else {
	%>

	<h1>
		No puede acceder a esta pagina contacte con el root:
		<%=Global.getRoot()%></h1>


	<%
		}
	%>















	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>




</body>
</html>