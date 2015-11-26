/**
 * @file
 * JavaScript to disable and re-label the installer's submit button on the
 * Optional Features screen after the first submit.
 */

(function ($) {
  Drupal.behaviors.installAutoSubmit = {

    attach: function (context, settings) {

      // add onclick handler for auto-submit
      $('#edit-auto-submit').click(function() {
        var $this = $(this);

        if ($this.attr('checked')) {
          // auto-submit is now checked, so start the countdown
          $('#auto-submit-description').show();
          Drupal.behaviors.installAutoSubmit.tick();
        }
        else {
          // unchecked, so stop countdown
          var t = $('#auto-submit-countdown').data('t');
          clearTimeout(t);
          // hide the auto submit message
          $('#auto-submit-description').hide();
        }
      });

      // onclick handler for submit button
      $('#edit-submit').click(function() {
        var $this = $(this);

        // Replace the button with some text
        $this.val('Stand by...');

        // Hide the auto submit.
        $('.form-item-auto-submit').hide();

        // Submit the form
         $('form')[0].submit();

        // Disable the button.
        $this.attr("disabled","disabled");

        // Allow the click event to fall through.
        return true;
      });

      // Check all checkboxes.
      $('body').find(':checkbox').attr('checked', 'checked');

      // Un-check the Update module checkbox.
      $('#edit-update-status-module-1').attr( "checked", "" );

      // Start countdown.
      this.tick();
    },

    tick: function() {
      var seconds = parseInt($('#auto-submit-countdown').html());

      seconds -= 1;
      if (seconds <= 0) {
        $('#auto-submit-description').hide();
        $('#edit-submit').click();
      }
      else {
        $('#auto-submit-countdown').html(seconds);
        // Scheduling another call of this function in 1s
        var t = setTimeout(Drupal.behaviors.installAutoSubmit.tick, 1000);
        $('#auto-submit-countdown').data('t', t);
      }
    }

  }

})(jQuery);