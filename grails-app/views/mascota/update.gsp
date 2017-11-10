<%@ page import="amordepatitas.Raza" contentType="text/html;charset=UTF-8" %>
@import 'font-awesome';

<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="indexRegistracion.css"/>
    <style>
    .upload-file{
        padding-top: -20px;
        background: rgba(66, 70, 69, 0.69);
    }
    </style>
</head>

<body>
    <div class="container" id="registro_mascota">
        <div class="row main">
            <div class="main-login main-center">
                <center><h3 class="header-title">Registra tu mascota es muy simple!</h3></center>
                <g:formRemote name="form_registro" id="form_registro" on404="alert('not found!')" update="mascota_id_created"
                              url="[controller: 'mascota', action:'uploadMascota']" onComplete="createMascota()">
                    <input type="hidden" name="mascotaId" value="${mascota.id}"/>
                    <div class="form-group">
                        <label for="nombre_mascota" class="cols-sm-2 custom-padding">Nombre Mascota</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><img src="../images/icons/dog-bone.png"/></span>
                                <input type="text" class="form-control" name="nombre_mascota" id="nombre_mascota"  placeholder="Ingrese el nombre de su mascota" value="${mascota.nombre}" required/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fecha_nacimiento" class="cols-sm-2">Fecha Nacimiento</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-birthday-cake fa" aria-hidden="true"></i></span>
                                <input type="date" class="form-control custom-tam" name="fecha_nacimiento" id="fecha_nacimiento" format="yyyy-MM-dd" value="${mascota.fechaNacimiento.format('yyyy-MM-dd')}" required/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="raza" class="cols-sm-2">Raza</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><img src="../images/icons/icon-dog.png"/></span>
                                <select id="raza" name="raza" class="form-control selectpicker" title="Seleccione la Raza" data-live-search="true" style="background-color: #ccc;overflow-x: hidden; overflow-y: scroll;" required>
                                    <g:each in="${amordepatitas.Raza.list()}">
                                        <g:if test="${it.descripcion == mascota.raza.descripcion}">
                                            <option value="${it?.id}" selected>${it?.descripcion}</option>
                                        </g:if>
                                        <g:else>
                                            <option value="${it?.id}">${it?.descripcion}</option>
                                        </g:else>
                                    </g:each>
                                </select>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="sexo" class="cols-sm-2 custom-padding">Sexo</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                                <div class="btn-group" id="sexo" data-toggle="buttons">
                                    <label class="btn btn-default btn-on btn-sm active">
                                        <input id="radio_macho" type="radio" value="MACHO" name="sexo_mascota" checked="checked">MACHO</label>
                                    <label class="btn btn-default btn-off btn-sm ">
                                        <input id="radio_hembra" type="radio" value="HEMBRA" name="sexo_mascota">HEMBRA</label>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="form-group ">
                        <input type="submit" class="btn btn-info btn-block login" value="Guardar Mascota"/>
                    </div>
                </g:formRemote>
            </div>
        </div>
    </div>
    <div class="container" id="upload_images">
        <g:if test="${imagenes}">
            <div class="row main upload-file" id="div_imagenes">
            <table class="table table-striped" id="imagenesCargadas" onchange="cantImagenes();" onclick="cantImagenes();">
                <center><h3 class="header-title">Ya cargadas!</h3></center>
                <thead>
                <tr>
                <g:each in="${imagenes}" var="imagen">
                    <th style="text-align: center" id="th-${imagen.id}">
                        <img src="${createLink(controller: 'imagenes', action: 'viewImage', params: ['id': imagen.id])}"/>
                        <center><span style="width: 80px;" class="input-group-addon" onclick="deleted(${imagen.id})">
                            <i class="fa fa-trash-o" aria-hidden="true" style="width: 30px"></i>
                        </span></center>
                        <div id="resultDeleted" name="resultDeleted"></div>
                    </th>
                </g:each>
                </tr>
                </thead>
            </table>
                <div class="form-group " id="omitir_2_images">
                    <label id="omitir_2" name="omitir_2" class="btn btn-error btn-block login" style="background-color: #d6c4bb">Omitir</label>
                </div>
            </div>
        </g:if>
        <div class="row main upload-file" id="upload_imagen">
            <g:form name="form_registro" mapping="mascota_create_upload" method="POST" >
            <center><h3 class="header-title">Puedes subir nuevas fotos!</h3></center>
                <div dir=rtl class="file-loading"> <!-- note the direction if you want to display file-loading indicator -->
                <!-- note that your input must just set the `rtl` data property of the plugin or in your javascript code -->
                    <input id="input-b8" name="input-b8[]" multiple type="file">
                </div>
                <input type="hidden" id="mascota" value="${mascota.id}"/>
                <div class="form-group ">
                    <label id="omitir" name="omitir" class="btn btn-error btn-block login" style="background-color: #d6c4bb">Omitir</label>
                </div>
                <div class="form-group" style="text-align: center; color: red; font-size: 18px" id="error_upload">Superaste el Limite maximo de 3 imagenes!</div>
            </g:form>
        </div>
    </div>

<script>
    $(document).on('ready', function() {
        var cantTh = 0
        $("#error_upload").hide();
        $("#upload_images").hide();
        $("#upload_button").hide();

        $('#input-b8').on('filebatchpreupload', function(event, data, previewId, index) {
            cantTh = $("#imagenesCargadas th").length;
            cantTh = cantTh+data.filescount
            if(cantTh > 3){
                $("#form_registro > div.file-input.kv-rtl > div.input-group.file-caption-main > div.input-group-btn > button").click();
                $("#error_upload").show();
                $('#input-b8').fileinput('unlock');
            } else {
                $("#error_upload").hide();
            }

        });

        $('#input-b8').on('fileloaded', function(event, file, previewId, index, reader) {
            $("#upload_button").show();
        });

        $('#input-b8').on('filebatchuploadcomplete', function(event, files, extra) {
            if(cantTh <= 3){
                $("#error_upload").hide();
                window.location.href = "/amorDePatitas/usuario/index";
            } else {
                $("#form_registro > div.file-input.kv-rtl > div.input-group.file-caption-main > div.input-group-btn > button").click();
                $("#error_upload").show();
                $("#error_upload").focus();
            }
        });

//        $('#input-b8').on('filebatchuploaderror', function(event, files, extra) {
//            window.location.href = "/amorDePatitas/usuario/index";
//        });


        $("#omitir").click(function(){
            window.location.href = "/amorDePatitas/usuario/index";
        });

        $("#omitir_2").click(function(){
            window.location.href = "/amorDePatitas/usuario/index";
        });

        if(${mascota.sexo == 'MACHO'}){
            $("#radio_macho").click();
        } else {
            $("#radio_hembra").click();
        }

    });
    function createMascota() {
        $("#input-b8").fileinput({
            rtl: true,
            uploadUrl:"/amorDePatitas/imagenes/uploadImagen",
            showPreview: true,
            showCancel: false,
            language: "es",
            uploadExtraData:{mascota: getMascotaId()},
            maxFileCount: 3,
            allowedFileExtensions: ["jpg", "png", "gif"],
            fileActionSettings : {
                showUpload : false,
                showCaption : false,
                showZoom : false
            },
        });
        $("#upload_images").show();
        $("#registro_mascota").hide();
    }

    function getMascotaId() {
        return $("#mascota").val();
    }

    function deleted(imagenId) {
        <g:remoteFunction controller="imagenes" action="deleteImage" params="'id='+imagenId"/>
        $("#th-"+imagenId).remove();
        cantTh = $("#imagenesCargadas th").length;
        if(cantTh <= 0){
            $("#div_imagenes").hide()
        }
    }

    function cantImagenes(){
        cantTh = 0
        cantTh = $("#imagenesCargadas th").length;
        if(cantTh >= 3){
            $("#upload_imagen").hide();
            $("#omitir_2_images").show();
        } else {
            $("#omitir_2_images").hide();
            $("#upload_imagen").show();
        }
    }

    cantTh = $("#imagenesCargadas th").length;
    if(cantTh >= 3){
        $("#upload_imagen").hide();
        $("#omitir_2_images").show();
    } else {
        $("#omitir_2_images").hide();
        $("#upload_imagen").show();
    }


</script>

</body>
</html>

