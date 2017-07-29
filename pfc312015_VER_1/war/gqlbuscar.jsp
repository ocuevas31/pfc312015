<%@ page language="java" contentType="text/html; charset=UTF-8"

import="com.pfc.datos.PMF"
import="javax.jdo.PersistenceManager"
import="com.pfc.datos.*"
import="java.util.Date"

import="javax.jdo.Query"
import="java.util.*"


  
    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Buscar datos en el DataStore</title>
</head>
<body>


<%

PersistenceManager pm = PMF.get().getPersistenceManager();


//insertamos un empleado con ese nombre ay apellidos y la fecha actual. tb tiene una clave autogenerada.


//https://cloud.google.com/appengine/docs/python/datastore/gqlreference#Examples
String sentencia=request.getParameter("sentencia");


//out.print("ve: "+sentencia);
//Thread.sleep(500);

Query q = pm.newQuery(sentencia);




out.print("Resultados de la busqueda de: "+sentencia+"<br>");

/*IDEA:
	hacer un form para enviar la consulta a ejecutar
	hacer otro para insertar cualquier dato.


	*/
 
try
{

List<Object> results = (List<Object>) q.execute();

out.print("<br>");
for(Object x:results)
{
	out.print(x.toString()+"<br>");
}
/*En principio se pueden hacer cambios a las clases de las entidades por ejemplo añadir un toString a Employee */

}
finally
{
	
	q.closeAll();
}




%>




</body>
</html>