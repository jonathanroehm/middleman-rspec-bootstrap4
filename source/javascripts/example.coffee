# JQuery 3 syntax for document ready.
class App.ExampleCoffee
  constructor: (@el) ->
    @jumbotron = @el.find '.jumbotron'
    @callToAction = @jumbotron.find '.btn'

    @callToAction.click (e) =>
      @animate()

    @initialize()

  initialize: ->
    @jumbotron.css 'transition', 'background 0.3s ease-in-out, color 0.3s ease-in-out'
  animate: ->

    if @jumbotron.hasClass 'bg-primary'
      @jumbotron.removeClass 'bg-primary text-white'
      @callToAction.removeClass 'btn-light'
      @callToAction.addClass 'btn-primary'
      
    else
      @jumbotron.addClass 'bg-primary text-white'
      @callToAction.addClass 'btn-light'
      @callToAction.removeClass 'btn-primary'

jQuery(document).ready ($) ->
  el = $('body')
  return unless el.length

  inst = new App.ExampleCoffee el