<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Read" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h1 class="display-1">Ver todos los puertos y servicios</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <table class="table table-striped table-hover table-bordered">
                    <thead class="table-dark">
                    <tr>
                        <th scope="col">Ciclo</th>
                        <th scope="col">Módulos</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${requestScope.ciclos}" var="ciclo">
                        <tr>
                            <td>${ciclo.nombre}</td>
                            <td>
                                <table class="table table-sm">
                                    <thead>
                                    <tr>
                                        <th scope="col">Módulos</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <c:forEach items="${ciclo.modulos}" var="modulo">
                                        <tr>
                                            <td>${modulo.denominacion}</td>
                                        </tr>
                                    </c:forEach>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>