$(document).ready(function() {
    // $('input.autocomplete-name').autocomplete({
    //     data: documentos(),
    // });
    // $('input.autocomplete-id').autocomplete({
    //     data: cedulas_aux(),
    // });
    // $('input.autocomplete-sedes').autocomplete({
    //     data: sedes_aux(),
    // });
    rellenar(filtro_aux());
});

function rellenar(data) {
    $('input.autocomplete-name').val(data.nombre);
    $('input.autocomplete-id').val(data.cedula);
    $('input.autocomplete-sedes').val(data.sede);
    $('input#date-inicial').val(data.date_init);
    $('input#date-final').val(data.date_finish);
    M.updateTextFields();
}