$('#video-submit').click e ->
	
  $.ajax
    type: 'GET'
    url: # put url here
    dataType: 'json'
    error: (jqXHR, textStatus, errorThrown) ->
      console.log("AJAX Error: " + textStatus)
    success: (data, textStatus, jqXHR) ->
      console.log("AJAX Success: " + textStatus)