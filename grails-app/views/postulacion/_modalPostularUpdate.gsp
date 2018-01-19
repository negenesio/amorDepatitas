<div class="modal fade postulacion_update" id="postulacionUpdate" tabindex="-1" role="dialog" aria-labelledby="postulacionUpdate" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                    <i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i>
                </button>
                <div>
                    <span id="infoModal" data-balloon="Mostrar / Ocultar informacon" data-balloon-pos="right"><i class="fa fa-info-circle" aria-hidden="true" style="font-size:25px; background-color: rgba(66, 70, 69, 0.69); color: yellowgreen"></i></span>

                    <div id="info_descripcionModal" style="font-size:15px;background-color: rgba(66, 70, 69, 0.69); width: auto;" >
                        <center><label style="color: #6bcd3c">En esta seccion podras registrar una nueva Mascota, tambien editar mascotas ya existentes!<br> Ademas podras gestionar las postulaciones de las mismas.!</label></center>
                    </div>
                </div>
                <h4 class="modal-title" id="myModalLabel">Opciones de Postulacion:</h4>
            </div>
            <g:form id="form_postulacion" controller="postulacion" action="postularMascota" method="POST">
                <div class="modal-body">
                    <div class="btn-group" data-toggle="buttons">
                        <input type="hidden" value="" id="userId" name="userId"/>
                        <div>
                            <i class="fa fa-pause" aria-hidden="true"></i>
                            <label>Pausar Publicacion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <div class="btn-group" id="horario" data-toggle="buttons">
                                        <label class="btn btn-default btn-on btn-sm active">
                                            <input id="pausa_si" type="radio" value="true" name="pausar_radio" checked="checked" >PAUSAR</label>
                                        <label class="btn btn-default btn-off btn-sm ">
                                            <input id="pausa_no" type="radio" value="false" name="pausar_radio">POSTULAR</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <br>
                        <i class="fa fa-calendar" aria-hidden="true" style="font-size: 20px;"></i>
                        <label class="col-2 col-form-label">Dias Disponibles</label>
                        <br>
                        <label class="btn btn-default radio-dia" id="l_lunes_update">
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
                        </label>
                    </div>
                    <br>
                    <div class="form-group" style="padding-top: -10px; padding-bottom: 10px;">
                        <br>
                        <label for="horario" class="cols-sm-2 custom-padding"><i class="fa fa-clock-o" aria-hidden="true" style="font-size: 20px;"></i> Disponibilidad Horaria</label>
                        <div class="cols-sm-10">
                            <div class="input-group" onchange="horario()">
                                <div class="btn-group" id="horario" data-toggle="buttons">
                                    <label class="btn btn-default btn-on btn-sm active">
                                        <input type="radio" value="SI" name="disponible_hora" checked="checked" class="horario_radio_si">SI</label>
                                    <label class="btn btn-default btn-off btn-sm ">
                                        <input type="radio" value="NO" name="disponible_hora" class="horario_radio_no">INDIFERENTE</label>
                                </div>
                            </div>
                        </div>
                        <br>
                        <table id="tabla_horario" class="table table-hover-default" style="padding-top: 10px;">
                            <tbody>
                                <tr>
                                    <td>Disponibilidad Desde</td>
                                    <td>Disponibilidad Hasta</td>
                                </tr>
                                <tr>
                                    <td><input name="desde" id="desde" type="time" required onchange="validHorario(this)"></td>
                                    <td><input name="hasta" id="hasta" type="time" required onchange="validHorario(this)"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-group" style="padding-top: 10px;">
                        <label for="observaciones"><i class="fa fa-eye" aria-hidden="true" style="font-size: 20px;"></i> Otras Observaciones:</label>
                        <textarea name="observaciones" class="form-control" id="observaciones" rows="3"></textarea>
                    </div>
                    <input type="hidden" value="" id="mascotaIdModal" name="mascotaIdModal"/>
                    <input type="hidden" value="" id="pausaModal" name="pausaModal"/>
                    <br>
                    <g:if test="${postulacion_mascota}">
                        <div>
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <label>Eliminar Postulacion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <button class="btn-danger" onclick="cancelarPostulacion()">ELIMINAR</button>
                                </div>
                            </div>

                        </div>
                        <br>
                    </g:if>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
                    <button id="submit_postulacion" type="submit" class="btn btn-primary">Guardar Postulacion</button>
                </div>
                <input type="hidden" id="dias_selected" name="dias"/>
                <input type="hidden" id="postulacion"/>
            </g:form>
        </div>
    </div>
</div>
<script>

    $("#submit_postulacion").click(function(){
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

    function cancelarPostulacion(){
        var mascotaId = $("#mascotaIdModal").val();
        <g:remoteFunction method="POST" controller="postulacion" action="cancelarPostularMascota" params="'id=' + mascotaId" ></g:remoteFunction>
    }
    $( document ).ready(function() {
            $("#infoModal").click(function () {
                if($("#info_descripcionModal").is(':visible')){
                    $("#info_descripcionModal").hide();
                } else {
                    $("#info_descripcionModal").show();
                }
            });

        $('#postulacionUpdate').on('hidden.bs.modal', function () {
            $("#l_lunes_update").addClass('btn-default');
            $("#l_lunes_update").removeClass('btn-success');
            $("#l_lunes_update").removeClass('active');
            $("[tag-dia-update='l_lunes_update']").is('checked', false);

            $("#l_martes_update").addClass('btn-default');
            $("#l_martes_update").removeClass('btn-success');
            $("#l_martes_update").removeClass('active');
            $("[tag-dia-update='l_martes_update']").is('checked', false);

            $("#l_miercoles_update").addClass('btn-default');
            $("#l_miercoles_update").removeClass('btn-success');
            $("#l_miercoles_update").removeClass('active');
            $("[tag-dia-update='l_miercoles_update']").is('checked', false);

            $("#l_jueves_update").addClass('btn-default');
            $("#l_jueves_update").removeClass('btn-success');
            $("#l_jueves_update").removeClass('active');
            $("[tag-dia-update='l_jueves_update']").is('checked', false);

            $("#l_viernes_update").addClass('btn-default');
            $("#l_viernes_update").removeClass('btn-success');
            $("#l_viernes_update").removeClass('active');
            $("[tag-dia-update='l_viernes_update']").is('checked', false);

            $("#l_sabado_update").addClass('btn-default');
            $("#l_sabado_update").removeClass('btn-success');
            $("#l_sabado_update").removeClass('active');
            $("[tag-dia-update='l_sabado_update']").is('checked', false);

            $("#l_domingo_update").addClass('btn-default');
            $("#l_domingo_update").removeClass('btn-success');
            $("#l_domingo_update").removeClass('active');
            $("[tag-dia-update='l_domingo_update']").is('checked', false);
        });

        $("#l_lunes_update").change(function(){
            if($("[tag-dia-update='l_lunes_update']").is(":checked")){
                $("#l_lunes_update").addClass('btn-success');
                $("#l_lunes_update").removeClass('btn-default');
            } else {
                $("#l_lunes_update").addClass('btn-default');
                $("#l_lunes_update").removeClass('btn-success');
            }
        });

        $("#l_martes_update").change(function(){
            if($("[tag-dia-update='l_martes_update']").is(":checked")){
                $("#l_martes_update").addClass('btn-success');
                $("#l_martes_update").removeClass('btn-default');
            } else {
                $("#l_martes_update").addClass('btn-default');
                $("#l_martes_update").removeClass('btn-success');
            }
        });

        $("#l_miercoles_update").change(function(){
            if($("[tag-dia-update='l_miercoles_update']").is(":checked")){
                $("#l_miercoles_update").addClass('btn-success');
                $("#l_miercoles_update").removeClass('btn-default');
            } else {
                $("#l_miercoles_update").addClass('btn-default');
                $("#l_miercoles_update").removeClass('btn-success');
            }
        });

        $("#l_jueves_update").change(function(){
            if($("[tag-dia-update='l_jueves_update']").is(":checked")){
                $("#l_jueves_update").addClass('btn-success');
                $("#l_jueves_update").removeClass('btn-default');
            } else {
                $("#l_jueves_update").addClass('btn-default');
                $("#l_jueves_update").removeClass('btn-success');
            }
        });

        $("#l_viernes_update").change(function(){
            if($("[tag-dia-update='l_viernes_update']").is(":checked")){
                $("#l_viernes_update").addClass('btn-success');
                $("#l_viernes_update").removeClass('btn-default');
            } else {
                $("#l_viernes_update").addClass('btn-default');
                $("#l_viernes_update").removeClass('btn-success');
            }
        });

        $("#l_sabado_update").change(function(){
            if($("[tag-dia-update='l_sabado_update']").is(":checked")){
                $("#l_sabado_update").addClass('btn-success');
                $("#l_sabado_update").removeClass('btn-default');
            } else {
                $("#l_sabado_update").addClass('btn-default');
                $("#l_sabado_update").removeClass('btn-success');
            }
        });

        $("#l_domingo_update").change(function(){
            if($("[tag-dia-update='l_domingo_update']").is(":checked")){
                $("#l_domingo_update").addClass('btn-success');
                $("#l_domingo_update").removeClass('btn-default');
            } else {
                $("#l_domingo_update").addClass('btn-default');
                $("#l_domingo_update").removeClass('btn-success');
            }
        });
    });


    $('#postulacionUpdate').on('shown.bs.modal', function (e) {
        var dias = $("#dias_selected").val();
        jQuery.each( dias.split(','), function( i, val ) {
            if(val == 'LUNES'){
                $("#l_lunes_update").click();
                $("#l_lunes_update").addClass('btn-success');
                $("#l_lunes_update").removeClass('btn-default');
            }
            if(val == 'MARTES'){
                $("#l_martes_update").click();
                $("#l_martes_update").addClass('btn-success');
                $("#l_martes_update").removeClass('btn-default');
            }
            if(val == 'MIERCOLES'){
                $("#l_miercoles_update").click();
                $("#l_miercoles_update").addClass('btn-success');
                $("#l_miercoles_update").removeClass('btn-default');
            }
            if(val == 'JUEVES'){
                $("#l_jueves_update").click();
                $("#l_jueves_update").addClass('btn-success');
                $("#l_jueves_update").removeClass('btn-default');
            }
            if(val == 'VIERNES'){
                $("#l_viernes_update").click();
                $("#l_viernes_update").addClass('btn-success');
                $("#l_viernes_update").removeClass('btn-default');
            }
            if(val == 'SABADO'){
                $("#l_sabado_update").click();
                $("#l_sabado_update").addClass('btn-success');
                $("#l_sabado_update").removeClass('btn-default');
            }
            if(val == 'DOMINGO'){
                $("#l_domingo_update").click();
                $("#l_domingo_update").addClass('btn-success');
                $("#l_domingo_update").removeClass('btn-default');
            }
        });
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
</script>