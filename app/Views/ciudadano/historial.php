<?= view('layouts/header') ?>
<!-- <?= view('layouts/navbar_vertical') ?> -->

<link rel="stylesheet" type="text/css" href="<?= base_url() ?>/assets/vendors/select2/select2.min.css">
<link rel="stylesheet" type="text/css" href="<?= base_url() ?>/assets/vendors/select2/select2-materialize.css">
<link rel="stylesheet" type="text/css" href="<?= base_url() ?>/assets/css/pages/form-select2.css">

<?= view('layouts/navbar_horizontal')?>

<!-- BEGIN: Page Main-->
<div id="main">
  <div class="row">
    <div class="pt-1 pb-0" id="breadcrumbs-wrapper">
      <!-- Search for small screen-->
      <div class="container">
        <div class="row">
          <div class="col s12 m6 l6">
          </div>
          <div class="col s12 m6 l6 right-align-md">
            <ol class="breadcrumbs mb-0">
              <li class="breadcrumb-item"><a href="<?= base_url() ?>">Home</a></li>
              <li class="breadcrumb-item"><a href="<?= base_url() ?>/table.php">Documentos</a></li>
              <li class="breadcrumb-item active">Detalle</li>
            </ol>
          </div>
        </div>
      </div>
    </div>
    <div class="col s12 m9">
      <div class="container">
        <div class="section">
          <!-- Page Length Options -->
          <div class="row">
            <div class="col s12 m12 l12">
              <h4 class="card-title center-align">Historial</h4>
              <div class="card padding-4 animate fadeLeft">
                <div class="row">
                  <table class="striped responsive-table">
                    <thead>
                      <tr>
                        <th>Fecha</th>
                        <th>Usuario</th>
                        <th>Rol</th>
                        <th>Observación</th>
                      </tr>
                    </thead>
                    <tbody>
                    <?php foreach($historiales as $historia): ?>
                      <tr>
                        <td><?= $historia->created_at ?></td>
                        <td><?= $documento->name ? $documento->name : $historia->username ?></td>
                        <td><?= $historia->name ?></td>
                        <td><?= $historia->observation ?></td>
                      </tr> 
                    <?php endforeach ?>                     
                    </tbody>
                  </table>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="col s12 m3">
      <div class="container">
        <div class="section">
          <form method="post" action="<?= base_url(['cespidh', 'historial', 'colaborador', $id]) ?>">
            <?= csrf_field() ?>
            <h5>Colaborador</h5>
            <hr>
            <div class="input-field">
              <select name="colaborador" class="select2 browser-default">
                <option value="" disable selected>Seleccionar colaborador</option>
                <?php foreach($colaboradores as $key => $colaborador): ?>
                  <option value="<?= $colaborador->id ?>"><?= $colaborador->name ?></option>
                <?php endforeach ?>
              </select>
            </div>
            <button class="btn success">Agregar colaborador</button>
          </form>
        </div>
      </div>
    </div>
  </div>
</div>



<!-- BEGIN VENDOR JS-->
<script src="<?= base_url() ?>/assets/js/vendors.min.js"></script>
<!-- BEGIN VENDOR JS-->
<script src="<?= base_url() ?>/assets/js/plugins.js"></script>
<script src="<?= base_url() ?>/assets/js/search.js"></script>
<script src="<?= base_url() ?>/assets/js/custom/custom-script.js"></script>


<!-- BEGIN PAGE VENDOR JS-->
<script src="<?= base_url() ?>/assets/vendors/select2/select2.full.min.js"></script>
<!-- END PAGE VENDOR JS-->


<!-- BEGIN PAGE LEVEL JS-->
<script src="<?= base_url() ?>/assets/js/scripts/form-select2.js"></script>
<!-- END PAGE LEVEL JS-->
<script>
</script>

<?= view('layouts/footer_libre') ?>