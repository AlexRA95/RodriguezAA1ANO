<jsp:directive.page contentType="text/html" pageEncoding="UTF-8"/>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<html lang="es">
<head>
    <jsp:include page="../../INC/metas.jsp">
        <jsp:param name="titulo" value="CRUD - ERROR 500" />
    </jsp:include>
</head>
<body>
<c:import url="../../INC/header.jsp"/>

<main class="hero">
    <div class="error-container">
        <h1>500</h1>
        <h2>Error del servidor</h2>
        <p>¡Ups! Algo salió mal en nuestro servidor. Estamos trabajando para solucionarlo.</p>
        <form action="${applicationScope.contexto}/FrontController" method="post">
            <button type="submit" name="opcion" value="inicio" class="btn btn-primary">Volver al inicio</button>
        </form>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>