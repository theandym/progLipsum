ProgLipsum.Views.Datasets ||= {}

class ProgLipsum.Views.Datasets.ShowView extends Backbone.View
  template: JST["backbone/templates/datasets/show"]

  render: ->
    @$el.html(@template(@model.toJSON() ))
    return this
