<%@page import="com.pfc.comunicacion.Comunicacion"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*"
	import="java.text.SimpleDateFormat"
	
	import="com.pfc.datos.*"
	import="com.pfc.html.*"
	
	
	 pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<title>Registrarse</title>
<link rel="stylesheet" type="text/css" href="/css/formularios.css" />

</head>
<body>



<%
String[] a = request.getParameterValues("nombreGrupo");
String user=(String)session.getAttribute("user");




Registro g=new Registro(user,a);

DSDatos.insertarRegistro(g);


%>





	
	
	
	<h1>Te has registrado en los siguientes grupos:</h1>	
<% 
	
	for(int i=0;i<a.length;i++)
	{	
%>
		<%=a[i] %>
		
	
		
		<br>
		
	
<% 
	}
%>	
	
	<%=HTML.getInicio() %>
	
	
	
	


</body>
</html>