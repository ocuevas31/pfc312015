<%@ 


page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pfc.datos.*" import="java.util.*"
	
	
	
%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Discos en Carrusel</title>

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


<%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>



	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12">



				<%
					@SuppressWarnings("unchecked")
					List<Disco> d = (List<Disco>) request.getAttribute("param");
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
				Disco g=d.get(0);
				%>


					<div class="carousel-inner">
						<div class="item active">
							<img alt="imagen de Grupo" src=<%=g.getPortada()%>	width="600" height="450">
							<div class="carousel-caption">
								<h1>
									<%=g.getTitulo()%> 
								</h1>
								
								<%int anio=g.getFecha().getYear(); %>
								
								
								<h2>Año: <%=anio<100?1900+anio:(anio-100+2000) %></h2>
								
								
								<p>
								<a href="navegar.jsp?nombreDisco=<%=g.getTitulo()%>"> Canciones: <%=g.getTitulo().toUpperCase() %> </a>
								</p>
							
								
								<p>
									<a href="<%=g.getWeb() %>" target="_blank"> Web </a>
								</p>

								<p>
									<a href="<%=g.getWiki() %>" target="_blank"> Wikipedia </a>
								</p>

								<p>
									<a href="<%=g.getRedes() %>" target="_blank"> Redes	Sociales </a>
								</p>

								
								
							</div>
						</div>



						<%
							for (int j = 1; j < d.size(); j++) {
								
								g=d.get(j);
						%>

						<div class="item">
							<img alt="Imagen de grupo" src=<%=g.getPortada()%>
								width="600" height="450">
							<div class="carousel-caption">
								<h1>
									<%=g.getTitulo()%> 
								</h1>
								
								<%anio=g.getFecha().getYear(); %>
								
								<h2>Año: <%=anio<100?1900+anio:(anio-100+2000) %></h2>
								
								
								
								<p>
								<a href="navegar.jsp?nombreDisco=<%=g.getTitulo() %>"> Canciones: <%=g.getTitulo().toUpperCase() %> </a>
								</p>
								
								<p>
									<a href="<%=g.getWeb() %>" target="_blank"> Web </a>
								</p>

								<p>
									<a href="<%=g.getWiki() %>" target="_blank"> Wikipedia </a>
								</p>

								<p>
									<a href="<%=g.getRedes() %>" target="_blank"> Redes	Sociales </a>
								</p>

								
								
							</div>
						</div>



						<%
							/*
									 //out.print("GRUPO: " + x.getNombre().toUpperCase() + "<br>");

									 out.print("<a href=\"navegar.jsp?nombreGrupo="+x.getNombre()+"\">"+x.getNombre().toUpperCase()+"</a>");

									 out.print("<a href=\"navegar.jsp?nombreGrupo="+x.getNombre()+"\">"+"<img src='"+x.getLogo()+"'>"+"</a>");


									 //out.print("<img src='"+x.getLogo()+"'>");

									 out.print("<br>");

								 */
						%>




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
				
				
				<h1> No hay Discos</h1>
				
				
				<%} %>
				
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>


</body>
</html>