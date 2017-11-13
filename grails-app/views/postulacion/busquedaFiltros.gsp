<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page import="amordepatitas.Mascota; amordepatitas.Postulacion" contentType="text/html;charset=UTF-8" %>
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
<g:if test="${postulaciones}">
    <table class="table table-striped mascota">
        <thead>
        <tr class="mascota">
            <th>Nombre</th>
            <th>Sexo</th>
            <th>Fecha Nacimiento</th>
            <th>Raza</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <g:each in="${postulaciones}" var="postulacion">
            <tr class="mascota">
                <td>${postulacion.mascota.nombre}</td>
                <td>${postulacion.dias}</td>
                <td>${postulacion.desde}</td>
                <td>${postulacion.hasta}</td>
                <td>${postulacion.mascota.raza.descripcion}</td>
                <td>
                <label style="padding-left: 5px">
                    <button class="button-selected" data-balloon="Eliminar Mascota" data-balloon-pos="up">
                        <i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i>
                    </button>
                </label>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table>
</g:if>
<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Sin resultados para tu seleccion!</h3>
            </center>
        </div>
    </div>
</g:else>
</body>
</html>