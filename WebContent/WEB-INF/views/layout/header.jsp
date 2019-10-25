<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
  <a class="navbar-brand" href="#">Nascimento Veterinarios</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#conteudoNavbarSuportado" aria-controls="conteudoNavbarSuportado" aria-expanded="false" aria-label="Alterna navegação">
    <span class="navbar-toggler-icon"></span>
  </button>

 <sec:authorize access="isAuthenticated()">
 <sec:authentication property="principal" var="principal"/>

  <div class="collapse navbar-collapse" id="conteudoNavbarSuportado">
    <ul class="navbar-nav mr-auto">
    
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Animais
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/NascimentoVeterinarios/animais/listar">Listar</a>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          	<a class="dropdown-item" href="/NascimentoVeterinarios/animais/adicionar">Cadastrar</a>
         </sec:authorize>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Veterinários
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/NascimentoVeterinarios/veterinarios/listar">Listar</a>
        	<sec:authorize access="hasRole('ROLE_ADMIN')">
          		<a class="dropdown-item" href="/NascimentoVeterinarios/veterinarios/adicionar">Cadastrar</a>
         	</sec:authorize>
        </div>
      </li>
      
       <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Prontuários
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/NascimentoVeterinarios/prontuarios/listar">Listar</a>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          	<a class="dropdown-item" href="/NascimentoVeterinarios/prontuarios/adicionar">Cadastrar</a>
          </sec:authorize>	
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Usuários
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/NascimentoVeterinarios/usuarios/listar">Listar</a>
          <sec:authorize access="hasRole('ROLE_ADMIN')">
          	<a class="dropdown-item" href="/NascimentoVeterinarios/usuarios/adicionar">Cadastrar</a>
          </sec:authorize>
        </div>
      </li>
      
      <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Bem vindo, ${principal.username}
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="/NascimentoVeterinarios/logout">Sair</a>
        </div>
      </li>

    </ul>
  </div>
  </sec:authorize>
</nav>