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
                    <div class="card-header">
                        Servicio ID: ${sessionScope.servicio.id}
                    </div>
                    <div class="card-body">
                        <h5 class="card-title">Servicio: ${sessionScope.servicio.nombre}</h5>
                        <p class="card-text">Path del Servicio: ${sessionScope.servicio.path}</p>
                        <h5 class="card-title">Puerto Asociado</h5>
                        <p class="card-text">Número de Puerto: ${sessionScope.servicio.puerto.numero}</p>
                        <p class="card-text">Tipo de Puerto: ${sessionScope.servicio.puerto.tipo}</p>
                    </div>
                </div>
                <button type="submit" name="opcion" value="doDelete" class="btn btn-primary">Borrar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>