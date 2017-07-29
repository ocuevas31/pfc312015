<%@ page import="com.google.appengine.api.blobstore.BlobstoreServiceFactory" %>
<%@ page import="com.google.appengine.api.blobstore.BlobstoreService" %>
 
<%
BlobstoreService blobstoreService = BlobstoreServiceFactory.getBlobstoreService();
%>
<html>
<head>
<title>Imagen</title>
</head>
<body>

<h1>Imagen</h1>
<hr/>



<form action="<%= blobstoreService.createUploadUrl("/Upload") %>" method="post" enctype="multipart/form-data">
File :
<input type="file" name="imagen"/>
<input type="submit" value="EnviarImagen"/>
</form>
</html>
