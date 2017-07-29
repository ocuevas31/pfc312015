<%@ 


page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"
    
import="com.pfc.datos.*"    
import="java.util.*"    
    
%>
    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Grupos</title>
</head>
<body>


<%

@SuppressWarnings("unchecked")
List<Noticia> results=(List<Noticia>)DSDatos.buscarNoticias();
out.print("<br>");

out.print("Noticias: <br>");

for (Noticia x : results) 
{


//out.print("GRUPO: " + x.getNombre().toUpperCase() + "<br>");
out.print(x.getTexto());


//out.print("<img src='"+x.getLogo()+"'>");

out.print("<br>");
out.print("<hr>");

}

out.print("<br>");


//out.print(com.pfc.html.HTML.getInicio());
%>




</body>
</html>