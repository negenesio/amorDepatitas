<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page import="amordepatitas.Mascota; amordepatitas.Postulacion; amordepatitas.Raza" contentType="text/html;charset=UTF-8" %>
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
    <div><table class="table table-striped mascota">
        <thead>
        <tr class="mascota">
            <th>Nombre Mascota</th>
            <th style="width: 100px">Dias Disponible</th>
            <th>Raza</th>
            <th>Sexo</th>
            <th>Hora Disponible Desde</th>
            <th>Hora Disponible Hasta</th>
            <th>Edad</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody style="overflow-y:scroll;">
        <g:each in="${postulaciones}" var="postulacion">
            <tr class="mascota">
                <td>${postulacion.mascota.nombre}</td>
                <g:if test="${postulacion.dias == 'LUNES,MARTES,MIERCOLES,JUEVES,VIERNES,SABADO,DOMINGO'}">
                    <td>SEMANA COMPLETA</td>
                </g:if>
                <g:else>
                    <td>${postulacion.dias.replace("LUNES","LU").replace("MARTES","MAR").replace("MIERCOLES","MIER").replace("JUEVES","JUE").replace("VIERNES","VIER").replace("SABADO","SAB").replace("DOMINGO","DOM")}</td>
                </g:else>
                <td>${postulacion.mascota.raza.descripcion}</td>
                <td>${postulacion.mascota.sexo}</td>
                <td>${postulacion.desde.format('HH:mm')}</td>
                <td>${postulacion.hasta.format('HH:mm')}</td>
                <td>${new Date().format('YYYY').toInteger() - postulacion.mascota.fechaNacimiento.format('YYYY').toInteger()}</td>
                <td>
                    <g:if test="${direccion?.id}">
                        <button id="viewModalButton" class="button-btn_viewDetail button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${postulacion}" onclick="setModal(${postulacion.id}, ${postulacion.mascota.id}, '${postulacion.mascota.sexo}')">
                            <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                        </button>
                    </g:if>
                    <g:else>
                        <label style="padding-left: 5px">
                            <button class="button-btn_direccionVerificar" class="button-selected open-direccionVerificar" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".direccionVerificar" data-id="${postulacion}">
                                <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                            </button>
                        </label>
                    </g:else>
                </td>
            </tr>

            <button id="viewModalButton" style="visibility: hidden" class="button-btn_viewDetail button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${postulacion}" onclick="setModal(${postulacion.id}, ${postulacion.mascota.id}, '${postulacion.mascota.sexo}')">
                <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
            </button>
        </g:each>
        </tbody>
    </table></div>
</g:if>
<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Sin resultados para tu seleccion!</h3>
                <g:link mapping="buscar_postulacion"><button class="btn-info">Realizar Nueva Busqueda</button></g:link>
            </center>
        </div>
    </div>
</g:else>
<g:render template="/direccion/direccionDatos"/>
<g:render template="/postulacion/detalle"/>
<div id="notificaciones"></div>
<script>
    function setModal(postulacionId, mascotaId, sexoMascota){

        $(".modal-body #postulacionModal").val(postulacionId);
        $(".modal-body #mascotaIdModal").val(mascotaId);
        $(".modal-body #sexoMascotaModal").val(sexoMascota);

        jQuery.ajax(
            {
                type:'GET',
                data:'postulacionId=' + postulacionId,
                url:'/amorDePatitas/postulacion/getMascotasTablaDetail',
                success:function(data,textStatus)
                {
                    jQuery('#tablaMascotasDetail').html(data);
                    $("#btn_enviarEncuentro").attr('style','visibility: hidden');
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });

        jQuery.ajax(
            {
                type:'GET',
                data:'mascotaId=' + mascotaId,
                url:'/amorDePatitas/direccion/index',
                success:function(data,textStatus)
                {
                    jQuery('#direccion').html(data);
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });

    }
</script>
</body>
</html>