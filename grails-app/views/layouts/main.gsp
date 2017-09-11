<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>
	<asset:stylesheet src="application.css"/>
	<asset:stylesheet src="usuario/indexRegistracion.css"/>
	<% def springSecurityService %>
	<g:layoutHead/>
</head>
<body>
<nav class="navbar navbar-default navbar-inverse" role="navigation">
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
<g:layoutBody/>
</body>
</html>