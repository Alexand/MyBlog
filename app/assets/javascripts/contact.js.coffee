@validateContactForm = ->
  $("#flash_warning").parent().closest("div").css "display", "inline"
  if $("#contact_name").val() is "" or $("#contact_email").val() is "" or $("#contact_message").val() is ""
    $("#flash_warning").text "Please fill in all the fields."
    false
  else
    $("#flash_warning").text "Sending ..."
    true