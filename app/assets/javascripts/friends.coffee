# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_friend_lookup = ->
  $('#friend-form').on 'ajax:before', (event, data, status) ->
    $('#spinner').show()

  $('#friend-form').on 'ajax:after', (event, data, status) ->
    $('#spinner').hide()

  $('#friend-form').on 'ajax:success', (event, data, status) ->
    $('#retrieve-friend').replaceWith data
    init_friend_lookup()

  $('#friend-form').on 'ajax:error', (event, xhr, status, error) ->
    $('#spinner').hide()
    $('#search-friend-results').replaceWith ' '
    $('#search-friend-errors').replaceWith 'User not found. Sorry.'


$(document).ready ->
  init_friend_lookup()