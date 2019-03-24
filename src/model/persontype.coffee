import BaseModel from './basemodel'

export default class PersonType extends BaseModel
    constructor: (name, props = {})->
            super(name)
            @name = name
            @