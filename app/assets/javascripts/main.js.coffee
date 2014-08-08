###############################################################################
# Adiciona reticencias no final do texto do menu
###############################################################################

# $(function() {
  # $(".suspension-points").each(function() {
    # var val = $(this).html();
    # if (val.length > 10) {
    # var new_val = val.substr(0,8).concat("...");
    # $(this).html(new_val);
  # }
  # });
# });

$ ->
  $(".suspension-points").each ->
    val = $(this).html()
    if val.length > 11
      new_val = val.substr(0, 11).concat("...")
      $(this).html new_val
    return
  return
  
###############################################################################
# 
###############################################################################

