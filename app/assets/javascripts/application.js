// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require_tree .

var auto_setting_points ={
  to_race_result: function(){
    var result = parseInt( $("#register_race_result").val() );
    var points = 5;
    if (! isNaN(result) ){
      if( result < 10 ){
        points = (50-((result-1 )*5));
      }else{ points = 5; }
      
    }
    $("#register_points").val(points);
  }
}

var fill_table_via_json = {
  print_data_tbody: function(){
    var $load_json =  $('[data-js-load-json]');
    if (!$load_json.length) return;

    var json_url= $('table').data('json-url');
    console.log(json_url);

  $.ajax({ 
        type: 'GET', 
        url: json_url, 
        data: { get_param: 'value' }, 
        dataType:'json',
        success: function (data) { 
          data.riders.forEach(function(element) {
            $load_json.children('tbody').append(
              `<tr>
                <td>${element['lugar']}</td>
                <td>${element['numero']}</td>
                <td>${element['tiempo']}</td>
                <td>${element['nombre']}</td>
                <td>${element['apellidos']}</td>
                <td>${element['equipo']}</td>
              </tr>`
              );
          });
        }
    });
  }
}

document.addEventListener("turbolinks:load", function() {
  $("#register_race_result").on('input', function() {
    auto_setting_points.to_race_result();
  });
  fill_table_via_json.print_data_tbody();
});