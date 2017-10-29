<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <asset:stylesheet src="../usuario/indexRegistracion.css"/>
    <title></title>
</head>

<body>
<g:if test="${mascotas}">
    <table class="table table-striped">
        <thead>
        <tr>
            <th>Nombre</th>
            <th>Sexo</th>
            <th>Fecha Nacimiento</th>
            <th>Raza</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${mascotas}" var="mascota">
        <tr>
            <td>${mascota.nombre}</td>
            <td>${mascota.sexo}</td>
            <td>${mascota.fechaNacimiento}</td>
            <td>${mascota.raza.descripcion}</td>
        </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
</body>
</html>