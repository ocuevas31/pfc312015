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
<title>Discos</title>
</head>
<body>


<%

@SuppressWarnings("unchecked")
List<Disco> d=(List<Disco>)request.getAttribute("param");



/*Si todos los discos son del mismo grupo, si mostrarlo sino no*/
if (d!=null && d.size()!=0 )
out.println("Discos del grupo: "+ d.get(0).getGrupo() + "<br>");



for (Disco x : d) 
{

	/* < ahref=""  > </a>*/
	//out.print("GRUPO: " + x.getNombre().toUpperCase() + "<br>");

	out.print("<a href=\"navegar.jsp?nombreDisco="
			+ x.getTitulo() + "\">"
			+ x.getTitulo().toUpperCase() + "</a");
	

	out.print("<a href=\"navegar.jsp?nombreDisco="+x.getTitulo()+"\">"+"<img src='"+x.getPortada()+"'>"+"</a>");

	

	out.print("<br>");

	/*
	for (Disco d : x.getDiscos()) {
		out.print("-----Disco: " + d.getTitulo().toUpperCase()
				+ "<br>");

		for (Cancion k : d.getCanciones()) {

			out.print("---------------Cancion: "
					+ k.getTituloCancion().toUpperCase()
					+ "<br>");

		}
	}
	 */
	out.print("<br>");
}

//out.print(com.pfc.html.HTML.getInicio());
%>




</body>
</html>