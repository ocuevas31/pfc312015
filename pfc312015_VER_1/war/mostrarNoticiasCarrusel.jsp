<%@ 


page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" 
	import="com.pfc.datos.*" 
	import="java.util.*"
	
	
	
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Noticias en Carrusel</title>

<meta name="description" content="Musica">
<meta name="author" content="Oscar">

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


<%@include file="menu.jsp" %>


	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">



				<%
					@SuppressWarnings("unchecked")
					List<Noticia> d =  DSDatos.buscarNoticias();

					
					
				%>


<%if (d.size()>0)
	{%>


				<div class="carousel slide" id="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel">
						</li>


						<%
							
							for (int i=1;i<d.size();i++) {
								out.print("<li data-slide-to=" + i
										+ " data-target=\"#carousel\"></li>");
								
							}
						%>
					</ol>


				<%
				Noticia g=d.get(0);
				%>


					<div class="carousel-inner">
						<div class="item active">
							<img alt="imagen de Grupo" src="/imagenes/guitarra.png">
							<div class="carousel-caption">
							
								<h2  style="color:black">
									<%=g.getTexto() %>
								</h2>
								
								
							</div>
						</div>



						<%
							for (int j = 1; j < d.size(); j++) {
								
								g=d.get(j);
						%>

						<div class="item">
							<img alt="imagen de Grupo" src="/imagenes/guitarra.png">
							<div class="carousel-caption">
								<h2  style="color:black">
									<%=g.getTexto() %>
								</h2>
								
								
							</div>
						</div>



						<%
							}
						%>




					</div>
					<a class="left carousel-control" href="#carousel" data-slide="prev"><span
						class="glyphicon glyphicon-chevron-left"></span></a> <a
						class="right carousel-control" href="#carousel" data-slide="next"><span
						class="glyphicon glyphicon-chevron-right"></span></a>
				</div>
				
				
				<%
				}
				else {%>
				
				
				<h1> No hay Noticias</h1>
				
				
				<%} %>
				
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>


</body>
</html>