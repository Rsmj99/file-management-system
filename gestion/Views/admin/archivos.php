<?php include_once 'Views/template/header.php'; ?>

<div class="app-content">
    <?php include_once 'Views/components/menus.php'; ?>
    <div class="content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col">
                    <div class="page-description d-flex align-items-center">
                        <div class="page-description-content flex-grow-1">
                            <h1><?php echo $data['carpeta']['nombre']; ?></h1>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <?php foreach ($data['archivos'] as $archivo) { ?>
                    <div class="col-md-6">
                        <div class="card file-manager-recent-item">
                            <div class="card-body">
                                <div class="d-flex align-items-center">
                                    <i class="material-icons-outlined text-danger align-middle m-r-sm">description</i>
                                    <a href="#" class="file-manager-recent-item-title flex-fill"><?php echo $archivo['nombre']; ?>
                                    </a>
                                    <span class="p-h-sm">167kb</span>
                                    <span class="p-h-sm text-muted">09.14.21</span>
                                    <a href="#" class="dropdown-toggle file-manager-recent-file-actions" id="file-manager-recent-1" data-bs-toggle="dropdown" aria-expanded="false"><i class="material-icons">more_vert</i></a>
                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="file-manager-recent-1">
                                        <li><a class="dropdown-item" href="#">Share</a></li>
                                        <li><a class="dropdown-item" href="#">Download</a></li>
                                        <li><a class="dropdown-item" href="#">Move to folder</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                <?php } ?>
            </div>
        </div>
    </div>
</div>

<?php include_once 'Views/template/footer.php'; ?>