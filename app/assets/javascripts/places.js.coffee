# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
$ ->
  $(".changepic img:gt(0)").hide()
  setInterval (->
    $(".changepic :first-child").fadeOut().next("img").fadeIn().end().appendTo ".changepic"
  ), 1000