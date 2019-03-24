import BaseModel from './basemodel'

export default class Relationship extends BaseModel
    constructor: (name, props = {})->
            super(name)
            @name = name
            @