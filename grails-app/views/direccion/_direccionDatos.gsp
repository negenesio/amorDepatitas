<div class="modal fade direccionVerificar" id="direccionVerificar" tabindex="-1" role="dialog" aria-labelledby="direccionVerificar" aria-hidden="true" data-backdrop="static">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">Para continuar debes completar los siguientes datos: </h4>
                <br>
                <div class="form-group" style=" width: 350px;">
                    <label for="ciudad" class="cols-sm-2">Ciudad:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-globe" aria-hidden="true"></i></span>
                            <select id="ciudad" name="ciudad" class="form-control selectpicker" title="Seleccione la ciudad" data-live-search="true" style="background-color: #ccc;overflow-x: hidden; overflow-y: scroll;" required>
                                <g:each in="${amordepatitas.Ciudad.list()}" var="ciudad">
                                    <g:if test="${ciudad?.id == direccion?.ciudad?.id}">
                                        <option value="${ciudad?.id}" selected>${ciudad?.descripcion}</option>
                                    </g:if>
                                    <g:else>
                                        <option value="${ciudad?.id}">${ciudad?.descripcion}</option>
                                    </g:else>
                                </g:each>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group" style=" width: 350px;">
                    <label for="calle" class="cols-sm-2">Calle:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-road" aria-hidden="true"></i></span>
                            <input style=" width: 300px;" type="text" id="calle" name="calle" title="Ingrese calle" required value="${direccion?.calle}">
                        </div>
                    </div>
                </div>

                <div class="form-group" style=" width: 150px;">
                    <label for="numero" class="cols-sm-2">Numeracion:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-street-view" aria-hidden="true"></i></span>
                            <input style=" width: 150px;" type="number" id="numero" name="numero" title="Ingrese numeracion" required value="${direccion?.numero}">
                        </div>
                    </div>
                </div>

                <div class="form-group" style=" width: 150px;">
                    <label for="numero" class="cols-sm-2">Telefono:</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-phone" aria-hidden="true"></i></span>
                            <input style=" width: 150px;" type="number" id="telefono" name="telefono" title="Ingrese numeracion" required value="${direccion?.telefono}">
                        </div>
                    </div>
                </div>
                <input type="hidden" value="${direccion?.usuario?.id}" name="direccionUsuario" id="direccionUsuario"/>
                <button id="direccionGuardar" class="btn-success" onclick="cargarDireccion()">Guardar Datos</button>
                <label id="mensajeError" style="color: darkred; visibility: hidden">Debes completar todos los datos para continuar.!</label>
            </div>
        </div>
    </div>
</div>
<script>
    function cargarDireccion() {
        var ciudad = $("#ciudad").val();
        var telefono = $("#telefono").val();
        var numero = $("#numero").val();
        var usuario = $("#direccionUsuario").val();
        var calle = $("#calle").val();

        if(!calle) {
            $("#mensajeError").attr('style','visibility: visible; color: darkred');
            $("#calle").focus();
            return false
        }
        if(!telefono) {
            $("#mensajeError").attr('style','visibility: visible; color: darkred');
            $("#telefono").focus();
            return false
        }
        if(!ciudad) {
            $("#mensajeError").attr('style','visibility: visible; color: darkred');
            $("#ciudad").focus();
            return false
        }
        if(!numero) {
            $("#mensajeError").attr('style','visibility: visible; color: darkred');
            $("#numero").focus();
            return false
        }


        jQuery.ajax(
            {
                type:'GET',
                data:'ciudad=' + ciudad + '&telefono=' + telefono + '&numero='+ numero +'&direccionUsuario='+ usuario +'&calle='+calle,
                url:'/amorDePatitas/direccion/cargarDireccion',
                success:function(data,textStatus)
                {
                    $("#direccionVerificar").modal('hide');
                    $("#mensajeError").attr('style','visibility: hidden');
                    $( "#viewModalButton").click();
                    $( "#modalEncuentro").click();
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });
    }
</script>