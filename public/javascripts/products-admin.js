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
  $("#page_facet_tokens").each(function() {
    $(this).tokenInput("/refinery/facets/tokens.json", {
        crossDomain: false,
        prePopulate: $(this).data("pre")
    });
  });
  $("#page_product_tokens").each(function() { 
      $(this).tokenInput("/refinery/products/tokens.json", {
        crossDomain: false,
        prePopulate: $(this).data("pre")
    });
  });
});