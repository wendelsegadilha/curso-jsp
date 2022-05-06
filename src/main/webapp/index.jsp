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
		h6 {
			position: absolute;
			top: 50%;
			left: 32%;
			color: red;
		}
	</style>
</head>
<body>
	<h3>Curso JSP - Jdev Treinamento</h3>
	
	<form action="ServletLogin" method="post" class="row g-3">
	<input type="hidden" value="<%=request.getParameter("url")%>" name="url">
		<div class="col-md-6">
			<label class="form-label">Login:</label>
			<input class="form-control" type="text" name="login">
		</div>

		<div class="col-md-6">
			<label class="form-label">Senha:</label>
			<input class="form-control" type="password" name="senha">
		</div>

		<input type="submit" class="btn btn-primary" value="Enviar">

	</form>
	<h6>${msg}</h6>

	<!-- Option 1: Bootstrap Bundle with Popper -->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>