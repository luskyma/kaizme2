// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function ready() {
  $('input.avail').change(function() {
    //console.log(arguments);
    var box = $(this);
    if (box.is(':checked')) {
      $.ajax({
        type: 'POST',
        url: '/availabilities.json',
        data: { availability: { start: box.val() }},
        complete: function() {
          //console.log(arguments);
        }
      });
    } else {
      var id = $(box).data('availability');
      $.ajax({
        type: 'DELETE',
        url: '/availabilities/' + id + '.json',
        complete: function() {
          //console.log(arguments);
        }
      });
    }
  });
}

$(ready);
$(document).on('page:load', ready);
