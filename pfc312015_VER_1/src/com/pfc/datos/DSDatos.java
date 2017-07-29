package com.pfc.datos;

import java.util.ArrayList;
import java.util.List;

import javax.jdo.*;

import com.google.appengine.api.datastore.Key;
import com.google.appengine.api.datastore.KeyFactory;
import com.pfc.global.Global;




/** Permite las principales operaciones con los datos mas importantes, grupos, discos,canciones......
 * 

 * @author ocuevas31
 *
 */
public class DSDatos {

	private static PersistenceManager pm = PMF.get().getPersistenceManager();

	static public boolean insertarGrupo(Grupo g)
	{
		boolean ok=false;
		
		
		try
		{
		

		pm.makePersistent(g);

		ok=true;
		
		}
		catch(Exception e)
		{
			ok=false;
		}
		finally
		{
			//pm.close();
			
		}
		return ok;
		
	}
	
	/** Busca un grupo con el nombre dado en el DS y lo devuelve o null si no esta */
	static public Grupo buscarGrupo(String nombreGrupo)
	
	{
		Grupo g=null;
		
		
		
		
		
		if (nombreGrupo!=null && !nombreGrupo.equals(""))
		{
			//PersistenceManager pm = PMF.get().getPersistenceManager();
	
			
			
			try
			{
				
			 Key k = KeyFactory.createKey(com.pfc.datos.Grupo.class.getSimpleName(),nombreGrupo);
	
			 g=pm.getObjectById(com.pfc.datos.Grupo.class,k);
	
			}
			catch(JDOObjectNotFoundException e)
			{
				
				g=null;
				
			}
			finally
			{
	
			//pm.close();
			
			}
		
		}
		
		return g;
		
	}
	
	
	/*Busca todos los grupos y los dev*/
	@SuppressWarnings("unchecked")
	static public List<Grupo> buscarGrupos()
	{
		//PersistenceManager pm = PMF.get().getPersistenceManager();
		
		List<Grupo> results=null;
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Grupo");

		try
		{

			results = (List<Grupo>) q.execute();


		}
		catch(Exception e)
		{
			
			results=null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
	
		return results;
		
		
		
	}
	
	
	static public List<Grupo> buscarGruposDeAdmin(String user)
	{
		//de los asignados buscar los que estan en el DS y devolverlos.
		
		List<Grupo> dev=new ArrayList<Grupo>();
		
		
		List<Grupo> todos=buscarGrupos();
		
		String[] asignados = Global.gruposDeAdmin(user);
		
		
		
		for(Grupo g:todos)
		{
			
			if (Global.esta(g.getNombre(),asignados)) dev.add(g);
			
			
			
		}
		
		
		return dev;		
	}
	
	
	
	
	
	
	
	/*Inserta el disco d al grupo con el nombreGrupo*/
	static public boolean insertarDiscoAGrupo(String nombreGrupo,Disco d)
	{
		boolean insertado=false;
		
		//Buscar el grupo
		//a ese grupo añadirle ese disco
		
		
		
		
		Grupo g=buscarGrupo(nombreGrupo);
		
		
		if (g!=null)
		{
			
			//PersistenceManager pm = PMF.get().getPersistenceManager();
			
			
			g.insertarDisco(d);
			
			
			pm.makePersistent(d);
			insertado=true;
			
		}
		
		
		return insertado;
		
		
	}
	
	static public void cerrar()
	{
		
		
		pm.close();
	}

	
	static public List<Disco> buscarDiscos(String nombreGrupo)
	{
		
		Grupo g=buscarGrupo(nombreGrupo);
		
		if (g!=null)
		return g.getDiscos();
		else return null;
		
		
	}
	
	
	
	
	static public Disco buscarDisco(String nombreGrupo,String nombreDisco)
	{
		
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Disco");

		try
		{

			@SuppressWarnings("unchecked")
			List<Disco> x = (List<Disco>) q.execute();

			
			for(Disco k:x)
			{
				if (k.getTitulo().equalsIgnoreCase(nombreDisco)){ return k;}
				
				
			}
			
			

		}
		catch(Exception e)
		{
			
			return null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
		
		
		return null;
	}
	
	
	
	
	
	static public boolean borrarDisco(String nombreGrupo,String nombreDisco)
	{
		boolean ok=false;
		
		/*buscar el grupo y quitarle ese disco*/
		

		
		Grupo g=buscarGrupo(nombreGrupo);
		
		
		if (g!=null)
		{
			
			//PersistenceManager pm = PMF.get().getPersistenceManager();
			
			
			g.borrarDisco(nombreDisco);
			
			
			Disco d=buscarDisco(nombreGrupo,nombreDisco);
			
			
			
			
			pm.deletePersistent(d);
			
			//pm.makePersistent(d);
			ok=true;
			
		}
		
		
		return ok;
	}
	
	
	
	
	static public Cancion buscarCancion(String nombreGrupo,String nombreDisco,String tituloCancion)
	{
		Cancion c=null;
		
		
		Disco d=buscarDisco(nombreGrupo,nombreDisco);
		
		if (d!=null)
		{
			
			
			Query q = pm.newQuery("SELECT FROM com.pfc.datos.Cancion");

			try
			{

				@SuppressWarnings("unchecked")
				List<Cancion> x = (List<Cancion>) q.execute();

				
				for(Cancion k:x)
				{
					if (k.getTituloCancion().equalsIgnoreCase(tituloCancion)){ return k;}
					
					
				}
				
				

			}
			catch(Exception e)
			{
				
				return null;
				
			}
			finally
			{
				q.closeAll();
				//pm.close();
			}
			
			
			
			
		}
		
		return c;
	}
	
	
	static public boolean borrarCancion(String nombreGrupo,String nombreDisco,String tituloCancion)
	{
		boolean ok=false;
		
		/*buscar el grupo y quitarle ese disco*/
		

		
		Grupo g=buscarGrupo(nombreGrupo);
		
		
		if (g!=null)
		{
			
			//PersistenceManager pm = PMF.get().getPersistenceManager();
			
			
		//	g.borrarDisco(nombreDisco);
			
			
			Disco d=buscarDisco(nombreGrupo,nombreDisco);
			
			
			
			d.borrarCancion(tituloCancion);
			
			Cancion c=buscarCancion(nombreGrupo,nombreDisco,tituloCancion);
			
			pm.deletePersistent(c);
			
			//pm.makePersistent(d);
			ok=true;
			
		}
		
		
		return ok;
	}
	
	
	
	
	//TB hacer un buscarCAnciones del tal disco de tal grupo, comprobar que el disco que tiene igual nombre tb tiene el mismo grupo.... por si hay repetidos
	static public List<Cancion> buscarCanciones(String nombreDisco)
	{
		
		List<Cancion> d=null;
		
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Disco");

		try
		{

			@SuppressWarnings("unchecked")
			List<Disco> x = (List<Disco>) q.execute();

			
			for(Disco k:x)
			{
				if (k.getTitulo().equalsIgnoreCase(nombreDisco)){ d=k.getCanciones(); return d;}
				
				
			}
			
			

		}
		catch(Exception e)
		{
			
			d=null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
		
		
		
		return d;
		
		
	}
	
	static public Cancion buscarCancion(String nombreCancion)
	{
		
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Cancion");

		try
		{

			@SuppressWarnings("unchecked")
			List<Cancion> x = (List<Cancion>) q.execute();

			
			for(Cancion k:x)
			{
				if (k.getTituloCancion().equalsIgnoreCase(nombreCancion)){  return k;}
				
				
			}
			
			

		}
		catch(Exception e)
		{
			
			return null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
		return null;
		
		
		
		
	}
	
	
	
	
	static public boolean insertarCancionADisco(String nombreGrupo ,String tituloDisco,Cancion c)
	{
		boolean ok=false;
		
		//buscar el grupo con nombreGrupo y entre sus discos en que tenga el titulo  tituloDisco e insertarle la cancion
		
		
		Grupo g=buscarGrupo(nombreGrupo);
		
		
		if (g!=null)
		{
			
			//PersistenceManager pm = PMF.get().getPersistenceManager();
			
			
			List <Disco> d=g.getDiscos();
			
					for(int i=0;i<d.size();i++)
						if (d.get(i).getTitulo().equals(tituloDisco)){ d.get(i).insertarCancion(c); break;}
			
			pm.makePersistent(c);
			ok=true;
			
		}
		
		
		
		
		return ok;
	}
	
	
	
	static public List<Cancion> buscarCancionConTitulo(String titulo)
	{
		List<Cancion> lista=new ArrayList<Cancion>();
		
		titulo=titulo.toUpperCase();
		

	Query q = pm.newQuery("SELECT FROM com.pfc.datos.Cancion");

	try
	{

		@SuppressWarnings("unchecked")
		List<Cancion> x = (List<Cancion>) q.execute();

		
		for(Cancion k:x)
		{
			if (k.getTituloCancion().indexOf(titulo)!=-1){ lista.add(k);}
			
			
		}
		
		

	}
	catch(Exception e)
	{
		
		return null;
		
	}
	finally
	{
		q.closeAll();
		//pm.close();
	}
	return lista;
	
	
	
	}
	
	static public List<Cancion> buscarCancionConLetra(String letra)
	{
	
		List<Cancion> lista=new ArrayList<Cancion>();
		
		letra=letra.toUpperCase();
		

	Query q = pm.newQuery("SELECT FROM com.pfc.datos.Cancion");

	try
	{

		@SuppressWarnings("unchecked")
		List<Cancion> x = (List<Cancion>) q.execute();

		
		for(Cancion k:x)
		{
			String cad=k.getLetra().toUpperCase();
			
			
			
			if (cad.indexOf(letra)!=-1){ lista.add(k);}
			
			
		}
		
		

	}
	catch(Exception e)
	{
		
		return null;
		
	}
	finally
	{
		q.closeAll();
		//pm.close();
	}
		
		
		
		
		return lista;
		
		
	}
	
	
	public static List<Grupo> buscarGruposConNombre(String que)
	{
		List<Grupo> dev=new ArrayList<Grupo>();
		

	Query q = pm.newQuery("SELECT FROM com.pfc.datos.Grupo");

	try
	{

		@SuppressWarnings("unchecked")
		List<Grupo> res= (List<Grupo>) q.execute();

		
		for(Grupo k:res)
		{
			String cad=k.getNombre().toUpperCase();
			
			
			
			if (cad.indexOf(que)!=-1){ dev.add(k);}
			
			
		}
		
		

	}
	catch(Exception e)
	{
		
		return null;
		
	}
	finally
	{
		q.closeAll();
		//pm.close();
	}
		
		
		
		
		
		
		return dev;
	}
	
	
	
	public static List<Disco> buscarDiscosConTitulo(String que)
	{
		List<Disco> dev=new ArrayList<Disco>();
		

		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Disco");

		try
		{

			@SuppressWarnings("unchecked")
			List<Disco> res= (List<Disco>) q.execute(); 

			
			for(Disco k:res)
			{
				String cad=k.getTitulo().toUpperCase();
				
				
				
				if (cad.indexOf(que)!=-1){ dev.add(k);}
				
				
			}
			
			

		}
		catch(Exception e)
		{
			
			return null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
			
			
			
			
			
			
			return dev;
		
		
		
	}
	
	static public boolean insertarNoticia(Noticia g)
	{
		boolean ok=false;
		
		
		try
		{
		

		pm.makePersistent(g);

		ok=true;
		
		}
		catch(Exception e)
		{
			ok=false;
		}
		finally
		{
			//pm.close();
			
		}
		return ok;
		
	}
	
	

	static public List<Noticia> buscarNoticias()
	{
		
		List<Noticia> x=null;
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Noticia");

		try
		{

			@SuppressWarnings("unchecked")
			 List<Noticia> c=  (List<Noticia>)q.execute();

			x=c;
			

		}
		catch(Exception e)
		{
			
			return null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
		
		
		return x;
	}
	
	
	static public Noticia buscarNoticia()
	{
		
		return buscarNoticias()==null|| buscarNoticias().size()==0?null:buscarNoticias().get(0);
		
		
	}
	
	
	
	
	static public boolean insertarFrase(Frase g)
	{
		boolean ok=false;
		
		
		try
		{
		

		pm.makePersistent(g);

		ok=true;
		
		}
		catch(Exception e)
		{
			ok=false;
		}
		finally
		{
			//pm.close();
			
		}
		return ok;
		
	}
	
	

	static public List<Frase> buscarFrases()
	{
		
		List<Frase> x=null;
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Frase");

		try
		{

			@SuppressWarnings("unchecked")
			 List<Frase> c=  (List<Frase>)q.execute();

			x=c;
			

		}
		catch(Exception e)
		{
			
			return null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
		
		
		return x;
	}
	
	
	static public Frase buscarFrase()
	{
		
		return buscarFrases()==null|| buscarFrases().size()==0?null:buscarFrases().get(0);
		
		
	}
	
	
	
	static public boolean insertarRegistro(Registro g)
	{
		boolean ok=false;
		
		
		try
		{
		

		pm.makePersistent(g);

		ok=true;
		
		}
		catch(Exception e)
		{
			ok=false;
		}
		finally
		{
			//pm.close();
			
		}
		return ok;
		
	}
	
	/*Busca todos los grupos y los dev*/
	@SuppressWarnings("unchecked")
	static public List<Registro> buscarRegistros()
	{
		//PersistenceManager pm = PMF.get().getPersistenceManager();
		
		List<Registro> results=null;
		
		Query q = pm.newQuery("SELECT FROM com.pfc.datos.Registro");

		try
		{

			results = (List<Registro>) q.execute();


		}
		catch(Exception e)
		{
			
			results=null;
			
		}
		finally
		{
			q.closeAll();
			//pm.close();
		}
	
		return results;	
	}
	
	
	/*Devuelve una lista de todos los usuarios registrados a ese grupo*/
	static public List<Registro> buscarRegistros(String grupo)
	{
		
		List<Registro> res=new ArrayList<Registro>();
		
		List<Registro> todos=buscarRegistros();
		
		
		
		for (Registro g : todos) 
		{
			
			List<String> l=g.getGrupos();
			
			
			if (Global.esta(grupo,l)) res.add(g);
			
		}
		
		
		
		
		
		return res;
		
		
	}
	
	
	
	

}
