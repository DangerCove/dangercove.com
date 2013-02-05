---
---
# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  # Change pluginName to your plugin's name.
  screenshots: (options) ->
    # Default settings
    settings =
      debug: true

    # Merge default settings with options.
    settings = $.extend settings, options

    # Save element
    element = $(@)

    # Simple logger.
    log = (msg) ->
      console?.log msg if settings.debug

    # Ignore click
    ignore = (e) ->
      e.preventDefault()

    # Switch screenshots
    switch_screenshot = (e) ->
      unless $(@).hasClass('active')
        $('ul.screenshots li', element).fadeOut()
        $('ul.screenshots ' + e.target.hash + '_screenshot', element).fadeIn()
        $('.pagination li', element).removeClass('active')
        $(@).addClass('active')

    # _Insert magic here._
    return @each ()->
      $('ul.screenshots li', element).hide()
      $('ul.screenshots li:first-child', element).show()
      $('.pagination li:first-child', element).addClass('active')

      $('.pagination a').click(ignore)
      $('.pagination li').click(switch_screenshot)
