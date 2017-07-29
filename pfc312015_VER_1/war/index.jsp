<%@page import="com.pfc.comunicacion.Comunicacion"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*" import="java.util.Date"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="es">
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <title>Instinto Musical</title>

    <meta name="description" content="Musica">
    <meta name="author" content="Oscar">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

  </head>
  <body>

    <div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
		
			<nav class="navbar navbar-default navbar-fixed-top" role="navigation">
			
				<div class="navbar-header">
					 
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
						 <span class="sr-only">Toggle navigation</span><span class="icon-bar"></span><span class="icon-bar"></span><span class="icon-bar"></span>
					</button> <a class="navbar-brand" href="navegar.jsp">Navegar</a>
				</div>
				
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
					<li class="active"> <a href="registro.html"><%=session.getAttribute("user")==null?"Registrate":((String)session.getAttribute("user")).substring(0,((String)session.getAttribute("user")).length()-10)%></a></li>
					
						<li >
							<a href="mostrarNoticiasCarrusel.jsp">Noticias</a>
						</li>
						<li>
							<a href="mostrarFrasesCarrusel.jsp">Frases</a>
						</li>
						<li>
							 <a href="accesogoogle.html">Admins</a>
						</li>
						<li>
							<a href="busquedashtml.jsp">Busqueda Avanzada</a>
						</li>
						
					</ul>
					
					<form class="navbar-form navbar-left" role="search" action="busquedas.jsp" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="que">
							<input type="hidden" name="como" value="letra">
						</div> 
						<button type="submit" class="btn btn-default" >
							Buscar
						</button>
					</form>
					
					<ul class="nav navbar-nav navbar-right">
						<li>
							 <a href="accesogoogle.html">Admins</a>
						</li>
						
					</ul>
				</div>
				
			</nav>
		</div>
	</div>
	
	<br>
	<div class="row">
		<div class="col-md-12">
		
		<%
		
		List<Grupo> results = DSDatos.buscarGrupos();

		
		
		/*VAmos a hacer que se muestren los datos de los grupos  ne otro jsp*/
		
		request.setAttribute("param", results);
						
		RequestDispatcher rd=request.getRequestDispatcher("mostrarGruposCarrusel.jsp");
		
		rd.include(request, response);
		
		
		%>
		</div>
		</div>
	</div>
	<br>
	
	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-979462">
				<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-949238" data-toggle="tab">Noticias</a>
					</li>
					<li>
						<a href="#panel-958636" data-toggle="tab">Frase del dia</a>
					</li>
						<li>
						<a href="#panel-1" data-toggle="tab">Imagenes</a>
					</li>
				
				</ul>
				
				
				
				<div class="tab-content">
					<div class="tab-pane active" id="panel-949238">
						<p>
							<%=DSDatos.buscarNoticia()==null?"Nuevo Disco Fito":DSDatos.buscarNoticia().getTexto() %>	
						</p>
							
					</div>
					<div class="tab-pane" id="panel-958636">
						<p>
							<%=DSDatos.buscarFrase()==null?"All we need is just a little patience (patience) 	Mm, yeah ":DSDatos.buscarFrase().getTexto() %>	
						</p>
					</div>
					<div class="tab-pane" id="panel-1">
						<p>
							<img src="imagenes/vibracion.gif">
						</p>
					</div>
					
				</div>
				

<br>			


<!-- 
				<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<div class="panel-group" id="panel-953321">
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-953321" href="#panel-element-264749">Collapsible Group Item #1</a>
					</div>
					<div id="panel-element-264749" class="panel-collapse collapse in">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
				<div class="panel panel-default">
					<div class="panel-heading">
						 <a class="panel-title" data-toggle="collapse" data-parent="#panel-953321" href="#panel-element-524308">Collapsible Group Item #2</a>
					</div>
					<div id="panel-element-524308" class="panel-collapse collapse">
						<div class="panel-body">
							Anim pariatur cliche...
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="container-fluid">
	<div class="row">
		<div class="col-md-12">
			<ul class="pagination">
				<li>
					<a href="#">Prev</a>
				</li>
				<li>
					<a href="base.html">Base</a>
				</li>
				<li>
					<a href="#">2</a>
				</li>
				<li>
					<a href="#">3</a>
				</li>
				<li>
					<a href="#">4</a>
				</li>
				<li>
					<a href="#">5</a>
				</li>
				<li>
					<a href="#">Next</a>
				</li>
			</ul>
		</div>
	</div>
</div>
 -->	
			</div>
		</div>
	</div>
</div>

    <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
  </body>
</html>