const array_list = [];

function delete_list(pregunta, id, campo) {
    array_list[pregunta] = array_list[pregunta].filter((item) => item.id !== (id - 1));
    input_hechos = $(`#${campo}_hechos`).val();
    input_hechos = JSON.parse(input_hechos);
    input_hechos[campo] = input_hechos[campo].filter((item) => item.id !== (id - 1));
    input_hechos = JSON.stringify(input_hechos);
    $(`#${campo}_hechos`).val(input_hechos);
    $(`#${pregunta}_${id}`).hide();
}

function edit_list(id, id_2, campo) {
    $(`#${campo}`).val(array_list[`pregunta_${id}`][(id_2 - 1)]['value']);
    $(`.agg-edit_${campo}`).attr('onclick', `edit_campo(${id}, ${id_2}, '${campo}')`);
    $(`.agg-edit_${campo}`).html('<i class="material-icons left">edit</i>Editar');
    M.updateTextFields();
}

function edit_campo(id, id_2, campo) {
    var new_value = $(`#${campo}`).val();
    if (new_value != '') {
        input_hechos = $(`#${campo}_hechos`).val();
        input_hechos = JSON.parse(input_hechos);
        console.log(input_hechos);
        input_hechos[campo].forEach((aux_value, index) => {
            if (aux_value.id == (id_2 - 1))
                input_hechos[campo][index]['value'] = new_value;

        });
        input_hechos = JSON.stringify(input_hechos);
        $(`#${campo}_hechos`).val(input_hechos);
        $(`.agg-edit_${campo}`).html('<i class="material-icons left">check</i>Agregar');
        $(`.agg-edit_${campo}`).attr('onclick', `add_list(${id}, '${campo}')`);
        $(`#pregunta_${id}_${id_2} .detalle`).html(new_value);
        $(`#pregunta_${id}_${id_2} td .edit`).attr('onclick', `edit_list('${id}', ${id_2}, '${campo}')`);
        $(`#pregunta_${id}_${id_2} td .delete`).attr('onclick', `delete_list('pregunta_${id}', '${campo}')`);
        array_list[`pregunta_${id}`].forEach((item, index) => {
            if (item.id == (id_2 - 1)) {
                array_list[`pregunta_${id}`][index]['value'] = new_value;
            }
        })
        $(`#${campo}`).val('')
        M.updateTextFields();
    } else alert('<span class="amber-text">No se puede editar un detalle vacio</span>', 'amber lighten-5');
}

function add_list(id, campo) {
    var value = $(`#${campo}`).val();
    if (value != '') {
        if (array_list[`pregunta_${id}`] == undefined)
            array_list[`pregunta_${id}`] = [];
        var aux_array = new Object();
        aux_array.id = 0;
        aux_array.value = value;
        array_list[`pregunta_${id}`].push(aux_array);
        var list = '';
        array_list[`pregunta_${id}`].forEach((pregunta, key) => {
            list += `
            <tr id="pregunta_${id}_${(key+1)}">
            <td class="detalle">${pregunta.value}</td>
            <td>
            <a class="btn-floating mb-1 edit" onclick="edit_list('${id}', ${(key+1)}, '${campo}')"><i class="material-icons">create</i></a>
            <a class="btn-floating mb-1 delete" onclick="delete_list('pregunta_${id}', ${(key+1)}, '${campo}')"><i class="material-icons">close</i></a>
            </td>
            </tr>
          `;
            array_list[`pregunta_${id}`][key]['id'] = key;
        });
        var input_hechos = $(`#${campo}_hechos`).val();
        var myObject = new Object();
        myObject[`${campo}`] = array_list[`pregunta_${id}`];
        input_hechos = JSON.stringify(myObject);
        $(`#pregunta_${id} tbody`).html(list);
        $(`#${campo}`).val('')
        M.updateTextFields();
        $(`#${campo}_hechos`).val(input_hechos);
    } else {
        alert('<span class="red-text">No se puede ingresar un detalle vacio</span>', 'red lighten-5');
    }
}

function add_edit(id, value, campo) {
    if (array_list[`pregunta_${id}`] == undefined)
        array_list[`pregunta_${id}`] = [];
    var aux_array = new Object();
    aux_array.id = 0;
    aux_array.value = value;
    array_list[`pregunta_${id}`].push(aux_array);
    array_list[`pregunta_${id}`].forEach((pregunta, key) => {
        array_list[`pregunta_${id}`][key]['id'] = key;
    });
    var input_hechos = $(`#${campo}_hechos`).val();
    console.log(input_hechos);
    var myObject = new Object();
    myObject[`${campo}`] = array_list[`pregunta_${id}`];
    input_hechos = JSON.stringify(myObject);
    $(`#${campo}_hechos`).attr('value', input_hechos);
    console.log(input_hechos);
}

const names = [];


function agg_anexo(campo, id) {
    var pruebas = `
          <div class="col l4 s12 anexo">
              <div class="card box-shadow-none mb-1 app-file-info">
                  <div class="card-content">
                    <div class="app-file-content-logo grey lighten-4">
                        <i class="material-icons">attach_file</i>
                    </div>
                    <div class="app-file-recent-details">
                        <div class="icons-pruebas">
                            <a href="#!" class="indigo-text font-weight-600" onclick="prueba_delete(this, ${id})"><i class="material-icons">close</i></a>
                        </div>
                        <div class="row">
                          <div class="file-field input-field col s12">
                            <div class="btn large">
                              <span>Archivo</span>
                              <input type="file" id="input_prueba_${id}" name="${campo}[]">
                            </div>
                            <div class="file-path-wrapper">
                              <input class="file-path validate" type="text" placeholder="Nombre parcial del archivo">
                            </div>
                          </div>
                          <div class="file-field input-field col s12">
                            <input placeholder="Nombre del archivo" id="input_name_${id}" type="text" class="validate" name="${campo}_names[]">
                          </div>
                        </div>
                    </div>
                  </div>
              </div>
          </div>`;
    $(`#pruebas_anexos_${id}`).append(pruebas);
}

function prueba_delete(boton, id) {
    var prueba = boton.parentNode.parentNode.parentNode.parentNode.parentNode;
    prueba.parentNode.removeChild(prueba);
}

function resetform(pagina) {
    console.log(pagina);
    $('#filtrado').trigger("reset");
    location.href=pagina;
}

document.addEventListener('DOMContentLoaded', function() {
    var elems = document.querySelectorAll('.autocomplete');
    var documento = autocompletado_aux();
    console.log(documento);

    var jsonname = {};
    var jsonusers_id = {};
    var jsonsede = {};
    var jsonusername = {};
    // console.log(elems);
    for (let i in elems) {
        for (let j in documento) {
            if(elems[i].id){
                switch (elems[i].name) {
                    case "name":
                        jsonname[documento[j].name]= null;
                        $('#'+elems[i].id).autocomplete({
                            limit : 5 ,
                            data: jsonname});
                        break;
                    case "users_id":
                        jsonusers_id[documento[j].users_id] = null;
                        $('#'+elems[i].id).autocomplete({limit : 5 ,data: jsonusers_id});
                        break;
                    case "sede_nombre":
                        jsonsede[documento[j].sede_nombre]= null;
                        $('#'+elems[i].id).autocomplete({limit : 5 ,data: jsonsede});
                        break;
                    case "username":
                        jsonusername[documento[j].username] = null;
                        $('#'+elems[i].id).autocomplete({limit : 5 ,data: jsonusername});
                        break;
                }
            }
            console.log(documento[j]);
        }
    }
  });

// function autocompletado(campollegada){
//     let campo = campollegada;
    
//     var opciones = [];
//     for (let i in documento) {
//         opciones.push(documento[i][campo]);
//     }
//     console.log(opciones);
//     var instances = M.Autocomplete.init($('#autocomplete-'+campo), opciones);

//     var a, b, i, val;
    
//     val = $('#autocomplete-'+campo).val();

//     closeAllLists();
//     if (!val) { return false;}
//     currentFocus = -1;
//     a = document.createElement("DIV");
//     a.setAttribute("id", '#autocomplete-'+campo + "autocomplete-list");
//     a.setAttribute("class", "autocomplete-items input-field col s12");
//     $('#autocomplete-'+campo).parent().append(a);
//     for (i = 0; i < opciones.length; i++) {
//         if (opciones[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
//             b = document.createElement("<select>");
//             // b.setAttribute("onclick","completar('hidden"+i+"')");
//             b.innerHTML = "<select>"
//             b.innerHTML = "<strong>" + opciones[i].substr(0, val.length) + "</strong>";
//             b.innerHTML += opciones[i].substr(val.length);
//             b.innerHTML += "<input id='hidden"+i+"' type='hidden' value='" + opciones[i] + "'>";

//             b.addEventListener("click", function() {
//                 console.log($('#hidden'+i+'').val());

//                 $('#autocomplete-'+campo).val($('#autocomplete'+campo).getElementsByTagName("input")[0].value);
//                 console.log( $('#autocomplete-'+campo).val());
                
//                 closeAllLists();
//             }
            
            
//             );
            
            
//             a.append(b);
//         }
//     }
    
//     $('#autocomplete-'+campo).on("keydown", function(e) {
//         var x = document.getElementById(this.id + "autocomplete-list");
//         if (x) x = x.getElementsByTagName("div");
//         if (e.keyCode == 40) {
          
//           currentFocus++;
          
//           addActive(x);
//         } else if (e.keyCode == 38) { 
//           currentFocus--;
          
//           addActive(x);
//         } else if (e.keyCode == 13) {
          
//           e.preventDefault();
//           if (currentFocus > -1) {
            
//             if (x) x[currentFocus].click();
//           }
//         }
//     });
//     function addActive(x) {
//         if (!x) return false;
//         removeActive(x);
//         if (currentFocus >= x.length) currentFocus = 0;
//         if (currentFocus < 0) currentFocus = (x.length - 1);
        
//         x[currentFocus].classList.add("autocomplete-active");
//     }
//     function removeActive(x) {
//     for (var i = 0; i < x.length; i++) {
//         x[i].classList.remove("autocomplete-active");
//     }
//     }
//     function closeAllLists(elmnt) {
//         var x = document.getElementsByClassName("autocomplete-items");
//         for (var i = 0; i < x.length; i++) {
//         if (elmnt != x[i] && elmnt != $('#autocomplete-'+campo)) {
//         x[i].parentNode.removeChild(x[i]);
//         }
//     }
//     }


//     // var options = {
//     //     data: opciones,
//     //     list: {
//     //         match: {
//     //             enabled: true
//     //         },
//     //         showAnimation: {
//     //             type: "fade", //normal|slide|fade
//     //             time: 400,
//     //             callback: function() {}
//     //         },
    
//     //         hideAnimation: {
//     //             type: "slide", //normal|slide|fade
//     //             time: 400,
//     //             callback: function() {}
//     //         },
//     //         onSelectItemEvent: function() {
//     //             switch (campo) {
//     //                 case "name":
//     //                     var value = $("#autocomplete-name").getSelectedItemData().name;
//     //                     $("#autocomplete-name").val(value);
//     //                   break;
//     //                 case "sede_nombre": 
//     //                     var value = $("#autocomplete-sede_nombre").getSelectedItemData().sede_nombre;
//     //                     $("#autocomplete-sede_nombre").val(value);
//     //                     console.log('sede_nombre');
//     //                   break; 
//     //                 case "username":
//     //                     var value = $("#autocomplete-username").getSelectedItemData().username;
//     //                     $("#autocomplete-username").val(value);
//     //                   break;
//     //                 default:
//     //                   console.log('default');
//     //                   var value = $("#autocomplete-name").getSelectedItemData().name;
//     //                   $("#autocomplete-name").val(value);
//     //             }
//     //         }
//     //     }
//     // };
    
//     // $("#autocomplete-"+campo).easyAutocomplete(options);
// }


