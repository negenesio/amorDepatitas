<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page import="amordepatitas.Mascota; amordepatitas.Postulacion; amordepatitas.CalificacionEncuentro" contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="indexRegistracion.css"/>

    <style>
        .btn span.glyphicon {
            opacity: 0;
        }
        .btn.active span.glyphicon {
            opacity: 1;
        }
        .weekDays-selector input {
            display: none!important;
        }

        .weekDays-selector input[type=checkbox] + label {
            display: inline-block;
            border-radius: 6px;
            background: #dddddd;
            height: 40px;
            width: 30px;
            margin-right: 3px;
            line-height: 40px;
            text-align: center;
            cursor: pointer;
        }

        .weekDays-selector input[type=checkbox]:checked + label {
            background: #2AD705;
            color: #ffffff;
        }
        .title {
            color: white;
        }
        th, td, tr {
            text-align: center;
        }
        .registrar-mascota{
            padding-top: -20px;
            padding-bottom: 30px;
            background: rgba(66, 70, 69, 0.69);
            color: white;
        }
        .mascota tr:nth-child(even) { background: #ddd }
        .mascota tr:nth-child(odd) { background: #fff}
        .table tbody tr:hover td, .table tbody tr:hover th {
            background-color: #E1F2B6;
        }
        .button-selected:hover {
            background-image: initial;
            background-repeat: initial;
            background-position: initial;
            -webkit-border-radius: initial;
            -moz-border-radius: initial;
            border-radius: initial;
            border-style: initial;
            border-width: initial;
            border-color: initial;
            background-color: initial;
            background-color: white;!important;
        }
    </style>
</head>
<body>
<g:if test="${calificaciones}">
    <table class="table table-striped mascota">
        <thead>
        <tr class="mascota">
            <th>Nombre Usuario</th>
            <th>Nota</th>
            <th>Descripcion</th>
            <th>Fecha</th>
            <th>Estado</th>
            <th>Tu Mascota</th>
            <th>La Cita</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${calificaciones}" var="calificacion">
        <tr class="mascota">
            <td>${calificacion.calificado.name}</td>
            <td>${calificacion.nota}</td>
            <td>${calificacion.descripcion}</td>
            <td>${calificacion.fechaModificacion.format('dd/mm/YYYY')}</td>
            <td>${calificacion.estado}</td>
            <g:if test="${calificacion.encuentro.mascotaSolicitud.secUser.username.toString() == sec.loggedInUserInfo(field:'username').toString()}">
                <td>${calificacion.encuentro.mascotaSolicitud.nombre}</td>
                <td>${calificacion.encuentro.mascotaPeticion.nombre}</td>
            </g:if>
            <g:else>
                <td>${calificacion.encuentro.mascotaPeticion.nombre}</td>
                <td>${calificacion.encuentro.mascotaSolicitud.nombre}</td>
            </g:else>
        </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Todavia no tienes calificaciones!</h3>
                <g:link controller="usuario" action="indexUsuario">
                    <button class="btn-info">Volver a la pagina principal</button>
                </g:link>
            </center>
        </div>
    </div>
</g:else>
</body>
</html>