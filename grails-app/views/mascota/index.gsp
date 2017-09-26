<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name='layout' content='main'/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <asset:stylesheet src="../usuario/indexRegistracion.css"/>
    <title></title>
</head>

<body>
<g:uploadForm name="upload" url="[action:'upload',controller:'photo']">
    <g:textField name="name" placeholder="name"/><br/>
    <input type="file" name="photo" /><br/>
    <g:submitButton name="update" value="Update" /><br/>
</g:uploadForm>
</body>
</html>