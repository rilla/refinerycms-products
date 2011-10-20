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

  $.fn.extend({
    disable_facet_set_selection: function(){
      if($('option:selected',this).val() == "") {
        $("#page_set").attr("disabled", false);
      } else {
        $('#page_set option:first').attr("selected", true);
        $("#page_set").attr("disabled", true);
      }
    }
  });

  $('input.autoresize').each(function(){ 
    $(this).autoGrowInput({
      comfortZone: 10,
      minWidth: 10,
      maxWidth: 1000});
    });

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