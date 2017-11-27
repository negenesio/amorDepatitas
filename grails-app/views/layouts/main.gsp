<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>

	<asset:stylesheet src="application.css"/>
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
	<g:javascript src="moment.js"/>

	<style>
		.checkbox {
			padding-left: 20px; }
		.checkbox label {
			display: inline-block;
			position: relative;
			padding-left: 5px; }
		.checkbox label::before {
			content: "";
			display: inline-block;
			position: absolute;
			width: 17px;
			height: 17px;
			left: 0;
			margin-left: -20px;
			border: 1px solid #cccccc;
			border-radius: 3px;
			background-color: #fff;
			-webkit-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
			-o-transition: border 0.15s ease-in-out, color 0.15s ease-in-out;
			transition: border 0.15s ease-in-out, color 0.15s ease-in-out; }
		.checkbox label::after {
			display: inline-block;
			position: absolute;
			width: 16px;
			height: 16px;
			left: 0;
			top: 0;
			margin-left: -20px;
			padding-left: 3px;
			padding-top: 1px;
			font-size: 11px;
			color: #555555; }
		.checkbox input[type="checkbox"] {
			opacity: 0; }
		.checkbox input[type="checkbox"]:focus + label::before {
			outline: thin dotted;
			outline: 5px auto -webkit-focus-ring-color;
			outline-offset: -2px; }
		.checkbox input[type="checkbox"]:checked + label::after {
			font-family: 'FontAwesome';
			content: "\f00c"; }
		.checkbox input[type="checkbox"]:disabled + label {
			opacity: 0.65; }
		.checkbox input[type="checkbox"]:disabled + label::before {
			background-color: #eeeeee;
			cursor: not-allowed; }
		.checkbox.checkbox-circle label::before {
			border-radius: 50%; }
		.checkbox.checkbox-inline {
			margin-top: 0; }

		.checkbox-primary input[type="checkbox"]:checked + label::before {
			background-color: #428bca;
			border-color: #428bca; }
		.checkbox-primary input[type="checkbox"]:checked + label::after {
			color: #fff; }

		.checkbox-danger input[type="checkbox"]:checked + label::before {
			background-color: #d9534f;
			border-color: #d9534f; }
		.checkbox-danger input[type="checkbox"]:checked + label::after {
			color: #fff; }

		.checkbox-info input[type="checkbox"]:checked + label::before {
			background-color: #5bc0de;
			border-color: #5bc0de; }
		.checkbox-info input[type="checkbox"]:checked + label::after {
			color: #fff; }

		.checkbox-warning input[type="checkbox"]:checked + label::before {
			background-color: #f0ad4e;
			border-color: #f0ad4e; }
		.checkbox-warning input[type="checkbox"]:checked + label::after {
			color: #fff; }

		.checkbox-success input[type="checkbox"]:checked + label::before {
			background-color: #5cb85c;
			border-color: #5cb85c; }
		.checkbox-success input[type="checkbox"]:checked + label::after {
			color: #fff; }

		.radio {
			padding-left: 20px; }
		.radio label {
			display: inline-block;
			position: relative;
			padding-left: 5px; }
		.radio label::before {
			content: "";
			display: inline-block;
			position: absolute;
			width: 17px;
			height: 17px;
			left: 0;
			margin-left: -20px;
			border: 1px solid #cccccc;
			border-radius: 50%;
			background-color: #fff;
			-webkit-transition: border 0.15s ease-in-out;
			-o-transition: border 0.15s ease-in-out;
			transition: border 0.15s ease-in-out; }
		.radio label::after {
			display: inline-block;
			position: absolute;
			content: " ";
			width: 11px;
			height: 11px;
			left: 3px;
			top: 3px;
			margin-left: -20px;
			border-radius: 50%;
			background-color: #555555;
			-webkit-transform: scale(0, 0);
			-ms-transform: scale(0, 0);
			-o-transform: scale(0, 0);
			transform: scale(0, 0);
			-webkit-transition: -webkit-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
			-moz-transition: -moz-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
			-o-transition: -o-transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33);
			transition: transform 0.1s cubic-bezier(0.8, -0.33, 0.2, 1.33); }
		.radio input[type="radio"] {
			opacity: 0; }
		.radio input[type="radio"]:focus + label::before {
			outline: thin dotted;
			outline: 5px auto -webkit-focus-ring-color;
			outline-offset: -2px; }
		.radio input[type="radio"]:checked + label::after {
			-webkit-transform: scale(1, 1);
			-ms-transform: scale(1, 1);
			-o-transform: scale(1, 1);
			transform: scale(1, 1); }
		.radio input[type="radio"]:disabled + label {
			opacity: 0.65; }
		.radio input[type="radio"]:disabled + label::before {
			cursor: not-allowed; }
		.radio.radio-inline {
			margin-top: 0; }

		.radio-primary input[type="radio"] + label::after {
			background-color: #428bca; }
		.radio-primary input[type="radio"]:checked + label::before {
			border-color: #428bca; }
		.radio-primary input[type="radio"]:checked + label::after {
			background-color: #428bca; }

		.radio-danger input[type="radio"] + label::after {
			background-color: #d9534f; }
		.radio-danger input[type="radio"]:checked + label::before {
			border-color: #d9534f; }
		.radio-danger input[type="radio"]:checked + label::after {
			background-color: #d9534f; }

		.radio-info input[type="radio"] + label::after {
			background-color: #5bc0de; }
		.radio-info input[type="radio"]:checked + label::before {
			border-color: #5bc0de; }
		.radio-info input[type="radio"]:checked + label::after {
			background-color: #5bc0de; }

		.radio-warning input[type="radio"] + label::after {
			background-color: #f0ad4e; }
		.radio-warning input[type="radio"]:checked + label::before {
			border-color: #f0ad4e; }
		.radio-warning input[type="radio"]:checked + label::after {
			background-color: #f0ad4e; }

		.radio-success input[type="radio"] + label::after {
			background-color: #5cb85c; }
		.radio-success input[type="radio"]:checked + label::before {
			border-color: #5cb85c; }
		.radio-success input[type="radio"]:checked + label::after {
			background-color: #5cb85c; }
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
													<sec:ifAnyGranted roles='ROLE_POSTULACION'>
														<li><g:link controller="postulacion" action="busquedaIndex">Buscar</g:link></li>
													</sec:ifAnyGranted>
													%{--<sec:ifAnyGranted roles='ROLE_MASCOTA'>
														<li><g:link controller="mascota" action="postularMascotaIndex">Postular</g:link></li>
													</sec:ifAnyGranted>--}%
													%{--</g:if>--}%
												</ul>
										</div>
									</div><!-- end row -->
								</li>
							</ul>
						</li>
						<li class="nav-divider"></li>
						<sec:ifAnyGranted roles='ROLE_ENCUENTRO'>
						<li><g:link controller="encuentro" action="encuentroIndex" class="dropdown-toggle" data-toggle="dropdown">Mis Encuentros</g:link></li>
							<li class="nav-divider"></li>
						</sec:ifAnyGranted>
						<sec:ifAnyGranted roles='ROLE_CALIFICACION'>
							<li><g:link controller="calificacionEncuentro" action="califiacionIndex" class="dropdown-toggle" data-toggle="dropdown">Mis Calificaciones</g:link></li>
							<li class="nav-divider"></li>
						</sec:ifAnyGranted>


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