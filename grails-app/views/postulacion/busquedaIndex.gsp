<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>
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
    <div class="container" id="registrar_mascota" style="height: 120px">
        <div class="row main registrar-mascota">
            <center>
                <h3 class="title" style="padding-top: 15px">Configuracion de busqueda para el encuentro perfecto! </h3>
            </center>
        </div>
    </div>
<div class="container" style="width: 80%;">
    <div class="row main">
        <div class="main-login main-center" style="height: auto; width: auto; padding-left: 10px;padding-right: 10px;">
            <g:form name="form_busqueda" action="busquedaFiltros" controller="postulacion" method="POST" >

                <div class="form-group">
                    <label for="raza" class="cols-sm-2">Raza</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><img src="../images/icons/icon-dog.png"/></span>
                            <select id="raza" name="raza" class="form-control selectpicker" title="Seleccione la Raza" data-live-search="true" style="background-color: #ccc;overflow-x: hidden; overflow-y: scroll;" required>
                                <g:each in="${amordepatitas.Raza.list()}">
                                    <option value="${it?.id}">${it?.descripcion}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="sexo" class="cols-sm-2 custom-padding">Sexo Mascota</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                            <div class="btn-group" id="sexo" data-toggle="buttons">
                                <label class="btn btn-default btn-on btn-sm active">
                                    <input type="radio" value="MACHO" name="sexo_mascota" checked="checked">MACHO</label>
                                <label class="btn btn-default btn-off btn-sm ">
                                    <input type="radio" value="HEMBRA" name="sexo_mascota">HEMBRA</label>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-2 col-form-label">Dias Disponibles</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-calendar" aria-hidden="true"></i></span>
                            <center><label class="btn btn-default radio-dia" id="l_lunes_update">
                                L
                                <input tag-dia-update="l_lunes_update" id="dias_check" name="LUNES" type="checkbox" class="check_input lunes">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_martes_update">
                                M
                                <input tag-dia-update="l_martes_update" id="dias_check" name="MARTES" type="checkbox" class="check_input martes">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_miercoles_update">
                                M
                                <input tag-dia-update="l_miercoles_update" id="dias_check" name="MIERCOLES" type="checkbox" class="check_input miercoles">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_jueves_update">
                                J
                                <input tag-dia-update="l_jueves_update" id="dias_check" name="JUEVES" type="checkbox" class="check_input jueves">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_viernes_update">
                                V
                                <input tag-dia-update="l_viernes_update" id="dias_check" name="VIERNES" type="checkbox" class="check_input viernes">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_sabado_update">
                                S
                                <input tag-dia-update="l_sabado_update" id="dias_check" name="SABADO" type="checkbox"  class="check_input sabado">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label>
                            <label class="btn btn-default radio-dia" id="l_domingo_update">
                                D
                                <input tag-dia-update="l_domingo_update" id="dias_check" name="DOMINGO" type="checkbox" class="check_input domingo">
                                <span class="glyphicon glyphicon-ok"></span>
                            </label></center>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-2 col-form-label">Horarios Disponibles</label>
                    <div class="cols-sm-10">
                        <div class="input-group" onchange="horario()">
                            <span class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                            <div class="btn-group" id="horario" data-toggle="buttons">
                                <label class="btn btn-default btn-on btn-sm active">
                                    <input type="radio" value="SI" name="disponible_hora" checked="checked" class="horario_radio_si">SI</label>
                                <label class="btn btn-default btn-off btn-sm ">
                                    <input type="radio" value="NO" name="disponible_hora" class="horario_radio_no">INDIFERENTE</label>
                            </div>

                        <br>
                        <center><div class="input-group">
                       <table id="tabla_horario" class="table table-hover-default" style="padding-top: 10px;">
                            <tbody>
                            <tr>
                                <td style="background-color: #fff; color: black;">Disponibilidad Desde</td>
                                <td style="background-color: #fff; color: black;">Disponibilidad Hasta</td>
                            </tr>
                            <tr>
                                <td><input style="color: black" input name="desde" id="desde" type="time" required onchange="validHorario(this)"></td>
                                <td><input style="color: black" name="hasta" id="hasta" type="time" required onchange="validHorario(this)"></td>
                            </tr>
                            </tbody>
                        </table>
                        </div></center>
                      </div>
                    </div>
                  </div>

                <div class="form-group">
                    <label class="col-2 col-form-label">Rango de Edad</label>
                    <div class="cols-sm-10">
                        <div class="input-group" onchange="edad()">
                            <span class="input-group-addon"><i class="fa fa-birthday-cake fa" aria-hidden="true"></i></span>
                            <div class="btn-group" id="edad" data-toggle="buttons">
                                <label class="btn btn-default btn-on btn-sm active">
                                    <input type="radio" value="SI" name="disponible_edad" checked="checked" class="edad_radio_si">SI</label>
                                <label class="btn btn-default btn-off btn-sm ">
                                    <input type="radio" value="NO" name="disponible_edad" class="edad_radio_no">INDIFERENTE</label>
                            </div>
                        <br>
                        <center><div class="input-group">
                            <table id="tabla_edad" class="table table-hover-default" style="padding-top: 10px;">
                                <tbody>
                                <tr>
                                    <td style="background-color: #fff; color: black;">Edad Desde</td>
                                    <td style="background-color: #fff; color: black;">Edad Hasta</td>
                                </tr>
                                <tr>
                                    <td><input style="color: black" input name="desde_edad" id="desde_edad" type="number" required onchange="validEdad(this)"></td>
                                    <td><input style="color: black" name="hasta_edad" id="hasta_edad" type="number" required onchange="validEdad(this)"></td>
                                </tr>
                                </tbody>
                            </table>
                        </div></center>
                        </div>
                    </div>
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-info btn-block login" id="submit_busqueda" value="Realizar Busqueda"/>
                </div>
                </div>
            </g:form>
        </div>
    </div>
</div>
<script>
    $("#submit_busqueda").click(function(){
        var lunes = document.querySelector("input[tag-dia-update='l_lunes_update']");
        var martes = document.querySelector("input[tag-dia-update='l_martes_update']");
        var miercoles = document.querySelector("input[tag-dia-update='l_miercoles_update']");
        var jueves = document.querySelector("input[tag-dia-update='l_jueves_update']");
        var viernes = document.querySelector("input[tag-dia-update='l_viernes_update']");
        var sabado = document.querySelector("input[tag-dia-update='l_sabado_update']");
        var domingo = document.querySelector("input[tag-dia-update='l_domingo_update']");
        if($(".radio-dia.active").length == 0){

            lunes.setCustomValidity('Seleccione al menos 1 dia.');
            lunes.reportValidity();

            martes.setCustomValidity('Seleccione al menos 1 dia.');
            martes.reportValidity();

            miercoles.setCustomValidity('Seleccione al menos 1 dia.');
            miercoles.reportValidity();

            jueves.setCustomValidity('Seleccione al menos 1 dia.');
            jueves.reportValidity();

            viernes.setCustomValidity('Seleccione al menos 1 dia.');
            viernes.reportValidity();

            sabado.setCustomValidity('Seleccione al menos 1 dia.');
            sabado.reportValidity();

            domingo.setCustomValidity('Seleccione al menos 1 dia.');
            domingo.reportValidity();


        } else {
            lunes.setCustomValidity('');
            martes.setCustomValidity('');
            miercoles.setCustomValidity('');
            jueves.setCustomValidity('');
            viernes.setCustomValidity('');
            sabado.setCustomValidity('');
            domingo.setCustomValidity('');
        }

    });

    $("#l_lunes_update").change(function(){
        if($("[tag-dia-update='l_lunes_update']").is(":checked")){
            $("#l_lunes_update").addClass('btn-success');
            $("#l_lunes_update").addClass('active');
            $("#l_lunes_update").removeClass('btn-default');
        } else {
            $("#l_lunes_update").addClass('btn-default');
            $("#l_lunes_update").removeClass('active');
            $("#l_lunes_update").removeClass('btn-success');
        }
    });

    $("#l_martes_update").change(function(){
        if($("[tag-dia-update='l_martes_update']").is(":checked")){
            $("#l_martes_update").addClass('btn-success');
            $("#l_martes_update").addClass('active');
            $("#l_martes_update").removeClass('btn-default');
        } else {
            $("#l_martes_update").addClass('btn-default');
            $("#l_martes_update").removeClass('active');
            $("#l_martes_update").removeClass('btn-success');
        }
    });

    $("#l_miercoles_update").change(function(){
        if($("[tag-dia-update='l_miercoles_update']").is(":checked")){
            $("#l_miercoles_update").addClass('btn-success');
            $("#l_miercoles_update").addClass('active');
            $("#l_miercoles_update").removeClass('btn-default');
        } else {
            $("#l_miercoles_update").addClass('btn-default');
            $("#l_miercoles_update").removeClass('active');
            $("#l_miercoles_update").removeClass('btn-success');
        }
    });

    $("#l_jueves_update").change(function(){
        if($("[tag-dia-update='l_jueves_update']").is(":checked")){
            $("#l_jueves_update").addClass('btn-success');
            $("#l_jueves_update").addClass('active');
            $("#l_jueves_update").removeClass('btn-default');
        } else {
            $("#l_jueves_update").addClass('btn-default');
            $("#l_jueves_update").removeClass('active');
            $("#l_jueves_update").removeClass('btn-success');
        }
    });

    $("#l_viernes_update").change(function(){
        if($("[tag-dia-update='l_viernes_update']").is(":checked")){
            $("#l_viernes_update").addClass('btn-success');
            $("#l_viernes_update").addClass('active');
            $("#l_viernes_update").removeClass('btn-default');
        } else {
            $("#l_viernes_update").addClass('btn-default');
            $("#l_viernes_update").removeClass('active');
            $("#l_viernes_update").removeClass('btn-success');
        }
    });

    $("#l_sabado_update").change(function(){
        if($("[tag-dia-update='l_sabado_update']").is(":checked")){
            $("#l_sabado_update").addClass('btn-success');
            $("#l_sabado_update").addClass('active');
            $("#l_sabado_update").removeClass('btn-default');
        } else {
            $("#l_sabado_update").addClass('btn-default');
            $("#l_sabado_update").removeClass('active');
            $("#l_sabado_update").removeClass('btn-success');
        }
    });

    $("#l_domingo_update").change(function(){
        if($("[tag-dia-update='l_domingo_update']").is(":checked")){
            $("#l_domingo_update").addClass('btn-success');
            $("#l_domingo_update").addClass('active');
            $("#l_domingo_update").removeClass('btn-default');
        } else {
            $("#l_domingo_update").addClass('btn-default');
            $("#l_domingo_update").removeClass('active');
            $("#l_domingo_update").removeClass('btn-success');
        }
    });

    function horario(){
        if($(".horario_radio_no").is(":checked")){
            $("#tabla_horario").hide();
            $("#desde").attr("required", false)
            $("#hasta").attr("required", false)
        } else {
            $("#tabla_horario").show();
            $("#desde").attr("required", true)
            $("#hasta").attr("required", true)
        }
    }

    function validHorario(input){
        var hasta = parseFloat($("#hasta").val().replace(':','.'));
        var desde = parseFloat($("#desde").val().replace(':','.'));
        var hasta_input = document.getElementById("hasta");
        var desde_input = document.getElementById("desde");

        if(desde >= hasta) {
            input.setCustomValidity('El horario Desde no debe ser menor al Hasta ');
            input.reportValidity()
        } else {
            hasta_input.setCustomValidity('');
            desde_input.setCustomValidity('');
        }
    }


    function edad(){
        if($(".edad_radio_no").is(":checked")){
            $("#tabla_edad").hide();
            $("#desde_edad").attr("required", false)
            $("#hasta_edad").attr("required", false)
        } else {
            $("#tabla_edad").show();
            $("#desde_edad").attr("required", true)
            $("#hasta_edad").attr("required", true)
        }
    }

    function validEdad(input){
        var hasta = $("#hasta_edad").val();
        var desde = $("#desde_edad").val();
        var hasta_input = document.getElementById("hasta_edad");
        var desde_input = document.getElementById("desde_edad");

        if(desde >= hasta) {
            input.setCustomValidity('El horario Desde no debe ser menor al Hasta ');
            input.reportValidity()
        } else {
            hasta_input.setCustomValidity('');
            desde_input.setCustomValidity('');
        }
    }
</script>
</body>
</html>