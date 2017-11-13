<div class="modal fade postulacion_crear" id="postulacionCrear" tabindex="-1" role="dialog" aria-labelledby="postulacionCrear" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i></button>
                <h4 class="modal-title" id="myModalLabel">Opciones de Postulacion:</h4>
            </div>
            <g:form id="form_postulacion" controller="postulacion" action="postularMascota" method="POST">
                <div class="modal-body">
                    <div class="btn-group" data-toggle="buttons">
                        <i class="fa fa-calendar" aria-hidden="true" style="font-size: 20px;"></i>
                        <label class="col-2 col-form-label">Dias Disponibles</label>
                        <br>
                        <label class="btn btn-default" id="l_lunes">
                            L
                            <input tag-dia="l_lunes" id="dias_check" name="LUNES" type="checkbox" onchange="dias('l_lunes', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_martes">
                            M
                            <input tag-dia="l_martes" id="dias_check" name="MARTES" type="checkbox" onchange="dias('l_martes', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_miercoles">
                            M
                            <input tag-dia="l_miercoles" id="dias_check" name="MIERCOLES" type="checkbox" onchange="dias('l_miercoles', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_jueves">
                            J
                            <input tag-dia="l_jueves" id="dias_check" name="JUEVES" type="checkbox" onchange="dias('l_jueves', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_viernes">
                            V
                            <input tag-dia="l_viernes" id="dias_check" name="VIERNES" type="checkbox" onchange="dias('l_viernes', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_sabado">
                            S
                            <input tag-dia="l_sabado" id="dias_check" name="SABADO" type="checkbox" onchange="dias('l_sabado', this), validateCheck();" class="check_input">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_domingo">
                            D
                            <input tag-dia="l_domingo" id="dias_check" name="DOMINGO" type="checkbox" onchange="dias('l_domingo', this), validateCheck();" class="check_input">
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

                        <label for="exampleTextarea"><i class="fa fa-eye" aria-hidden="true" style="font-size: 20px;"></i> Otras Observaciones:</label>
                        <textarea name="observaciones" class="form-control" id="exampleTextarea" rows="3"></textarea>
                    </div>
                    <input type="hidden" value="" id="mascotaIdModal" name="mascotaIdModal"/>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
                    <button id="submit_postulacion" type="submit" class="btn btn-primary">Crear Postulacion</button>
                </div>
                %{--<input type="hidden" value="${mascota.id}" name="mascotaId"/>--}%
            </g:form>
        </div>
    </div>
</div>
<script>

    function validateCheck(){
        var list = $(".check_input");
        var cant_false = 0
        for (i=0; i<list.size(); i++) {
            if(list[i].checked == false){
                cant_false++;
            }
            if(cant_false == 7){
                for (b=0; b<list.size(); b++) {
                    var input = $(list[b]).attr("tag-dia");
                    $("#"+input).addClass("btn-danger");
                    $(list[b]).attr("required", true)
                    list[b].setCustomValidity('Seleccione al menos 1 dia.');
                }
            } else {
                for (b=0; b<list.size(); b++) {
                    var input = $(list[b]).attr("tag-dia");
                    $("#"+input).removeClass("btn-danger");
                    $(list[b]).attr("required", false)
                    list[b].setCustomValidity('');
                }
            }
        }

        return false
    }
    $("#submit_postulacion").click(function(){
        validateCheck();
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

    function dias(id_dia, check){
        if($(check).is(":checked")){
            $("#"+id_dia).removeClass("btn-default");
            $("#"+id_dia).addClass("btn-success");
        } else {
            $("#"+id_dia).addClass("btn-default");
            $("#"+id_dia).removeClass("btn-success");
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

    $(document).ready(function() {
        $("#dias_mensaje").hide();
    });

</script>