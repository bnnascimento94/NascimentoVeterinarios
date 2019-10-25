<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<br/>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Veterinários</span>
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


<table class="table" id="tbl-veterinarios">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome</th>
			<th>Especialidade</th>
			<th>Número Conselho</th>
			<th>Ações</th>	
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty veterinario}">
			<c:forEach items="${veterinario}" var="veterinario">
				<tr>
					<td>${veterinario.id}</td>
					<td>${veterinario.nome}</td>
					<td>${veterinario.especialidade}</td>
					<td>${veterinario.numeroConselho}</td>
					<td>
						<sec:authorize access="hasRole('ROLE_ADMIN')">
							<a href="/NascimentoVeterinarios/veterinarios/alterar/${veterinario.id}">Alterar</a> | <a href="/NascimentoVeterinarios/veterinarios/excluir/${veterinario.id}">Excluir</a>
						</sec:authorize>
					</td>					
				</tr>
			</c:forEach>
		</c:if>
	
	</tbody>
</table>
<br/>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href="/NascimentoVeterinarios/veterinarios/adicionar" class="btn btn-default">Cadastrar Veterinário</a>
</sec:authorize>
<script type="text/javascript">
	$(document).ready(function(){
		
		$('#btn-pesquisar').click(
			function(){
				var nomeVeterinario = $('#txt-pesquisa').val();	
				$.ajax({
							method: "GET",
							url: "/NascimentoVeterinarios/veterinarios/porNome?nome=" + nomeVeterinario,
							success: function(data){
								$('#tbl-veterinarios tbody > tr').remove();
								$.each(data,function(index,veterinario){
									
									$('#tbl-veterinarios tbody').append(
											'<tr>'
											+
												'<td>'+veterinario.id+'</td>'+
												'<td>'+veterinario.nome+'</td>'+
												'<td>'+veterinario.especialidade+'</td>'+
												'<td>'+veterinario.numetoConselho+'</td>'+
												'<td>'
													  +
													  '<a href="/NascimentoVeterinarios/veterinarios/alterar/'+veterinario.id+'">Alterar</a> |'
													  +
													  '<a href="/NascimentoVeterinarios/veterinarios/excluir/'+veterinario.id+'">Excluir</a>'
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