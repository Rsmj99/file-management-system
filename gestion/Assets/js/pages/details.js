const id_carpeta = document.querySelector('#id_carpeta');
let tbl;

document.addEventListener('DOMContentLoaded', function () {
    tbl = $('#tblDetalle').DataTable({
        ajax: {
            url: base_url + 'admin/listardetalle/' + id_carpeta.value,
            dataSrc: ''
        },
        columns: [
            { data: 'acciones' },
            { data: 'correo' },
            { data: 'nombre' },
            { data: 'estado' }
        ],
        language: {
            url: 'https://cdn.datatables.net/plug-ins/2.2.0/i18n/es-ES.json'
        },
        responsive: true,
        destroy: true,
        order: [[1, 'desc']],
    });
})

function eliminarDetalle(id) {
    const url = base_url + 'archivos/eliminarCompartido/' + id;
    eliminarRegistro('ESTÁ SEGURO DE ELIMINAR', 'EL ARCHIVO COMPARTIDO SE ELIMINARÁ DE FORMA PERMANENTE EN 30 DÍAS', 'SI ELIMINAR', url, tbl);
}