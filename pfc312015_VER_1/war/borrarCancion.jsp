<%@page import="com.pfc.comunicacion.Comunicacion"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" 
	import="com.pfc.global.*"
	
	pageEncoding="UTF-8"


%>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Borrar Cancion del DataStore</title>

<link rel="stylesheet" type="text/css" href="/css/formularios.css" />

<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/style.css" rel="stylesheet">

</head>


<body onload="iniSelector()">




<%

RequestDispatcher rd=request.getRequestDispatcher("menu.jsp");

rd.include(request, response);

%>





<%
 String user=(String)session.getAttribute("user");
 if ( user!=null && user.length()!=0 && Global.esAdmin(user)) 
 
 {%>

<h1>Borrar una canción por Admin:  <%=user %></h1>

	<script>
		function iniSelector() {

			//alert("Cargado");
			funcion();
		}
	</script>







	<script>
		var arrayGrupos = new Array();
		var arrayDiscos = new Array();
		var arrayCanciones=new Array();
	
	
	<%
	List<Grupo> lresults=DSDatos.buscarGruposDeAdmin(user); //DSDatos.buscarGrupos();


	//out.print("<select name=\"nombreGrupo\" onchange=\"funcion(formulario.nombreGrupo.value)\">");
	int i=0;
	for(Grupo x:lresults)
	{
		//out.print("<option value=\"");
		//out.print(x.getNombre());
		//out.println("\">"+x.getNombre()+"</option>");

		out.println("arrayGrupos["+i+"]=\""+x.getNombre().toUpperCase()+"\";");
		
		out.println("arrayDiscos["+i+"]=new Array();");
		
		
		
		/*igual no es obligatorio  buscar los Discos, con los grupos tb estan sus discos....*/
		List<Disco> res=DSDatos.buscarDiscos(x.getNombre());
		 
		out.println("arrayCanciones["+i+"]=new Array();");
		
		
		for(int j=0;j<res.size();j++)
		{
			out.println("arrayDiscos["+i+"]["+j+"]="+"\""+res.get(j).getTitulo().toUpperCase()+"\";");


			out.println("arrayCanciones["+i+"]["+j+"]=new Array();");
		
		

			List<Cancion> can=DSDatos.buscarCanciones(res.get(j).getTitulo().toUpperCase());

			for(int k=0;k<can.size();k++)
			{
				
				out.println("arrayCanciones["+i+"]["+j+"]["+k+"]="+"\""+can.get(k).getTituloCancion().toUpperCase()+"\";");

				
			}



		}
		
		
		i++;
	}

	%>
		function funcion() {

			//alert("PAisa");
			//ya esta seleccionado el grupo vamos a rellenar el selector de Disco
			//formulario.entrada.value=formulario.nombreSelector.value;

			var s = document.formulario.tituloDisco;

			//vaciar el select
			if (s.options) {
				for (m = s.options.length - 1; m >= 0; m--)
					s.options[m] = null;
			}

			var pos = formulario.nombreGrupo.selectedIndex;
			
			for (i=0;i<arrayDiscos[pos].length;i++)
			 {
			 var option=document.createElement("option"); 
			 option.value=arrayDiscos[pos][i]; 
			 option.text=arrayDiscos[pos][i]; 

			 s.appendChild(option) // y aqui lo añadiste
			 }
			 

			/*for (i = 0; i < 3; i++) {
				var option = document.createElement("option");
				option.value = "tal ";
				option.text = "tal  ";

				s.appendChild(option)
			}*/
			
			funcionDisco();

		}

		function funcionDisco() {

			//alert("Hola");

			var s = document.formulario.tituloCancion;

			//vaciar el select
			if (s.options) {
				for (m = s.options.length - 1; m >= 0; m--)
					s.options[m] = null;
			}

			var pos = formulario.tituloDisco.selectedIndex;

			var pos2=formulario.nombreGrupo.selectedIndex;
			
			
			for (i=0;i<arrayCanciones[pos2][pos].length;i++)
			{
			 var option=document.createElement("option"); 
			 option.value=arrayCanciones[pos2][pos][i]; 
			 option.text=arrayCanciones[pos2][pos][i]; 

			 s.appendChild(option) // y aqui lo añadiste
			}
			 

			/*for (i = 0; i < 3; i++) {
				var option = document.createElement("option");
				option.value = "cual ";
				option.text = "cual  ";

				s.appendChild(option) // y aqui lo añadiste
			}*/

		}
	</script>





	<%
String tituloDisco=request.getParameter("tituloDisco");
String tituloCancion=request.getParameter("tituloCancion");
//String letra=request.getParameter("letra");
String nombreGrupo=request.getParameter("nombreGrupo");
//control correcto de datos





// se puede buscar con key...
/*Query q = pm.newQuery("SELECT  FROM com.pfc.datos.Grupo where nombre=='"+nombreGrupo+"'");*/


/* 
try
{

results = (List<Grupo>) q.execute();

*/

//y letra????????????????????????????????
if (tituloDisco!=null && !tituloDisco.equals("") && nombreGrupo!=null && !nombreGrupo.equals(""))
{

	nombreGrupo=nombreGrupo.toUpperCase();
	//tituloCancion=tituloCancion.toUpperCase();
	tituloDisco=tituloDisco.toUpperCase();
	
//Cancion e = new Cancion(tituloCancion,tituloDisco,letra);



boolean ok=DSDatos.borrarCancion(nombreGrupo,tituloDisco,tituloCancion);

out.print("Intentando borrar cancion: "+nombreGrupo+" "+tituloDisco+""+tituloCancion);
if (ok) 
	{
	
	Comunicacion.enviarCorreo(Global.correoRoot(),"Se ha borrado una cancion: " +tituloCancion,"grupo ins " + nombreGrupo  +" disco:"+tituloDisco+new Date().toString());

	out.print("cancion borrado: "+ "  al Disco:"+tituloDisco+ " Del grupo: "+nombreGrupo);
	}
else out.print("Algun errror al borrar un disco, contacta con el root");

}

%>












	<form name="formulario" action="borrarCancion.jsp" method="post">

		<fieldset>
			<legend>Borrar una Cancion de un Grupo de un Disco</legend>

			<p>
				<label> nombre Grupo: </label>
				 <select name="nombreGrupo"	onchange="funcion()">

					<script>
						var i;

						for (i=0;i<arrayGrupos.length;i++)
						{
							document.write('<option value="');
							document.write(arrayGrupos[i]);
							document.write('">'+arrayGrupos[i]+'</option>');
						}

					</script>

				</select>

			</p>

			<p>
				<label>Titulo Disco:</label> <select name="tituloDisco"	onchange="funcionDisco()">

				</select>


			</p>


			<p>
				<label>Titulo Cancion:</label> <select name="tituloCancion">

				</select>


			</p>

		</fieldset>

		<br> <br> <input type="submit" value="BORRAR CANCION" />
	</form>



<%
}
 else 
 {

%>

<h1>No puede acceder a esta pagina contacte con el root: <%=Global.getRoot() %></h1>


<%
} 
%>




	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>





</body>
</html>