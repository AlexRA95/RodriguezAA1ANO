document.getElementById("addModulo").addEventListener("click", ()=> {

    const container = document.getElementById('modulosContainer');
    const newModulo = document.createElement('div');
    newModulo.className = 'modulo mb-3';
    newModulo.innerHTML = `
            <label for="denominacionModulo" class="form-label">Denominación del Módulo *</label>
            <input type="text" class="form-control" id="denominacionModulo" name="modulo">
        `;
    container.appendChild(newModulo);
});
