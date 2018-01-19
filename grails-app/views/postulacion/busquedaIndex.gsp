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
    <g:javascript src="bootstrap-checkbox.js"/>
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
        <center><label style="color: #6bcd3c">Esta es la seccion de Busqueda y Aplicacion de filtros! <br>Ten en cuenta la raza y el sexo de tu mascota para ser mas eficientes en la busqueda! mucha suerte!!</label></center>
    </div>
</div>
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
                                <g:each in="${razas}" var="raza">
                                    <option value="${raza?.id}">${raza?.descripcion}</option>
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
                           <div class="checkbox checkbox-primary">
                               <input id="lunes" type="checkbox" name="LUNES" class="check_dias">
                               <label for="lunes">
                                   Lunes
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="martes" type="checkbox" name="MARTES" class="check_dias">
                               <label for="martes">
                                   Martes
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="miercoles" type="checkbox" name="MIERCOLES" class="check_dias">
                               <label for="miercoles">
                                   Miercoles
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="jueves" type="checkbox" name="JUEVES" class="check_dias">
                               <label for="jueves">
                                   Jueves
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="viernes" type="checkbox" name="VIERNES" class="check_dias">
                               <label for="viernes">
                                   Viernes
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="sabado" type="checkbox" name="SABADO" class="check_dias">
                               <label for="sabado">
                                   Sabado
                               </label>
                           </div>
                           <div class="checkbox checkbox-primary">
                               <input id="domingo" type="checkbox" name="DOMINGO" class="check_dias">
                               <label for="domingo">
                                   Domingo
                               </label>
                           </div>
                       </div>
                   </div>
                </div>

               <div class="form-group">
                   <label class="col-2 col-form-label">Horarios Disponibles</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-clock-o" aria-hidden="true"></i></span>
                           <input id="check_horario" name="check_horario" type="checkbox" data-reverse>
                       <br>
                           <div class="input-group">
                      <table id="tabla_horario" class="table table-hover-default" style="padding-top: 10px;">
                           <tbody>
                           <tr>
                               <td style="background-color: #fff; color: black;">Disponibilidad Desde</td>
                               <td style="background-color: #fff; color: black;">Disponibilidad Hasta</td>
                           </tr>
                           <tr>
                               <td><input style="color: black" name="desde" id="desde" type="time" onchange="validHorario(this)"></td>
                               <td><input style="color: black" name="hasta" id="hasta" type="time" onchange="validHorario(this)"></td>
                           </tr>
                           </tbody>
                       </table>
                       </div>
                     </div>
                   </div>
                 </div>

               <div class="form-group">
                   <label class="col-2 col-form-label">Rango de Edad</label>
                   <div class="cols-sm-10">
                       <div class="input-group">
                           <span class="input-group-addon"><i class="fa fa-birthday-cake fa" aria-hidden="true"></i></span>
                           <input id="check_edad" name="check_edad" type="checkbox" data-reverse>
                           <script>
                               $('#check_edad').checkboxpicker({
                                   offLabel: 'INDIFERENTE',
                                   onLabel: 'SI'
                               });
                           </script>
                       <br>
                       <div class="input-group">
                           <table id="tabla_edad" class="table table-hover-default" style="padding-top: 10px;">
                               <tbody>
                               <tr>
                                   <td style="background-color: #fff; color: black;">Edad Desde</td>
                                   <td style="background-color: #fff; color: black;">Edad Hasta</td>
                               </tr>
                               <tr>
                                   <td><input style="color: black" name="desde_edad" id="desde_edad" type="number" min="1" max="19" onchange="validEdad(this)"></td>
                                   <td><input style="color: black" name="hasta_edad" id="hasta_edad" type="number" min="2" max="20" onchange="validEdad(this)"></td>
                               </tr>
                               </tbody>
                           </table>
                       </div>
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
    $("#lunes").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#martes").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#miercoles").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#jueves").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#viernes").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#sabado").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#domingo").change(function(){
        if($(this).prop('checked')){
            $(this).addClass('active');
        } else {
            $(this).removeClass('active');
        }
    });

    $("#submit_busqueda").click(function(){
        var lunes = document.getElementById('lunes');
        var martes = document.getElementById('martes');
        var miercoles = document.getElementById('miercoles');
        var jueves = document.getElementById('jueves');
        var viernes = document.getElementById('viernes');
        var sabado = document.getElementById('sabado');
        var domingo = document.getElementById('domingo');
        if($(".check_dias.active").length == 0){
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

    function validEdad(input){
        var desde = $('#desde_edad').val();
        var hasta = $('#hasta_edad').val();

        if(parseInt(desde) < parseInt(hasta)){
            document.getElementById('desde_edad').setCustomValidity('');
            document.getElementById('hasta_edad').setCustomValidity('');
            $("#desde").attr("required", false)
            $("#hasta").attr("required", false)
        } else {
            document.getElementById('desde_edad').setCustomValidity('La edad desde no puede ser mayor al Hasta.');
            document.getElementById('hasta_edad').setCustomValidity('La edad desde no puede ser mayor al Hasta.');
            $("#desde").attr("required", true)
            $("#hasta").attr("required", true)
        }
    }

    $( document ).ready(function() {

        $("#info").click(function () {
            if($("#info_descripcion").is(':visible')){
                $("#info_descripcion").hide();
            } else {
                $("#info_descripcion").show();
            }
        });

        $('#tabla_horario').hide();
        $('#tabla_edad').hide();
        $('#check_horario').checkboxpicker({
            offLabel: 'INDIFERENTE',
            onLabel: 'SI'
        });
        $('#check_horario').on('change', function() {
            if($('#check_horario').prop('checked') == true) {
                $('#tabla_horario').show();
                $(desde).attr("required", true)
                $(hasta).attr("required", true)
                $("#check_horario").val('SI');
            }
            if($('#check_horario').prop('checked') == false) {
                $('#tabla_horario').hide();
                $(desde).attr("required", false)
                $(hasta).attr("required", false)
                $("#check_horario").val('NO');
            }
        });

        $('#tabla_edad').hide();
        $('#check_edad').checkboxpicker({
            offLabel: 'INDIFERENTE',
            onLabel: 'SI'
        });
        $('#check_edad').on('change', function() {
            if($('#check_edad').prop('checked') == true) {
                $('#tabla_edad').show();
                $("#check_edad").val('SI');
                $("#desde_edad").attr("required", true);
                $("#hasta_edad").attr("required", true);
            }
            if($('#check_edad').prop('checked') == false) {
                $('#tabla_edad').hide();
                $("#check_edad").val('NO');
                $("#desde_edad").attr("required", false);
                $("#hasta_edad").attr("required", false);
            }
        });
    });
</script>
</body>
</html>