<div class="modal fade test" id="basicModal" tabindex="-1" role="dialog" aria-labelledby="basicModal" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i></button>
                <h3 class="modal-title" id="myModalLabel">Opciones de Postulacion:</h4>
            </div>
            <form>
                <div class="modal-body">
                    <div class="btn-group" data-toggle="buttons">
                        <i class="fa fa-calendar" aria-hidden="true" style="font-size: 20px;"></i>
                        <label class="col-2 col-form-label">Dias Disponibles</label>
                        <br>
                        <label class="btn btn-default" id="l_lunes">
                            L
                            <input type="checkbox" autocomplete="off" onchange="dias('l_lunes', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_martes">
                            M
                            <input type="checkbox" autocomplete="off" onchange="dias('l_martes', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_miercoles">
                            M
                            <input type="checkbox" autocomplete="off" onchange="dias('l_miercoles', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_jueves">
                            J
                            <input type="checkbox" autocomplete="off" onchange="dias('l_jueves', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_viernes">
                            V
                            <input type="checkbox" autocomplete="off" onchange="dias('l_viernes', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_sabado">
                            S
                            <input type="checkbox" autocomplete="off" onchange="dias('l_sabado', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                        <label class="btn btn-default" id="l_domingo">
                            D
                            <input type="checkbox" autocomplete="off" onchange="dias('l_domingo', this)">
                            <span class="glyphicon glyphicon-ok"></span>
                        </label>
                    </div>
                    <br>
                    <div class="form-group" style="padding-top: 10px; padding-bottom: 10px;">
                        <br>
                        <label for="horario" class="cols-sm-2 custom-padding"><i class="fa fa-clock-o" aria-hidden="true" style="font-size: 20px;"></i> Disponibilidad Horaria</label>
                        <div class="cols-sm-10">
                            <div class="input-group" onchange="horario()">
                                <div class="btn-group" id="horario" data-toggle="buttons">
                                    <label class="btn btn-default btn-on btn-sm active">
                                        <input type="radio" value="NO" name="disponible_hora" checked="checked" class="horario_radio_si">SI</label>
                                    <label class="btn btn-default btn-off btn-sm ">
                                        <input type="radio" value="SI" name="disponible_hora" class="horario_radio_no">INDIFERENTE</label>
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
                                    <td><input id="desde" type="time" required></td>
                                    <td><input id="hasta" type="time" required></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div class="form-group" style="padding-top: 10px;">

                        <label for="exampleTextarea"><i class="fa fa-eye" aria-hidden="true" style="font-size: 20px;"></i> Otras Observaciones:</label>
                        <textarea class="form-control" id="exampleTextarea" rows="3"></textarea>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
                    <button type="submit" class="btn btn-primary">Crear Postulacion</button>
                </div>
            </form>
        </div>
    </div>
</div>
<script>
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
</script>