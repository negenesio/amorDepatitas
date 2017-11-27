<%@ page import="amordepatitas.Imagenes; amordepatitas.Postulacion" contentType="text/html;charset=UTF-8" %>
<style>
.none td{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none tbody tr:hover td, .table tbody tr:hover{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none thead th:hover, tr:hover{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none div{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none .hembra thead th:hover, tr:hover{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none .mascota th{
    background-color: #E1F2B6;
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none th{
    background-image: -webkit-gradient(linear, left top, left bottom, color-stop(0, #E1F2B6), color-stop(1, #E1F2B6)) !important;
}
.none h5{
    background-color: #E1F2B6;
    margin-bottom: 0px;
}
</style>
<center><table style="width: 40%;" class="none">
    <tbody>
    <tr class="none">
        <td><b>Nombre:</b></span></td>
        <td><label>${mascota.nombre}</label></td>
    </tr>
    <tr class="none">
        <td><b>Sexo</b></td>
        <td><label>${mascota.sexo}</label></td>
    </tr>
    <tr class="none">
        <td><b>Fecha de Nacimiento:</b></td>
        <td><label>${mascota.fechaNacimiento.format('dd/MM/YYYY')}</label></td>
    </tr>
    </tbody>
</table></center>
<br>
<div class="container" id="upload_images" style="margin: 0px;">
    <g:set var="imagenes" value="${Imagenes.findAllByMascota(mascota)}"/>
    <g:if test="${imagenes}">
        <div class="row main upload-file" id="div_imagenes" style="margin: 0px;">
        <table class="table table-striped" id="imagenesCargadas" onchange="cantImagenes();" onclick="cantImagenes();">
            <thead>
            <tr>
            <g:each in="${imagenes}" var="imagen">
                <th style="text-align: center" id="th-${imagen.id}">
                    <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}" width="150px" height="150px"/>
                </th>
            </g:each>
            </tr>
            </thead>
        </table>
        </div>
    </g:if>
</div>
<div>
<g:set var="postulacion" value="${Postulacion.findByMascota(mascota)}"/>
<g:if test="${postulacion?.observaciones}">
    <center>
        <h4 style="margin: 0px;">Algo Sobre ${mascota.nombre}</h4>
        <br>
        <label>${postulacion.observaciones}</label>
    </center>

</g:if>
</div>
