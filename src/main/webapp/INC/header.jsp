<header class="p-3 bg-light text-dark border-bottom shadow-sm">
    <div class="container d-flex justify-content-between align-items-center">
        <img src="${applicationScope.contexto}/IMG/logo/logo.png" alt="Logo" class="img-fluid" style="max-height: 50px;">
        <form method="post" action="${applicationScope.contexto}/FrontController" class="d-flex flex-row justify-content-evenly">
            <button type="submit" name="opcion" value="inicio" class="btn  mx-1">
                <i class="bi bi-house"></i> Inicio
            </button>
            <button type="submit" name="opcion" value="create"  class="btn mx-1">
                <i class="bi bi-pencil-square"></i> Crear (Create)
            </button>
            <button type="submit" name="opcion" value="read"  class="btn mx-1">
                <i class="bi bi-book"></i> Ver (Read)
            </button>
            <button type="submit" name="opcion" value="update"  class="btn mx-1">
                <i class="bi bi-arrow-clockwise"></i> Modificar (Update)
            </button>
            <button type="submit" name="opcion" value="delete"  class="btn mx-1">
                <i class="bi bi-trash3"></i> Borrar (Delete)
            </button>
        </form>
    </div>
</header>