<%@ 


page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="com.pfc.datos.*" import="java.util.*"%>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">



<title>Discos</title>

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







<!-- 
out.println("Cancion: "+ c.getTituloCancion() + "<br>");


out.print("<p>");
out.print("TITULO: "+c.getTituloCancion());
out.print("<br>");
out.print("DISCO: "+c.getTitulodisco());
out.print("<br>");
out.print("LETRA: "+c.getLetra());


out.print("<br>");
out.print("TRADUCCION: "+c.getTraduccion());

out.print("<br>");
out.print("Orden: "+c.getOrden());

out.print("<br>");
out.print("RESUMEN: "+c.getResumen());

out.print("<br>");
out.print("MENSAJE: "+c.getMensaje());

out.print("<br>");
out.print("ETIQUETAS: "+c.getListaEtiquetas());


out.print("</p>");
out.print("<br>");

 -->

<%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>




	<%
//hacerlo ok jsp sin print y con pestañas para los textos..... y menu

Cancion c=(Cancion)request.getAttribute("param");

%>



<h1> <%=c.getOrden()%> <%=c.getTituloCancion()%> <%=c.getDuracion() %></h1>

<a href="navegar.jsp?nombreDisco=<%=c.getTitulodisco() %>">Disco: <%=c.getTitulodisco() %> </a>
							
<p>
									<a href="<%=c.getWeb() %>" target="_blank"> Web </a>
								</p>

								<p>
									<a href="<%=c.getWiki() %>" target="_blank"> Wikipedia </a>
								</p>

								<p>
									<a href="<%=c.getRedes() %>" target="_blank"> Redes	Sociales </a>
								</p>



	<div class="row">
		<div class="col-md-12">
			<div class="tabbable" id="tabs-979462">
				<ul class="nav nav-tabs">
					<li class="active"><a href="#panel-949238" data-toggle="tab">Letra</a></li>
					<li><a href="#panel-958636" data-toggle="tab">Traduccion</a></li>
					<li><a href="#panel-1" data-toggle="tab">Resumen</a></li>

					<li><a href="#panel-2" data-toggle="tab">Mensaje</a></li>

					<li><a href="#panel-3" data-toggle="tab">TAB</a></li>


				</ul>



				<div class="tab-content">
					<div align="center" class="tab-pane active" id="panel-949238">
						<pre><%=c.getLetra() %></pre>
					</div>
					<div align="center" class="tab-pane" id="panel-958636">
						<pre><%=c.getTraduccion() %></pre>
					</div>
					<div align="center" class="tab-pane" id="panel-1">
						<pre><%=c.getResumen() %></pre>
					</div>
					<div align="center" class="tab-pane" id="panel-2">
						<pre><%=c.getMensaje() %></pre>
					</div>
					<div align="center" class="tab-pane" id="panel-3">
						<pre><%=c.getTab() %></pre>
					</div>
					
				</div>


			</div>
		</div>
	</div>





	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>

</body>
</html>