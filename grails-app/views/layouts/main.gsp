<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>
	<asset:stylesheet src="application.css"/>
	<asset:stylesheet src="usuario/indexRegistracion.css"/>
	<asset:stylesheet src="sidebar.css"/>
	<g:javascript src="script.js"/>
	<g:javascript src="jquery.min.js"/>
	<g:javascript src="jquery-ui.min.js"/>
	<g:javascript src="bootstrapvalidator.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<g:javascript src="bootstrap-select.min.js"/>
	<g:javascript src="fileinput.min.js"/>
	<g:javascript src="locales/es.js"/>
	<script src="../js/bootsnav.js"></script>
	<link href="../css/animate.css" rel="stylesheet">
	<link href="../css/bootsnav.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/style.css"/>
	<link rel="stylesheet" type="text/css" href="../css/bootstrap-select.min.css"/>
	<link href="../css/fileinput.min.css" rel="stylesheet">
	<link href="../css/fileinput-rtl.min.css" rel="stylesheet">
	<style>
	.btn-default.btn-on.active{background-color: #0f23b7;color: white;}
	.btn-default.btn-off.active{background-color: #DA4F49;color: white;}

	.btn-default.btn-on-1.active{background-color: #006FFC;color: white;}
	.btn-default.btn-off-1.active{background-color: #DA4F49;color: white;}

	.btn-default.btn-on-2.active{background-color: #00D590;color: white;}
	.btn-default.btn-off-2.active{background-color: #A7A7A7;color: white;}

	.btn-default.btn-on-3.active{color: #5BB75B;font-weight:bolder;}
	.btn-default.btn-off-3.active{color: #DA4F49;font-weight:bolder;}

	.btn-default.btn-on-4.active{background-color: #006FFC;color: #5BB75B;}
	.btn-default.btn-off-4.active{background-color: #DA4F49;color: #DA4F49;}
	background-color: #ccc;
	</style>
	<% def springSecurityService %>
	<g:layoutHead/>
</head>
<body>
	<sec:ifLoggedIn>
		<nav class="navbar navbar-inverse navbar-sidebar bootsnav">
			<div class="container">
				<!-- Start Header Navigation -->
				<div class="navbar-header">
				<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
						<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>
						<br>
					</div>
					<label class="header-title pull-left" style="color: #5e5e5e;font-family: 'Passion One', cursive; font-size: 15px">Usuario: ${sec.loggedInUserInfo(field:'username')}</label>
				</div>
				<!-- End Header Navigation -->

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse" id="navbar-menu">
					<!-- Start Menu -->
					<ul class="nav navbar-nav navbar-inverse" data-in="fadeInDown" data-out="fadeOutUp">
						<li class="dropdown megamenu-fw">
							<a href="#" class="dropdown-toggle" data-toggle="dropdown">Mascotas</a>
							<ul class="dropdown-menu megamenu-content animated fadeOutUp" role="menu" style="display: none; opacity: 1;">
								<li>
									<div class="row">
										<div class="col-menu col-md-3">
												<ul class="menu-col">
													<li><g:link controller="mascota" action="createIndex">Crear</g:link></li>
													<sec:ifAnyGranted roles='ROLE_MASCOTA'>
													<li><a href="#">Buscar</a></li>
													<li><a href="#">Postular</a></li>
													</sec:ifAnyGranted>
													%{--</g:if>--}%
												</ul>
										</div>
									</div><!-- end row -->
								</li>
							</ul>
						</li>
						<li class="nav-divider"></li>
						<li><g:link controller="logout">Desconectarse</g:link></li>
					</ul>
					<!-- End Menu -->
				</div><!-- /.navbar-collapse -->
			</div>
		</nav>
	</sec:ifLoggedIn>
	<sec:ifNotLoggedIn>
		<div class="container-fluid" style="background-color: black">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>
				<form controller="login" action='/amorDePatitas/j_spring_security_check' method='POST' id='loginForm' class='navbar-form navbar-right pull-right' autocomplete='off'>
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Usuario" name="j_username" required>
					</div>
					<div class="form-group">
						<input type="password" class="form-control" placeholder="Contraseña" name="j_password" required>
					</div>
					<button type="submit" class="btn btn-default">Iniciar Sesion</button>
				</form>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</sec:ifNotLoggedIn>
<g:layoutBody/>
</body>
</html>