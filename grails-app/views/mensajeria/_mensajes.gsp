<input type="hidden" id="solicitud_mensaje" value="${solicitud}"/>
<input type="hidden" id="peticion_mensaje" value="${peticion}"/>
<input type="hidden" id="confirm" value="${confirm}"/>
<div id="chatMessages"></div>

<div id="temp"></div>
<script>

    function enviarMensaje(){
        var message = $('#messageBox').val();
        var solicitud = $("#solicitud_mensaje").val()
        var peticion = $("#peticion_mensaje").val()
        jQuery.ajax(
            {
                type:'GET',
                data:'mensaje=' + message + '&peticion=' + peticion + '&solicitud=' + solicitud,
                url:'/amorDePatitas/mensajeria/submitMessage',
                success:function(data,textStatus)
                {
                    jQuery('#temp').html(data);
                    $('#messageBox').val('');
                    return false;
                }
            });
    }
    function messageKeyPress(field,event) {
        var theCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
        var message = $('#messageBox').val();
        var solicitud = $("#solicitud_mensaje").val()
        var peticion = $("#peticion_mensaje").val()
        if (theCode == 13){
            jQuery.ajax(
                {
                    type:'GET',
                    data:'mensaje=' + message + '&peticion=' + peticion + '&solicitud=' + solicitud,
                    url:'/amorDePatitas/mensajeria/submitMessage',
                    success:function(data,textStatus)
                    {
                        jQuery('#temp').html(data);
                        $('#messageBox').val('');
                        return false;
                    }
                });

        } else {
            return true;
        }
    }
    function retrieveLatestMessages(solicitud, peticion) {
        jQuery.ajax(
            {
                type:'GET',
                data: 'peticion=' + peticion + '&solicitud=' + solicitud,
                url:'/amorDePatitas/mensajeria/retrieveLatestMessages',
                success:function(data,textStatus)
                {
                    jQuery('#chatMessages').html(data);
                }
            });
    }
    function pollMessages() {
        var solicitud = "${solicitud}";
        var peticion = "${peticion}";
        retrieveLatestMessages(solicitud, peticion);
        setTimeout('pollMessages()', 500000);
    }
    pollMessages();
</script>