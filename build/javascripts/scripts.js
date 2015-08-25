(function() {

  $(document).ready(function() {
    $('.screenshots_container').screenshots();
    $('.uservoice').uservoice();
    $(".manual_download").click(function(e) {
      return clearTimeout(downloadTimeout);
    });
    return $("a.popup").click(function(e) {
      var newwindow;
      e.preventDefault();
      newwindow = window.open($(this).attr('href'), 'dangercove-popup', 'width=480,height=320,top=100,left=100');
      if (window.focus) {
        return newwindow.focus();
      }
    });
  });

}).call(this);
