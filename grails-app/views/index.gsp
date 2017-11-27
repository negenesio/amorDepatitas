<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
    <asset:stylesheet src="indexRegistracion.css"/>
</head>

<body>
<div class="container">
    <div class="row main">
        <div class="main-login main-center">
            <center><h3 class="header-title">Encuentra la pareja perfecta para tu Mascota!</h3></center>
            <g:form name="form_registro" mapping="usuario_create" method="POST" >
                <div class="form-group">
                    <label for="username" class="cols-sm-2 custom-padding">Usuario</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="username" id="username"  placeholder="Ingrese su Usuario"  required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="name" class="cols-sm-2">Nombre y Apellido</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
                            <input type="text" class="form-control" name="name" id="name"  placeholder="Ingrese su Nombre Completo" required/>
                        </div>
                    </div>
                </div>

                <div class="form-group">
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
                    <label for="sexo" class="cols-sm-2 custom-padding">Sexo</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-venus-mars" aria-hidden="true"></i></span>
                            <div class="btn-group" id="sexo" data-toggle="buttons">
                                <label class="btn btn-default btn-on btn-sm active">
                                    <input type="radio" value="masculino" name="sexo" checked="checked">MASCULINO</label>
                                <label class="btn btn-default btn-off btn-sm ">
                                    <input type="radio" value="femenino" name="sexo">FEMENINO</label>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="form-group">
                    <label for="password" class="cols-sm-2">Contraseña</label>
                    <div class="cols-sm-10">
                        <div class="input-group">
                            <span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
                            <input type="password" class="form-control" name="password" id="password"  placeholder="Ingrese su Contraseña"  required/>
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
    <sec:ifLoggedIn>
        window.location.href = "/amorDePatitas/usuario/index";
    </sec:ifLoggedIn>
        $('#form_registro').bootstrapValidator({
            feedbackIcons: {
                valid: 'fa fa-check-square-o',
                invalid: 'fa fa-times',
                validating: 'fa fa-clock-o'
            },
            fields: {
                username: {
                    validators: {
                        remote: {
                            type: 'POST',
                            url: '/amorDePatitas/usuario/ajaxFindUsuario',
                            message: 'El usuario ingresado ya existe.'
                        },
                        notEmpty: {
                            message: 'Ingrese un usuario valido.'
                        }
                    }
                },
                email: {
                    validators: {
                        notEmpty: {
                            message: 'Email no puede estar vacio.'
                        },
                        emailAddress: {
                            message: 'Ingrese una direccion de email valida.'
                        },
                        remote: {
                            type: 'POST',
                            url: '/amorDePatitas/usuario/ajaxFindEmail',
                            message: 'El email ingresado ya existe.'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'Ingrese una constraseña valida.'
                        }
                    }
                },
                confirm:{
                    validators: {
                        identical: {
                            field: 'password'
                        },
                        notEmpty: {
                            message: 'Ingrese confirmacion de contraseña.'
                        }
                    }
                }
            }
        });
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
