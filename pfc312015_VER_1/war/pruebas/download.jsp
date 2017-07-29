<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
<%@ page import="com.google.appengine.api.blobstore.BlobKey" %>


<html>
<head>
<title>Ver imagen desde Blog Store</title>
</head>
<body>


<%
//BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();

String blobKey=(String)request.getSession().getAttribute("img");
%>



<%


/*import com.google.appengine.api.images.ImagesServiceFactory;
import com.google.appengine.api.images.ServingUrlOptions;
*/

/*com.google.appengine.api.images.ImagesService imagesService = com.google.appengine.api.images.ImagesServiceFactory.getImagesService();
com.google.appengine.api.images.ServingUrlOptions suo = com.google.appengine.api.images.ServingUrlOptions.Builder.withBlobKey(new BlobKey(blobKey));
*/
String image_url = (String)request.getSession().getAttribute("img");

out.print(image_url+"<br>");


%>



<%=request.getSession().getAttribute("img") %>

<br>
<img width="200" height="150" src='<%=image_url%>' >


<!-- 

<img width="200" height="150" src='/Upload?img_id=<%=blobKey%>' >


<img width="200" height="150" src='/Upload' >

 -->


</body>
</html>
