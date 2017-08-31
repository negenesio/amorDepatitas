<%@ page contentType="text/html;charset=UTF-8" %>
@import 'font-awesome';

<html>
<head>
	<meta name="layout" content="main"/>
	<g:javascript src="jquery.min.js"/>
	<g:javascript src="jquery-ui.min.js"/>
	<g:javascript src="bootstrapvalidator.min.js"/>
	<g:javascript src="bootstrap.min.js"/>
	<link rel="stylesheet" type="text/css" href="css/bootstrap.min.css" />
	<link rel="stylesheet" type="text/css" href="css/bootstrapvalidator.min.css" />

	<style type="text/css">
	#profileForm .form-control-feedback {
		top: 25px;
		right: 0px;
	}
	</style>
</head>

<body>
<i class="fa fa-camera-retro fa-lg"></i>
<label>hola</label>
<input value="test bootstrap css in gsp" type="button" id="test" class="btn btn-lg btn-primary btn-block"/>


<form id="profileForm">
	<div class="form-group">
		<label>Email address</label>
		<input type="text" class="form-control" name="email" />
	</div>
	<div class="form-group">
		<label>Password</label>
		<input type="password" class="form-control" name="password" />
	</div>
</form>
<script>
    $(document).ready(function() {
        $('#profileForm').bootstrapValidator({
            feedbackIcons: {
                valid: 'glyphicon glyphicon-ok',
                invalid: 'glyphicon glyphicon-remove',
                validating: 'glyphicon glyphicon-refresh'
            },
            fields: {
                email: {
                    validators: {
                        notEmpty: {
                            message: 'The email address is required'
                        },
                        emailAddress: {
                            message: 'The email address is not valid'
                        }
                    }
                },
                password: {
                    validators: {
                        notEmpty: {
                            message: 'The password is required'
                        }
                    }
                }
            }
        });
    });
</script>
</body>
</html>
%{--isaacn.182@gmail.com--}%
%{--Isaacn Nassar--}%

%{--eric.dominguez@live.com.ar--}%
%{--Eric Dominguez--}%

%{--ignaciofernandez85@gmail.com--}%
%{--Ignacio Fernandez--}%
