function display_new_page_dialog($elem, url, title) {
  $('<div/>').addClass("new_page_dialog").appendTo($elem).load(url).dialog({
    modal: true,
    title: title,
    width: 600,
    height: 250
  });
  return $();
}

jQuery(document).ready(function($) {



});

