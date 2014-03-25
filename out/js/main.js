(function() {
  require.config({
    paths: {
      jquery: 'jquery'
    }
  });

  require(['jquery'], function($) {
    var changeDisplay, getDiff, moveLeft;
    moveLeft = function(element, delta) {
      var currLeft;
      currLeft = parseInt($(element).css('left').substring(-2));
      return $(element).css('left', currLeft + delta);
    };
    getDiff = function(a, b) {
      return ($(a).offset().left + $(a).width() / 2) - ($(b).offset().left + $(b).width() / 2);
    };
    changeDisplay = function(newDisplay) {
      $(window.current).removeClass('visible');
      $('.content').css('height', $('#topic-' + newDisplay).css('height'));
      return setTimeout(function() {
        window.current = '#topic-' + newDisplay;
        return $(window.current).addClass('visible');
      }, 500);
    };
    window.current = null;
    if (window.location.hash) {
      window.current = '#topic-' + window.location.hash.substring(1);
      moveLeft('.tab-arrow', getDiff('#tab-' + window.location.hash.substring(1), '.tab-arrow'));
      $(window.current).addClass('visible');
      $('.content').css('height', $(window.current).css('height'));
    } else {
      window.current = '#topic-iOS';
      $(window.current).addClass('visible');
      moveLeft('.tab-arrow', getDiff('.tab-item:first-child', '.tab-arrow'));
      $('.content').css('height', $('#topic-iOS').css('height'));
    }
    return $('.tab-item').click(function(e) {
      moveLeft('.tab-arrow', getDiff(this, '.tab-arrow'));
      return changeDisplay($(this).data('topic'));
    });
  });

}).call(this);
