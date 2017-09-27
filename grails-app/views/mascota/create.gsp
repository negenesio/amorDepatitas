<%@ page contentType="text/html;charset=UTF-8" %>
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

                <div class="form-group">
                    <label for="nombre_mascota" class="cols-sm-2 custom-padding">¿Conoces la fecha de nacimiento?</label>
                    <div class="cols-sm-10" style="padding-left: 30px">
                            <input type="radio" id="no_fecha"  name="radio-group" value="true">
                            <label style="padding-left: 10px; padding-right: 70px" for="no_fecha"> Si</label>
                            <input type="radio" id="si_fecha" name="radio-group" value="false">
                            <label style="padding-left: 10px" for="si_fecha"> No</label>
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

                <div class="form-group">
                    <label for="email" class="cols-sm-2">Email</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="email" id="email"  placeholder="Ingrese su Email" required/>
                        </div>
                    </div>
                </div>




                <div class="form-group">
                    <label for="confirm" class="cols-sm-2">Repetir Contraseña</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="confirm" id="confirm" placeholder="Confirmar Contraseña"  required/>
                        </div>
                    </div>
                </div>

                <div class="form-group ">
                    <input type="submit" class="btn btn-info btn-block login" type="submit" value="Registrarse"/>
                </div>

            </g:form>
        </div>
    </div>
</div>
<script>
    $(document).ready(function() {

    });
</script>
</body>
</html>
%{--isaacn.182@gmail.com--}%
%{--Isaacn Nassar--}%

%{--eric.dominguez@live.com.ar--}%
%{--Eric Dominguez--}%

%{--ignaciofernandez85@gmail.com--}%
%{--Ignacio Fernandez--}%
