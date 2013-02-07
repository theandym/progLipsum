class ProgLipsum.Models.Dataset extends Backbone.Model
  paramRoot: 'dataset'

  defaults:
    name: null
    format: null
    output: null
    public: null
    account_id: null

class ProgLipsum.Collections.DatasetsCollection extends Backbone.Collection
  model: ProgLipsum.Models.Dataset
  url: '/datasets'
