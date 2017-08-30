<%--
  Created by IntelliJ IDEA.
  User: negenesio
  Date: 26/8/17
  Time: 14:59
--%>
@import 'font-awesome';

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
	<meta name="layout" content="main"/>
	<title>Admin</title>
	<style>
	/*
/* Created by Filipe Pina
* Specific styles of signin, register, component
*/
	/*
     * General styles
     */

	body, html{
		background-color: #d3d3d3;
		font-family: 'Oxygen', sans-serif;
	}


	h1.title {
		font-size: 50px;
		font-family: 'Passion One', cursive;
		font-weight: 400;
	}

	hr{
		width: auto;
		color: #fff;
	}

	input,
	input::-webkit-input-placeholder {
		font-size: 11px;
		padding-top: 3px;
	}

	.main-login{
		background-color: #fff;
		/* shadows and rounded borders */
		-moz-border-radius: 2px;
		-webkit-border-radius: 2px;
		border-radius: 2px;
		-moz-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		-webkit-box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
		box-shadow: 0px 2px 2px rgba(0, 0, 0, 0.3);
	}

	.main-center{
		margin-top: 30px;
		margin: 0 auto;
		max-width: 330px;
		padding: 20px 40px;

	}

	.login-button{
		margin-top: 5px;
	}

	.login-register{
		font-size: 11px;
		text-align: center;
	}

	</style>
</head>

<body>
<div class="container">
	<div class="row main">
		<div class="panel-heading">
			<div class="panel-title text-center">
				<h1 class="title">Patitas De Amor <i class="fa fa-paw" aria-hidden="true"></i></h1>
				<hr />
			</div>
		</div>
		<div class="main-login main-center">
			<form method="post" action="createUser" role="form" data-toggle="validator" id="form_usuario" name="form_usuario">

				<div class="form-group has-feedback" id="div_usuario" name="div_usuario">
					<label for="username" class="cols-sm-2 control-label">Usuario</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="username" id="username"  placeholder="Ingrese su usuario" required/>
							<span id="span_usuario" class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"></div>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label for="name" class="cols-sm-2 control-label">Nombre</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-user fa" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="name" id="name"  placeholder="Ingrese su nombre" required/>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"></div>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label for="fecha_nacimiento" class="cols-sm-2 control-label">Fecha Nacimiento</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<input type="date" class="form-control" name="fecha_nacimiento" id="fecha_nacimiento" required/>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"></div>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label for="email" class="cols-sm-2 control-label">Email</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-envelope fa" aria-hidden="true"></i></span>
							<input type="text" class="form-control" name="email" id="email"  placeholder="Ingrese su Email" required/>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"></div>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label for="password" class="cols-sm-2 control-label">Contraseña</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input type="password" class="form-control" name="password" id="password"  placeholder="Ingrese su Contraseña" required/>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"></div>
					</div>
				</div>

				<div class="form-group has-feedback">
					<label for="confirm" class="cols-sm-2 control-label">Confirmar Contraseña</label>
					<div class="cols-sm-10">
						<div class="input-group">
							<span class="input-group-addon"><i class="fa fa-lock fa-lg" aria-hidden="true"></i></span>
							<input type="password" class="form-control" name="confirm" id="confirm"  placeholder="Confirme su Contraseña" data-match="#password" data-match-error="Las contraseñas no coinciden!"required/>
							<span class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="help-block with-errors"/>
					</div>
				</div>

				<div class="form-group ">
					<button type="submit" class="btn btn-primary btn-lg btn-block login-button">Registrarse</button>
					<input type="button" onlick="test()" class="btn btn-primary btn-lg btn-block login-button" value="test"/>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
//    function test(){
//        alert('asd');
//        $('#form_usuario').on('valid.bs.validator invalid.bs.validator', function (e) {
//            if (e.relatedTarget.name === 'username') {
//                e.type === 'valid' ? console.log("valid!") : console.log("invalid!")
//            }
//        })
//    }
$(document).ready(function() {
        alert('hola');

    $.fn.validator.Constructor.INPUT_SELECTOR = ':input:not([type="submit"], button):enabled';
    $('#form_usuario').validator({
        delay: 200,
        focus: false,
        feedback: {
            success: 'glyphicon glyphicon-ok-sign',
            error: 'glyphicon glyphicon-exclamation-sign'
        },
        custom: {
            username: function($el) {
                var result = 'hola'
                console.log(result);
                if (!result)
                    return "Custom Error: Select one or more options";
                else
                    return false;
            }
        },
        errors: {
            username: "Select one or more options"
        }
    });
//    alert($('#username').val());

//    $('#createUser').validator().on('submit', function (e) {
//        if (e.isDefaultPrevented()) {
//            alert('1');
//        } else {
//            alert('2');
//        }
//    });
});
    %{--$(document).ready(function(){--}%

        %{--$("#username").focusout(function(){--}%
            %{--$("#username").trigger('submit.success');--}%

			%{--var Parameters = {usuario: $("#usuario").val()};--}%

			%{--$.ajax({--}%
				%{--url: "${createLink(controller:'usuario', action:'ajaxFindUsuario')}",--}%
				%{--type: "GET",--}%
				%{--data: Parameters,--}%
				%{--success: function(resp){--}%
						%{--$("#username").validator();--}%
				%{--}--}%
			%{--});--}%
        %{--});--}%
    %{--});--}%
</script>
</body>
</html>
%{--isaacn.182@gmail.com--}%
%{--Isaacn Nassar--}%

%{--eric.dominguez@live.com.ar--}%
%{--Eric Dominguez--}%

%{--ignaciofernandez85@gmail.com--}%
%{--Ignacio Fernandez--}%
