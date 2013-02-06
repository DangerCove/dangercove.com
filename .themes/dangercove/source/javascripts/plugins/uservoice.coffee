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

    # _Insert magic here._
    return @each ()->
      topics = []
      $.ajax({
        url: 'http://dangercove.uservoice.com/api/v1/articles.json?client=8KiWIaX9jEbsnUu7TDLQWg&per_page=100',
        dataType: 'jsonp',
        success: (data) ->
          $('.loading', element).hide()
          $.each(data.articles, (i, article) ->
            target = $('.topic_other .topics', element)
            if article.topic
              unless article.topic.id in topics
                topic_item = document.createElement 'li'
                $(topic_item).attr 'class', 'topic_' + article.topic.id
                topic_title = document.createElement 'h2'
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
            article_title = document.createElement 'h3'
            $(article_title).text article.question
            $(article_title).appendTo article_item
            $(article_title).click((e) ->
              $(this).siblings('.answer').toggle()
            )
            article_answer = document.createElement 'div'
            $(article_answer).attr 'class', 'answer'
            $(article_answer).html article.answer_html
            $(article_answer).appendTo article_item

            $(article_item).appendTo target
          )
      })
