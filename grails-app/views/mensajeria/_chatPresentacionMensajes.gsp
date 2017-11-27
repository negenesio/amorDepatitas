<div id="chat"><h4>Converzacion Establecida con: ${nombreAmo}</h4>
<br>
<g:if test="${mensajes.isEmpty()}">
    Perfecto! ya puedes establacer contacto! el dueño de ${nombreMascota}.!

</g:if>
<div style="border-style: double;">
<g:each in="${mensajes}" var="mensaje">
    <g:if test="${mensaje.usuario.username.toString() == sec.loggedInUserInfo(field:'username').toString()}">
        <b><label style="color: blue;"> ${mensaje.usuario.username}</label></b>
    </g:if>
    <g:else>
        <b><label style="color: darkred;">${mensaje.usuario.username}</label></b>
    </g:else>
    <b><label style="color: black"> - ${mensaje.fecha.format('dd/mm/YYYY HH:mm:ss')}: </label></b>
    <label>${mensaje.message}</label>
    <br>
</g:each>
</div>
<br>
<div>
    <input type="text" id="messageBox" style="width: 300px;" name="message" onkeypress="messageKeyPress(this, event);"/>
    <button class="btn-primary" onclick="enviarMensaje()">Enviar Mensaje!</button>
    <br>
</div>
<center><div>
    <h5 style="margin: 0px;">Informacion de Contacto de: ${nombreAmo} <label style="color: darkgreen" data-balloon="Los datos son los proporcionados por ${nombreAmo}!, mucha suerte con tu encuentro!." data-balloon-length="medium" data-balloon-pos="right"><i class="fa fa-info-circle" aria-hidden="true" style="font-size:17px;"></i></label></h5>
    <lu>
        <li>
            <label>Telefono: </label><label>${peticionDireccion.telefono}</label>
        </li>
        <li>
            <label>Ciudad: </label><label>${peticionDireccion.ciudad.descripcion}</label>
        </li>
        <li>
            <label>Calle: </label><label>${peticionDireccion.calle}</label>
        </li>
        <li>
            <label>Email: </label><label>${peticion.secUser.email}</label>
        </li>
    </lu>
</div>
    <dvi>
        <br>
            <input type="hidden" id="nombreMascotaSolicitud" value="${solicitud.nombre}"/>
            <input type="hidden" id="nombreMascotaPeticion" value="${peticion.nombre}"/>
        <button class="btn-success" id="btn_finalizar" onclick="calificar();">Finalizar y Evaluar encuentro!</button>
    </dvi>
</center>
</div>
<div id="calificaciones" hidden>
    <center>
        <h4>Para finalizar el encuentro debes seleccionar una nota del 1 al 10!</h4>
        <br>
        <label>Nota: </label>
        <select id="nota">
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10" selected>10</option>
    </select>
        <br>
        <label>Recomendarias a ${nombreAmo}?: </label><br>
        <textarea id="descripcion" rows="4" cols="40"></textarea>
        <br>
        <div style="padding-left: 20px;">
            <button type="button" class="btn btn-default" data-dismiss="modal" onclick="cancelarCalificacion();" id="cancelarCalificacion">cancelar</button><label style="visibility: hidden;">adasd</label><button class="btn-success" id="enviarNota" onclick="cargarNota()">Cargar Calificacion</button>
        </div>
    </center>
</div>
<script>
    $( document ).ready(function() {
        if($("#confirm").val() == 'confirm'){
            $("#calificaciones").show();
            $("#btn_finalizar").hide();
        }
    });
    function cancelarCalificacion(){
        $("#descripcion").val('');
        $("#nota").val('10');
    }
    function calificar(){
        $( document ).ready(function() {
            $("#chat").hide();
            $("#calificaciones").show();
        });
    }

    function cargarNota() {

        var nombreMascota = "${nombreMascota}";
        var nombreMascotaSolicitud = $("#nombreMascotaSolicitud").val();
        var nombreMascotaPeticion = $("#nombreMascotaPeticion").val();
        var nombrePeticion = "${nombreAmo}";
        var nota = $("#nota").val();
        var descripcion = $("#descripcion").val();
        var confirm = $("#confirm").val();
        if(nombreMascotaSolicitud == nombreMascota){
            nombreMascotaSolicitud = nombreMascotaPeticion;
        }

        jQuery.ajax(
            {
                type:'GET',
                data:'nombrePeticion=' + nombrePeticion +'&mascotaSolicitud='+nombreMascotaSolicitud+'&mascotaPeticion='+nombreMascota+'&nota='+nota+'&descripcion='+descripcion+'&confirm='+confirm,
                url:'/amorDePatitas/encuentro/finalizarEncuentro',
                success:function(data,textStatus)
                {
                    location.reload();
                },
                error:
                    function(XMLHttpRequest,textStatus,errorThrown){

                    }
            });

    }
</script>