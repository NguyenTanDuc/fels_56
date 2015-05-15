function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).closest(".fields").hide();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g")
  var content = "<table class='table table-bordered'>"+content+"</table>";
  $(link).parent().before(content.replace(regexp, new_id));
}