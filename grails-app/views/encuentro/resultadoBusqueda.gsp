<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 25/11/17
  Time: 14:43
--%>

<%@ page import="amordepatitas.Mascota; amordepatitas.Postulacion; amordepatitas.CalificacionEncuentro;" contentType="text/html;charset=UTF-8" %>
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
     .MACHO{
         background: #269abc !important;
     }
    .HEMBRA{
        background: #e4b9b9 !important;
    }
    </style>
</head>
<body>
 <div class="container" id="registrar_mascota" style="padding-top: 0px; padding-bottom: 0px; height: 140px;">
    <div class="row main registrar-mascota">
        <center>
            <h3 class="title">Resultado de la Busqueda!</h3>
        </center>
    </div>
</div>
<g:if test="${mascotaBusqueda}">
    <button id="viewModalButton" class="button-btn_viewDetail button-selected open-modalResultadoBusqueda" data-keyboard="false" data-balloon="Ver Detalle" data-backdrop="static" data-balloon-pos="up" data-toggle="modal" data-target=".modalResultadoBusqueda" data-id="" style="visibility: hidden">
        <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
    </button>
    <g:render template="/encuentro/modalResultadosBusqueda"/>
</g:if>

<script>
    $( document ).ready(function() {
        $( "#viewModalButton" ).click();
    });
</script>
</body>
</html>