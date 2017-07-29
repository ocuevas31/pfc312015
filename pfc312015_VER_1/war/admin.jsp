<%@ page language="java" contentType="text/html; charset=UTF-8"

import="com.pfc.datos.PMF"
import="javax.jdo.PersistenceManager"
import="com.pfc.datos.*"
import="java.util.Date"
import="com.google.appengine.api.datastore.*"
import="javax.jdo.Query"
import="java.util.*"
import="com.pfc.global.*"

    pageEncoding="UTF-8"%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
   <meta name="google-signin-client_id" content="22115098457-1ehmt8s0c6l659nioc4asoa6bd6mte0t.apps.googleusercontent.com">
  


<title>Admins</title>

<link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
  
</head>
<body >


<!-- 
COMPROBAR QUE ES ALGUNO DE LOS USUARIOS ADMITIDOS, SINO FUERA.

 -->
  <%



  request.getRequestDispatcher("menu.jsp").include(request, response);

%>
  

<%
String user=(String)request.getParameter("user");


out.print("Usuario: "+user);
if (Global.esAdmin(user) ) 
{

	session.setAttribute("user",user);
	
	RequestDispatcher rd=request.getRequestDispatcher("Pfc312015_VER_1.jsp");
	
	rd.forward(request, response);
	
}
else
{
	
	out.print("<h1>No tiene permiso, contacte con:"+Global.getRoot() +" </h1>");
 	
	%>
	
	
	
  <script>
    function signOut() {
      var auth2 = gapi.auth2.getAuthInstance();
      auth2.signOut().then(function () {
        console.log('User signed out.');
        
        location.href="accesogoogle.html";
      });
    }

    function onLoad() {
      gapi.load('auth2', function() {
        gapi.auth2.init();
      });
    }
  </script>
  
   Intentar con otro usuario:
  <a href="#" onclick="signOut();">Sign out</a>

  <script src="https://apis.google.com/js/platform.js?onload=onLoad" async defer></script>
 
 
 
	
	
<%	
}


%>


 
  <script src="js/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/scripts.js"></script>
 

</body>
</html>