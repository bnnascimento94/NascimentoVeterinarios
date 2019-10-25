<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>


<br/>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Usuários</span>
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

<table class="table" id="tbl-usuarios">
	<thead>
		<tr>
			<th>ID</th>
			<th>Nome de Usuário</th>
			<th>Role</th>
			
		</tr>
	</thead>
	<tbody>
		<c:if test="${!empty usuarios}">
			<c:forEach items="${usuarios}" var="usuario">
				<tr>
					<td>${usuario.id}</td>
					<td>${usuario.username}</td>
					<td>${usuario.role}</td>
										
				</tr>
			</c:forEach>
		</c:if>
	
	</tbody>
</table>
<br/>

<a href="/NascimentoVeterinarios/usuarios/adicionar" class="btn btn-default">Adicionar novo Usuário</a>

<script type="text/javascript">
	$(document).ready(function(){
		
		$('#btn-pesquisar').click(
			function(){
				var nomeUsuario = $('#txt-pesquisa').val();	
				$.ajax({
							method: "GET",
							url: "/NascimentoVeterinarios/usuarios/porNome?nome=" + nomeUsuario,
							success: function(data){
								$('#tbl-usuarios tbody > tr').remove();
								$.each(data,function(index,usuario){
									
									$('#tbl-usuarios tbody').append(
											'<tr>'
											+
												'<td>'+usuario.id+'</td>'+
												'<td>'+usuario.username+'</td>'+
												'<td>'+usuario.role+'</td>'+
												'<td>'
													  +
													  '<a href="/NascimentoVeterinarios/usuarios/alterar/'+usuario.id+'">Alterar</a> |'
													  +
													  '<a href="/NascimentoVeterinarios/usuarios/excluir/'+usuario.id+'">Excluir</a>'
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