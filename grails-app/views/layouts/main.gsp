<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>
	<asset:stylesheet src="application.css"/>
	<asset:stylesheet src="usuario/indexRegistracion.css"/>
	<asset:stylesheet src="sidebar.css"/>
	<g:javascript src="jquery.min.js"/>
	<g:javascript src="jquery-ui.min.js"/>
	<g:javascript src="bootstrapvalidator.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<script src="../js/bootsnav.js"></script>
	<link href="../css/animate.css" rel="stylesheet">
	<link href="../css/bootsnav.css" rel="stylesheet">
	<link rel="stylesheet" type="text/css" href="../css/style.css"/>
	<g:javascript src="script.js"/>

	<% def springSecurityService %>
	<g:layoutHead/>
</head>
<body>
	<sec:ifLoggedIn>
		%{--<nav class="navbar-default navbar-inverse" role="navigation">--}%
			%{--<div class="container-fluid">--}%
				%{--<!-- Collect the nav links, forms, and other content for toggling -->--}%
				%{--<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">--}%
					%{--<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>--}%
					%{--<label class="navbar-right pull-right header-title" style="text-align: right; font-family: 'Passion One', cursive;">${sec.loggedInUserInfo(field:'username')} <g:link controller="logout">Desconectarse</g:link></label>--}%
				%{--</div><!-- /.navbar-collapse -->--}%
			%{--</div><!-- /.container-fluid -->--}%
		%{--</nav>--}%
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
													<li><a href="#">Crear</a></li>
													<li><a href="#">Buscar</a></li>
													<li><a href="#">Postular</a></li>
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