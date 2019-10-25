<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

	<c:url var="actionAdicionar" value="/animais/adicionar"></c:url>
	 <div class="container">
	 	<div class="row">
	 		<div class="col-md-12">
				<span class="listar-titulo">Cadastrar Animal</span>
			</div>
		</div>	
	</div>	

<div class="container-form">
	<form:form action="${actionAdicionar}" method="post" modelAttribute="animal">
	  <div class="form-group">
		    <label>Nome do animal:</label>
		   <form:input path="nome" cssClass="form-control"/>
		   <form:errors path="nome" cssStyle="color:red;"></form:errors>
	  </div>
	  <div class="form-group">
			<label>Idade:</label>
			<form:input path="idade" cssClass="form-control"/><br/>
			<form:errors path="idade"  cssStyle="color:red;"></form:errors>
	  </div>
  	  <div class="form-group">
			<label>Raça:</label>
			<form:input path="raca" cssClass="form-control"/><br/>
			<form:errors path="raca"  cssStyle="color:red;"></form:errors>
	  </div>
	  <div class="form-group">
			<label>Dono:</label>
			<form:input path="nomedono" cssClass="form-control"/><br/>
			<form:errors path="nomedono"  cssStyle="color:red;"></form:errors>
	  </div>
 
  	  <button type="submit" class="btn btn-primary">Salvar</button>
   </form:form>
	
</div>	
		

