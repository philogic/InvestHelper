# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

init_stock_lookup = ->
  $('#stock-form').on 'ajax:before', (event, data, status) ->
    $('#spinner').show()

  $('#stock-form').on 'ajax:after', (event, data, status) ->
    $('#spinner').hide()

  $('#stock-form').on 'ajax:success', (event, data, status) ->
    $('#retrieve-stock').replaceWith data
    init_stock_lookup()

  $('#stock-form').on 'ajax:error', (event, xhr, status, error) ->
    $('#spinner').hide()
    $('#search-stock-results').replaceWith ' '
    $('#search-stock-errors').replaceWith 'Stock not found. Sorry.'


$(document).ready ->
  init_stock_lookup()


