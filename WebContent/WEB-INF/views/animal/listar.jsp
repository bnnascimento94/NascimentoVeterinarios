<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<br/>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Animais</span>
			</div>
		</div>	
	</div>	
<br/>

<div class="row">
	<div class="col-md-10">
		<div class="form-group">
			<input type="text" id="txt-pesquisa" class="form-control">
		</div>
	</div>
	<div class="col-md-2">
		<button class="btn btn-default" id="btn-pesquisar">Pesquisar</button>
	</div>	
</div>
<br/><br/>

<table class="table" id="tbl-animais">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome do Animal</th>
			<th>Idade</th>
			<th>Raça</th>
			<th>Nome do Dono</th>
			<th>Ações</th>		
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty animal}">
			<c:forEach items="${animal}" var="animal">
				<tr>
					<td>${animal.id}</td>
					<td>${animal.nome}</td>
					<td>${animal.idade}</td>
					<td>${animal.raca}</td>
					<td>${animal.nomedono}</td>
					<td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
						<a href="/NascimentoVeterinarios/animais/alterar/${animal.id}">Alterar</a> | <a href="/NascimentoVeterinarios/animais/excluir/${animal.id}">Excluir</a>
						</sec:authorize>
					</td>					
				</tr>
			</c:forEach>
		</c:if>
	
	</tbody>
</table>
<br/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/NascimentoVeterinarios/animais/adicionar" class="btn btn-default">Cadastrar novo Pet</a>
</sec:authorize>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#btn-pesquisar').click(
			function(){
				var nomeAnimal = $('#txt-pesquisa').val();	
				$.ajax({
							method: "GET",
							url: "/NascimentoVeterinarios/animais/porNome?nome=" + nomeAnimal,
							success: function(data){
								$('#tbl-animais tbody > tr').remove();
								$.each(data,function(index,animal){
									
									$('#tbl-animais tbody').append(
											'<tr>'
											+
												'<td>'+animal.id+'</td>'+
												'<td>'+animal.nome+'</td>'+
												'<td>'+animal.idade+'</td>'+
												'<td>'+animal.raca+'</td>'+
												'<td>'+animal.nomedono+'</td>'+
												'<td>'
													  +
													  '<a href="/NascimentoVeterinarios/animais/alterar/'+animal.id+'">Alterar</a> |'
													  +
													  '<a href="/NascimentoVeterinarios/animais/excluir/'+animal.id+'">Excluir</a>'
													  +
												'</td>'
											+
											'</tr>'		
										);
									
								});

								
							}, 
							
							error: function(){
								alert("Houve um erro na requisição")
							}
						});
			}		
		);
	});
</script>