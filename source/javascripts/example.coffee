class App.Example
  constructor: (@el) ->
    @someVar = @el.length

$(document).on 'ready', ->
  el = $('body')
  return unless el.length
  inst = new App.Example el
