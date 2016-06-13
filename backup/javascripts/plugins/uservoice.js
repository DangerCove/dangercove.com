(function() {
  var $,
    indexOf = [].indexOf || function(item) { for (var i = 0, l = this.length; i < l; i++) { if (i in this && this[i] === item) return i; } return -1; };

  $ = jQuery;

  $.fn.extend({
    uservoice: function(options) {
      var element, ignore, log, settings;
      settings = {
        debug: true
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
      if (!(settings.app && settings.client)) {
        return;
      }
      return this.each(function() {
        var topics;
        topics = [];
        return $.ajax({
          url: '//' + settings.app + '.uservoice.com/api/v1/articles.json?client=' + settings.client + '&per_page=100',
          dataType: 'jsonp',
          success: function(data) {
            $('.loading', element).hide();
            return $.each(data.articles, function(i, article) {
              var article_answer, article_item, article_title, ref, target, topic_item, topic_list, topic_title;
              target = $('.topic_other .topics', element);
              if (article.topic) {
                if (ref = article.topic.id, indexOf.call(topics, ref) < 0) {
                  topic_item = document.createElement('li');
                  $(topic_item).attr('class', 'topic_' + article.topic.id);
                  topic_title = document.createElement('h3');
                  $(topic_title).text(article.topic.name);
                  $(topic_title).appendTo(topic_item);
                  topic_list = document.createElement('ul');
                  $(topic_list).attr('class', 'topics');
                  $(topic_list).appendTo(topic_item);
                  $(topic_item).prependTo($(element));
                  topics.push(article.topic.id);
                }
                target = $('.topic_' + article.topic.id + ' .topics');
              } else {
                $('.topic_other').show();
              }
              article_item = document.createElement('li');
              $(article_item).attr('class', 'article_' + article.id);
              article_title = document.createElement('h4');
              $(article_title).text(article.question);
              $(article_title).appendTo(article_item);
              $(article_title).click(function(e) {
                if ($(this).siblings('.answer').is(":visible")) {
                  _gaq.push(['_trackEvent', 'Support', 'Close article_' + article.id, 'Close: ' + article.question]);
                } else {
                  _gaq.push(['_trackEvent', 'Support', 'Open article_' + article.id, 'Open: ' + article.question]);
                }
                return $(this).siblings('.answer').toggle();
              });
              article_answer = document.createElement('div');
              $(article_answer).attr('class', 'answer');
              $(article_answer).html(article.answer_html);
              $(article_answer).appendTo(article_item);
              return $(article_item).appendTo(target);
            });
          }
        });
      });
    }
  });

}).call(this);
