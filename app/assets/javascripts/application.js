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
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function ready() {

  // When the input is changed do something.

  $('input.avail').change(function() {

    box = $(this); // set this to box for readability and
                   // our own sanity of trying to understand js scoping

    // reads like english, if box is checked do a thing else do another thing
    if (box.is(':checked')) {

      // Make an ajax post to availabilities#create
      // with the availability start time,
      // after it's done set the data-availability
      // with its id.

      $.ajax({
        // set the type to POST
        type: 'POST',
        // set the url
        url: '/availabilities.json',
        // send the start time
        data: {availability: {start: box.val() }},

        // After a succesful availability creation
        // set the data-availability with the
        // availability id.
        complete: function(data) {

          // availabilities#create returns
          // the created availability as json
          availability = data.responseJSON;

          // set the data-availability to the availability id
          box.attr('data-availability', availability.id);
        }
      });

    } else {

      // If it is not checked then delete the availability
      // set in the data-availability attribute.

      // Get the availability id from the
      // data-availability attribute we set.
      id = $(box).attr('data-availability');

      // Make ajax post to availabilities#destroy
      $.ajax({

        // set the type to DELETE
        type: 'DELETE',

        // set the url for delete
        // with the id '/availabilities/:id.json'
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