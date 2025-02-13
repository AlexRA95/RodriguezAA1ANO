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
                <h1 class="display-1">Formulario de Actualizaci&oacute;n de Servicio</h1>
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
                    <p class="h2 border-bottom border-light-subtle w-100">Datos del Servicio</p>
                    <div class="mb-3">
                        <label for="nombreServicio" class="form-label">Nombre del Servicio *</label>
                        <input type="text" class="form-control" id="nombreServicio" name="nombre" value="${sessionScope.servicio.nombre}">
                    </div>
                    <div class="mb-3">
                        <label for="pathServicio" class="form-label">Path del Servicio *</label>
                        <input type="text" class="form-control" id="pathServicio" name="path" value="${sessionScope.servicio.path}">
                    </div>
                    <p class="h2 border-bottom border-light-subtle w-100">Datos del Puerto Asociado</p>
                    <div class="mb-3">
                        <label for="numeroPuerto" class="form-label">Número de Puerto *</label>
                        <input type="number" class="form-control" id="numeroPuerto" name="numero" value="${sessionScope.servicio.puerto.numero}">
                    </div>
                    <div class="mb-3">
                        <label for="tipoPuerto" class="form-label">Tipo de Puerto *</label>
                        <input type="text" class="form-control" id="tipoPuerto" name="tipo" value="${sessionScope.servicio.puerto.tipo}">
                    </div>
                    <button type="submit" class="btn btn-primary" name="opcion" value="doUpdate">Actualizar</button>
                </form>
            </div>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>