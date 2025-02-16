<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Update" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Actualizar datos de Ciclo y sus m&oacute;dulos</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <c:if test="${not empty requestScope.error}">
                    <div class="alert alert-danger" role="alert">
                            ${requestScope.error}
                    </div>
                </c:if>
                <form method="post" action="${applicationScope.contexto}/Update">
                    <p class="h2 border-bottom border-light-subtle w-100">Datos del ciclo</p>
                    <div class="mb-3">
                        <label for="nombreCiclo" class="form-label">Nombre del Ciclo *</label>
                        <input type="text" class="form-control" id="nombreCiclo" name="nombre" value="${sessionScope.ciclo.nombre}">
                    </div>
                    <p class="h2 border-bottom border-light-subtle w-100">Datos de los módulos</p>
                    <div id="modulosContainer">
                        <c:forEach var="modulo" items="${sessionScope.ciclo.modulos}">
                            <div class="modulo mb-3">
                                <label for="denominacionModulo${modulo.idModulo}" class="form-label">Denominación del M&oacute;dulo</label>
                                <input type="text" class="form-control" id="denominacionModulo${modulo.idModulo}" name="modulo" value="${modulo.denominacion}">
                            </div>
                        </c:forEach>
                    </div>
                    <button type="button" class="btn btn-secondary" id="addModulo">Añadir Módulo</button>
                    <button type="submit" name="opcion" value="doUpdate" class="btn btn-primary">Actualizar Ciclo y Módulos</button>
                </form>
            </div>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>