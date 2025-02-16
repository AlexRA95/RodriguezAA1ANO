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
                        <th scope="col">Seleccionar</th>
                        <th scope="col">Ciclo</th>
                        <th scope="col">Módulos</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.ciclos}" var="ciclo" varStatus="status">
                        <tr>
                            <td>
                                <input type="radio" name="ciclo" value="${ciclo.idCiclo}" ${status.first ? 'checked' : ''}>
                            </td>
                            <td>${ciclo.nombre}</td>
                            <td>
                                <c:forEach items="${ciclo.modulos}" var="modulo">
                                    <p>${modulo.denominacion}</p>
                                </c:forEach>
                            </td>
                        </tr>
                    </c:forEach>
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
