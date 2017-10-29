<%@ page import="amordepatitas.Raza" contentType="text/html;charset=UTF-8" %>
@import 'font-awesome';

<html>
<head>
    <meta name="layout" content="main"/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <asset:stylesheet src="usuario/indexRegistracion.css"/>
</head>

<body>
<div class="container">
    <div class="row main">
            <center><h3 class="title">Registra tu mascota es muy simple!</h3></center>
            <g:form name="form_registro" mapping="mascota_create_upload" method="POST" >
                <div dir=rtl class="file-loading"> <!-- note the direction if you want to display file-loading indicator -->
                <!-- note that your input must just set the `rtl` data property of the plugin or in your javascript code -->
                    <input id="input-b8" name="input-b8[]" multiple type="file">
                </div>
                <div class="form-group ">
                    <input type="submit" class="btn btn-info btn-block login" type="submit" value="Guardar Mascota"/>
                </div>
            </g:form>
    </div>
</div>
<script>
    $(document).on('ready', function() {
        var mascota = ${mascotaId};
        $("#input-b8").fileinput({
            rtl: true,
            uploadUrl:"uploadImagen",
            showPreview: true,
            showCancel: false,
            language: "es",
            uploadExtraData:{mascota: mascota},
            maxFileCount: 3,
            allowedFileExtensions: ["jpg", "png", "gif"]
        });

        $('#input-b8').on('filebatchuploadcomplete', function(event, files, extra) {
            window.location.href = "/amorDePatitas/Usuario/indexUsuario";
        });
    });
</script>
</body>
</html>
