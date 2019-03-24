import BaseModel from './basemodel'

export default class Person extends BaseModel
    name: 'test'

    constructor: (name, props = {})->
        super(name)
        @name = name
        @
        
