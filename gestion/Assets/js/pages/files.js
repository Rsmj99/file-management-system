const btnUpload = document.querySelector('#btnUpload');
const btnNuevaCarpeta = document.querySelector('#btnNuevaCarpeta');
const myModal = new bootstrap.Modal(document.querySelector("#modalFile"));

const myModal1 = new bootstrap.Modal(document.querySelector("#modalCarpeta"));
const frmCarpeta = document.querySelector("#frmCarpeta");

const file = document.querySelector('#file');

const myModal2 = new bootstrap.Modal(document.querySelector("#modalCompartir"));
const id_carpeta = document.querySelector("#id_carpeta");

const carpetas = document.querySelectorAll('.carpetas');
const btnSubir = document.querySelector('#btnSubir');

// ver archivos
const btnVer = document.querySelector('#btnVer');

// compartir archivos entre usuarios
const compartir = document.querySelectorAll('.compartir');
const myModalUser = new bootstrap.Modal(document.querySelector("#modalUsuarios"));
const frmCompartir = document.querySelector("#frmCompartir");
const usuarios = document.querySelector("#usuarios");

const btnCompartir = document.querySelector('#btnCompartir');
const container_archivos = document.querySelector('#container-archivos');
const btnVerDetalle = document.querySelector('#btnVerDetalle');
const content_acordeon = document.querySelector('#accordionFlushExample');

// ELIMINAR ARCHIVOS RECIENTES
const eliminar = document.querySelectorAll('.eliminar');
const modalArchivos = new bootstrap.Modal(document.querySelector("#modalArchivos"));

document.addEventListener('DOMContentLoaded', function () {
    btnUpload.addEventListener('click', function () {
        myModal.show();
    })

    btnNuevaCarpeta.addEventListener('click', function () {
        myModal.hide();
        myModal1.show();
    })

    frmCarpeta.addEventListener('submit', function (e) {
        e.preventDefault();
        if (frmCarpeta.nombre.value == '') {
            alertaPersonalizada('warning', 'EL NOMBRE ES REQUERIDO');
        } else {
            const data = new FormData(frmCarpeta);
            const http = new XMLHttpRequest();
            const url = base_url + 'admin/crearcarpeta';
            http.open("POST", url, true);
            http.send(data);
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    const res = JSON.parse(this.responseText);
                    alertaPersonalizada(res.tipo, res.mensaje);
                    if (res.tipo == 'success') {
                        setTimeout(() => {
                            window.location.reload();
                        }, 1500);
                    }
                }
            };
        }
    })

    // file.addEventListener('change', function (e) {
    //     console.log(e.target.files[0]);
    //     const data = new FormData();
    //     data.append('id_carpeta', id_carpeta.value);
    //     data.append('file', e.target.files[0]);
    //     const http = new XMLHttpRequest();
    //     const url = base_url + 'admin/subirarchivo';
    //     http.open("POST", url, true);
    //     http.upload.addEventListener('progress', function(e){
    //         let porcentaje=(e.loaded / e.total)*100;
    //         container_progress.innerHTML=`<div class="progress">
    //         <div class="progress-bar"  role="progressbar" style="width: ${porcentaje.toFixed(0)}%;" aria-valuenow="${porcentaje.toFixed(0)}" aria-valuemin="0" aria-valuemax="100">
    //         ${porcentaje.toFixed(0)}%
    //         </div>
    //         </div>`;
    //     })
    //     http.addEventListener('load', function () {
    //         setTimeout(() => {
    //             window.location.reload();
    //         }, 1500);
    //     })
    //     http.send(data);
    //     http.onreadystatechange = function () {
    //         if (this.readyState == 4 && this.status == 200) {
    //             console.log(this.responseText);
    //             const res = JSON.parse(this.responseText);
    //             alertaPersonalizada(res.tipo, res.mensaje);       
    //         }
    //     };
    // })

    carpetas.forEach(carpeta => {
        carpeta.addEventListener('click', function (e) {
            id_carpeta.value = e.target.id;
            myModal2.show();
        })
    });

    btnSubir.addEventListener('click', function () {
        myModal2.hide();
        modalArchivos.show();
    })

    btnVer.addEventListener('click', function () {
        window.location = base_url + 'admin/ver/' + id_carpeta.value;
    })

    $(".js-states").select2({
        theme: 'bootstrap-5',
        placeholder: 'Buscar y agregar usuarios',
        maximumSelectionLength: 5,
        minimunInputLength: 2,
        dropdownParent: $('#modalUsuarios'),
        ajax: {
            url: base_url + 'archivos/getUsuarios',
            dataType: 'json',
            delay: 250,
            data: function (params) {
                return {
                    q: params.term
                };
            },
            processResults: function (data) {
                return {
                    results: data
                };
            },
            cache: true
        },
    });

    // agregar click al enlace compartir
    compartir.forEach(enlace => {
        enlace.addEventListener('click', function (e) {
            compartirArchivo(e.target.id);
        })
    });

    frmCompartir.addEventListener('submit', function (e) {
        e.preventDefault();
        if (usuarios.value == '') {
            alertaPersonalizada('warning', 'TODOS LOS CAMPOS SON REQUERIDOS');
        } else {
            const data = new FormData(frmCompartir);
            const http = new XMLHttpRequest();
            const url = base_url + 'archivos/compartir';
            http.open("POST", url, true);
            http.send(data);
            http.onreadystatechange = function () {
                if (this.readyState == 4 && this.status == 200) {
                    console.log(this.responseText);
                    const res = JSON.parse(this.responseText);
                    alertaPersonalizada(res.tipo, res.mensaje);
                    if (res.tipo == 'success') {
                        $('.js-states').val(null).trigger('change');
                        myModalUser.hide();
                    }
                }
            };
        }
    })

    // COMPARTIR ARCHIVOS POR CARPETA
    btnCompartir.addEventListener('click', function () {
        verArchivos();
    })

    // VER DETALLE COMPARTIDO
    btnVerDetalle.addEventListener('click', function () {
        window.location = base_url + 'admin/verdetalle/' + id_carpeta.value;
    })

    // ELIMINAR ARCHIVO RECIENTE
    eliminar.forEach(enlace => {
        enlace.addEventListener('click', function (e) {
            let id = e.target.getAttribute('data-id');
            const url = base_url + 'archivos/eliminar/' + id;
            eliminarRegistro('ESTÁ SEGURO DE ELIMINAR', 'EL ARCHIVO SE ELIMINARÁ DE FORMA PERMANENTE EN 30 DÍAS', 'SI ELIMINAR', url, null);
        })
    });
})

//iniciar dropzone
Dropzone.options.uploadForm = {
    dictDefaultMessage:'Arrastrar y soltar archivos',
    dictRemoveFile:'ELIMINAR',
    autoProcessQueue: false,
    uploadMultiple: true,
    parallelUploads: 100,
    maxFiles: 100, //maximo de archivos a subir
    addRemoveLinks:true,
  
    // The setting up of the dropzone
    init: function() {
      var myDropzone = this;
  
      // First change the button to actually tell Dropzone to process the queue.
      document.querySelector('#btnProcesar').addEventListener("click", function(e) {
        // Make sure that the form isn't actually being sent.
        e.preventDefault();
        e.stopPropagation();
        myDropzone.processQueue();
      });
  
      this.on("successmultiple", function(files, response) {
        setTimeout(() => {
            window.location.reload();
        }, 1500);
      });
    }
   
  }

//finalizar dropzone

function compartirArchivo(id) {
    const http = new XMLHttpRequest();
    const url = base_url + 'archivos/buscarCarpeta/' + id;
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            console.log(this.responseText);
            // id_archivo.value = res.id;
            id_carpeta.value = res.id_carpeta;
            content_acordeon.classList.add('d-none');
            container_archivos.innerHTML = `<input type="hidden" value="${res.id}" name="archivos[]">`;
            myModalUser.show();
        }
    };
}

function verArchivos() {
    const http = new XMLHttpRequest();
    const url = base_url + 'archivos/verArchivos/' + id_carpeta.value;
    http.open("GET", url, true);
    http.send();
    http.onreadystatechange = function () {
        if (this.readyState == 4 && this.status == 200) {
            const res = JSON.parse(this.responseText);
            let html = '';
            if (res.length > 0) {
                content_acordeon.classList.remove('d-none');
                res.forEach(archivo => {
                    html += `<div class="form-check">
                                                    <input class="form-check-input" type="checkbox" value="${archivo.id}" name="archivos[]" id="flexCheckDefault_${archivo.id}">
                                                    <label class="form-check-label" for="flexCheckDefault_${archivo.id}">
                                                        ${archivo.nombre}
                                                    </label>
                                                </div>`;
                });
                // cargarDetalle(id_carpeta.value);
            } else {
                html = `<div class="alert alert-custom alert-indicator-right indicator-warning" role="alert">
                                                    <div class="alert-content">
                                                        <span class="alert-title">Warning!</span>
                                                        <span class="alert-text">Carpeta vacía</span>
                                                        </div>
                                                        </div>`;
            }
            container_archivos.innerHTML = html;
            myModal2.hide();
            myModalUser.show();
        }
    };
}
