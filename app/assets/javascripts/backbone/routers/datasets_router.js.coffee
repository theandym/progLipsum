class ProgLipsum.Routers.DatasetsRouter extends Backbone.Router
  initialize: (options) ->
    @datasets = new ProgLipsum.Collections.DatasetsCollection()
    @datasets.reset options.datasets

  routes:
    "new"      : "newDataset"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  newDataset: ->
    @view = new ProgLipsum.Views.Datasets.NewView(collection: @datasets)
    $("#datasets").html(@view.render().el)

  index: ->
    @view = new ProgLipsum.Views.Datasets.IndexView(datasets: @datasets)
    $("#datasets").html(@view.render().el)

  show: (id) ->
    dataset = @datasets.get(id)

    @view = new ProgLipsum.Views.Datasets.ShowView(model: dataset)
    $("#datasets").html(@view.render().el)

  edit: (id) ->
    dataset = @datasets.get(id)

    @view = new ProgLipsum.Views.Datasets.EditView(model: dataset)
    $("#datasets").html(@view.render().el)
