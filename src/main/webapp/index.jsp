<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Curso JSP</title>
	<!-- Bootstrap CSS -->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

	<style type="text/css">
		form{
			position: absolute;
			top: 30%;
			left: 32%;
		}
		
		h3{
			position: absolute;
			top: 23%;
			left: 32%;
		}
		.alerta {
			position: absolute;
			top: 70%;
			left: 39%;
		}
	</style>
</head>
<body>
	<h3>Curso JSP - Jdev Treinamento</h3>
	
	<form action="<%=request.getContextPath()%>/ServletLogin" method="post" class="row g-3 needs-validation" novalidate>
	<input type="hidden" value="<%=request.getParameter("url")%>" name="url">
		<div class="mb-3">
			<label class="form-label">Login:</label>
			<input class="form-control" type="text" name="login" required>
			<div class="invalid-feedback">Informe o login</div>
			<div class="valid-feedback">ok</div>
		</div>

		<div class="mb-3">
			<label class="form-label">Senha:</label>
			<input class="form-control" type="password" name="senha" required>
			<div class="invalid-feedback">Informe a senha</div>
			<div class="valid-feedback">ok</div>
		</div>

		<input type="submit" class="btn btn-primary" value="Enviar">
		
	</form>
	<div class="mb-3">
		<div class="alert alert-danger alerta" role="alert">
			${msg}
		</div>
	</div>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

<script type="text/javascript">
	// Example starter JavaScript for disabling form submissions if there are invalid fields
	(function() {
		'use strict'

		// Fetch all the forms we want to apply custom Bootstrap validation styles to
		var forms = document.querySelectorAll('.needs-validation')

		// Loop over them and prevent submission
		Array.prototype.slice.call(forms).forEach(function(form) {
			form.addEventListener('submit', function(event) {
				if (!form.checkValidity()) {
					event.preventDefault()
					event.stopPropagation()
				}

				form.classList.add('was-validated')
			}, false)
		})
	})()
</script>

</body>
</html>