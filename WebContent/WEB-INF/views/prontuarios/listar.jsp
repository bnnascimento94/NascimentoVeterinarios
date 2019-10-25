<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br/>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Prontuários</span>
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


<table class="table" id="tbl-prontuarios">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome veterinario</th>
			<th>Nome animal</th>
			<th>Data Atendimento</th>
			<th>Observações</th>
			<th>Ações</th>	
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty prontuario}">
			<c:forEach items="${prontuario}" var="prontuario">
				<tr>
					<td>${prontuario.id}</td>
					<td>${prontuario.veterinario.nome}</td>
					<td>${prontuario.animal.nome}</td>
					<td>${prontuario.dataAtendimento}</td>
					<td>${prontuario.observacoes}</td>
					<td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="/NascimentoVeterinarios/prontuarios/alterar/${prontuario.id}">Alterar</a> | <a href="/NascimentoVeterinarios/prontuarios/excluir/${prontuario.id}">Excluir</a>
						</sec:authorize>
					</td>					
				</tr>
			</c:forEach>
		</c:if>
	
	</tbody>
</table>
<br/>

<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/NascimentoVeterinarios/prontuarios/adicionar" class="btn btn-default">Adicionar novo Prontuário</a>
</sec:authorize>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#btn-pesquisar').click(
			function(){
				var nomeProntuario = $('#txt-pesquisa').val();	
				$.ajax({
							method: "GET",
							url: "/NascimentoVeterinarios/prontuarios/porNome?nome=" + nomeProntuario,
							success: function(data){
								$('#tbl-prontuarios tbody > tr').remove();
								$.each(data,function(index,prontuario){
									
									$('#tbl-musicas tbody').append(
											'<tr>'
											+
												'<td>'+prontuario.id+'</td>'+
												'<td>'+prontuario.veterinario.nome+'</td>'+
												'<td>'+prontuario.animal.nome+'</td>'+
												'<td></td>'+
												'<td>'+prontuario.observacoes+'</td>'+
												'<td>'
													  +
													  '<a href="/NascimentoVeterinarios/prontuarios/alterar/'+prontuario.id+'">Alterar</a> |'
													  +
													  '<a href="/NascimentoVeterinarios/prontuarios/excluir/'+prontuario.id+'">Excluir</a>'
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