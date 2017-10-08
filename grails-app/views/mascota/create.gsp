<%@ page import="amordepatitas.Raza" contentType="text/html;charset=UTF-8" %>
@import 'font-awesome';

<html>
<head>
    <meta name="layout" content="main"/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <asset:stylesheet src="usuario/indexRegistracion.css"/>
    <style>
    .new-select {
        background-color: #ccc;
    }
    </style>
</head>

<body>
<div class="container">
    <div class="row main">
        <div class="main-login main-center">
            <center><h3 class="title">Registra tu mascota es muy simple!</h3></center>
            <g:form name="form_registro" mapping="mascota_create" method="POST" >

                <div class="form-group">
                    <label for="nombre_mascota" class="cols-sm-2 custom-padding">Nombre Mascota</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><img src="../images/icons/dog-bone.png"/></span>
                            <input type="text" class="form-control" name="nombre_mascota" id="nombre_mascota"  placeholder="Ingrese el nombre de su mascota"  required/>
                        </div>
                    </div>
                </div>

                <div class="form-group" id="fecha_nacimiento">
                    <label for="fechaNacimiento" class="cols-sm-2">Fecha Nacimiento</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-birthday-cake fa" aria-hidden="true"></i></span>
                            <input type="date" class="form-control custom-tam" name="fechaNacimiento" id="fechaNacimiento"  required/>
                        </div>
                    </div>
                </div>

                <div class="form-group" id="raza">
                    <label for="raza" class="cols-sm-2">Raza</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><img src="../images/icons/icon-dog.png"/></span>
                            <select name="raza" class="form-control selectpicker" title="Seleccione la Raza" data-live-search="true" style="background-color: #ccc;overflow-x: hidden; overflow-y: scroll;" required>
                                <g:each in="${amordepatitas.Raza.list()}">
                                    <option value="${it?.id}">${it?.descripcion}</option>
                                </g:each>
                            </select>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <input type="submit" class="btn btn-info btn-block login" type="submit" value="Guardar Mascota"/>
                </div>
            </g:form>
        </div>
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
