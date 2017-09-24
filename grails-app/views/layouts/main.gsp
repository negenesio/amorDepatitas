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
	<% def springSecurityService %>
	<g:layoutHead/>
</head>
<body>
<nav class="navbar-default navbar-inverse" role="navigation">
	<sec:ifLoggedIn>
		<div class="container-fluid">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>
				<label class="navbar-right pull-right header-title" style="text-align: right; font-family: 'Passion One', cursive;">${sec.loggedInUserInfo(field:'username')} <g:link controller="logout">Desconectarse</g:link></label>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</sec:ifLoggedIn>
	<sec:ifNotLoggedIn>
		<div class="container-fluid">
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
</nav>
<sec:ifLoggedIn>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-2 col-sm-4 sidebar1">
				<div class="logo">
					<img src="http://lorempixel.com/output/people-q-g-64-64-1.jpg" class="img-responsive center-block" alt="Logo">
				</div>
				<br>
				<div class="left-navigation">
					<ul class="list">
						<h5><strong>WHEREABOUTS</strong></h5>
						<li><g:link style="color:white" controller="mascota" action="index">Mascotas</g:link></li>
						<li><g:link style="color:white" controller="mascota" action="index">Office</g:link></li>
						<li><g:link style="color:white" controller="mascota" action="index">School</g:link></li>
						<li><g:link style="color:white" controller="mascota" action="index">Gym</g:link></li>
						<li><g:link style="color:white" controller="mascota" action="index">Art Class</g:link></li>
						<li><g:link style="color:white" controller="mascota" action="index">Hike Club</g:link></li>
						<li> <a style="color:white" href="#" data-toggle="collapse" data-target="#mascotas"> <i class="fa fa-paw"></i> <span class="nav-label">Graphs</span> <span class="fa fa-chevron-left pull-right"></span> </a>
							<ul class="sub-menu collapse list" id="mascotas">
								<li><g:link style="color:white" controller="mascota" action="index">Nueva Mascota</g:link></li>
								<li><g:link style="color:white" controller="mascota" action="index">Nueva Mascota</g:link></li>
								<li><g:link style="color:white" controller="mascota" action="index">Nueva Mascota</g:link></li>
							</ul>
						</li>
					</ul>
				</div>
			</div>
			<div class="col-md-10 col-sm-8 main-content">
				<!--Main content code to be written here -->
				<h1></h1>
				<h3></h3>
			</div>
		</div>
	</div>
</sec:ifLoggedIn>
<g:layoutBody/>
</body>
</html>