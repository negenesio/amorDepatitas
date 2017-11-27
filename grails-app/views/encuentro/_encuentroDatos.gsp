<style>
    .macho td{
        background-color: powderblue;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho tbody tr:hover td, .table tbody tr:hover{
        background-color: powderblue;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho thead th:hover, tr:hover{
        background-color: #83aaaf;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho2 div{
        background-color: powderblue;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho{
        background-color: powderblue;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho2 .mascota thead th:hover, tr:hover{
        background-color: #91b8bd;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #91b8bd), color-stop(1, #91b8bd)) !important;
    }
    .macho2 .mascota th{
        background-color: #91b8bd !important;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #91b8bd), color-stop(1, #91b8bd)) !important;
    }
    .macho2 th{
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #B0E0E6), color-stop(1, #B0E0E6)) !important;
    }
    .macho2 h5{
        background-color: powderblue;
        margin-bottom: 0px;
    }

    .hembra td{
        background-color: #ffa4e5;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra tbody tr:hover td, .table tbody tr:hover{
        background-color: #ffa4e5;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra thead th:hover, tr:hover{
        background-color: #cb7db2;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra div{
        background-color: #ffa4e5;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra{
        background-color: #ffa4e5;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra2 .hembra thead th:hover, tr:hover{
        background-color: #cb7db2;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #cb7db2), color-stop(1, #cb7db2)) !important;
    }
    .hembra2 .mascota th{
        background-color: #cb7db2 !important;
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #cb7db2), color-stop(1, #cb7db2)) !important;
    }
    .hembra2 th{
        background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #ffa4e5), color-stop(1, #ffa4e5)) !important;
    }
    .hembra2 h5{
        background-color: #ffa4e5;
        margin-bottom: 0px;
    }
</style>
<center><h4 class="header-title" style="color: black;"><b>¿Deseas aprobar el Siguiente encuentro?!.</b></h4></center>
<br>
<div id="tu_mascota" class="${mascotaSolicitud.sexo.toLowerCase()}2">
<center><h5 class="header-title" style="color: black; padding: 0px;" class="${mascotaSolicitud.sexo.toLowerCase()}2"><b>Tu Mascota!.</b></h5></center>
<div class="container" id="upload_images">
    <g:if test="${imagenesSolicitud}">
        <div class="row main upload-file" id="div_imagenes" style="margin: 0px">
            <table class="table table-striped" id="imagenesCargadas" style="margin: 0px; border: 0px;">
                <thead>
                <tr>
                    <g:each in="${imagenesSolicitud}" var="imagen">
                        <th style="text-align: center;" class="${mascotaSolicitud.sexo.toLowerCase()}2" id="th-${imagen.id}">
                            <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="80px" height="80px"/>
                        </th>
                    </g:each>
                </tr>
                </thead>
            </table>
        </div>
    </g:if>
</div>
<table class="${mascotaSolicitud.sexo.toLowerCase()} table mascota" style="margin: 0px;">
    <thead>
    <tr>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Nombre</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Sexo</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Fecha Nacimiento</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Raza</th>
    </tr>
    </thead>
    <tbody>
    <tr class="tr_tabla_seleccionar_mascota" id="tr_${mascotaSolicitud.id}">
        <td>${mascotaSolicitud.nombre}</td>
        <td>${mascotaSolicitud.sexo}</td>
        <td>${mascotaSolicitud.fechaNacimiento.format('dd/mm/YYYY')}</td>
        <td>${mascotaSolicitud.raza.descripcion}</td>
    </tr>
    </tbody>
</table>
</div>
<br>
<div class="${mascotaPeticion.sexo.toLowerCase()}2" id="peticion_mascota">
<g:if test="${mascotaPeticion.sexo == 'MACHO'}">
    <center><h5 class="header-title" style="color: black; padding: 0px;"><b>Te Presentamos a un gran Candidato el es: ${mascotaPeticion.nombre}!.</b></h5></center>
</g:if>
<g:else>
    <center><h5 class="header-title ${mascotaPeticion.sexo.toLowerCase()}2" style="color: black; padding: 0px;"><b>Te Presentamos a una gran Candidata ella es: ${mascotaPeticion.nombre}!.</b></h5></center>
</g:else>
<div class="container" id="upload_images">
    <g:if test="${imegenesPeticion}">
        <div class="row main upload-file" id="div_imagenes" style="margin: 0px">
            <table class="table table-striped" id="imagenesCargadas">
                <thead>
                <tr>
                    <g:each in="${imegenesPeticion}" var="imagen">
                        <th style="text-align: center" id="th-${imagen.id}" class="${mascotaPeticion.sexo.toLowerCase()}2">
                            <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="80px" height="80px"/>
                        </th>
                    </g:each>
                </tr>
                </thead>
            </table>
        </div>
    </g:if>
</div>
<table class="table table-striped mascota ${mascotaPeticion.sexo.toLowerCase()}">
    <thead>
    <tr class="mascota">
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Nombre</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Sexo</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Fecha Nacimiento</th>
        <th class="${mascotaSolicitud.sexo.toLowerCase()}">Raza</th>
    </tr>
    </thead>
    <tbody>
    <tr class="tr_tabla_seleccionar_mascota" id="tr_${mascotaPeticion.id}">
        <td>${mascotaPeticion.nombre}</td>
        <td>${mascotaPeticion.sexo}</td>
        <td>${mascotaPeticion.fechaNacimiento.format('dd/mm/YYYY')}</td>
        <td>${mascotaPeticion.raza.descripcion}</td>
    </tr>
    </tbody>
</table>
</div>
<input type="hidden" name="peticion_id_modal" id="peticion_id_modal" value="${encuentro.mascotaPeticion.id}">
<input type="hidden" name="solicitud_id_modal" id="solicitud_id_modal" value="${encuentro.mascotaSolicitud.id}" >