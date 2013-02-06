---
---
$(document).ready(->
  $('.screenshots_container').screenshots()
  $('.uservoice').uservoice()

  $(".manual_download").click((e) ->
    clearTimeout downloadTimeout
  )
)
