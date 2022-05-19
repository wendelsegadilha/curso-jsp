<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<jsp:include page="head.jsp"></jsp:include>

<body>
<!-- Pre-loader start -->
<jsp:include page="theme-loader.jsp"></jsp:include>

<!-- Pre-loader end -->
<div id="pcoded" class="pcoded">
	<div class="pcoded-overlay-box"></div>
	<div class="pcoded-container navbar-wrapper">
	
		<jsp:include page="navbar.jsp"></jsp:include>

		<div class="pcoded-main-container">
			<div class="pcoded-wrapper">
				
				<jsp:include page="navbar-mainmenu.jsp"></jsp:include>
				
				<div class="pcoded-content">
					<!-- Page-header start -->
					<jsp:include page="page-header.jsp"></jsp:include>
					
					<!-- Page-header end -->
					<div class="pcoded-inner-content">
						<!-- Main-body start -->
						<div class="main-body">
							<div class="page-wrapper">
								<!-- Page-body start -->
								<div class="page-body">
									<div class="row">
                                            <div class="col-sm-12">
                                                <!-- Basic Form Inputs card start -->
                                                <div class="card">
                                                    <div class="card-block">
                                                        <h4 class="sub-title">Cad. Usuário</h4>
		                                              		<div style="color: #000; margin-bottom: 20px;">
		                                              			<span id="msg">${msg}</span>
		                                              		</div>
          												 <form class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post" id="formUser">
          												 	
          												 	<input type="hidden" name="acao" id="acao" value="">
          												 
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" id="id" name="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID:</label>
                                                            </div>
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" value="${modelLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="email" id="email" class="form-control" required="required" autocomplete="off" value="${modelLogin.email}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">E-mail:</label>
                                                            </div>
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input type="text" name="login" id="login" class="form-control" required="required" autocapitalize="off" value="${modelLogin.login}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="password" name="senha" id="senha" class="form-control" required="required" autocapitalize="off" value="${modelLogin.senha}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha:</label>
                                                            </div>
                                                            
                                                           <button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm()">Novo</button>
												           <button class="btn btn-success waves-effect waves-light">Salvar</button>
												           <button type="button" class="btn btn-info waves-effect waves-light" onclick="criaDeleteComAjax()">Excluir</button>
												           <button type="button" class="btn btn-sencondary" data-toggle="modal" data-target="#modalExemploUsuario">Pesquisar</button>
												            
                                                        </form> 
                                                </div>
                                                   		
                                                </div>
                                                </div>
                                                </div>
								</div>
								<!-- Page-body end -->
							</div>
							<div id="styleSelector"> </div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>


<!-- Required Jquery -->
<jsp:include page="arquivo-javascript.jsp"></jsp:include>


<!-- Modal -->
<div class="modal fade" id="modalExemploUsuario" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Pesquisa de usuário</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Fechar">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      
        <div class="input-group mb-3">
		  <input type="text" class="form-control" placeholder="nome do usuário" aria-label="Nome do usuário" id="nomeBusca" aria-describedby="button-addon2">
		  <div class="input-group-append">
		    <button class="btn btn-success" type="button" id="button-addon2" onclick="buscarUsuario()">Buscar</button>
		  </div>
		</div>
		
		<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Nome</th>
		      <th scope="col">Ver</th>
		    </tr>
		  </thead>
		  <tbody>
		    
		  </tbody>
		</table>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">
	
	function limparForm(){
		var elementos = document.getElementById("formUser").elements; /*retorna os elementos html dentro do form*/
		
		for (var p = 0; p < elementos.length; p++) {
			elementos[p].value = '';
		}
	}
	
	function criarDelete() {
		
		if(confirm('Deseja realmente excluir?')){
			var form = document.getElementById("formUser");
			form.method = 'get';
			document.getElementById("acao").value = 'deletar';
			form.submit();			
		}
	}
	
	function criaDeleteComAjax() {
		
		if(confirm('Deseja realmente excluir?')){
			var urlAction = document.getElementById("formUser").action;
			var idUser = document.getElementById("id").value;
			
			$.ajax({
				
				method: "get",
				url: urlAction,
				data: "id=" + idUser + "&acao=deletarAjax",
				success: function(response) {
					document.getElementById("msg").textContent = response;
					limparForm();
				}
				
			}).fail(function(xhr, status, errorThrown){
				alert('Erro ao excluir usuário! Erro: ' + xhr.responseText);
			});
			
		}
		
	}
	
	function buscarUsuario() {
		var nomeBusca = document.getElementById("nomeBusca").value;
		
		/*validando entrada de dados*/
		if(nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {
			alert(nomeBusca);
		}
	}
	
</script>
</body>

</html>
