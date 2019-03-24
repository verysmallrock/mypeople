import BaseModel from './basemodel'

export default class BaseModelList extends BaseModel
    constructor: (@models = []) ->
        super()

    add: (model) ->
        @models.push(model)

    serialize: ->
        data = {
            models: []
        }
        for model in @models
            data.models.push model.serialize()

        data

    # Turn an object into yourself
    deserialize: (data) ->
        @models = [] 
        for modelData in data.models
            @models.push(new @modelClass().deserialize(modelData))

        @