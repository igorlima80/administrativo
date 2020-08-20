/*
 jquery/dist/jquery
 jquery_ujs
 activestorage

 bootstrap
 bootstrap-treeview.min
 admin-lte/dist/js/adminlte
 datatables.net/js/jquery.dataTables
 datatables.net-bs/js/dataTables.bootstrap
 datatables.net-responsive/js/dataTables.responsive
 datatables.net-responsive-bs/js/responsive.bootstrap
 jquery-maskmoney/dist/jquery.maskMoney

 select2/dist/js/select2.full
 select2/dist/js/i18n/pt-BR

 cocoon
 zutils

function via_cep(input) {
  form = input.parent().parent().parent();
  $.post("/utils/zipcode", { zipcode: input.val() }, function(data) {
    form.find('input[id$=street]').val(data.response.logradouro);
    form.find('input[id$=district]').val(data.response.bairro);
    form.find('input[id$=complement]').val(data.response.complemento);
    select = form.find('select[id$=city_id]');
    select.val(select.find('[data-ibge=' + data.response.ibge + ']').val());
  });
}

function select2() {
  $(".select2" ).select2({
    allowClear: true,
    placeholder: "Escolha uma opção",
    language: "pt-BR",
    theme: "bootstrap"
  });
}

function money() {
  $('.currency').maskMoney({
    prefix: 'R$ ',
    thousands: '.',
    decimal: ','
  });
}

function components_cocoon(line) {
  select2();
  money();
  line.find("select[id$=_category_id]").on('select2:select', function (e) {
    $.post("/categories/" + e.params.data.id + "/products", function(data) {
      line.find("select[id$=_lot_id]").html("").trigger("change");
      line.find('.und').text("");
      line.find('.unt_val').text("");
      line.find('.total').text("");
      select = line.find("select[id$=_product_id]");
      select.html("");
      $.each(data, function( index, value ) {
        option = new Option(value.name, value.id, true, true);
        option.setAttribute("data-unity", value.unity);
        select.append(option).trigger('change');
      });
      option = new Option("", "", true, true);
      select.append(option).trigger('change');
    });
  });
  line.find("select[id$=_product_id]").on('select2:select', function (e) {
    line.find('.und').text($(this).find(':selected').data('unity'));
    $.post("/products/" + e.params.data.id + "/lots", function(data) {
      select = line.find("select[id$=_component_id]");
      select.html("");
      $.each(data, function( index, value ) {
        option = new Option("Lote " + value.id + " | Estoque: " + value.available_now, value.id, true, true);
        option.setAttribute("data-unit-value-cents", value.unit_value_cents);
        select.append(option).trigger('change');
      });
      option = new Option("", "", true, true);
      select.append(option).trigger('change');
    });
  });
  // line.find("select[id$=_component_id]").on('select2:select', function (e) {
  //   line.find('.unt_val').text(("R$ " + ($(this).find(':selected').data('unit-value-cents') / 100.0).toFixed(2)).replace('.', ','));
  // });
  // line.find("input[id$=_quantity]").blur(function () {
  //   compute_total_products();
  // });
}

function compute_total_products() {
  full_total = 0.0;
  $("input[id$=_quantity]").each(function() {
    qtd = parseFloat($(this).val());
    unt = parseFloat($(this).parent().parent().parent().find('.unt_val').text().replace("R$ ", "").replace(',', '.'));
    total = qtd * unt;
    $(this).parent().parent().parent().find('.total').text(("R$ " + total.toFixed(2)).replace('.', ','));
    full_total = full_total + total;
  });
  $("#full_total").text(("R$ " + full_total.toFixed(2)).replace('.', ','))
}

function lot_product_select2() {
  $('#lot_product_id').on('select2:select', function (e) {
    form = $(this).parent().parent();
    hint = form.find('#lot_quantity').parent().find('small');
    hint.text("Unidade: " + $(this).find(':selected').data('unity'));
  });
}

$(document).ready(function(){
  $('[data-toggle="tooltip"]').tooltip();

  var tree = $('#UNITS_TREE').data('tree');

  $('#tree').treeview({data: tree, enableLinks: true, selectedBackColor: 'red'});

  money();

  $('.datatables').DataTable({
    paging: false,
    searching: false,
    ordering:  false,
    info: false,
    responsive: true,
    language: {
      "sEmptyTable": "Nenhum registro encontrado",
      "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
      "sInfoEmpty": "Mostrando 0 até 0 de 0 registros",
      "sInfoFiltered": "(Filtrados de _MAX_ registros)",
      "sInfoPostFix": "",
      "sInfoThousands": ".",
      "sLengthMenu": "_MENU_ resultados por página",
      "sLoadingRecords": "Carregando...",
      "sProcessing": "Processando...",
      "sZeroRecords": "Nenhum registro encontrado",
      "sSearch": "Pesquisar",
      "oPaginate": {
        "sNext": "Próximo",
        "sPrevious": "Anterior",
        "sFirst": "Primeiro",
        "sLast": "Último"
      },
      "oAria": {
        "sSortAscending": ": Ordenar colunas de forma ascendente",
        "sSortDescending": ": Ordenar colunas de forma descendente"
      }
    }
  });

  select2();

  // $('#lot_category_id').on('select2:select', function (e) {
  //   form = $(this).parent().parent();
  //   var data = e.params.data;
  //   $.post("/categories/" + e.params.data.id + "/products", function(data) {
  //     select = form.find('#lot_product_id');
  //     select.html("");
  //     $.each(data, function( index, value ) {
  //       option = new Option(value.name, value.id, true, true);
  //       option.setAttribute("data-unity", value.unity);
  //       select.append(option).trigger('change');
  //     });
  //     option = new Option("", "", true, true);
  //     select.append(option).trigger('change');
  //     lot_product_select2();
  //   });
  // });
  //
  // $("#lot_product_id").on('select2:select', function (e) {
  //   form = $(this).parent().parent();
  //   var data = e.params.data;
  //   $.post("/products/" + e.params.data.id + "/lots", function(data) {
  //     select = form.find('#lot_lot_id');
  //     select.html("");
  //     $.each(data, function( index, value ) {
  //       option = new Option("Lote " + value.id + " | Estoque: " + value.available_now, value.id, true, true);
  //       option.setAttribute("data-unity", value.unity);
  //       select.append(option).trigger('change');
  //     });
  //     option = new Option("", "", true, true);
  //     select.append(option).trigger('change');
  //     hint = form.find('#lot_quantity').parent().find('small');
  //     lot_product_select2();
  //   });
  // });

  lot_product_select2();

  $('#products_table')
    .on('cocoon:after-insert', function() {
      components_cocoon($("#products_table tbody tr:last"));
    });

  $("#products_table tbody tr").each(function(){
    components_cocoon($(this));
  });

  $('#addresses').on('cocoon:after-insert', function(e, form) {
    form.find('input[id$=zipcode]').blur(function(){
      via_cep($(this));
    });
  });

  $('#documents').on('cocoon:after-insert', function(e, form) {
    select2();
  });

  $('#phones').on('cocoon:after-insert', function(e, form) {
    select2();
  });

  $('#accounts').on('cocoon:after-insert', function(e, form) {
    select2();
  });

  $('#bidding_products').on('cocoon:after-insert', function(e, form) {
    select2();
  });

  $('#bidding_tasks').on('cocoon:after-insert', function(e, form) {
    select2();
  });

  $('#quotation_products').on('cocoon:after-insert', function(e, form) {
    select2();
    money();
  });

  $('#quotation_tasks').on('cocoon:after-insert', function(e, form) {
    select2();
    money();
  });
});
*/