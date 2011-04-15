$(function() {
  var filter = function(query) {
    var titlesSelector = "#content .show h3 a";
    if (query == '') {
      $(titlesSelector).closest(".show").show(); 
    } else {
      $("#content .show").closest(".show").hide();
      $(titlesSelector + ":contains('" + query + "')").closest(".show").show();
    }
  }
  var h = function(eventData) {
    filter($(this).val().toLowerCase());
  }; 
  $("<input>", {
    "placeholder" : SEARCH_PLACEHOLDER_TEXT, 
    class: "search",
    keyup: h, 
    focusout: h, 
    mouseleave: h
  }).appendTo("#content h4");
});
