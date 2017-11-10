<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>

	<asset:stylesheet src="application.css"/>
	%{--<asset:stylesheet src="usuario/indexRegistracion.css"/>--}%
	<asset:stylesheet src="sidebar.css"/>
	<asset:stylesheet src="bootstrap.min.css"/>
	<asset:stylesheet src="bootstrapvalidator.min.css"/>
	<asset:stylesheet src="animate.css"/>
	<asset:stylesheet src="bootsnav.css"/>
	<asset:stylesheet src="style.css"/>
	<asset:stylesheet src="bootstrap-select.min.css"/>
	<asset:stylesheet src="fileinput.min.css"/>
	<asset:stylesheet src="fileinput-rtl.min.css"/>
	<asset:stylesheet src="ballon.css"/>

	<g:javascript src="jquery.min.js"/>
	<g:javascript src="jquery-ui.min.js"/>
	<g:javascript src="bootstrapvalidator.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<g:javascript src="bootstrap-select.min.js"/>
	<g:javascript src="fileinput.min.js"/>
	<g:javascript src="locales/es.js"/>
	<g:javascript src="bootsnav.js"/>
	%{--<g:javascript src="../../bower_components/bootstrap-timepicker/js/bootstrap-timepicker.js"/>--}%

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

		/**
         * Tooltip Styles
         */

		/* Add this attribute to the element that needs a tooltip */
		[data-tooltip] {
			position: relative;
			z-index: 2;
			cursor: pointer;
		}

		/* Hide the tooltip content by default */
		[data-tooltip]:before,
		[data-tooltip]:after {
			visibility: hidden;
			-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=0)";
			filter: progid: DXImageTransform.Microsoft.Alpha(Opacity=0);
			opacity: 0;
			pointer-events: none;
		}

		/* Position tooltip above the element */
		[data-tooltip]:before {
			position: absolute;
			bottom: 150%;
			left: 50%;
			margin-bottom: 5px;
			margin-left: -80px;
			padding: 7px;
			width: 160px;
			-webkit-border-radius: 3px;
			-moz-border-radius: 3px;
			border-radius: 3px;
			background-color: #000;
			background-color: hsla(0, 0%, 20%, 0.9);
			color: #fff;
			content: attr(data-tooltip);
			text-align: center;
			font-size: 14px;
			line-height: 1.2;
		}

		/* Triangle hack to make tooltip look like a speech bubble */
		[data-tooltip]:after {
			position: absolute;
			bottom: 150%;
			left: 50%;
			margin-left: -5px;
			width: 0;
			border-top: 5px solid #000;
			border-top: 5px solid hsla(0, 0%, 20%, 0.9);
			border-right: 5px solid transparent;
			border-left: 5px solid transparent;
			content: " ";
			font-size: 0;
			line-height: 0;
		}

		/* Show tooltip content on hover */
		[data-tooltip]:hover:before,
		[data-tooltip]:hover:after {
			visibility: visible;
			-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(Opacity=100)";
			filter: progid: DXImageTransform.Microsoft.Alpha(Opacity=100);
			opacity: 1;
		}
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
						<g:link controller="usuario" action="indexUsuario" class="dropdown-toggle" data-toggle="dropdown">Mascotas</g:link>
							<ul class="dropdown-menu megamenu-content animated fadeOutUp" role="menu" style="display: none; opacity: 1;">
								<li>
									<div class="row">
										<div class="col-menu col-md-3">
												<ul class="menu-col">
													<li><g:link controller="mascota" action="createIndex">Crear</g:link></li>
													<sec:ifAnyGranted roles='ROLE_MASCOTA'>
													<li><a href="#">Buscar</a></li>
													<li><g:link controller="mascota" action="postularMascotaIndex">Postular</g:link></li>
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