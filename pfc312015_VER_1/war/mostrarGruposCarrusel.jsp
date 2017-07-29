<%@ 


page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pfc.datos.*" import="java.util.*"%>

<!DOCTYPE html>
<html lang="es">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Grupos en Carrusel</title>

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
					List<Grupo> results = (List<Grupo>) request.getAttribute("param");
				%>


				<%if (results.size()>0)
	{%>

				<div class="carousel slide" id="carousel">
					<ol class="carousel-indicators">
						<li class="active" data-slide-to="0" data-target="#carousel">
						</li>


						<%
							
							for (int i=1;i<results.size();i++) {
								out.print("<li data-slide-to=" + i
										+ " data-target=\"#carousel\"></li>");
								
							}
						%>
					</ol>




					<%
					Grupo g=results.get(0);
					%>


					<div class="carousel-inner">
						<div class="item active">
						
						
						<!-- 	<img alt="imagen de Grupo" src=<%=g.getLogo()%> width="400"	height="400">  -->
						
						<img alt="imagen de Grupo" src=<%=g.getLogo()%> width="600"	height="450">
							<div class="carousel-caption">
								<h1>
									<%=g.getNombre()%>
								</h1>

								<p>
									<a href="navegar.jsp?nombreGrupo=<%=g.getNombre() %>">
										Discos: <%=g.getNombre().toUpperCase() %>
									</a>
								</p>

								<p>
									<a href="<%=g.getBiografia() %>" target="_blank"> Biografia
									</a>
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
								<p>
								
								<a href=<%=g.getYoutube()%> target="_blank"> <img src="/imagenes/iconos/ico-youtube.png">  </a>
								<a href=<%=g.getFacebook()%> target="_blank"> <img src="/imagenes/iconos/ico-fb.png">  </a>
								<a href=<%=g.getTwitter()%> target="_blank"> <img src="/imagenes/iconos/ico-twitter.png">  </a>
								<a href=<%=g.getInstagram()%> target="_blank"> <img src="/imagenes/iconos/ico-instagram.png">  </a>
								<a href=<%=g.getSpotify()%> target="_blank"> <img src="/imagenes/iconos/ico-spotify.png">  </a>
								<a href=<%=g.getGplus()%> target="_blank"> <img src="/imagenes/iconos/ico-gplus.png">  </a>
								<a href=<%=g.getTumblr()%> target="_blank"> <img src="/imagenes/iconos/ico-tumblr.png">  </a>
								
								</p>
								
								
								
								
							</div>
						</div>



						<%
							for (int j = 1; j < results.size(); j++) {
								
								
								
								g=results.get(j);
						%>

						<div class="item">
							<img alt="Imagen de grupo" src=<%=g.getLogo()%> width="600"
								height="450">
							<div class="carousel-caption">

								<h1>
									<%=g.getNombre()%>
								</h1>

								<p>
									<a href="navegar.jsp?nombreGrupo=<%=g.getNombre() %>">
										Discos: <%=g.getNombre().toUpperCase() %>
									</a>
								</p>

								<p>
									<a href="<%=g.getBiografia() %>" target="_blank"> Biografia
									</a>
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
								
								
								<p>
								
								<a href=<%=g.getYoutube()%> target="_blank"> <img src="/imagenes/iconos/ico-youtube.png">  </a>
								<a href=<%=g.getFacebook()%> target="_blank"> <img src="/imagenes/iconos/ico-fb.png">  </a>
								<a href=<%=g.getTwitter()%> target="_blank"> <img src="/imagenes/iconos/ico-twitter.png">  </a>
								<a href=<%=g.getInstagram()%> target="_blank"> <img src="/imagenes/iconos/ico-instagram.png">  </a>
								<a href=<%=g.getSpotify()%> target="_blank"> <img src="/imagenes/iconos/ico-spotify.png">  </a>
								<a href=<%=g.getGplus()%> target="_blank"> <img src="/imagenes/iconos/ico-gplus.png">  </a>
								<a href=<%=g.getTumblr()%> target="_blank"> <img src="/imagenes/iconos/ico-tumblr.png">  </a>
								
								</p>


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


				<h1>No hay Grupos</h1>


				<%} %>
			</div>
		</div>
	</div>

	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>


</body>
</html>