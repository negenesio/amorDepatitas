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

<g:if test="${misPeticiones}">
    <div class="container" id="registrar_mascota" style="padding-top: 0px; padding-bottom: 0px; height: 140px;">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Mis Peticiones Realizadas!</h3>
            </center>
        </div>
    </div>
    <div><table class="table table-striped mascota">
        <thead>
        <tr class="mascota">
            <th>Mascota Encuentro</th>
            <th>Tu Mascota</th>
            <th>Fecha Creacion</th>
            <th>Fecha Ultima Actualizacion</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody style="overflow-y:scroll;">
        <g:each in="${misPeticiones}" var="encuentro">
            <tr class="mascota">
                <td><label style="padding-left: 5px">
                    <button class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${encuentro.id}" onclick="verDetalle(${encuentro.mascotaSolicitud.id})">
                        <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                    </button>
                </label>${encuentro.mascotaSolicitud.nombre}</td>
                <td><label style="padding-left: 5px">
                    <button class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${encuentro.id}" onclick="verDetalle(${encuentro.mascotaPeticion.id})">
                        <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                    </button>
                </label>${encuentro.mascotaPeticion.nombre}</td>
                <td>${encuentro.fechaCreacion.format('dd/MM/YYYY HH:mm:ss')}</td>
                <td>${encuentro.fechaModificacion.format('dd/MM/YYYY HH:mm:ss')}</td>
                <td>
                    <g:if test="${encuentro.estado == 'pending'}">
                        PENDIENTE
                    </g:if>
                    <g:if test="${encuentro.estado == 'approved'}">
                        APROBADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'cancelled'}">
                        CANCELADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'finished'}">
                        FINALIZADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'confirm'}">
                        CONFIRMADO
                    </g:if>
                </td>
                <td>
                    <g:if test="${encuentro.estado == 'pending'}">
                        %{--<label style="padding-left: 5px">
                            <button style="color: #da4f49" class="button-btn_concretarEncuentro" class="button-selected open-concretarEncuentro" data-balloon="Realizar Encuentro" data-balloon-pos="up" data-toggle="modal" data-target=".concretarEncuentro" onclick="detalleAprobarEncuentro(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id})">
                                <i class="fa" aria-hidden="true" style="font-size:17px;"><img src="../images/icons/corazon.png"/></i>
                            </button>
                        </label>--}%
                        <label style="padding-left: 5px">
                            <button style="color: #da4f49" class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Cancelar Encuentro" data-balloon-pos="up" onclick="cancelarEncuentro(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id});">
                                <i class="fa fa-minus-circle" aria-hidden="true"  style="font-size:17px;"></i>
                            </button>
                        </label>
                    </g:if>
                    <g:if test="${encuentro.estado == 'approved'}">
                        <label style="padding-left: 5px">
                            <button style="color: #4aa466" class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Abrir Contacto" data-balloon-pos="up"  data-toggle="modal" data-target=".abrirChat" onclick="abrirChat(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id});">
                                <i class="fa fa-comments" aria-hidden="true"></i>
                            </button>
                        </label>

                    </g:if>

                    <g:if test="${encuentro.estado == 'confirm'}">
                        <g:if test="${CalificacionEncuentro.findByEncuentro(encuentro).creador.id.toString() != sec.loggedInUserInfo(field:'id').toString()}">
                            <label style="padding-left: 5px">
                                <button style="color: #4aa466" class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Cargar Calificacion" data-balloon-pos="up"  data-toggle="modal" data-target=".abrirChat" onclick="abrirChat(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id}, 'confirm');">
                                    <i class="fa fa-check-circle-o"" aria-hidden="true"></i>
                                </button>
                            </label>
                        </g:if>
                    </g:if>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table></div>
</g:if>
<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Aun no has realizado ninguna peticion de encuentro!</h3>
            </center>
        </div>
    </div>
</g:else>

<g:if test="${misSolicitudes}">
    <div class="container" id="registrar_mascota" style="padding-top: 0px; padding-bottom: 0px; height: 140px;">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Has Recibido las siguientes Solicitudes!</h3>
            </center>
        </div>
    </div>
    <div><table class="table table-striped mascota">
        <thead>
        <tr class="mascota">
            <th>Tu Mascota</th>
            <th>Mascota Encuentro</th>
            <th>Fecha Creacion</th>
            <th>Fecha Ultima Actualizacion</th>
            <th>Estado</th>
            <th>Acciones</th>
        </tr>
        </thead>
        <tbody style="overflow-y:scroll;">
        <g:each in="${misSolicitudes}" var="encuentro">
            <tr class="mascota">
                <td><label style="padding-left: 5px">
                    <button class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${encuentro.id}" onclick="verDetalle(${encuentro.mascotaSolicitud.id})">
                        <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                    </button>
                </label>${encuentro.mascotaSolicitud.nombre}</td>
                <td><label style="padding-left: 5px">
                    <button class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Ver Detalle" data-balloon-pos="up" data-toggle="modal" data-target=".viewDetail" data-id="${encuentro.id}" onclick="verDetalle(${encuentro.mascotaPeticion.id})">
                        <i class="fa fa-eye" aria-hidden="true" style="font-size:17px;"></i>
                    </button>
                </label>${encuentro.mascotaPeticion.nombre}</td>
                <td>${encuentro.fechaCreacion.format('dd/MM/YYYY HH:mm:ss')}</td>
                <td>${encuentro.fechaModificacion.format('dd/MM/YYYY HH:mm:ss')}</td>
                <td>
                    <g:if test="${encuentro.estado == 'pending'}">
                        PENDIENTE
                    </g:if>
                    <g:if test="${encuentro.estado == 'approved'}">
                        APROBADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'cancelled'}">
                        CANCELADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'finished'}">
                        FINALIZADO
                    </g:if>
                    <g:if test="${encuentro.estado == 'confirm'}">
                        CONFIRMADO
                    </g:if>

                </td>
                <td>
                    <g:if test="${encuentro.estado == 'pending'}">
                        <g:if test="${direccion?.id}">
                            <label style="padding-left: 5px">
                                <button style="color: #da4f49" class="button-btn_concretarEncuentro" class="button-selected open-concretarEncuentro" data-balloon="Realizar Encuentro" data-balloon-pos="up" data-toggle="modal" data-target=".concretarEncuentro" onclick="detalleAprobarEncuentro(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id})">
                                    <i class="fa" aria-hidden="true" style="font-size:17px;"><img src="../images/icons/corazon.png"/></i>
                                </button>
                            </label>
                        </g:if>
                        <g:else>
                            <label style="padding-left: 5px">
                                <button style="color: #da4f49" class="button-btn_direccionVerificar" class="button-selected open-direccionVerificar" data-balloon="Realizar Encuentro" data-balloon-pos="up" data-toggle="modal" data-target=".direccionVerificar">
                                    <i class="fa" aria-hidden="true" style="font-size:17px;"><img src="../images/icons/corazon.png"/></i>
                                </button>
                            </label>
                        </g:else>
                        <label style="padding-left: 5px">
                            <button style="color: #da4f49" class="button-btn_concretarEncuentro" class="button-selected open-concretarEncuentro" data-balloon="Cancelar Encuentro" data-balloon-pos="up" onclick="cancelarEncuentro(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id});">
                                <i class="fa fa-minus-circle" aria-hidden="true"  style="font-size:17px;"></i>
                            </button>
                        </label>
                    </g:if>
                    <g:if test="${encuentro.estado == 'approved'}">
                        <label style="padding-left: 5px">
                            <button style="color: #4aa466" class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Abrir Contacto" data-balloon-pos="up" data-toggle="modal" data-target=".abrirChat" onclick="abrirChat(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id});">
                                <i class="fa fa-comments" aria-hidden="true"></i>
                            </button>
                        </label>
                    </g:if>
                    <g:if test="${encuentro.estado == 'confirm'}">
                        <g:if test="${CalificacionEncuentro.findByEncuentro(encuentro).creador.id.toString() != sec.loggedInUserInfo(field:'id').toString()}">
                            <label style="padding-left: 5px">
                                <button style="color: #4aa466" class="button-btn_viewDetail" class="button-selected open-viewDetail" data-balloon="Cargar Calificacion" data-balloon-pos="up"  data-toggle="modal" data-target=".abrirChat" onclick="abrirChat(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id}, 'confirm');">
                                    <i class="fa fa-check-circle-o" aria-hidden="true"></i>
                                </button>
                            </label>
                        </g:if>
                    </g:if>
                    <label style="padding-left: 5px">
                        <button id="modalEncuentro" style="color: #da4f49; visibility: hidden" class="button-btn_concretarEncuentro" class="button-selected open-concretarEncuentro" data-balloon="Realizar Encuentro" data-balloon-pos="up" data-toggle="modal" data-target=".concretarEncuentro" onclick="detalleAprobarEncuentro(${encuentro.mascotaSolicitud.id}, ${encuentro.mascotaPeticion.id})">
                            <i class="fa" aria-hidden="true" style="font-size:17px;"><img src="../images/icons/corazon.png"/></i>
                        </button>
                    </label>
                </td>
            </tr>
        </g:each>
        </tbody>
    </table></div>
</g:if>
%{--<g:else>
    <div class="container" id="registrar_mascota">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title">Aun no has sido solicitado por nadie!., Prueba flexibilizando la confiuraciones de postulacion!</h3>
            </center>
        </div>
    </div>
</g:else>--}%

<g:render template="/direccion/direccionDatos"/>
<g:render template="/mensajeria/chatIndex"/>
<g:render template="/encuentro/verDetalleEncuentro"/>
<g:render template="/encuentro/concretarEncuentro"/>
<script>
    $( document ).ready(function() {
        $("#cancelar").click(function () {
            window.location.reload(true);
        });
    });

    function cancelarEncuentro(solicitud, peticion){
        jQuery.ajax(
            {
                type:'POST',
                data:'solicitud=' + solicitud +'&peticion='+peticion,
                url:'/amorDePatitas/encuentro/encuentroCancelar',
                success:function(data,textStatus)
                {
                    window.location.href = "/amorDePatitas/encuentro/encuentroIndex";
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });
    }

    function detalleAprobarEncuentro(solicitud, peticion){
        jQuery.ajax(
            {
                type:'POST',
                data:'solicitud=' + solicitud +'&peticion='+peticion,
                url:'/amorDePatitas/encuentro/detalleAprobarEncuentro',
                success:function(data,textStatus)
                {
                    jQuery('#encuentroDatos').html(data);
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });
    }
    function verDetalle(mascotaId){
        jQuery.ajax(
            {
                type:'GET',
                data:'mascotaId=' + mascotaId,
                url:'/amorDePatitas/mascota/vistaPrevia',
                success:function(data,textStatus)
                {
                    jQuery('#verDetalle').html(data);
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });
    }

    function abrirChat(solicitud, peticion, confirm) {
        mensajes(solicitud, peticion, confirm);
    }


</script>
</body>
</html>