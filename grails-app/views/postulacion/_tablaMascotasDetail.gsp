
<div class="container" id="upload_images">
    <g:if test="${imagenesPostulacion}">
        <div class="row main upload-file" id="div_imagenes" style="margin: 0px">
            <table class="table table-striped" id="imagenesCargadas">
                <center><h3 class="header-title" style="color: black;"><b>Fotos de tu seleccion! conoce a: ${postulacion.mascota.nombre}</b></h3></center>
                <thead>
                <tr>
                    <g:each in="${imagenesPostulacion}" var="imagen">
                        <th style="text-align: center" id="th-${imagen.id}">
                            <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="80px" height="80px"/>
                        </th>
                    </g:each>
                </tr>
                </thead>
            </table>
        </div>
    </g:if>
</div>
<style>
    .success_tr {
        background-color: #4caa4b !important;
    }
</style>
<div id="direccion"></div>
<g:if test="${postulacionesUsuario}">
    <center><h4 class="header-title" style="color: black;"><b>Debe seleccionar alguna de sus mascota, para continuar!.</b></h4></center>
    <br>
<table class="table table-striped mascota">
    <thead>
    <tr class="mascota">
        <th>Nombre</th>
        <th>Sexo</th>
        <th>Fecha Nacimiento</th>
        <th>Raza</th>
    </tr>
    </thead>
    <tbody>
    <g:each in="${postulacionesUsuario.mascota}" var="mascota">
       <tr class="tr_tabla_seleccionar_mascota" id="tr_${mascota.id}" onclick="seleccionarMascota(${mascota.id}, ${postulacion.mascota.id}, this)">
            <td>${mascota.nombre}</td>
            <td>${mascota.sexo}</td>
            <td>${mascota.fechaNacimiento.format('dd/mm/YYYY')}</td>
            <td>${mascota.raza.descripcion}</td>
       </tr>
    </g:each>
    </tbody>
</table>
</g:if>
<g:else>
   <center><b>No tienes ninguna mascota que pueda realizar un encuentro con la selccion actual.</b></center>
    <br>
</g:else>

<script>
    function seleccionarMascota(mascotaIdUsuario, mascotaIdEncuentro, inputTr) {
        $('.tr_tabla_seleccionar_mascota').each(function() {
            $( this ).removeClass('success_tr');
        });
        $("#btn_enviarEncuentro").attr('style','visibility: visible');
        $(inputTr).addClass('success_tr');
        $("#mascotaUsuario").val(mascotaIdUsuario);
        $("#mascotaEncuentro").val(mascotaIdEncuentro);
    }
</script>