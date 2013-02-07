ProgLipsum.Views.Datasets ||= {}

class ProgLipsum.Views.Datasets.IndexView extends Backbone.View
  template: JST["backbone/templates/datasets/index"]

  initialize: () ->
    @options.datasets.bind('reset', @addAll)

  addAll: () =>
    @options.datasets.each(@addOne)

  addOne: (dataset) =>
    view = new ProgLipsum.Views.Datasets.DatasetView({model : dataset})
    @$("tbody").append(view.render().el)

  render: =>
    @$el.html(@template(datasets: @options.datasets.toJSON() ))
    @addAll()

    return this
