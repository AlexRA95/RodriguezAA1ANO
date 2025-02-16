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
                <h1 class="display-1">Que quieres ver</h1>
            </div>
        </div>
        <div class="row">
            <div class="col-12">
                <form action="${applicationScope.contexto}/FrontController" method="post">
                    <button type="submit" name="opcion" value="ciclo" class="btn btn-primary" >Ciclos</button>
                    <button type="submit" name="opcion" value="modulo" class="btn btn-primary" >Modulo</button>
                </form>
            </div>
        </div>
    </div>
</main>

<c:import url="../../INC/footer.jsp"/>
</body>
</html>
