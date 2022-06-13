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
														<h4 class="sub-title">Cad. Telefone</h4>
															<div style="color: #000; margin-bottom: 20px;">
		                                              			<span id="msg">${msg}</span>
		                                              		</div>
														<form class="form-material" action="<%= request.getContextPath() %>/ServletTelefone" method="post" id="formUser">
															<div class="form-group form-default form-static-label">
                                                                <input type="text" id="id" name="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">ID Usuário:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" readonly="readonly" name="nome" id="nome" class="form-control" required="required" value="${modelLogin.nome}">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Usuário:</label>
                                                            </div>
                                                            <div class="form-group form-default form-static-label">
                                                                <input type="text" name="numero" id="numero" class="form-control" required="required">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Número:</label>
                                                            </div>
                                                            <button class="btn btn-success waves-effect waves-light">Salvar</button>
														</form>
													</div>
												</div>
												
												<div style="height: 300px; overflow: scroll;">
													<table class="table" id="tabelaResultadosView">
														<thead>
															<tr>
																<th scope="col">ID</th>
																<th scope="col">Número</th>
																<th scope="col">Ação</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${modelTelefones}" var="mt">
																<tr>
																	<td><c:out value="${mt.id}" /></td>
																	<td><c:out value="${mt.numero}" /></td>
																	<td><a class="btn btn-danger" href="ServletTelefone?acao=excluir&id=${mt.id}&iduser=${modelLogin.id}">Excluir</a></td>															</tr>
															</c:forEach>
														</tbody>
													</table>
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

<script type="text/javascript">
	$("#numero").keypress(function (event){
		return /\d/.test(String.fromCharCode(event.keyCode));
		
	});
</script>
</body>

</html>
