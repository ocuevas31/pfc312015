<%@ page language="java" contentType="text/html; charset=UTF-8"

import="com.pfc.global.*"
import="com.pfc.html.*"


    pageEncoding="UTF-8"%>
    
    
    
<!doctype html>
<!-- The DOCTYPE declaration above will set the     -->
<!-- browser's rendering engine into                -->
<!-- "Standards Mode". Replacing this declaration   -->
<!-- with a "Quirks Mode" doctype is not supported. -->

<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">

   <meta name="viewport" content="width=device-width, initial-scale=1">
  
  <meta name="google-signin-scope" content="profile email">
    <meta name="google-signin-client_id" content="22115098457-1ehmt8s0c6l659nioc4asoa6bd6mte0t.apps.googleusercontent.com">
  



<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
  

    <!--                                                               -->
    <!-- Consider inlining CSS to reduce the number of requested files -->
    <!--                                                               -->
    <link type="text/css" rel="stylesheet" href="Pfc312015_VER_1.css">

<link rel="stylesheet" type="text/css" href="http://fonts.googleapis.com/css?family=Tangerine">






<script src="https://apis.google.com/js/platform.js" async defer></script>

 
 
 


    <!--                                           -->
    <!-- Any title is fine                         -->
    <!--                                           -->
    <title>PFC v. 2.000</title>
    
    <!--                                           -->
    <!-- This script loads your compiled module.   -->
    <!-- If you add any GWT meta tags, they must   -->
    <!-- be added before this line.                -->
    <!--                                           
    <script type="text/javascript" language="javascript" src="pfc312015/pfc312015.nocache.js"></script>
  -->
  </head>

  <!--                                           -->
  <!-- The body can have arbitrary html, or      -->
  <!-- you can leave the body empty if you want  -->
  <!-- to create a completely dynamic UI.        -->
  <!--                                           -->
  
  
  
  <body >

<!-- 
 <%



 // request.getRequestDispatcher("menu.jsp").include(request, response);

%>


 -->
 
    <!-- OPTIONAL: include this if you want history support 
    <iframe src="javascript:''" id="__gwt_historyFrame" tabIndex='-1' style="position:absolute;width:0;height:0;border:0"></iframe>
    
    -->
    <!-- RECOMMENDED if your web app will not function without JavaScript enabled -->
    <noscript>
      <div style="width: 22em; position: absolute; left: 50%; margin-left: -11em; color: red; background-color: white; border: 1px solid red; padding: 4px; font-family: sans-serif">
     Es necesario tener activado javascript para poderlo visualizar correctamente. 
      </div>
    </noscript>

    <h1>Hola <%=Global.esRoot(request.getParameter("user"))?"Root":"Admin" %>:  <%=session.getAttribute("user") %></h1>
   
   
   
    <%if (Global.esRoot(request.getParameter("user")))
 {
 

 %> 

 <a href="insertarhtml.jsp" >Insertar Grupo</a>
 <br>
 
  
 <%
 }
 %>
 
 
 <!-- 
 <br>
 <a href="buscar.html"> Buscar Grupo/s en el Data Store y ver sus discos y sus canciones</a>
 
 <br>
  <a href="navegar.jsp"> Navegar por los  Grupos  y  sus discos y sus canciones</a>
 
 
 

 
 <br>
  -->
 <a href="insertarDiscohtml.jsp" >Insertar Disco </a>
 <br>
 

 
 
 <a href="insertarCancion.jsp" >Insertar Canción</a>
 <br>
 
 <hr>
 <a href="borrarDisco.jsp" >Borrar Disco</a>
 
 
 
 <br>
 
 <a href="borrarCancion.jsp" >Borrar Canción</a>
 <br>
 
<hr>


 <a href="insertarNoticiahtml.jsp" >Insertar Noticia</a>
 <br>
 



 <a href="insertarFrasehtml.jsp" >Insertar Frase</a>
 <br>
 


  <script>
    function signOut() {
    	
    	//alert("Click");
      var auth2 = gapi.auth2.getAuthInstance();
      
    	  auth2.signOut().then(function () {
    	  
    	  //alert("Click dentro de signOut");
        console.log('User signed out.');
        
        
        
      
        location.href="index.jsp";
      });
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
  
   Logout:
  <a href="#" onclick="signOut();">Sign out</a>

  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
 
 
 
 
  
 <br>
 
 
 <a href="index.jsp" >Inicio</a>
 
 
 
 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
 
 <hr>
 
 
 <!-- 
 <a href="gqlbuscar.html"> Buscar mediante una sentencia JDOQL </a>
 
 <br>
 
 
 
    
    <a href="prueba0.jsp">Prueba0.jsp (import, desde codigo java añadir elementos dinamicos a la pagina, makepersistent y queryexecute bsasico)</a>
    <br>
    <a href="prueba1.jsp">Prueba1.jsp</a>
 <br>
 <a href="admin.jsp">Admin</a>
 
 <br>
 
 <a href="pruebas/imagen.jsp">Imagen</a>

<br>
 <a href="pruebas/download.jsp">Descargar imagen dentro de html</a>

 -->

<!-- 
    <table align="center">
      <tr>
        <td colspan="2" style="font-weight:bold;">Please enter your name:</td>        
      </tr>
      <tr>
        <td id="nameFieldContainer"></td>
        <td id="sendButtonContainer"></td>
      </tr>
      <tr>
        <td colspan="2" style="color:red;" id="errorLabelContainer"></td>
      </tr>
    </table>
  
   -->
  </body>
</html>
