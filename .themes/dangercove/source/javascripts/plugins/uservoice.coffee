---
---
# Reference jQuery
$ = jQuery

# Adds plugin object to jQuery
$.fn.extend
  # Change pluginName to your plugin's name.
  uservoice: (options) ->
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

    unless settings.app and settings.client
      return

    # _Insert magic here._
    return @each ()->
      topics = []
      $.ajax({
        url: 'http://' + settings.app + '.uservoice.com/api/v1/articles.json?client=' + settings.client + '&per_page=100',
        dataType: 'jsonp',
        success: (data) ->
          $('.loading', element).hide()
          $.each(data.articles, (i, article) ->
            target = $('.topic_other .topics', element)
            if article.topic
              unless article.topic.id in topics
                topic_item = document.createElement 'li'
                $(topic_item).attr 'class', 'topic_' + article.topic.id
                topic_title = document.createElement 'h3'
                $(topic_title).text article.topic.name
                $(topic_title).appendTo topic_item
                topic_list = document.createElement 'ul'
                $(topic_list).attr 'class', 'topics'
                $(topic_list).appendTo topic_item

                $(topic_item).prependTo $(element)
                topics.push article.topic.id
              target = $('.topic_' + article.topic.id + ' .topics')
            else
              $('.topic_other').show()

            article_item = document.createElement 'li'
            $(article_item).attr 'class', 'article_' + article.id
            article_title = document.createElement 'h4'
            $(article_title).text article.question
            $(article_title).appendTo article_item
            $(article_title).click((e) ->
              if($(this).siblings('.answer').is(":visible"))
                _gaq.push(['_trackEvent', 'Support', 'Close article_' + article.id, 'Close: ' + article.question])
              else
                _gaq.push(['_trackEvent', 'Support', 'Open article_' + article.id, 'Open: ' + article.question])
              $(this).siblings('.answer').toggle()
            )
            article_answer = document.createElement 'div'
            $(article_answer).attr 'class', 'answer'
            $(article_answer).html article.answer_html
            $(article_answer).appendTo article_item

            $(article_item).appendTo target
          )
      })
