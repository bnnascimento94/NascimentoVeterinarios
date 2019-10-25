<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<c:url var="actionAdicionar" value="/usuarios/adicionar"></c:url>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Cadastrar Usuários</span>
			</div>
		</div>	
	</div>
	
	<div class="container-form">
		<form:form action="${actionAdicionar}" method="post" modelAttribute="usuario">

			<div class="form-group">
				<label>Nome usuário:</label>
				<form:input path="username" cssClass="form-control"/>
				<form:errors path="username" cssStyle="color:red;"></form:errors>
			</div>
			
			<div class="form-group">
				<label>Senha:</label>
				<form:password path="password" cssClass="form-control"/><br/>
				<form:errors path="password"  cssStyle="color:red;"></form:errors>
			</div>

			<div class="form-group">
				<label>Perfil</label>
				<select name="role" class="form-control">
					<option value="ROLE_ADMIN">Administrador</option>
					<option value="ROLE_USER">Usuário comum</option>
				</select>
				<form:errors path="" cssStyle="color:red;"></form:errors>
			</div>
		<input type="submit" value="Salvar!" class="btn btn-default"/>
	</form:form>
	
</div>	