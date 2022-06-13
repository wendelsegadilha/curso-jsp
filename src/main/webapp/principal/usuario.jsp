<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
          												 <form class="form-material" enctype="multipart/form-data" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post" id="formUser">
          												 	
          												 	<input type="hidden" name="acao" id="acao" value="">
          												 
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" id="id" name="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default input-group mb-4">
                                                            	<c:if test="${modelLogin.fotouser != '' && modelLogin.fotouser != null}">
                                                            		<a href="<%= request.getContextPath() %>/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}">
                                                            			<img alt="Img 01" id="fotoembase64" width="70" src="${modelLogin.fotouser}">
                                                            		</a>
                                                            	</c:if>
                                                            	<c:if test="${modelLogin.fotouser == '' || modelLogin.fotouser == null}">
                                                            		<img alt="Img 01" id="fotoembase64" width="70" src="assets/images/user.png">
                                                            	</c:if>
                                                            	<input type="file" id="fileFoto" name="fileFoto" onchange="vizualizaImg('fotoembase64', 'fileFoto')" accept="image/*" class="form-control-file" style="margin-left: 5px; margin-top: 15px;">
                                                            </div>
                                                            
                                                              <div class="form-group form-default form-static-label">
                                                                <input type="text" name="nome" id="nome" class="form-control" required="required" value="${modelLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="dataNascimento" id="dataNascimento" class="form-control" required="required" value="${modelLogin.dataNascimento}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Dat. Nascimento:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="email" id="email" class="form-control" required="required" autocomplete="off" value="${modelLogin.email}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">E-mail:</label>
                                                            </div>
                                                            
															<div class="form-group form-default form-static-label">
																<select class="form-control"
																	aria-label="Default select example" name="perfil">
																	<option>[selecione o perfil]</option>
																	
																	<option value="ADMINISTRADOR"
																		<% 
																			ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																			if (modelLogin != null && modelLogin.getPerfil().equals("ADMINISTRADOR")){
																				out.print(" selected=\"selected\" ");
																			}
																		%>
																	>Administrador</option>
																	<option value="SECRETARIA"
																		<% 
																			modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																			if (modelLogin != null && modelLogin.getPerfil().equals("SECRETARIA")){
																				out.print(" selected=\"selected\" ");
																			}
																		%>
																	>Secretária</option>
																	<option value="AUXILIAR"
																		<% 
																			modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																			if (modelLogin != null && modelLogin.getPerfil().equals("AUXILIAR")){
																				out.print(" selected=\"selected\" ");
																			}
																		%>
																	>Aúxiliar</option>
																</select>
																 <span class="form-bar"></span>
                                                                <label class="float-label">Perfil:</label>
															</div>
															
															<div class="form-group form-default form-static-label">
                                                                <input type="text" onblur="pesquisaCep()" name="cep" id="cep" class="form-control" required="required" autocapitalize="off" value="${modelLogin.cep}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Cep:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="logradouro" id="logradouro" class="form-control" required="required" autocapitalize="off" value="${modelLogin.logradouro}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Logradouro:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="bairro" id="bairro" class="form-control" required="required" autocapitalize="off" value="${modelLogin.bairro}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Bairro:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="localidade" id="localidade" class="form-control" required="required" autocapitalize="off" value="${modelLogin.localidade}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Localidade:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="uf" id="uf" class="form-control" required="required" autocapitalize="off" value="${modelLogin.uf}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Estado:</label>
                                                            </div>
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="numero" id="numero" class="form-control" required="required" autocapitalize="off" value="${modelLogin.numero}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Número:</label>
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
                                                            
                                                            <div class="form-group form-default form-static-label">
                                                            	<input type="radio" name="sexo" checked="checked" value="MASCULINO"
                                                            		<% 
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")){
																			out.print(" checked=\"checked\" ");
																		}
																	%>
                                                            	
                                                            	> Masculino
                                                            	<input type="radio" name="sexo" value="FEMININO"
                                                            		<% 
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")){
																			out.print(" checked=\"checked\" ");
																		}
																	%>
                                                            	> Feminino
                                                            </div>
                                                            
                                                           <button type="button" class="btn btn-primary waves-effect waves-light" onclick="limparForm()">Novo</button>
												           <button class="btn btn-success waves-effect waves-light">Salvar</button>
												           <button type="button" class="btn btn-info waves-effect waves-light" onclick="criaDeleteComAjax()">Excluir</button>
												           <button type="button" class="btn btn-sencondary" data-toggle="modal" data-target="#modalExemploUsuario">Pesquisar</button>
												           <c:if test="${modelLogin.id > 0}">
												          		<a href="<%= request.getContextPath() %>/ServletTelefone?iduser=${modelLogin.id}" class="btn btn-primary waves-effect waves-light">Telefone</a> 
												           </c:if>
                                                        
                                                        </form> 
                                                </div>
                                                   		
                                                </div>

												<div style="height: 300px; overflow: scroll;">
													<table class="table" id="tabelaResultadosView">
														<thead>
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Nome</th>
																<th scope="col">E-mail</th>
																<th scope="col">Ação</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${modelLogins}" var="ml">
																<tr>
																	<td><c:out value="${ml.id}" /></td>
																	<td><c:out value="${ml.nome}" /></td>
																	<td><c:out value="${ml.email}" /></td>	
																	<td><a class="btn btn-success" href="ServletUsuarioController?acao=buscarEditar&id=${ml.id}">Ver</a></td>															</tr>
															</c:forEach>
														</tbody>
													</table>
												</div>

												<nav aria-label="Page navigation example">
													<ul class="pagination">
													
														<%
														int totalPagina = (int) request.getAttribute("totalPagina");
														for (int p = 0; p < totalPagina; p++) {
															String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
															out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+url+"\">"+(p + 1)+"</a></li>");
														}
														%>
													</ul>
												</nav>

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
		
		<div style="height: 300px; overflow: scroll;">
			<table class="table" id="tabelaResultados">
			  <thead>
			    <tr>
			      <th scope="col">ID</th>
			      <th scope="col">Nome</th>
			      <th scope="col">E-mail</th>
			      <th scope="col">Ação</th>
			    </tr>
			  </thead>
			  <tbody>
			  </tbody>
			</table>
		</div>

		<nav aria-label="Page navigation example">
			<ul class="pagination" id="ulPaginacaoUserAjax">
			
			</ul>
		</nav>
					<span id="totalResultados"></span>
		
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fechar</button>
      </div>
    </div>
  </div>
</div>

<script type="text/javascript">

$( function() {
	  
	  $("#dataNascimento").datepicker({
		    dateFormat: 'dd/mm/yy',
		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Próximo',
		    prevText: 'Anterior'
		});
} );


$("#numero").keypress(function (event){
	return /\d/.test(String.fromCharCode(event.keyCode));
	
});


$("#cep").keypress(function (event){
	return /\d/.test(String.fromCharCode(event.keyCode));
	
});


	function pesquisaCep() {
		
		var cep = $("#cep").val();
		
		//Consulta o webservice viacep.com.br/
        $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {

            if (!("erro" in dados)) {
                //Atualiza os campos com os valores da consulta.
                $("#logradouro").val(dados.logradouro);
                $("#bairro").val(dados.bairro);
                $("#localidade").val(dados.localidade);
                $("#uf").val(dados.uf);
            } //end if.
            else {
                //CEP pesquisado não foi encontrado.
                alert("CEP não encontrado.");
            }
        });
	}

	function vizualizaImg(fotoembase64, filefoto) {
		var preview = document.getElementById(fotoembase64); //Campo img do HTML
		var fileUser = document.getElementById(filefoto).files[0]; //Campo file do HTML
		var reader = new FileReader();
		
		reader.onloadend = function () {
			preview.src = reader.result; // carrega a foto na tela
		}
		
		if (fileUser) {
			reader.readAsDataURL(fileUser); // preview da imagem
		} else {
			preview.src = '';
		}
	}
	
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
	
	function buscaUserPagAjax(url) {
		
		var urlAction = document.getElementById("formUser").action
		var nomeBusca = document.getElementById("nomeBusca").value;
		
		$.ajax({
			
			method: "get",
			url: urlAction,
			data: url,
			success: function(response, textStatus, xhr) {
				
				var json = JSON.parse(response);
				
				$('#tabelaResultados > tbody > tr').remove();
				$("#ulPaginacaoUserAjax > li").remove();
				
				for (var p = 0; p < json.length; p++) {
					$('#tabelaResultados > tbody').append('<tr><td>'+json[p].id+'</td><td>'+json[p].nome+'</td><td>'+json[p].email+'</td><td><button class="btn btn-info" onclick="verEditar('+json[p].id+')">Ver</button></td><tr/>');
				}
				
				document.getElementById("totalResultados").textContent = "Resultados: " + json.length;
				
				var totalPagina = xhr.getResponseHeader("totalPagina");
				
				for (var p = 0; p < totalPagina; p++) {
					
					var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina=' + (p * 5);
					$("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\'' +url+ '\')" >'+(p+1)+'</a></li>');
				}
			}
			
		}).fail(function(xhr, status, errorThrown){
			alert('Erro ao buscar usuário! Erro: ' + xhr.responseText);
		});
	}
	
	function buscarUsuario() {
		var nomeBusca = document.getElementById("nomeBusca").value;
		var urlAction = document.getElementById("formUser").action;
		
		/*validando entrada de dados*/
		if(nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {
			
			$.ajax({
				
				method: "get",
				url: urlAction,
				data: "nomeBusca=" + nomeBusca + "&acao=buscarUserAjax",
				success: function(response, textStatus, xhr) {
					
					var json = JSON.parse(response);
					
					$('#tabelaResultados > tbody > tr').remove();
					$("#ulPaginacaoUserAjax > li").remove();
					
					for (var p = 0; p < json.length; p++) {
						$('#tabelaResultados > tbody').append('<tr><td>'+json[p].id+'</td><td>'+json[p].nome+'</td><td>'+json[p].email+'</td><td><button class="btn btn-info" onclick="verEditar('+json[p].id+')">Ver</button></td><tr/>');
					}
					
					document.getElementById("totalResultados").textContent = "Resultados: " + json.length;
					
					var totalPagina = xhr.getResponseHeader("totalPagina");
					
					for (var p = 0; p < totalPagina; p++) {
						
						var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina=' + (p * 5);
						$("#ulPaginacaoUserAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscaUserPagAjax(\'' +url+ '\')" >'+(p+1)+'</a></li>');
					}
				}
				
			}).fail(function(xhr, status, errorThrown){
				alert('Erro ao buscar usuário! Erro: ' + xhr.responseText);
			});
			
		}
	}
	
	function verEditar(id) {
		var urlAction = document.getElementById("formUser").action;
		//alert(urlAction + "?acao=buscarEditar&id="+id);		
		window.location.href = urlAction + "?acao=buscarEditar&id="+id;
	}
	
</script>
</body>

</html>
