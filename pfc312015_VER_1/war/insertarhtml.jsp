<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"


import="java.util.*"
import="com.pfc.global.*"

 pageEncoding="UTF-8"%>
 
<%
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>

<!doctype html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    
       <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <title>Insertar grupo</title>
    
  <link rel="stylesheet" type="text/css" href="/css/formularios.css" />
  
  <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
  
  </head>

  <body>
  
  <%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>
  
 <!--  
<%  
  Enumeration<String> e=(Enumeration<String>)session.getAttributeNames();

	while (e.hasMoreElements())
		out.print(e.nextElement()+"<br>");


  
  %>
   -->
 
 
 <% 
 
 String user=(String)session.getAttribute("user");
 if ( user!=null && user.length()!=0 && Global.esRoot(user)) 
 
 {%>
 
 
 <h1>Insertar un Grupo por Admin:  <%=user %></h1>
 
 <form action="<%= blobstoreService.createUploadUrl("/Upload") %>" method="post" enctype="multipart/form-data" >
 <fieldset>
 <legend>Inserta un Grupo</legend>
  
  <p>
  <label>Nombre Grupo:</label>
  <input type="text" name="nombreGrupo" value="" required/>
 </p>
 
 <p>
  <label>Logo Grupo:</label>
  <input type="file" name="imagen" required  />
 </p>
 
 <p>
 
 <label>Fecha creacion: </label>  <input type="date" name="fini" required >
 </p>
 
 
  <p>
 <label>Biografia: </label>
 <textarea rows="5" cols="50" name="biografia" >...</textarea> 
 </p>
 
  <p>
  <label>Web:</label>
  <input type="text" name="web" value="" size="50" maxlength="300" />
 </p>
 
  <p>
  <label>Pais:</label>
  <input type="text" name="pais" value="" required/>
 </p>
 
  <p>
  <label>wiki:</label>
  <input type="text" name="wiki" value="" size="50" />
 </p>
 
  <p>
  <label>Idioma:</label>
  <input type="text" name="idioma" value="" />
 </p>
 
  <p>
  <label>Estilo:</label>
  <input type="text" name="estilo" value="" />
 </p>
 
  <p>
  <label>Subestilo:</label>
  <input type="text" name="subestilo" value="" />
 </p>
 
  <p>
  <label>Redes:</label>
  <input type="text" name="redes" value="" size="50" />
 </p>

 
  <p>
  <label>Youtube:</label>
  <input type="text" name="youtube" value="" size="50" />
 </p>
 
  <p>
  <label>Facebook:</label>
  <input type="text" name="facebook" value="" size="50" />
 </p>
 
  <p>
  <label>Twitter:</label>
  <input type="text" name="twitter" value="" size="50" />
 </p>
 
  <p>
  <label>Instagram:</label>
  <input type="text" name="instagram" value="" size="50" />
 </p>
 
  <p>
  <label>Spotify:</label>
  <input type="text" name="spotify" value="" size="50" />
 </p>
 
  <p>
  <label>G+:</label>
  <input type="text" name="gplus" value="" size="50" />
 </p>
 
  <p>
  <label>Tumblr:</label>
  <input type="text" name="tumblr" value="" size="50" />
 </p>
 

 
 
 
 </fieldset>
  <input type="submit" value="INSERTAR" />
  

  
  <input type="hidden" value="insertar" name="accion"/>
  
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
				
						<li>
						<a href="#panel-tube" data-toggle="tab">Video Ayuda</a>
					</li>
				</ul>
				
				
				
				<div class="tab-content">
					<div class="tab-pane active" id="panel-949238">
						<p>
							Rellena todos los campos y pulsa el boton.
							La imagen del Grupo tiene que tener un formato compatible con la web( jpg,gif,png,....) y tener un tamaño de 1600x1200 o por lo menos ese aspecto (relacion entre ancho y alto), es decir
							1600/1200 o sea 1,333333  y ser mayor o igual que 600x450  (600/450 = 1.333333)
						</p>
					</div>
					<div class="tab-pane" id="panel-958636">
						<p>
							<img src="/imagenes/ayuda/ayuda_insertar_Grupo.png">
						</p>
					</div>
					<div class="tab-pane" id="panel-1">
						<p>
							En firefox las fechas van con formato: YYYY-MM-DD  (año, mes y dia)
							En firefox para hacer logout y entrar con otro usuario ir a google.es y esquina usperior derecha darle a cerrar sesion. En Chrome funciona ok.
							
						</p>
					</div>
					
					<div class="tab-pane" id="panel-tube">
						<p>
							Video de demostracion en Youtube:
						</p>
								
							<iframe width="854" height="480" src="https://www.youtube.com/embed/CMByzXJX27c" frameborder="0" allowfullscreen></iframe>							
					
					</div>
					
				</div>




















 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
 
  </body>
</html>