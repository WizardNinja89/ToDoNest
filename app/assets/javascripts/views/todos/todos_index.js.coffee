class ToDoNest.Views.TodosIndex extends Backbone.View

  template: JST['todos/index']

  events:
    'submit #new_todo': 'createTodo'

  initialize: ->
    @collection.on('sync', @render, this)
    @collection.on('add', @render, this)
    @collection.on('all', @render, this)

  render: ->
    $(@el).html(@template(todos: @collection))
    @collection.each(@appendTodo)
    this

  appendTodo: (todo) =>
    view = new ToDoNest.Views.Todo(model: todo)
    @$('#todos').append(view.render().el)

  createTodo: (event) ->
    event.preventDefault()
    attributes = {description: $('#new_todo_description').val(), user_id: parseInt($("#user_id").html())}
    @collection.create attributes

