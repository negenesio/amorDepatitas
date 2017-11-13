<div class="modal fade postulacion_cancelar" id="postulacionCancelar" tabindex="-1" role="dialog" aria-labelledby="postulacionCancelar" aria-hidden="true" data-backdrop="static">

    <div class="modal-dialog modal-sm" style="width: 500px">
        <div class="modal-content">
            <g:form mapping="upload_postulacion_pausa">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true"><i class="fa fa-times" aria-hidden="true" style="font-size:17px;"></i></button>
                    <h4 class="modal-title" id="myModalLabel">Opciones de Cancelacion:</h4>
                </div>
                    <div class="modal-body">
                        <input type="hidden" value="" id="mascotaIdModal" name="mascotaIdModal"/>
                        <input type="hidden" value="" id="userId" name="userId"/>
                        <div>
                            <i class="fa fa-pause" aria-hidden="true"></i>
                            <label>Pausar Publicacion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <div class="btn-group" id="horario" data-toggle="buttons">
                                        <label class="btn btn-default btn-on btn-sm active">
                                        <input id="pausa_si" type="radio" value="SI" name="pausar_si" checked="checked" class="pausar_si" onclick="setPausa(this)" onchange="setPausa(this)">PAUSAR</label>
                                        <label class="btn btn-default btn-off btn-sm ">
                                        <input id="pausa_no" type="radio" value="NO" name="pausar_no" class="pausar_no" onclick="setPausa(this)" onchange="setPausa(this)">POSTULAR</label>
                                    </div>
                                </div>
                            </div>
                        </div>
                            <br>
                        <div>
                            <i class="fa fa-times" aria-hidden="true"></i>
                            <label>Eliminar Postulacion</label>
                            <div class="cols-sm-10">
                                <div class="input-group">
                                    <g:link controller="postulacion" action="cancelarPostularMascota" params="${}"><button class="btn-danger">ELIMINAR</button></g:link>
                                </div>
                            </div>

                        </div>
                    </div>
                <div class="modal-footer">
                    <div id="ajax_pausa"></div>
                    <button id="postulacion_pausa_guardar" type="submit" class="btn btn-default" data-dismiss="modal">Guardar</button>
                </div>
            </g:form>
        </div>
    </div>
</div>
<script>
    function setPausa (input){
        if(input.value == 'NO'){
            $("#ajax_pausa").text('false');
        } else {
            $("#ajax_pausa").text('true');
        }
    }

</script>