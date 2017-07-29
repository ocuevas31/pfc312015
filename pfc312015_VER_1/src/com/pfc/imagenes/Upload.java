package com.pfc.imagenes;

import javax.servlet.http.HttpServlet;

import java.io.IOException;
import java.util.List;
import java.util.Map;
//import java.util.logging.Logger;
 








import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
 








import com.google.appengine.api.blobstore.BlobKey;
import com.google.appengine.api.blobstore.BlobstoreService;
import com.google.appengine.api.blobstore.BlobstoreServiceFactory;
import com.google.appengine.api.images.ImagesService;
import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;



	 
	@SuppressWarnings("serial")
	public class Upload extends HttpServlet 
	{
	//private final static Logger _logger = Logger.getLogger(Upload.class.getName());
	private BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
	 
	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException 
	{

/*
		ImagesService imagesService = ImagesServiceFactory.getImagesService();
        ServingUrlOptions suo = ServingUrlOptions.Builder.withBlobKey(blobKey);
        String image_url = imagesService.getServingUrl(suo);

	*/	
		
		
		/*String key=req.getParameter("img_id");

		boolean hayParam=key!=null && !key.equals("");		
				
				
				
		if (hayParam)
		{
			
			
        	BlobKey blobKey = new BlobKey(key);
        	
        
			blobstoreService.serve(blobKey, res);
			
			
			
			
			
		}
		else
		{
		
		*/
				
        Map<String, List<BlobKey>> blobs = blobstoreService.getUploads(req);
        List<BlobKey> blobKeys = blobs.get("imagen");

        if (blobKeys == null || blobKeys.isEmpty()) 
        {
            res.sendRedirect("/");
        } else 
        {
        	
        	 //BlobKey blobKey = new BlobKey(blobKeys.get(0).getKeyString());

        	
        	BlobKey blobKey = new BlobKey(blobKeys.get(0).getKeyString());
        	
        	/*final Logger _logger = Logger.getLogger(Upload.class.getName());
        	
        		_logger.info(blobKeys.get(0).getKeyString());
        		*/	
        	
        	
        	/**Hay que guardar en el Data Store blobKeys.get(0).getKeyString()
        	 * 
        	 * para cuando se quiera recuperar la imagen hacer 	BlobKey blobKey = new BlobKey(blobKeys.get(0).getKeyString()); y despues
        	 * blobstoreService.serve(blobKey, res); y mirar que hace bien el serve y uso del res.
        	 * no mejor guardar la url de la imagen lo unico mirar si funciona siempre no solo 1 dia.

        	 * 
        	 * 
        	 */
        	
        	
        	
        	ImagesService imagesService = ImagesServiceFactory.getImagesService();
            ServingUrlOptions suo = ServingUrlOptions.Builder.withBlobKey(blobKey);
            String image_url = imagesService.getServingUrl(suo);
        	       	
  		
          req.setAttribute("imagen", image_url);
            
           
          String accion=req.getParameter("accion");
          
          RequestDispatcher rd=null;
          
          
          
          if (accion.equals("insertar"))
          {
          
        	  rd = req.getRequestDispatcher("insertar.jsp");
          
          }
          else if (accion.equals("insertarDisco"))
          {
        	  
        	  
        	  rd = req.getRequestDispatcher("insertarDisco.jsp");
              	  
        	  
          }
          
          rd.forward(req, res);
          
          
            //req.getSession().setAttribute("img", image_url); 
        	
  			//al  Data Store
  			
  			
        	 /*PrintWriter out=res.getWriter();
        	 
        	 out.print("Hola que paisa   ");
        	 
        	 
        	 out.print(blobKeys.get(0).getKeyString());
        	 */
        	 
        	 
        	//blobstoreService.serve(blobKey, res);

        }
        	
        	
            //res.sendRedirect("/serve?blob-key=" + blobKeys.get(0).getKeyString());
        /*}*/


		
	}
}



