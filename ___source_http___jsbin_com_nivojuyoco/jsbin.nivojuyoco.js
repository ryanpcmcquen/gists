$(function() {
  $('li').on('click', function(e) {
    var $clickedItemDetails = $(e.currentTarget).find('.details');
    var $allDetails = $('li .details');

    if ($clickedItemDetails.is(':hidden')) {
      $allDetails.hide().parent().removeClass('collapsed');
      $clickedItemDetails.show();
    } else {
      $clickedItemDetails.hide();
    }
    
    $allDetails.each(function(index, el) {
      if ($(el).is(':hidden')) {
        $(el).parent().addClass('collapsed');
      }
    });
    
    if ($('li.collapsed').length === $('li').length) {
      $('li').removeClass('collapsed');
    }
  });  
});