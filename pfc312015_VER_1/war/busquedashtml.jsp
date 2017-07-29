<!doctype html>
<html>
  <head>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Buscar cancion</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
  
<!-- <link rel="stylesheet" type="text/css" href="/css/formularios.css" /> -->

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">
  </head>

  <body>
 
 
 <%



  request.getRequestDispatcher("menu.jsp").include(request, response);

%>
 
 
 <form action="busquedas.jsp" method="post">
 
 <fieldset>
		<legend>Buscar canciones/grupos/discos</legend>
<p>	
 
  
  <select name="como">
 	<option value="titulo">Canciones con el titulo</option>
  	<option value="letra">Canciones con la letra</option>
  	<option value="grupo">Grupos con el nombre </option>
  	<option value="disco">Discos con el titulo </option>
  	
  	
  </select>
  
  
  <input type="text" name="que" value="" />
 
 
 </p>
 <!-- 
  <br>
 apellido:
 <input type="text" name="lastName" value="" />
 
  -->
  
  </fieldset>
 <br>
  <input type="submit" value="BUSCAR" />
</form>
 
 
 
<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>
  </body>
</html>