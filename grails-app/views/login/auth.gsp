<%@ page contentType="text/html;charset=UTF-8" %>

<html>
<head>
	<asset:stylesheet src="application.css"/>
	<asset:stylesheet src="usuario/indexRegistracion.css"/>
	<g:javascript src="jquery.min.js"/>
	<g:javascript src="jquery-ui.min.js"/>
	<g:javascript src="bootstrapvalidator.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="../css/bootstrapvalidator.min.css" />
	<asset:stylesheet src="../usuario/indexRegistracion.css"/>
</head>

<body>
<div class="container">
	<div class="row main">
		<div class="main-login main-center">
			<div class="container-fluid">
				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
					<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive; font-size: 30px; padding-left: 10px">Amor de Patitas</label><i class="fa fa-paw fa-1 pull-left header-title" aria-hidden="true"></i>

				<g:if test="${message}">
					<div class="collapse navbar-collapse">
							<label style="font-size: 15px; color: #374b84">${message}</label>
					</div>
				</g:if>
				<g:if test="${flash.message}">
					<div class="collapse navbar-collapse">
						<label style="font-size: 12px; color: #84373a">${flash.message}</label>
					</div>
				</g:if>
					<form controller="login" action='/amorDePatitas/j_spring_security_check' method='POST' id='loginForm' class='navbar-form navbar-right pull-right' autocomplete='off'>

						<div class="form-group">
							<label for="j_username" class="cols-sm-2 custom-padding">Usuario</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-users fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" placeholder="Usuario" name="j_username" id="j_username" required>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label for="j_password" class="cols-sm-2 custom-padding">Contraseña</label>
							<div class="cols-sm-10">
								<div class="input-group">
									<span class="input-group-addon"><i class="fa fa-lock fa" aria-hidden="true"></i></span>
									<input type="text" class="form-control" placeholder="Contraseña" name="j_password" id="j_password" required>
								</div>
							</div>
						</div>

						<div class="form-group" style="padding-top: 25px">
							<div class="input-group">
								<input type="submit" class="btn btn-info btn-block login" type="submit" value="Iniciar Sesion"/>
							</div>
							<div style="padding-left: 20px; padding-top: 5px" class="input-group">
								<label id="cancelar" name="cancelar" style="color: black; font-family: 'Passion One'">cancelar</label>
							</div>
						</div>
					</form>
				</div><!-- /.navbar-collapse -->
			</div><!-- /.container-fluid -->
		</div>
	</div>
</div>
<script>
    $(document).ready(function(){
        $("#cancelar").click(function(){
            window.location.replace("/amorDePatitas/");
        });
    });
</script>
</body>
</html>