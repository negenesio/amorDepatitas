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
<g:if test="${mascotas}">
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
        <g:each in="${mascotas}" var="mascota">
        <tr class="mascota">
            <td>${mascota.nombre}</td>
            <td>${mascota.sexo}</td>
            <td>${mascota.fechaNacimiento.format('dd/mm/YYYY')}</td>
            <td>${mascota.raza.descripcion}</td>
            <td>
                <g:set var="postulacion_mascota" value="${postulaciones?.find{it?.mascota?.id == mascota.id}}"/>
                <g:if test="${mascota.postulado && postulacion_mascota && postulacion_mascota?.pausa.toString() == 'true'}">
                    <label style="padding-left: 5px">
                        <button id="btn_postulacionUpdate" class="button-selected open-postulacionUpdate" data-balloon="Modificar Postulacion" data-balloon-pos="up" data-toggle="modal" data-target=".postulacion_update" data-id="${mascota.id}" data-pausa="${postulacion_mascota.pausa}" data-observaciones="${postulacion_mascota.observaciones}" data-desde="${postulacion_mascota.desde}" data-dias="${postulacion_mascota.dias}" data-hasta="${postulacion_mascota.hasta}" data-postulacion="true" onclick="validateDias(this);">
                            <i class="fa fa-pause" aria-hidden="true" style="font-size:17px; color: #a7a935"></i>
                        </button>
                    </label>
                </g:if>
                <g:elseif test="${mascota.postulado}">
                    <label style="padding-left: 5px">
                        <button id="btn_postulacionUpdate" class="button-selected open-postulacionUpdate" data-balloon="Modificar Postulacion" data-balloon-pos="up" data-toggle="modal" data-target=".postulacion_update" data-id="${mascota.id}" data-pausa="${postulacion_mascota.pausa}" data-observaciones="${postulacion_mascota.observaciones}" data-desde="${postulacion_mascota.desde}" data-dias="${postulacion_mascota.dias}" data-hasta="${postulacion_mascota.hasta}" data-postulacion="true" onclick="validateDias(this);">
                            <i class="fa fa-arrow-up" aria-hidden="true" style="font-size:17px; color: #268d1c"></i>
                        </button>
                    </label>
                </g:elseif>
                <g:else>
                    <label style="padding-left: 5px">
                        <button id="btn_postulacionUpdate" class="button-selected open-postulacionUpdate" data-balloon="Modificar Postulacion" data-balloon-pos="up" data-toggle="modal" data-target=".postulacion_update" data-id="${mascota?.id}" data-pausa="${postulacion_mascota?.pausa}" data-observaciones="${postulacion_mascota?.observaciones}" data-desde="${postulacion_mascota?.desde}" data-dias="${postulacion_mascota?.dias}" data-hasta="${postulacion_mascota?.hasta}" data-postulacion="false" onclick="validateDias(this);">
                            <i class="fa fa-arrow-up" aria-hidden="true" style="font-size:17px; color: red;"></i>
                        </button>
                    </label>
                </g:else>
                <label style="padding-left: 5px">
                    <g:link controller="mascota" action="update" params="[mascotaId: mascota.id]">
                        <button class="button-selected" data-balloon="Modificar Mascota" data-balloon-pos="up">
                            <i class="fa fa-pencil" aria-hidden="true" style="font-size:17px;" ></i>
                        </button>
                    </g:link>
                </label>
                <label style="padding-left: 5px">
                    <g:link controller="mascota" action="deletedMascota" params="[mascotaId: mascota.id]">
                        <button class="button-selected" data-balloon="Eliminar Mascota" data-balloon-pos="up">
                            <i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i>
                        </button>
                    </g:link>
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
                    <h3 class="title">Para empezar, deberias cargar tu primer mascota!</h3>
                    <g:link controller="mascota" action="createIndex">
                        <button class="btn-info">Registrar Mascota</button>
                    </g:link>
                </center>
        </div>
    </div>
</g:else>
<input type="hidden" id="dias_selected"/>
<script>
    $(document).ready(function() {
        $("#ajax_pausa").hide();
        $("#test_pausa").hide();
    });
    function validateDias(input_data){
        var pausa = $(input_data).data('pausa');
        var desde = $(input_data).data('desde');
        var hasta = $(input_data).data('hasta');
        var dias = $(input_data).data('dias');
        var observaciones = $(input_data).data('observaciones');
        var mascotaIdModal = $(input_data).data('id');
        var postulacionStatus = $(input_data).data('postulacion');
        if(pausa == false){
            $("#pausa_no").click();
        } else {
            $("#pausa_si").click();
        }
        $(".modal-body #pausaModal").val( pausa );
        $(".modal-body #mascotaIdModal").val( mascotaIdModal );
        $(".modal-body #observaciones").val( observaciones );
        $(".modal-body #desde").val( moment(desde).format("HH:mm"));
        $(".modal-body #hasta").val( moment(hasta).format("HH:mm") );
        if(dias){
            $("#dias_selected").val(dias.split(','));
        }
        $(".modal-body #postulacion").val( postulacionStatus );
    }
</script>
<g:render template="/postulacion/modalPostularUpdate"/>
</body>
</html>