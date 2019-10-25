<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<c:url var="actionAdicionar" value="/prontuarios/adicionar"></c:url>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Cadastrar Prontuário</span>
			</div>
		</div>	
	</div>
	
<div class="container-form">
	<form:form action="${actionAdicionar}" method="post" modelAttribute="prontuario">
		<div class="form-group">
			<label>Nome Veterinário:</label>
			<form:select path="veterinario.id" cssClass="form-control">
				<form:options items="${veterinario}" itemLabel="nome" itemValue="id"/>
			</form:select>
			<form:errors path="" cssStyle="color:red;"></form:errors>
		</div>
		<div class="form-group">
			<label>Nome Animal:</label>
			<form:select path="animal.id" cssClass="form-control">
				 <form:options items="${animal}" itemLabel="nome" itemValue="id"/>
			</form:select>
			<form:errors path="" cssStyle="color:red;"></form:errors>
		</div>
  	  
				<div class="form-group">
					<label>Data de Atendimento:</label>
					<form:input path="dataAtendimento" cssClass="form-control"/><br/>
					<form:errors path="dataAtendimento"  cssStyle="color:red;"></form:errors>
				</div>
	  
	  
				<div class="form-group">
					<label>Observações:</label>
					<form:textarea path="observacoes" cssClass="form-control" rows="3"/>
					<form:errors path="observacoes"  cssStyle="color:red;"></form:errors>
				</div>
	  
  	  <button type="submit" class="btn btn-primary">Salvar</button>
   </form:form>
	
</div>	
	
	
		