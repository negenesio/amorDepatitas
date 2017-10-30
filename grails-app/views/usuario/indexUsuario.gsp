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
    <style>
        th, td, tr {
            text-align: center;
        }
        .registrar-mascota{
            padding-top: -20px;
            padding-bottom: 30px;
            background: rgba(66, 70, 69, 0.69);
            color: white;
        }
        tr:nth-child(even) { background: #ddd }
        tr:nth-child(odd) { background: #fff}
        .table tbody tr:hover td, .table tbody tr:hover th {
            background-color: #E1F2B6;
        }
    </style>
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
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${mascotas}" var="mascota">
        <tr>
            <td>${mascota.nombre}</td>
            <td>${mascota.sexo}</td>
            <td>${mascota.fechaNacimiento}</td>
            <td>${mascota.raza.descripcion}</td>
            <td>
                <label style="padding-left: 5px"><i class="fa fa-share" aria-hidden="true" style="font-size:20px;" data-toggle="tooltip" data-placement="top" title="Postular Mascota"></i></label>
                <label style="padding-left: 5px"><i class="fa fa-pencil" aria-hidden="true" style="font-size:20px;" data-toggle="tooltip" data-placement="top" title="Modificar Mascota"></i></label>
                <label style="padding-left: 5px"><i class="fa fa-times" aria-hidden="true" style="font-size:20px;" data-toggle="tooltip" data-placement="top" title="Eliminar Mascota"></i></label>
            </td>
        </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
                <center><h3 class="title">Para empezar, deberias cargar tu primer mascota!</h3>
            <g:link controller="mascota" action="createIndex"><button class="btn-info">Registrar Mascota</button></g:link></center>
        </div>
    </div>
</g:else>
</body>
</html>