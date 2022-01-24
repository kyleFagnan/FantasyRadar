# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

#checkbox event handler for subscribing to players
$(document).on "turbolinks:load", ->
  $('.subButton').on 'change', (event) ->
    $.post '/subscriptions',
      player_id: event.target.value
      trans_type: event.target.checked




  

