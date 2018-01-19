<%@ page import="amordepatitas.Mascota; amordepatitas.seguridad.SecUser" contentType="text/html;charset=UTF-8" %>
<div class="modal fade viewDetail" id="viewDetail" tabindex="-1" role="dialog" aria-labelledby="viewDetail" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog modal-sm" style="width: 500px">
        <div class="modal-content" style="width: 700px">
            <div class="modal-body">
                <br>
                <div id="tablaMascotasDetail"></div>
                <input type="hidden" id="postulacionModal" name="postulacionModal"/>
                <input type="hidden" id="mascotaIdModal" name="mascotaIdModal"/>
                <input type="hidden" id="sexoMascotaModal" name="sexoMascotaModal"/>
                <div id="resultado">
                    <center>
                        <button type="button" class="btn btn-default" data-dismiss="modal" onclick="refreshPage()">cancelar</button>
                        <button id='btn_enviarEncuentro' onclick='enviarFormularioEncuentro()' data-dismiss="modal" class="btn-primary" style="visibility: hidden">Enviar Solicitud de Encuentro</button>
                    </center>
                </div>
            </div>
        </div>
    </div>
</div>
<g:form id="form_enviarEncuentro" mapping="enviar_encuentro" method="POST">
    <div style="visibility: hidden">
        <input type="hidden" name="mascotaUsuario" id="mascotaUsuario"/>
        <input type="hidden" name="mascotaEncuentro" id="mascotaEncuentro"/>
    <center>
        <submit id="btn_enviarEncuentro" class="btn-primary">Enviar Solicitud de Encuentro</submit>
    </center>
    </div>
</g:form>

<script>
    function refreshPage(){
        $('.tr_tabla_seleccionar_mascota').each(function() {
            $( this ).removeClass('success_tr');
        });
        jQuery('#notificaciones').html('');
        $("#btn_enviarEncuentro").attr('style','visibility: hidden');
    }

    function enviarFormularioEncuentro(){
        var mascotaEncuentro = $("#mascotaUsuario").val();
        var mascotaUsuario = $("#mascotaEncuentro").val();

        jQuery.ajax(
            {
                type:'POST',
                data:'mascotaEncuentro=' + mascotaEncuentro + '&mascotaUsuario=' + mascotaUsuario,
                url:'/amorDePatitas/encuentro/enviarEncuentro',
                success:function(data,textStatus)
                {
                    $('.tr_tabla_seleccionar_mascota').each(function() {
                        $( this ).removeClass('success_tr');
                    });
                    var notificaciones = '<center><div class="container"><div class="row main"><div class="main-login main-center"><div class="form-group"><b><label>El encuentro fue enviado!.</label><br><label>Desde la seccion Mis Encuentros, puedes comprobar el estado actual de cada uno!.</label></b><br><g:link controller="encuentro" action="encuentroIndex"><input type="button" class="btn-primary" value="Mis Encuentros"/></g:link></div></div></div></div></center>'
                    jQuery('#notificaciones').html(notificaciones);
                    $("#btn_enviarEncuentro").attr('style','visibility: hidden');
                },
                error: function(XMLHttpRequest,textStatus,errorThrown){
                    var notificaciones = '<center><div class="container"><div class="row main"><div class="main-login main-center"><div class="form-group"><b><label>La mascota seleccionada ya tiene un encuentro pendiente!.</label></b></div></div></div></div></center>'
                        jQuery('#notificaciones').html(notificaciones);
                    }
            });
    }
</script>