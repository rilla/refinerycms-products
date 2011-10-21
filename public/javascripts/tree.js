$(function() {
  $('.tree .toggle').live('click', function(e) { 
    console.debug('clicked');
    e.preventDefault(); 
    var $icon = $(this);
    var $li   = $icon.parents('li:first');
    var $nested = $li.find('.nested');

    if ($icon.hasClass('expanded')) {
      $icon.removeClass('expanded');
      $nested.slideUp(); 
    }
    else {
      var contentUrl = $nested.attr('data-ajax-content');
      
      $nested.load(contentUrl, function() {
        $nested.find('li:last').addClass('branch_end');
        $icon.addClass('expanded');
        init_tooltips();
        $nested.slideDown(); 
      });
    }
  });
});