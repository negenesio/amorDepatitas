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
asd
${mascotaId}
<div class="container">
    <div class="row main">
            <center><h3 class="title">Registra tu mascota es muy simple!</h3></center>
            <g:form name="form_registro" mapping="mascota_create_upload" method="POST" >
                <input type="hidden" name="fechaNacimiento" value="${fechaNacimiento}"/>
                <input type="hidden" name="nombre_mascota" value="${nombre_mascota}"/>
                <input type="hidden" name="raza" value="${raza}"/>
                <div dir=rtl class="file-loading"> <!-- note the direction if you want to display file-loading indicator -->
                <!-- note that your input must just set the `rtl` data property of the plugin or in your javascript code -->
                    <input id="input-b8" name="input-b8[]" multiple type="file">
                </div>
                <script>
                    $(document).on('ready', function() {
                        var mascota = ${mascotaId};
                        $("#input-b8").fileinput({
                            rtl: true,
                            uploadUrl:"uploadImagen",
                            uploadExtraData:{mascota: mascota},
                            maxFileCount: 3,
                            allowedFileExtensions: ["jpg", "png", "gif"]
                        });
                    });
                </script>

                <div class="form-group ">
                    <input type="submit" class="btn btn-info btn-block login" type="submit" value="Guardar Mascota"/>
                </div>
            </g:form>
    </div>
</div>

</body>
</html>
%{--<div class="form-group" id="imagenes">--}%
    %{--<label for="raza" class="cols-sm-2">Imagenes</label>--}%
    %{--<div class="cols-sm-10">--}%
        %{--<div class="input-group">--}%
            %{--<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="width: 100%">--}%
            %{--<span class="input-group-addon"><img src="../images/icons/dog-imagen.png"/></span>--}%
            %{--<!-- Button trigger modal -->--}%
                %{--Cargar Imagenes...--}%
            %{--</button>--}%
        %{--</div>--}%
    %{--</div>--}%
%{--</div>--}%
