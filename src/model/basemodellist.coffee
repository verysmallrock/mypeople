import BaseModel from './basemodel'

export default class BaseModelList extends BaseModel
    constructor: (@models = []) ->
        super()

    add: (model) ->
        @models.push(model)