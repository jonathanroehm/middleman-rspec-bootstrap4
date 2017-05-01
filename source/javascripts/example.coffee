class App.Example
  constructor: (@el) ->
    @someVar = @el.length
    console.log @someVar


$(document).on 'ready', ->
  el = $('body')
  alert "yo"
  return unless el.length
  inst = new App.Example el
