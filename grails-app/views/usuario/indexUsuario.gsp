<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page import="amordepatitas.Mascota;" contentType="text/html;charset=UTF-8" %>
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
<div>
    <span id="info" data-balloon="Mostrar / Ocultar informacon" data-balloon-pos="right"><i class="fa fa-info-circle" aria-hidden="true" style="font-size:25px; background-color: rgba(66, 70, 69, 0.69); color: yellowgreen"></i></span>

    <div id="info_descripcion" style="font-size:15px;background-color: rgba(66, 70, 69, 0.69); width: auto;" >
        <center><label style="color: #6bcd3c">En esta seccion podras registrar una nueva Mascota, tambien editar mascotas ya existentes!</label></center>
    </div>
</div>
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
                <label style="padding-left: 5px">
                    <label style="padding-left: 5px">
                        <button class="button-selected" data-balloon="Buscar Pareja" data-balloon-pos="up">
                            <i><g:link controller="encuentro" action="buscarEncuentro" params="[mascotaId: mascota.id]"><asset:image src="mascotas/searchLove.png" width="26" height="26"/></g:link></i>
                        </button>
                    </label>
                    <g:link controller="mascota" action="update" params="[mascotaId: mascota.id]">
                        <button class="button-selected" data-balloon="Modificar Mascota" data-balloon-pos="up">
                            <i class="fa fa-pencil" aria-hidden="true" style="font-size:17px;" ></i>
                        </button>
                    </g:link>
                </label>
                <label style="padding-left: 5px">
                    <button class="button-selected" data-balloon="Eliminar Mascota" data-balloon-pos="up" onclick="eliminarMascota(${mascota.id});">
                        <i class="fa fa-times" aria-hidden="true" style="font-size:17px; color: red"></i>
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
                <h3 class="title">Para empezar, deberias cargar tu primer mascota!</h3>
                <g:link controller="mascota" action="createIndex">
                    <button class="btn-info"><asset:image src="mascotas/patitas.png" width="26" height="26"/>Registrar Mascota</button>
                </g:link>
            </center>

        </div>
    </div>
</g:else>
<input type="hidden" id="dias_selected"/>
<script>
    function eliminarMascota(mascotaId){
        var result = confirm("Estas Seguro que desea eliminar la Mascota Seleccionada?")
           if(result == true){
               jQuery.ajax(
                   {
                       type:'POST',
                       data: 'mascotaId=' + mascotaId,
                       url:'/amorDePatitas/mascota/deletedMascota',
                       success:function(data,textStatus)
                       {
                           window.location.reload(true);
                       }
                   });
           }

    }
    $(document).ready(function() {


        $("#ajax_pausa").hide();
        $("#test_pausa").hide();

        $("#info").click(function () {
            if($("#info_descripcion").is(':visible')){
                $("#info_descripcion").hide();
            } else {
                $("#info_descripcion").show();
            }
        });
    });

</script>

</body>
</html>