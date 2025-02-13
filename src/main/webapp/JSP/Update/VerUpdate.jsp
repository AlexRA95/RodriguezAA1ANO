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
                <h1 class="display-1">Selecciona el servicio a actualizar</h1>
            </div>
        </div>
        <div class="row">
            <form action="${applicationScope.contexto}/Update" method="post" class="col-12 d-flex justify-content-center flex-column">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">Número de Puerto</th>
                        <th scope="col">Tipo de Puerto</th>
                        <th scope="col">Nombre del Servicio</th>
                        <th scope="col">Path del Servicio</th>
                        <th scope="col">Seleccionar</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:choose>
                        <c:when test="${empty requestScope.servicios}">
                            <tr>
                                <td colspan="4" class="text-center">No hay servicios registrados todavía</td>
                            </tr>
                        </c:when>
                        <c:otherwise>
                            <c:forEach items="${requestScope.servicios}" var="servicio" varStatus="status">
                                <tr>
                                    <td>${servicio.puerto.numero}</td>
                                    <td>${servicio.puerto.tipo}</td>
                                    <td>${servicio.nombre}</td>
                                    <td>${servicio.path}</td>
                                    <td><input class="form-check-input" type="radio" name="servUpdate" value="${servicio.id}" ${status.first ? 'checked' : ''}> </td>
                                </tr>
                            </c:forEach>
                        </c:otherwise>
                    </c:choose>
                    </tbody>
                </table>
                <button type="submit" name="opcion" value="verUpdate" class="btn btn-primary">Seleccionar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
