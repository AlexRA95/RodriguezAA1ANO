<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:url var="bootstrap" value="/CSS/bootstrap.min.css" scope="application" />
<c:url var="bootstrapJS" value="/JS/bootstrap.bundle.min.js" scope="application" />
<c:url var="estilo" value="/CSS/style.css" scope="application"/>
<c:set var="contexto" value="${pageContext.request.contextPath}" scope="application" />
<c:url var="jsScript" value="/JS/script.js" scope="application" />
<html lang="es">
<head>
    <jsp:include page="INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - Men&uacute;" />
    </jsp:include>
</head>
<body>
    <c:import url="INC/header.jsp"/>

    <main class="hero">
        <div class="container">
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="display-1">Operaciones CRUD</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <h1 class="display-1">Relaci&oacute;n 1 a N Ordenada</h1>
                </div>
            </div>
            <div class="row">
                <div class="col-12 text-center">
                    <p>En Hibernate, una relación 1 a N (uno a muchos) ordenada se utiliza para definir una asociación entre dos entidades donde una entidad padre puede tener múltiples entidades hijas, y estas entidades hijas están ordenadas según un criterio específico.</p>
                </div>
            </div>
        </div>
    </main>

    <c:import url="INC/footer.jsp"/>
</body>
</html>
