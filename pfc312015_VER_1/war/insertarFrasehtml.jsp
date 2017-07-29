<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"


import="java.util.*"
import="com.pfc.global.*"

 pageEncoding="UTF-8"%>
 


<!doctype html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
       <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Insertar Frase</title>
    
  <link rel="stylesheet" type="text/css" href="/css/formularios.css" />
  
  <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
  
  </head>

  <body>
  
  <%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>
  

 
 <% 
 
 String user=(String)session.getAttribute("user");
 
 if ( user!=null && user.length()!=0 && Global.esAdmin(user)) 
 
 {%>
 
 
 <h1>Insertar una Frase por Admin:  <%=user %></h1>
 
 <form action="insertarFrase.jsp" method="post"  >
 <fieldset>
 <legend>Inserta una Frase</legend>
  
<p>
				<label>Texto: </label>
				<textarea rows="20" cols="50" name="texto"></textarea>
			</p>

 </fieldset>
  <input type="submit" value="INSERTAR" />
  


</form>

<%
}
 else 
 {

%>

<h1>No puede acceder a esta página, contacte con el root: <%=Global.getRoot() %></h1>


<%
} 
%>

<ul class="nav nav-tabs">
					<li class="active">
						<a href="#panel-949238" data-toggle="tab">Ayuda</a>
					</li>
					<li>
						<a href="#panel-958636" data-toggle="tab">Ejemplos</a>
					</li>
						<li>
						<a href="#panel-1" data-toggle="tab">Ojo</a>
					</li>
				
				</ul>
				
				
				
				<div class="tab-content">
					<div class="tab-pane active" id="panel-949238">
						<p>
							<pre>Se pueden insertar codigos html como por ejemplo:" &lt;a href= "tal_enlace.html" 	 TExto a mostrar &lt; /a &gt;  .Importante  que la a este pegada a &lt;</pre>
							
						
						</p>
					</div>
					<div class="tab-pane" id="panel-958636">
						<p>
							&amp;lt a href=""https://youtu.be/I-suRH3iDEc"&amp;gt  TExto  /a>
						</p>
					</div>
					<div class="tab-pane" id="panel-1">
						<p>
						 	Para hacer logout y entrar con otro usuario ir a google.es y esquina superior derecha darle a cerrar sesion. En Chrome funciona ok.
							
						</p>
					</div>
					
				</div>




















 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
 
  </body>
</html>