<%@ 


page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8" import="com.pfc.datos.*" import="java.util.*"

%>



	
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">


				<nav class="navbar navbar-default navbar-fixed-top"
					role="navigation">

				<div class="navbar-header">

					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#bs-example-navbar-collapse-1">
						<span class="sr-only">Toggle navigation</span><span
							class="icon-bar"></span><span class="icon-bar"></span><span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="navegar.jsp">Navegar</a>
				</div>

				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li class="active"> <a href="registro.html"><%=session.getAttribute("user")==null?"Registrate":((String)session.getAttribute("user")).substring(0,((String)session.getAttribute("user")).length()-10) %></a></li>
						<li ><a href="mostrarNoticiasCarrusel.jsp">Noticias</a>
						</li>
						<li><a href="mostrarFrasesCarrusel.jsp">Frases</a></li>
						<li><a href="accesogoogle.html">Admins</a></li>
							<li><a href="busquedashtml.jsp">Busqueda Avanzada</a></li>
							
						
					</ul>

					<form class="navbar-form navbar-left" role="search"
						action="busquedas.jsp" method="post">
						<div class="form-group">
							<input type="text" class="form-control" name="que"> <input
								type="hidden" name="como" value="letra">
						</div>
						<button type="submit" class="btn btn-default">Buscar</button>
					</form>

					<ul class="nav navbar-nav navbar-right">
						<li><a href="/index.jsp">INICIO</a></li>
					</ul>
				</div>

				</nav>


			</div>
		</div>
	</div>
	
	 <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>

<br>
<br>
<br>
