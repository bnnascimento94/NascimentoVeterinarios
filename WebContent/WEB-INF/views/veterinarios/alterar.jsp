<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<c:url var="actionEditar" value="/veterinarios/alterar"></c:url>
	<div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Edição dos dados do veterinario "${veterinario.nome}"</span>
			</div>
		</div>	
	</div>
	
 <div class="container-form">
	<form:form action="${actionAdicionar}" method="post" modelAttribute="veterinario">
	  <div class="form-group">
			<label>Nome Veterinário:</label>
			<form:input path="nome" cssClass="form-control"/>
			<form:errors path="nome" cssStyle="color:red;"></form:errors>
	  </div>
	  <div class="form-group">
			<label>Especialidade:</label>
			<form:input path="especialidade" cssClass="form-control"/><br/>
			<form:errors path="especialidade"  cssStyle="color:red;"></form:errors>
	  </div>
  	  <div class="form-group">
			<label>Número Conselho:</label>
			<form:input path="numeroConselho" cssClass="form-control"/><br/>
			<form:errors path="numeroConselho"  cssStyle="color:red;"></form:errors>
	  </div>

 
  	  <button type="submit" class="btn btn-primary">Salvar</button>
   </form:form>
	
</div>	
