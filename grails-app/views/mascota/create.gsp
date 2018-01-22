<%@ page import="amordepatitas.Raza" contentType="text/html;charset=UTF-8" %>

<html>
<head>
    <meta name="layout" content="main"/>
    <asset:stylesheet src="indexRegistracion.css"/>
    <style>
    div.kv-file-content > img{
        width: 50px;
        height: 50px;
    }
    .upload-file{
        padding-top: -20px;
        background: rgba(66, 70, 69, 0.69);
    }
    </style>
</head>

<body>
<div>
    <span id="info" data-balloon="Mostrar / Ocultar informacon" data-balloon-pos="right"><i class="fa fa-info-circle" aria-hidden="true" style="font-size:25px; background-color: rgba(66, 70, 69, 0.69); color: yellowgreen"></i></span>

    <div id="info_descripcion" style="font-size:15px;background-color: rgba(66, 70, 69, 0.69); width: auto;" >
        <center><label style="color: #6bcd3c">Debes completar todos los datos requeridos, para continuar con el proceso de carga, ademas en esta seccion podras subir hasta 3 imagenes de tu mascota!</label></center>
    </div>
</div>
    <div class="container" id="registro_mascota">
        <div class="row main">
            <div class="main-login main-center">
                <center><h3 class="header-title">Registra tu mascota es muy simple!</h3></center>
                <g:formRemote name="form_registro" id="form_registro" on404="alert('not found!')" update="mascota_id_created"
                              url="[controller: 'mascota', action:'createMascota']" onComplete="createMascota()">
                <div name="mascota_id_created" id="mascota_id_created"></div>
                %{--<g:form name="form_registro" mapping="mascota_create" method="POST" >--}%
                    <div class="form-group">
                        <label for="nombre_mascota" class="cols-sm-2 custom-padding">Nombre Mascota</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><img src="../images/icons/dog-bone.png"/></span>
                                <input type="text" class="form-control" name="nombre_mascota" id="nombre_mascota"  placeholder="Ingrese el nombre de su mascota"  required/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="fecha_nacimiento" class="cols-sm-2">Fecha Nacimiento</label>
                        <div class="cols-sm-10">
                            <div class="input-group">
                                <span class="input-group-addon"><i class="fa fa-birthday-cake fa" aria-hidden="true"></i></span>
                                <input type="date" class="form-control custom-tam" name="fecha_nacimiento" id="fecha_nacimiento"  required/>
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
                                        <option value="${it?.id}">${it?.descripcion}</option>
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
                                        <input type="radio" value="MACHO" name="sexo_mascota" checked="checked">MACHO</label>
                                    <label class="btn btn-default btn-off btn-sm ">
                                        <input type="radio" value="HEMBRA" name="sexo_mascota">HEMBRA</label>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="form-group" style="padding-top: 10px;">
                        <label for="exampleTextarea"><i class="fa fa-eye" aria-hidden="true" style="font-size: 20px;"></i><div id="charNum"> Descripcion:</div></label>
                        <textarea name="descripcion" maxlength="140" class="form-control" id="exampleTextarea" rows="3" onkeyup="countChar(this)"></textarea>
                    </div>
                    <div class="form-group ">
                        <input type="submit" class="btn btn-info btn-block login" value="Guardar Mascota"/>
                    </div>
                </g:formRemote>
            </div>
        </div>
    </div>
    <div class="container" id="upload_images">
        <div class="row main upload-file">
            <g:form name="form_registro" mapping="mascota_create_upload" method="POST" >
            <center><h3 class="header-title">Ya esta casi listo, solo faltan las fotos!</h3></center>
                <div dir=rtl class="file-loading"> <!-- note the direction if you want to display file-loading indicator -->
                <!-- note that your input must just set the `rtl` data property of the plugin or in your javascript code -->
                    <input id="input-b8" name="input-b8[]" multiple type="file">
                </div>
                <input type="hidden" id="mascota" value=""/>
                <div class="form-group ">
                    <label id="omitir" name="omitir" class="btn btn-error btn-block login" style="background-color: #d6c4bb">Omitir</label>
                </div>
            </g:form>
        </div>
    </div>

<script>
    $(document).on('ready', function() {
        $("#info").click(function () {
            if($("#info_descripcion").is(':visible')){
                $("#info_descripcion").hide();
            } else {
                $("#info_descripcion").show();
            }
        });

        $("#upload_images").hide();
        $("#upload_button").hide();

        $('#input-b8').on('fileloaded', function(event, file, previewId, index, reader) {
            $("#mascota").val($("#mascota_id_created").text());
            $("#upload_button").show();
        });

        $('#input-b8').on('filebatchuploadcomplete', function(event, files, extra) {
            window.location.href = "/amorDePatitas/usuario/index";
        });

        $('#input-b8').on('filebatchuploaderror', function(event, files, extra) {
            window.location.href = "/amorDePatitas/usuario/index";
        });


        $("#omitir").click(function(){
            window.location.href = "/amorDePatitas/usuario/index";
        });

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
            allowedFileExtensions: ["jpg", "png", "gif"]
        });
        $("#upload_images").show();
        $("#registro_mascota").hide();
    }

    function getMascotaId() {
        return $("#mascota_id_created").text();
    }
    function countChar(val) {
        var len = val.value.length-1;
        if (len >= 140) {
            val.value = val.value.substring(0, 140);
        } else {
            $('#charNum').text(" Descripcion: "+(140 - len-1));
        }
    };
</script>

</body>
</html>

