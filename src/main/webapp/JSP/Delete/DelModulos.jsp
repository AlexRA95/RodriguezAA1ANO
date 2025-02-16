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
                <h1 class="display-1">Selecciona el m&oacute;dulo a borrar</h1>
            </div>
        </div>
        <div class="row">
            <form action="${applicationScope.contexto}/Delete" method="post" class="col-12 d-flex justify-content-center flex-column">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">Ciclo</th>
                        <th scope="col">Módulos</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.ciclos}" var="ciclo" varStatus="cicloStatus">
                        <tr>
                            <td>${ciclo.nombre}</td>
                            <td>
                                <c:forEach items="${ciclo.modulos}" var="modulo" varStatus="moduloStatus">
                                    <input type="radio" name="moduloSeleccionado" value="${modulo.idModulo}" ${cicloStatus.first && moduloStatus.first ? 'checked' : ''}>
                                    ${modulo.denominacion}
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
                <button type="submit" name="opcion" value="verDelModulo" class="btn btn-primary">Seleccionar</button>
            </form>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
