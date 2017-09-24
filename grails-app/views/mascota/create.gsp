<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 10/9/17
  Time: 22:57
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="sinMenu"/>

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
    <asset:stylesheet src="../usuario/indexRegistracion.css"/>
    <title></title>
</head>

<body>
<div class="container">
    <div class="row main">
        <div class="main-login main-center">
            <center><h3 class="title">Registra tu Mascota!</h3></center>
            <g:form name="form_registro_mascota" mapping="mascota_create" method="POST" >
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
</body>
</html>