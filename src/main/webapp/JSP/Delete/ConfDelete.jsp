<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Delete" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Confirmar borrar</h1>
            </div>
        </div>
        <div class="row">
            <form action="${applicationScope.contexto}/Delete" method="post" class="col-12 d-flex justify-content-center flex-column">
                <div class="card">
                    <c:choose>
                        <c:when test="${not empty sessionScope.ciclo}">
                            <div class="card-header">
                                Ciclo ID: ${sessionScope.ciclo.idCiclo}
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Ciclo: ${sessionScope.ciclo.nombre}</h5>
                                <ul>
                                    <c:forEach items="${sessionScope.ciclo.modulos}" var="modulo">
                                        <li>${modulo.denominacion}</li>
                                    </c:forEach>
                                </ul>
                            </div>
                        </c:when>
                        <c:when test="${not empty sessionScope.modulo}">
                            <div class="card-header">
                                Módulo ID: ${sessionScope.modulo.idModulo}
                            </div>
                            <div class="card-body">
                                <h5 class="card-title">Módulo: ${sessionScope.modulo.denominacion}</h5>
                            </div>
                        </c:when>
                    </c:choose>
                </div>
                <button type="submit" name="opcion" value="doDelete" class="btn btn-primary">Borrar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>