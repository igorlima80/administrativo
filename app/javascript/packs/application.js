require('typeface-titillium-web')

import '../stylesheets/application.scss'
import "@fortawesome/fontawesome-free/css/all.css"

require("@rails/ujs").start()
// require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")

import './bootstrap_custom.js'
import 'admin-lte/dist/js/adminlte'
// import 'admin-lte/plugins/overlayScrollbars/js/jquery.overlayScrollbars'
// import 'overlayscrollbars/js/jquery.overlayScrollbars'
import 'jstree/dist/jstree'

import 'bootstrap-table/dist/bootstrap-table'
import 'bootstrap-table/dist/bootstrap-table-locale-all'

// import 'cocoon-rails/src/cocoon'

import Inputmask from "inputmask";

import 'selectize/dist/js/selectize';

$(document).ready(function () {

  $('[data-toggle="tooltip"]').tooltip();
  $('[data-toggle="popover"]').popover();

  money();
  
  $('.styletable').bootstrapTable({
    locale: 'pt-BR'
  });

  var tree_data = $('#UNITS_TREE').data('tree');

  $('#tree').jstree({
    'core': {
      'themes': {
        'name': 'proton',
        'responsive': true
      },
      'data': tree_data
    },
    "plugins": ["contextmenu"],
    "contextmenu": {
      "items": function ($node) {
        return {
          "show": {
            "label": "Visualizar",
            "action": function (obj) {
              window.location = $node.a_attr.href;
            }
          },
          "add": {
            "label": "Adicionar Filho",
            "action": function (obj) {
              window.location = "/units/new?parent_id=" + $node.id;
            }
          },
          "edit": {
            "label": "Editar",
            "action": function (obj) {
              window.location = "/units/" + $node.id + '/edit';
            }
          }
        };
      }
    }
  });

  var selectizeCallback = null;

  $(".selectize_with_add_without_modal").each(function (i, item) {
    $(item).selectize({
      create: function (input, callback) {
        $(item).parent().removeClass('has-error');
        $(item).parent().find('.help-block').text("");
        selectizeCallback = callback;
        var data = {};
        data[$(item).data('model')] = {};
        data[$(item).data('model')][$(item).data('field')] = input;
        $.ajax({
          method: "POST",
          dataType: "json",
          url: "/" + $(item).data('pluralized'),
          data: data,
          success: function (response) {
            selectizeCallback({ value: response.id, text: response.name });
          },
          error: function (response) {
            $(item).parent().addClass('has-error');
            if (!($(item).parent().find('.help-block').length)) {
              $(item).parent().append("<p class='help-block'></p>");
            }
            $(item).parent().find('.help-block').text("Valor já existente: " + input);
            selectizeCallback();
          }
        });
        selectizeCallback = callback;
      }
    });
  });
})

function money() {
  Inputmask.extendAliases({
    reais: {
      prefix: "R$ ",
      groupSeparator: ".",
      radixPoint: ',',
      alias: "numeric",
      placeholder: "0",
      autoGroup: !0,
      digits: 2,
      digitsOptional: !0,
      clearMaskOnLostFocus: !1
    }
  });

  Inputmask({
    alias: 'reais'
  }).mask(document.querySelectorAll(".currency"));
}