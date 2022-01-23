# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready ->
  $('.subButton').on 'change', (event) ->
    $.post '/subscriptions',
      player_id: event.target.value
      trans_type: event.target.checked
    return
  return

  

  # $(document).ready ->
  # $('.addButton').on 'click', (event) ->
  #   $.post '/subscriptions',
  #     player_id: event.target.value
  #     trans_type: event.target.clicked
  #   return
  # return