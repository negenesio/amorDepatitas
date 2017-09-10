<!DOCTYPE html>
<html>
<head>
	<title><g:layoutTitle default="Grails"/></title>
	<asset:stylesheet src="application.css"/>
	<g:layoutHead/>
</head>
<body>
<g:if test="${!session.usuario}">
<nav class="navbar navbar-default navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
			<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>
			<form class="navbar-form navbar-right pull-right">
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Usuario">
				</div>
				<div class="form-group">
					<input type="text" class="form-control" placeholder="Contraseña">
				</div>
				<button type="submit" class="btn btn-default">Iniciar Sesion</button>
			</form>
		</div><!-- /.navbar-collapse -->
	</div><!-- /.container-fluid -->
</nav>
</g:if>
<g:else>
	<nav class="navbar navbar-default navbar-inverse" role="navigation">
		<div class="container-fluid">
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<label class="navbar-left pull-left header-title" style="font-family: 'Passion One', cursive;">Amor de Patitas</label><i class="fa fa-paw fa-4 pull-left header-title" aria-hidden="true"></i>
					<div class="form-group">
						<label class="navbar-rigth pull-rigth header-title" style="font-family: 'Passion One', cursive;">${session.usuario.usuario}</label>
					</div>
					<button type="submit" class="btn btn-default">Cerrar Sesion</button>
			</div><!-- /.navbar-collapse -->
		</div><!-- /.container-fluid -->
	</nav>
</g:else>
	<g:layoutBody/>
</body>
</html>