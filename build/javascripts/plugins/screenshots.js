(function() {
  var $;

  $ = jQuery;

  $.fn.extend({
    screenshots: function(options) {
      var element, ignore, log, settings, switch_screenshot;
      settings = {
        debug: false
      };
      settings = $.extend(settings, options);
      element = $(this);
      log = function(msg) {
        if (settings.debug) {
          return typeof console !== "undefined" && console !== null ? console.log(msg) : void 0;
        }
      };
      ignore = function(e) {
        return e.preventDefault();
      };
      switch_screenshot = function(e) {
        if (!$(this).hasClass('active')) {
          $('ul.screenshots li', element).fadeOut();
          $('ul.screenshots ' + e.target.hash + '_screenshot', element).fadeIn();
          $('.pagination li', element).removeClass('active');
          return $(this).addClass('active');
        }
      };
      return this.each(function() {
        $('ul.screenshots li', element).hide();
        $('ul.screenshots li:first-child', element).show();
        $('.pagination li:first-child', element).addClass('active');
        $('.pagination a').click(ignore);
        return $('.pagination li').click(switch_screenshot);
      });
    }
  });

}).call(this);
