
<div class="modal fade concretarEncuentro" id="concretarEncuentro" tabindex="-1" role="dialog" aria-labelledby="concretarEncuentro" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm" style="width: 500px">
        <div class="modal-content" style="width: 700px">
            <div class="modal-body">
                <div id="encuentroDatos"></div>
                    <center>
                        <button id="cancelar" type="button" class="btn btn-default" data-dismiss="modal">cancelar</button>
                        <button type="button" class="btn btn-primary" data-dismiss="modal" onclick="aprobarEncuentro()">Aprobar Encuentro</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
<form id="aprobar_form" name="aprobar_form">
    <input type="hidden" id="peticion_id" name="peticion_id">
    <input type="hidden" id="solicitud_id" name="solicitud_id">
</form>
<script>
    function aprobarEncuentro(){
        var peticion = $("#peticion_id_modal").val()
        var solicitud = $("#solicitud_id_modal").val()

        jQuery.ajax(
            {
                type:'POST',
                data:'peticion=' + peticion + '&solicitud=' + solicitud,
                url:'/amorDePatitas/encuentro/aprobarEncuentro',
                success:function(data,textStatus)
                {
                    window.location.href = "/amorDePatitas/encuentro/encuentroIndex";
                },
                error: function(XMLHttpRequest,textStatus,errorThrown){
                }
            });
    }
</script>