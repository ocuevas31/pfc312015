<%@page import="com.pfc.comunicacion.Comunicacion"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	import="com.pfc.datos.PMF" import="javax.jdo.PersistenceManager"
	import="com.pfc.datos.*" import="java.util.Date"
	import="com.google.appengine.api.datastore.*" import="javax.jdo.Query"
	import="java.util.*" import="com.pfc.global.*" import="java.util.Date"
	import="java.text.SimpleDateFormat" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="es">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Insertar Cancion en el DataStore</title>

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
	 if ( user!=null && user.length()!=0 &&  Global.esAdmin(user)) 
	 
	 {
	%>


	<h1>
		Insertar una Canción por Admin:
		<%=user%></h1>



	<script>
		var arrayGrupos = new Array();
		var arrayDiscos = new Array();
	<%List<Grupo> lresults=DSDatos.buscarGruposDeAdmin(user); //DSDatos.buscarGrupos();


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
	 
	
	
	for(int j=0;j<res.size();j++)
	{
		out.println("arrayDiscos["+i+"]["+j+"]="+"\""+res.get(j).getTitulo().toUpperCase()+"\";");
	}
	
	
	i++;
}%>
		function iniSelector() {

			funcion("a");

		}
	</script>







	<script>
		function funcion(nG) {

			//alert(nG);	
			//ya esta seleccionado el grupo vamos a rellenar el selector de Disco
			//formulario.entrada.value=formulario.nombreSelector.value;

			var s = document.formulario.tituloDisco;

			//vaciar el select
			if (s.options) {
				for (m = s.options.length - 1; m >= 0; m--)
					s.options[m] = null;
			}

			var i;

			var pos = formulario.nombreGrupo.selectedIndex;

			for (i = 0; i < arrayDiscos[pos].length; i++) {
				var option = document.createElement("option");
				option.value = arrayDiscos[pos][i];
				option.text = arrayDiscos[pos][i];

				s.appendChild(option) // y aqui lo añadiste
			}

			/////

		}
	</script>








	<%
		String tituloDisco=request.getParameter("tituloDisco");
	String tituloCancion=request.getParameter("tituloCancion");
	String letra=request.getParameter("letra");
	String nombreGrupo=request.getParameter("nombreGrupo");


	String traduccion=request.getParameter("traduccion");
	String orden=request.getParameter("orden");
	String resumen=request.getParameter("resumen");;
	String mensaje=request.getParameter("mensaje");
	String listaEtiquetas=request.getParameter("listaEtiquetas");

	 String tab=request.getParameter("tab");
	 String duracion=request.getParameter("duracion");
	 String date=null;
	 
	 //if (duracion!=null && duracion.length()!=0) date=new SimpleDateFormat("hh:mm:ss").parse(duracion);
	 /*********************************************** OJOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO******************/
	 date=duracion;
	 
	String web=request.getParameter("web");
	String wiki=request.getParameter("wiki");
	 String redes=request.getParameter("redes");

	 String imp=request.getParameter("imp");
	//control correcto de datos





	// se puede buscar con key...
	/*Query q = pm.newQuery("SELECT  FROM com.pfc.datos.Grupo where nombre=='"+nombreGrupo+"'");*/


	/* 
	try
	{

	results = (List<Grupo>) q.execute();

	*/

	//y letra????????????????????????????????
	if (tituloDisco!=null && !tituloDisco.equals("") && tituloCancion!=null && !tituloCancion.equals(""))
	{

		nombreGrupo=nombreGrupo.toUpperCase();
		tituloCancion=tituloCancion.toUpperCase();
		tituloDisco=tituloDisco.toUpperCase();
		
		Cancion  rep = DSDatos.buscarCancion(nombreGrupo, tituloDisco, tituloCancion); 
		if (rep != null) {
			
			out.print("La cancion:"+tituloCancion+" del Disco: "+tituloDisco	+" del Grupo: " + nombreGrupo
			+ " Ya existe, no se puede insertar.");
		} else {

		
	Cancion e = new Cancion(tituloCancion,tituloDisco,letra,traduccion,orden,resumen,mensaje,listaEtiquetas,tab,date,web,wiki,redes,imp);



	boolean ok=DSDatos.insertarCancionADisco(nombreGrupo,tituloDisco,e);

	out.print("Intentando insertar cancion: "+nombreGrupo+" "+tituloDisco+" "+tituloCancion);
	if (ok)
		{
		Comunicacion.enviarCorreo(Global.correoRoot(),"Se ha insertado una cancion: " +tituloCancion,"grupo ins " + nombreGrupo  +" disco:"+tituloDisco+new Date().toString());

		
		//Mandar correo a todos los usuarios registrados al grupo:nombreGrupo
		
		
			
					List<Registro> kk=DSDatos.buscarRegistros(nombreGrupo);
					List<String> dest=new ArrayList<String>(kk.size());
	
					for(Registro k:kk)
					{
						
						dest.add(k.getUser());
						
					}
	
	//solo se envia si hay alguno registrado, sino que vas a enviar
	if (!dest.isEmpty())
		Comunicacion.enviarCorreos(dest, "Se ha insertado una cancion: " +tituloCancion,"grupo ins " + nombreGrupo  +" disco:"+tituloDisco+new Date().toString());
	
					
					
		
		
		
		
		out.print("Insertada cancion: "+tituloCancion+ "  al Disco:"+tituloDisco+ " Del grupo: "+nombreGrupo);
		}
	else out.print("Algun error al insertar la cancion, contacta con el root");



	out.print(com.pfc.html.HTML.getInicio());
		}
	}
	%>






	<form name="formulario" action="insertarCancion.jsp" method="post">

		<fieldset>
			<legend>Insertar una Cancion a un Disco de un Grupo</legend>

			<p>
				<label> nombre Grupo: </label> <select name="nombreGrupo"
					onchange="funcion(formulario.nombreGrupo.value)">

					<script>
						var i;

						for (i = 0; i < arrayGrupos.length; i++) {
							document.write('<option value="');
							document.write(arrayGrupos[i]);
							document.write('">' + arrayGrupos[i] + '</option>');
						}
					</script>

				</select>

			</p>

			<p>
				<label>Titulo Disco:</label> <select name="tituloDisco">

				</select>


			</p>


			<p>
				<label> Orden:</label> <input type="number" name="orden" value=""
					required />
			</p>



			<p>
				<label> Titulo Cancion:</label> <input type="text"
					name="tituloCancion" value="" required />
			</p>



			<p>
				<label>letra: </label>
				<textarea rows="20" cols="50" name="letra"></textarea>
			</p>

			<p>
				<label>Traduccion: </label>
				<textarea rows="20" cols="50" name="traduccion"></textarea>
			</p>

			<p>
				<label>Resumen: </label>
				<textarea rows="20" cols="50" name="resumen"></textarea>
			</p>
			<p>
				<label>Mensaje: </label>
				<textarea rows="20" cols="50" name="mensaje"></textarea>
			</p>



			<p>
				<label>TAB: </label>
				<textarea rows="20" cols="50" name="tab"></textarea>
			</p>


			<p>
				<label>Duracion: </label> <input type="time" name="duracion">
			</p>


			<p>
				<label>Web:</label> <input type="text" name="web" value="" size="50" />
			</p>

			<p>
				<label>Wiki:</label> <input type="text" name="wiki" value=""
					size="50" />
			</p>

			<p>
				<label>redes:</label> <input type="text" name="redes" value=""
					size="50" />
			</p>

			<p>
				<label> IMP:</label> <input type="number" name="orden" value="0" />
			</p>


		</fieldset>

		<fieldset>
			<label>Etiquetas:</label>

			<p>
				<input type="checkbox" name="listaEtiquetas" value="amor">Amor
				<input type="checkbox" name="listaEtiquetas" value="infantil">Infantil
				<input type="checkbox" name="listaEtiquetas" value="naturaleza">Naturaleza
				<input type="checkbox" name="listaEtiquetas" value="social">Social
			</p>

		</fieldset>



		<br> <br> <input type="submit" value="INSERTAR CANCION" />
	</form>






	<ul class="nav nav-tabs">
		<li class="active"><a href="#panel-949238" data-toggle="tab">Ayuda</a>
		</li>
		<li><a href="#panel-958636" data-toggle="tab">Ejemplos</a></li>
		<li><a href="#panel-1" data-toggle="tab">Ojo</a></li>
		<li><a href="#panel-tube" data-toggle="tab">Video Ayuda</a></li>

	</ul>



	<div class="tab-content">
		<div class="tab-pane active" id="panel-949238">
			<p>Rellena todos los campos y pulsa el boton.Puedes ver un video de ejemplo en la pestaña de Video de Ayuda</p>
		</div>
		<div class="tab-pane" id="panel-958636">
			
				<p>
				<img src="/imagenes/ayuda/ayuda_insertar_Cancion.png">
			</p>
			
		</div>
		<div class="tab-pane" id="panel-1">
			<p>En IMP poner un numero del 0 al 10, segun la importancia de la cancion.</p>
			<p>La duracion en formato mm:ss</p>
			
			
		</div>
		
		<div class="tab-pane" id="panel-tube">
			<p>Video de YouTube de Ayuda:</p>
			
			<p>
			<iframe width="854" height="480" src="https://www.youtube.com/embed/5R1E8dFYCUw" frameborder="0" allowfullscreen></iframe>
			</p>
			
		</div>

	</div>














	<%
		} else {
	%>

	<h1>
		No puede acceder a esta pagina contacte con el root:
		<%=Global.getRoot()%></h1>


	<%
		}
	%>






	<script src="js/jquery.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/scripts.js"></script>






</body>
</html>