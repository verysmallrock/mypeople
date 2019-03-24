import BaseModel from './basemodel'

export default class RelationshipType extends BaseModel
    constructor: (name, props = {})->
        super(name)
        @name = name
        @