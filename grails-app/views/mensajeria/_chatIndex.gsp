
<div class="modal fade abrirChat" id="abrirChat" tabindex="-1" role="dialog" aria-labelledby="abrirChat" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm" style="width: 500px">
        <div class="modal-content" style="width: 700px">
            <div class="modal-body">
                <div id="mensajesChat" name="mensajesChat"></div>
                <br>
                    <div style="absolute:right;position: relative;"><button type="button" class="btn btn-default" data-dismiss="modal">Salir</button></div>
            </div>
        </div>
    </div>
</div>
<script>
    function mensajes(solicitud, peticion, confirm){
        jQuery.ajax(
            {
                type:'GET',
                data:'peticion=' + peticion + '&solicitud=' + solicitud+ '&confirm='+confirm,
                url:'/amorDePatitas/mensajeria/mensajes',
                success:function(data,textStatus)
                {
                    jQuery('#mensajesChat').html(data);
                },
                error: function(XMLHttpRequest,textStatus,errorThrown){
                }
            });
    }
</script>
